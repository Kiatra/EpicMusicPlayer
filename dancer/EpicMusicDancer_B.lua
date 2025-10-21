-- EpicMusicDancer (Option B: Manual SetSequenceTime with safe modulo wrap)
-- Removes hard-coded endframe; loops animations with a fixed modulo window.

local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local EpicMusicDancer = LibStub("AceAddon-3.0"):NewAddon("EpicMusicDancer", "AceEvent-3.0", "AceTimer-3.0")
EpicMusicPlayer.EpicMusicDancer = EpicMusicDancer

local x = nil
 

local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")
local _G, math = _G, math

-- ---------------------------------------------------------------------------
-- State
-- ---------------------------------------------------------------------------
local seq = nil
local seqTimeMs = 0
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

-- loop window for SetSequenceTime (milliseconds) — large enough to look natural
local LOOP_MS = 10000

-- ---------------------------------------------------------------------------
-- Models & animations (now only seq IDs; no endframe)
-- ---------------------------------------------------------------------------
local MODELS = {
  { file="Creature/band/bandTaurenMale.M2", modelScale=0.4, stand=132, anims={{seq=69},{seq=213},{seq=214},{seq=215},{seq=216}} },
  { file="Creature/band/bandBloodElfMale.M2", modelScale=0.7, stand=132, anims={{seq=213},{seq=214},{seq=215},{seq=216}} },
  { file="Creature/band/bandTrollMale.M2",    modelScale=0.6, stand=132, anims={{seq=213},{seq=214},{seq=215}} },
  { file="Creature/band/bandUndeadMale.M2",   modelScale=0.6, stand=132, anims={{seq=213},{seq=214},{seq=215},{seq=216}} },
  { file="Creature/band/bandOrcMale.M2",      modelScale=0.6, anims={{seq=213},{seq=214},{seq=215},{seq=216},{seq=217},{seq=218}} },
  { file="Creature/BloodElfGuard/BloodElfMale_Guard.M2", modelScale=0.7, stand=115, anims={{seq=69}} },
  { file="Creature/Murloccostume/murloccostume.m2", modelScale=0.7, stand=115, randomstand={73,80,82}, anims={{seq=69}} },
}
local MODEL_MAP = { guard=6, orc=5, bloodelf=2, undead=4, troll=3, tauren=1, murloccostume=7 }

-- ---------------------------------------------------------------------------
-- Options (same as Option A)
-- ---------------------------------------------------------------------------
local options = {
  name = L["MusicDancer"],
  order = 5, type = "group",
  args = {
    show = { type="toggle", order=1, name=L["Show Dancer"], desc=L["Toggle show model."],
      get=function() return EpicMusicDancer:IsVisible() end,
      set=function() EpicMusicDancer:ToggleShow() end },
    guihide = { type="toggle", order=2, name=L["Toggle with GUI"], desc=L["Showing/hiding the GUI will show/hide the dancer."],
      get=function() return EpicMusicDancer:IsGuiToggle() end,
      set=function() EpicMusicDancer:ToggleGuiToggle() end },
    random = { type="toggle", order=3, name=L["Random Model"], desc=L["Show a random model when playing a new song."],
      get=function() return EpicMusicDancer:IsRandom() end,
      set=function() EpicMusicDancer:ToggleRandom() end },
    setmodel = { type="select", order=4, name=L["Set Model"], desc=L["Select a model"],
      values = { bloodelf="Sid Nicious", undead="Bergrisst", troll="Mai'Kyl", tauren="Chief Thunder-Skins", orc="Samuro", guard="Bloodelf Guard", murloccostume="Murloccostume" },
      get=function() return EpicMusicDancer:GetDefaultModel() end,
      set=function(info, v) EpicMusicDancer:SetDefaultModel(info, v) end },
    scale = { type="range", order=8, name=L["Model Size"], desc=L["Adjust the size of the model frame"],
      step=0.1, min=0.1, max=5, get=function() return EpicMusicDancer:GetScale() end,
      set=function(_, v) EpicMusicDancer:SetScale(v) end },
    lock = { type="toggle", order=9, name=L["Lock"],
      desc=L["Unlock to allow moving the model. Moving will release the model from the GUI. Use reset to reattach."],
      get=function() return lockPos end, set=function() EpicMusicDancer:ToggleLock() end },
    mouse = { type="toggle", order=11, name=L["Enable Mouse"], desc=L["Click me or scroll me. I won\'t bite. 8==8"],
      get=function() return EpicMusicDancer:IsMouse() end, set=function() EpicMusicDancer:ToggleMouse() end },
    tooltip = { type="toggle", order=12, name=L["Show Tooltip"], desc=L["Show Tooltip"],
      get=function() return EpicMusicDancer:IsShowTooltip() end, set=function() EpicMusicDancer:ToggleShowTooltip() end },
    strata = { type="select", order=13, name=L["Frame strata"], desc=L["Frame strata"],
      values={ FULLSCREEN_DIALOG="Fullscreen_Dialog", FULLSCREEN="Fullscreen", DIALOG="Dialog", HIGH="High", MEDIUM="Medium", LOW="Low", BACKGROUND="Background" },
      get=function() return EpicMusicDancer.db.model.strata end,
      set=function(_, v) EpicMusicDancer.db.model.strata=v; EpicMusicDancer.frame:SetFrameStrata(v) end },
    reset = { type="execute", order=-1, name=L["Reset Position"],
      desc=L["This will set the model to the default size and attach it to the GUI."],
      func=function() EpicMusicDancer:ResetPos() end },
  }
}

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
  if frame1Active then EpicMusicDancer.Model2:SetModelScale(scale) else EpicMusicDancer.Model:SetModelScale(scale) end
  swapModelFrame()
end

local function setModelOnFrame(modelFile)
  local mf = currentModelFrame()
  mf:ClearModel()
  mf:SetModelScale(1)
  mf:SetModel(modelFile, true)
end

local function pickRandomStandIfAny()
  local r = MODELS[modelId].randomstand
  if r and #r > 0 then return r[math.random(1, #r)] end
  return MODELS[modelId].stand or 69
end

-- ---------------------------------------------------------------------------
-- Update (drives SetSequenceTime with a safe modulo loop)
-- ---------------------------------------------------------------------------
local function OnUpdate(_, elapsed)
  timeSinceLast = timeSinceLast + elapsed
  if seq then
    seqTimeMs = (seqTimeMs + elapsed * 1000) % LOOP_MS
    if dancing then currentModelFrame():SetSequenceTime(seq, seqTimeMs) end
  end
  if timeSinceLast > 1 then
    timeSinceLast = 0
    randomCountdown = randomCountdown - 1
    if randomCountdown < 1 then EpicMusicDancer:RandomAnim() end
  end
end

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

  _G.UIParent:HookScript("OnShow", function()
    if EpicMusicDancer.db.model.show then EpicMusicDancer:Show() end
  end)

  self:SetScale(self.db.model.scale or 1)
end

function EpicMusicDancer:EMPGuiLoaded()
  if self.frame:IsUserPlaced() then self:SetScale(self.db.model.scale or 1) end
  modelId = MODEL_MAP[self.db.model.defaultmodel] or modelId
  self:SetModel(modelId)
  seq = MODELS[modelId].stand or 69
  seqTimeMs = 0
end

-- ---------------------------------------------------------------------------
-- Public API
-- ---------------------------------------------------------------------------
function EpicMusicDancer:GetDefaultModel()
  return self.db.model.defaultmodel
end

function EpicMusicDancer:SetDefaultModel(_, value)
  self.db.profile.defaultmodel = value
  modelId = MODEL_MAP[value] or 1
  self:SetModel(modelId)
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
  setModelOnFrame(MODELS[modelId].file)
  applyModelScale()
end

function EpicMusicDancer:GetScale()
  return self.db.model.scale or 1
end

function EpicMusicDancer:SetScale(val)
  self.db.model.scale = val
  self.frame:SetScale(val or 1)
  setModelOnFrame(MODELS[modelId].file)
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
  self:SetModel(modelId)
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
  self.frame:SetWidth(100); self.frame:SetHeight(100)
  self.frame:SetUserPlaced(false)
  self.db.model.pedestal = true
  self:SetModel(modelId)
  sticky = true
end

function EpicMusicDancer:EMPUpdatePlay()
  if self:IsRandom() then modelId = math.random(1, #MODELS) end
  self:SetModel(modelId)
  seq = (animData[nextAnimIndex] and animData[nextAnimIndex].seq) or pickRandomStandIfAny()
  seqTimeMs = 0
end

function EpicMusicDancer:EMPUpdateStop()
  seq = pickRandomStandIfAny()
  seqTimeMs = 0
end

function EpicMusicDancer:IsMouse() return self.db.model.mouse end
function EpicMusicDancer:ToggleMouse()
  self.db.model.mouse = not self.db.model.mouse
  if self.db.model.mouse then
    self.frame:EnableMouse(true); self.frame:EnableMouseWheel(true)
  else
    self.frame:EnableMouse(false); self.frame:EnableMouseWheel(false)
  end
end

function EpicMusicDancer:IsGuiToggle() return self.db.model.guitoggle end
function EpicMusicDancer:ToggleGuiToggle() self.db.guitoggle = not self.db.guitoggle end

function EpicMusicDancer:GetModelFrame() return currentModelFrame() end

function EpicMusicDancer:SetModel(id)
  modelId = id
  animData = MODELS[modelId].anims
  nextAnimIndex = 1
  setModelOnFrame(MODELS[modelId].file)
  self:CancelAllTimers()
  self:ScheduleTimer(applyModelScale, 0.1)
end

function EpicMusicDancer:ToggleDancing()
  if EpicMusicPlayer.Playing then
    dancing = true
  elseif MODELS[modelId].anims then
    dancing = true
    seq = 69; seqTimeMs = 0
  else
    dancing = false
  end
end

function EpicMusicDancer:SetLastModel()
  modelId = modelId - 1; if modelId < 1 then modelId = #MODELS end
  self:SetModel(modelId)
end

function EpicMusicDancer:SetNextModel()
  modelId = modelId + 1; if modelId > #MODELS then modelId = 1 end
  self:SetModel(modelId)
end

-- ---------------------------------------------------------------------------
-- Frame creation
-- ---------------------------------------------------------------------------
function EpicMusicDancer:CreateDancerFrame(parent)
  self.frame = _G.CreateFrame("Button", "EMPDancerFrame", _G.UIParent, BackdropTemplateMixin and "BackdropTemplate")
  EMPDancerFrame = self.frame
  self.frame:SetWidth(100); self.frame:SetHeight(100)
  self.frame:SetParent(parent)

  EpicMusicDancer.frame:SetPoint("BOTTOM", "EMPGUI", "TOP", -25, -22)
  EpicMusicDancer.frame:SetPoint("CENTER", "EMPGUI", "CENTER", -25, -22)
  sticky = true

  self.frame:SetFrameStrata(self.db.model.strata or "MEDIUM")
  self.frame:SetMovable(true)
  self.frame:SetClampedToScreen(true)

  if self.db.model.show then self.frame:Show() else self.frame:Hide() end

  self.frame:SetHitRectInsets(10, 10, 25, 0)

  self.frame:SetScript("OnMouseUp", function(s, btn)
    EpicMusicPlayer:OnDisplayClick(s, btn)
    if tooltip then _G.EpicMusicPlayerGui:ShowTooltip(tooltip) end
  end)

  if self.db.model.mouse then
    self.frame:EnableMouse(true); self.frame:EnableMouseWheel(true)
  else
    self.frame:EnableMouse(false); self.frame:EnableMouseWheel(false)
  end

  self.hitbox = _G.CreateFrame("Frame", "EMPDancerHitbox", EMPDancerFrame, BackdropTemplateMixin and "BackdropTemplate")
  self.hitbox:SetWidth(80); self.hitbox:SetHeight(75)
  self.hitbox:SetPoint("BOTTOMLEFT", EMPDancerFrame, 10, 0)
  self.hitbox:SetBackdrop({
    bgFile="Interface/Tooltips/UI-Tooltip-Background",
    edgeFile="Interface/Tooltips/UI-Tooltip-Border",
    tile=true, tileSize=16, edgeSize=16,
    insets={left=4,right=4,top=4,bottom=4}
  })
  self.hitbox:SetBackdropColor(0,0,0,1)
  self.hitbox:SetBackdropBorderColor(1,0,0)
  self.hitbox:Hide()

  self.pedestal = _G.CreateFrame("Frame", "EMPDancerPodest", EMPDancerFrame, BackdropTemplateMixin and "BackdropTemplate")
  self.pedestal.texture = self.pedestal:CreateTexture(nil)
  self.pedestal.texture:SetTexture("Interface\\AddOns\\EpicMusicPlayer\\modules\\dancer\\podest.tga")
  self.pedestal.texture:SetAllPoints(self.pedestal)
  self.pedestal:SetWidth(100); self.pedestal:SetHeight(32)
  self.pedestal:SetPoint("CENTER", 0, -46)
  if not self:IsPedestal() then self.pedestal:Hide() end

  local model = _G.CreateFrame("PlayerModel", nil, EMPDancerFrame, BackdropTemplateMixin and "BackdropTemplate")
  model:SetWidth(100); model:SetHeight(100)
  model:ClearAllPoints(); model:SetAllPoints(EpicMusicDancer.frame)
  model:SetCamera(1); model:SetKeepModelOnHide(true)
  model:Hide()
  EpicMusicDancer.Model = model

  local model2 = _G.CreateFrame("PlayerModel", nil, EMPDancerFrame, BackdropTemplateMixin and "BackdropTemplate")
  model2:SetWidth(100); model2:SetHeight(100)
  model2:ClearAllPoints(); model2:SetAllPoints(EpicMusicDancer.frame)
  model2:SetCamera(1); model2:SetKeepModelOnHide(true)
  EpicMusicDancer.Model2 = model2

  self.frame:SetScript("OnMouseWheel", function(_, value)
    EpicMusicPlayer:DisplyScrollHandler(value)
  end)

  self.frame:SetScript("OnDragStart", function(s) s:StartMoving(); s.isMoving = true end)
  self.frame:SetScript("OnDragStop",  function(s) s:StopMovingOrSizing(); s.isMoving = false end)

  self.frame:SetScript("OnEnter", function(s)
    if EpicMusicPlayer.db.tooltip then tooltip = s; EpicMusicPlayer:ShowTooltip(s) end
  end)
  self.frame:SetScript("OnLeave", function()
    if self.db.model.tooltip then tooltip = nil; _G.GameTooltip:Hide() end
  end)

  model:SetScript("OnUpdate", OnUpdate)
  model2:SetScript("OnUpdate", OnUpdate)
end

-- ---------------------------------------------------------------------------
-- Random animation swap
-- ---------------------------------------------------------------------------
function EpicMusicDancer:RandomAnim()
  randomCountdown = math.random(5, 10)
  if not animData or #animData <= 1 then return end
  nextAnimIndex = math.random(1, #animData)
  seq = animData[nextAnimIndex].seq or pickRandomStandIfAny()
  seqTimeMs = 0
end
