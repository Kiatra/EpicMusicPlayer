-- EpicMusicDancer (Option A: Client-driven animation loops, no manual timing)
-- Uses two PlayerModel frames to avoid scale glitches while models load.
-- Refactors duplicate vars, fixes nils, keeps your config & messages.

-- /run EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer"):EpicMusicDancer:Show()

local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local EpicMusicDancer = LibStub("AceAddon-3.0"):NewAddon("EpicMusicDancer", "AceEvent-3.0", "AceTimer-3.0")
EpicMusicPlayer.EpicMusicDancer = EpicMusicDancer

local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")
local _G, math = _G, math

-- ---------------------------------------------------------------------------
-- State
-- ---------------------------------------------------------------------------
local seq = nil
local modelId = 1
local animData = nil
local nextAnimIndex = 1
local randomCountdown = 10
local timeSinceLast = 0
local frame1Active = false
local dancing = true
local lockPos = true
local sticky = true
local tooltip
local EMPDancerFrame

-- ---------------------------------------------------------------------------
-- Models & animations (no endframe here)
-- ---------------------------------------------------------------------------
-- Display IDs first; keep file/fileID only as last-ditch fallback.
local MODELS = {
   --Chief Thunder-Skins (Tauren drummer)
  { displayIDs = {21661}, modelScale = 0.4, stand = 132,
    anims = { {seq=69, mode="manual"}, {seq=213}, {seq=214}, {seq=215}, {seq=216} } },

  -- Sid Nicious (Blood elf w/ guitar)
  { displayIDs = {21666}, modelScale = 0.7, stand = 132,
    anims = { {seq=69}, {seq=213}, {seq=214}, {seq=215}, {seq=216} } },

  -- Mai'Kyl (Troll w/ guitar)
  --{ displayIDs = {21662}, modelScale = 0.6, stand = 132,
  --  anims = { {seq=69, mode="manual"}, {seq=213}, {seq=214}, {seq=215} } },

  -- Bergrisst (Undead on bass/guitar)
  --{ displayIDs = {21659}, modelScale = 0.6, stand = 132,
  --  anims = { {seq=69, mode="manual"}, {seq=213}, {seq=214}, {seq=215}, {seq=216} } },

  -- Samuro (singing orc)
  --{ displayIDs = {21665}, modelScale = 0.6,
  --  anims = { {seq=69, mode="manual"}, {seq=213}, {seq=214}, {seq=215}, {seq=216}, {seq=217}, {seq=218} } },

  -- Blood Elf Guard (generic male BE model)
  --{ displayIDs = {47519}, modelScale = 0.7, stand = 115, anims = { {seq=69, mode="manual"} } },

  -- Murloc costume (try both classic & BlizzCon suit; first that works will stick)
  --{ displayIDs = {21723, 22267}, modelScale = 0.7, stand = 115, randomstand = {73,80,82},
  --  anims = { {seq=69, mode="manual"} } 
  
}

local MODEL_MAP = { guard=6, orc=5, bloodelf=2, undead=4, troll=3, tauren=1, murloccostume=7 }



-- Put near the top, after MODELS
local LOOP_DURATION = {
  [69]  = 8000,  -- Dance (tune this if it feels too fast/slow)
  [213] = 4166,
  [214] = 4000,
  [215] = 4333,
  [216] = 3800,
  [217] = 3334,
  [218] = 2666,
}
local function loopDuration(seq) return LOOP_DURATION[seq] end

-- current animation state
local currentMode = "auto"     -- "auto" or "manual"
local currentSeq  = nil        -- sequence id currently playing
local manualSeq   = nil        -- only used in manual mode
local manualTimeMs = 0
local switchTimer = 0          -- seconds until next random switch
local autoKickT   = 0          -- watchdog for auto anims

-- place this right after MODELS and before OnInitialize
local function clampModelId(id)
  -- guard MODELS length in case something weird happens
  local max = (type(MODELS) == "table" and #MODELS or 1)
  if type(id) ~= "number" then return 1 end
  if id < 1 or id > max then return 1 end
  return id
end

-- ---------------------------------------------------------------------------
-- Helpers
-- ---------------------------------------------------------------------------
local function currentModelFrame()
  if frame1Active then return EpicMusicDancer.Model else return EpicMusicDancer.Model2 end
end

local function swapModelFrame()
  currentModelFrame():Hide()
  frame1Active = not frame1Active
  currentModelFrame():Show()
end

local function applyModelScale()
  local scale = MODELS[modelId].modelScale or 1
  if frame1Active then
    EpicMusicDancer.Model2:SetModelScale(scale)
  else
    EpicMusicDancer.Model:SetModelScale(scale)
  end
  swapModelFrame()
end

local function SetDisplayInfo(m, ids)
  if not ids then return false end
  for _,id in ipairs(ids) do
    if type(id) == "number" and id > 0 then
      if pcall(m.SetDisplayInfo, m, id) then return true end
    end
  end
  return false
end

local function setModelOnFrame(entry)
  local m = currentModelFrame()
  m:ClearModel()
  m:SetModelScale(1)

  SetDisplayInfo(m, entry.displayIDs) 
end

local function playSequence(id)
  seq = id
  local mf = currentModelFrame()
  mf:SetSequence(213, 0)
  if mf.SetAnimation then
  --anims = { {seq=69, mode="manual"}, {seq=213}, {seq=214}, {seq=215}, {seq=216} } },
    --mf:SetAnimation(seq)  -- client loops it
  else
  --  mf:SetSequence(seq)   -- fallback
  end
end

local function pickRandomStandIfAny()
  local r = MODELS[modelId].randomstand
  if r and #r > 0 then
    return r[math.random(1, #r)]
  end
  return MODELS[modelId].stand or 69
end

-- how long to keep an animation before switching (seconds)
-- manual ones: 1–2 loops; auto ones: 3–6s
local function emd_next_dwell_seconds(seq, mode)
  if mode == "manual" then
    local loops = math.random(1, 2)
    return (loopDuration(seq) * loops) / 1000
  else
    return math.random(3, 6)
  end
end

local function emd_play(seq, mode)
  local mf = currentModelFrame()
  currentMode = mode or "auto"
  currentSeq  = seq

  if currentMode == "manual" then
    manualSeq   = seq
    manualTimeMs = 0
    --if mf.SetSequence then mf:SetSequence(seq) end
  else
    manualSeq   = nil
    manualTimeMs = 0
    --if mf.SetAnimation then mf:SetAnimation(seq) else mf:SetSequence(seq) end
  end

  switchTimer = emd_next_dwell_seconds(seq, currentMode)
  autoKickT = 0
end

-- pick a new animation from the model's list, avoiding repeating currentSeq
local function emd_pick_next_anim()
  local list = animData -- your per-model anim table, e.g. { {seq=69, mode="manual"}, ... }
  if not list or #list == 0 then
    return { seq = MODELS[modelId].stand or 69, mode = "auto" }
  end

  -- build a pool excluding the current seq to avoid repeats
  local pool = {}
  for i = 1, #list do
    local e = list[i]
    if e.seq ~= currentSeq then table.insert(pool, e) end
  end
  if #pool == 0 then pool = list end

  return pool[math.random(1, #pool)]
end


-- ---------------------------------------------------------------------------
-- Update (only for periodic random switch countdown)
-- ---------------------------------------------------------------------------
--[[
local function OnUpdate(_, elapsed)
  --manual mode is active
  --manualTimeMs = (manualTimeMs + elapsed * 1000) % loopDuration(manualSeq)
  --currentModelFrame():SetSequenceTime(manualSeq, manualTimeMs)

  timeSinceLast = timeSinceLast + elapsed
  if timeSinceLast > 1 then
    timeSinceLast = 0
    randomCountdown = randomCountdown - 1
    if randomCountdown < 1 then
      --EpicMusicDancer:RandomAnim()
    end
  end
end
--]]

--[[
local function OnUpdate(_, elapsed)
  --self:Debug("manualSeq=",manualSeq, " manualTimeMs=", manualTimeMs, "currentSeq=", currentSeq)
  -- drive manual timing smoothly
  if currentMode == "manual" and manualSeq then
    manualTimeMs = (manualTimeMs + elapsed * 1000) % loopDuration(manualSeq)
    currentModelFrame():SetSequenceTime(manualSeq, manualTimeMs)
  end

  -- auto watchdog: some client-driven anims fall asleep; nudge every 2s
  if currentMode == "auto" and currentSeq then
    autoKickT = autoKickT + elapsed
    if autoKickT > 2.0 then
      autoKickT = 0
      local mf = currentModelFrame()
      if mf.SetAnimation then mf:SetAnimation(currentSeq) else mf:SetSequence(currentSeq) end
    end
  end

  -- choreograph switching
  switchTimer = switchTimer - elapsed
  if switchTimer <= 0 then
    local nextEntry = emd_pick_next_anim()
    emd_play(nextEntry.seq, nextEntry.mode or "auto")
  end
end
]]

-- ---------------------------------------------------------------------------
-- Lifecycle
-- ---------------------------------------------------------------------------
function EpicMusicDancer:OnInitialize()
  self.db = EpicMusicPlayer.db
  self:CreateDancerFrame(_G.UIParent)
  self:RegisterMessage("EMPUpdateStop")
  self:RegisterMessage("EMPUpdatePlay")
  self:RegisterMessage("EMPGuiLoaded")
  EpicMusicPlayer:AddOptions("dancer", options)

  -- Ensure defaults exist
  self.db.model = self.db.model or {}
  self.db.model.defaultmodel = self.db.model.defaultmodel or "tauren"
  self.db.model.scale = self.db.model.scale or 1

  modelId = clampModelId(MODEL_MAP[self.db.model.defaultmodel] or 1)

  -- IMPORTANT: SetModel first, then SetScale
  self:SetModel(modelId)
  self:SetScale(self.db.model.scale)

  _G.UIParent:HookScript("OnShow", function()
    if self.db.model.show then self:Show() end
  end)
  --EpicMusicDancer:SetOnUpdate(OnUpdate)
end

function EpicMusicDancer:EMPGuiLoaded()
  if self.frame:IsUserPlaced() then
    self:SetScale(self.db.model.scale or 1)
  end
  modelId = MODEL_MAP[self.db.model.defaultmodel] or modelId
  setModelOnFrame(MODELS[modelId])
  seq = MODELS[modelId].stand or 69
  playSequence(seq)
end

-- ---------------------------------------------------------------------------
-- Public API used by options & EMP
-- ---------------------------------------------------------------------------
function EpicMusicDancer:GetDefaultModel()
  return self.db.model.defaultmodel
end

function EpicMusicDancer:SetDefaultModel(_, value)
  self.db.profile.defaultmodel = value
  modelId = MODEL_MAP[value] or 1
  setModelOnFrame(MODELS[modelId])
end

function EpicMusicDancer:ToggleLock()
  lockPos = not lockPos
  if lockPos then
    self.frame:RegisterForDrag()
    self.hitbox:Hide()
    if not self:IsMouse() then self.frame:EnableMouse(false) end
  else
    self.frame:SetMovable(true)
    self.frame:RegisterForDrag("LeftButton")
    self.hitbox:Show()
    self.frame:EnableMouse(true)
    self.frame:SetParent(_G.UIParent)
  end
  -- force reload to apply scale safely
  setModelOnFrame(MODELS[modelId])
  applyModelScale()
end

function EpicMusicDancer:GetScale()
  return self.db.model.scale or 1
end

function EpicMusicDancer:SetScale(val)
  self.db.model.scale = val
  self.frame:SetScale(val or 1)
  setModelOnFrame(MODELS[modelId])
  applyModelScale()
end

function EpicMusicDancer:IsRandom()
  return self.db.model.random
end
function EpicMusicDancer:ToggleRandom()
  self.db.model.random = not self.db.model.random
end

function EpicMusicDancer:IsPedestal()
  return self.db.model.pedestal
end

function EpicMusicDancer:Show()
  self.frame:Show()
  setModelOnFrame(MODELS[modelId])
  self.db.model.show = true
  
end

function EpicMusicDancer:Hide()
  self.frame:Hide()
  self.Model:Hide()
  self.db.model.show = false
end

function EpicMusicDancer:IsVisible()
  return EMPDancerFrame and EMPDancerFrame:IsVisible()
end

function EpicMusicDancer:ToggleShow()
  if self.db.model.show then self:Hide() else self:Show() end
end

function EpicMusicDancer:IsShowTooltip()
  return self.db.model.tooltip
end
function EpicMusicDancer:ToggleShowTooltip()
  self.db.model.tooltip = not self.db.model.tooltip
end

function EpicMusicDancer:SetBackground()
  self.frame:SetBackdrop({
    bgFile = "Interface/Tooltips/UI-Tooltip-Background",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
  })
  self.frame:SetBackdropColor(0,0,0,1)
end

function EpicMusicDancer:ResetPos()
  self:SetScale(1)
  if _G.EMPGUI then
    self.frame:SetParent(_G.EMPGUI)
    self.frame:ClearAllPoints()
    self.frame:SetPoint("BOTTOM", "EMPGUI", "TOP", -25, -22)
    self.frame:SetPoint("CENTER", "EMPGUI", "CENTER", -25, -22)
    _G.EMPGUI:Show()
    EpicMusicPlayer.db.showgui = true
  else
    self.frame:SetParent(_G.UIParent)
    self.frame:ClearAllPoints()
    self.frame:SetPoint("CENTER")
  end
  self.frame:SetWidth(100)
  self.frame:SetHeight(100)
  self.frame:SetUserPlaced(false)
  self.db.model.pedestal = true
  setModelOnFrame(MODELS[modelId])
  sticky = true
end

function EpicMusicDancer:EMPUpdatePlay()
  if self:IsRandom() then modelId = math.random(1, #MODELS) end
  setModelOnFrame(MODELS[modelId])
  playSequence((animData[nextAnimIndex] and animData[nextAnimIndex].seq) or pickRandomStandIfAny())
end

function EpicMusicDancer:EMPUpdateStop()
  playSequence(pickRandomStandIfAny())
end

function EpicMusicDancer:IsMouse()
  return self.db.model.mouse
end
function EpicMusicDancer:ToggleMouse()
  self.db.model.mouse = not self.db.model.mouse
  if self.db.model.mouse then
    self.frame:EnableMouse(true); self.frame:EnableMouseWheel(true)
  else
    self.frame:EnableMouse(false); self.frame:EnableMouseWheel(false)
  end
end

function EpicMusicDancer:IsGuiToggle()
  return self.db.model.guitoggle
end
function EpicMusicDancer:ToggleGuiToggle()
  self.db.guitoggle = not self.db.guitoggle
end

function EpicMusicDancer:GetModelFrame()
  return currentModelFrame()
end

function EpicMusicDancer:SetModel(id)
  modelId = id
  animData = MODELS[modelId].anims
  nextAnimIndex = 1
  setModelOnFrame(MODELS[modelId])
  self:CancelAllTimers()
  self:ScheduleTimer(applyModelScale, 0.1)
end

function EpicMusicDancer:ToggleDancing()
  if EpicMusicPlayer.Playing then
    dancing = true
  elseif MODELS[modelId].anims then
    dancing = true
    playSequence(69)
  else
    dancing = false
  end
end

function EpicMusicDancer:SetLastModel()
  modelId = modelId - 1; if modelId < 1 then modelId = #MODELS end
  setModelOnFrame(MODELS[modelId])
end

function EpicMusicDancer:SetNextModel()
  modelId = modelId + 1; if modelId > #MODELS then modelId = 1 end
  setModelOnFrame(MODELS[modelId])
end

-- ---------------------------------------------------------------------------
-- Random animation swap (choose a new sequence index)
-- ---------------------------------------------------------------------------
function EpicMusicDancer:RandomAnim()
  if EpicMusicPlayer.Playing then return end  -- keep dancing!
  randomCountdown = math.random(5, 10)
  if not animData or #animData <= 1 then return end
  nextAnimIndex = math.random(1, #animData)
  --playSequence(animData[nextAnimIndex].seq or pickRandomStandIfAny())
  --anims = { {seq=69, mode="manual"}, {seq=213}, {seq=214}, {seq=215}, {seq=216} } },
  playSequence(213)
end


function EpicMusicDancer:RandomAnim()
  local e = emd_pick_next_anim()
  emd_play(e.seq, e.mode or "auto")
end

function EpicMusicDancer:EMPUpdatePlay()
  if self:IsRandom() then modelId = math.random(1, #MODELS) end
  self:SetModel(modelId)
  -- start with dance (manual) or your first listed anim
  local start = animData[1] or { seq = 69, mode = "manual" }
  emd_play(start.seq, start.mode or "auto")
end

function EpicMusicDancer:EMPUpdateStop()
  -- settle on idle/stand (client-driven) and pause switching
  currentMode = "auto"
  currentSeq  = MODELS[modelId].stand or 69
  manualSeq   = nil
  manualTimeMs = 0
  switchTimer = math.huge -- effectively stop switching while idle
  local mf = currentModelFrame()
  --if mf.SetAnimation then mf:SetAnimation(currentSeq) else mf:SetSequence(currentSeq) end
end
