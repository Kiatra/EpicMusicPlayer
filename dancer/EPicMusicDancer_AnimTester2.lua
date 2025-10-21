-- EMD_AnimTester_UI.lua — minimal sequence tester with buttons (Retail)
-- No Ace deps. Uses PlayerModel + displayIDs. Dance (69) runs manual-timed.

local CreateFrame = CreateFrame
local UIParent = UIParent
local math = math
local print = print

------------------------------------------------------------
-- Preset displays (L70ETC + guard + murloc suit)
------------------------------------------------------------
local MODEL_LIST = {
  [1] = { name="Tauren Drummer (21661)",  displayID=21661, modelScale=0.10, stand=132, seqData = { 
      { seq=69, ms=2000, label="69" },
			{ seq=213, ms=4166, label="213" },
			{ seq=214, ms=1200, label="214" },
      { seq=215, ms=2100, label="215" },
			{ seq=216, ms=1166, label="216" },
	  },
  },
  [2] = { name="Blood Elf Guitar (21666)",displayID=21666, modelScale=0.30, stand=132, seqData = { 
      { seq = 69, ms = 3700 },
			{ seq = 213, ms = 4166 },
			{ seq = 214, ms = 1767 },
      { seq = 215, ms = 4333 },
			{ seq = 216, ms = 6766 },
    },    
  }
 --[3] = { name="Troll Guitar (21662)",    displayID=21662, modelScale=0.60, stand=132 },
 -- [4] = { name="Undead Bass (21659)",     displayID=21659, modelScale=0.60, stand=132 },
 -- [5] = { name="Orc Singer (21665)",      displayID=21665, modelScale=0.60, stand=132 },
 -- [6] = { name="BE Guard (47519)",        displayID=47519, modelScale=0.70, stand=115 },
 -- [7] = { name="Murloc Suit (21723)",     displayID=21723, modelScale=0.70, stand=115 },
}

------------------------------------------------------------
-- Frame & Model
------------------------------------------------------------
local f = CreateFrame("Frame", "EMD_SequenceTesterFrame", UIParent, BackdropTemplateMixin and "BackdropTemplate")

local width = 660
local heigth = 600

f:SetSize(width, heigth)
f:SetPoint("CENTER")
f:SetBackdrop({
  bgFile="Interface/Tooltips/UI-Tooltip-Background",
  edgeFile="Interface/Tooltips/UI-Tooltip-Border",
  tile=true, tileSize=16, edgeSize=16,
  insets={left=4,right=4,top=4,bottom=4}
})
f:SetBackdropColor(0,0,0,0.85)
f:EnableMouse(true)
f:SetMovable(true)
f:RegisterForDrag("LeftButton")
f:SetScript("OnDragStart", f.StartMoving)
f:SetScript("OnDragStop", f.StopMovingOrSizing)

local title = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
title:SetPoint("TOPLEFT", 12, -10)
title:SetText("EMD Sequence Tester")

local modelFrame = CreateFrame("PlayerModel", nil, f)
modelFrame:SetPoint("TOPLEFT", 12, -36)
modelFrame:SetSize(width, heigth)
modelFrame:SetKeepModelOnHide(true)
modelFrame:SetCamera(1)

local infoText = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
infoText:SetPoint("TOPLEFT", modelFrame, "TOPRIGHT", 12, 0)
infoText:SetJustifyH("LEFT")
infoText:SetText("—")

------------------------------------------------------------
-- State
------------------------------------------------------------
local currentModelId = 1
local running       = false
local randomMode    = false   -- when true, switcher runs
local currentSeqId  = 0
local currentMode   = "auto"  -- "manual" or "auto"
local currentSeqProgressMs  = 0
local switchTimer   = 0       -- seconds until switch

------------------------------------------------------------
-- Helpers
------------------------------------------------------------
local function setInfo()
  local d = MODEL_LIST[currentModelId]
  local seqData = d.seqData[currentSeq]
  local seq = seqData.seq or (d.stand or 132)
  local mode = currentMode
  local dur = seqData.ms or 0
  local status = running and (randomMode and "running: random" or "running: single") or "stopped"
  infoText:SetText((
    "Model: |cffffffff%s|r\nSeq: |cffffffff%d|r  (%s)\nDuration: |cffffffff%d ms|r\nStatus: |cffffffff%s|r"
  ):format(d.name, seq, mode, dur, status))
end

local function play(seq, mode)
  currentSeq  = seq
  currentMode = mode or "auto"
  currentSeqProgressMs = 0

  if currentMode == "manual" then
    modelFrame:SetSequence(seq)   -- base pose
  else
    modelFrame:SetAnimation(seq)  -- client-driven loop
  end

  local ms = getSeqData(currentModelId, currentSeqId) or 4000
  if randomMode then
    if currentMode == "manual" then
      local loops = math.random(1, 2)
      switchTimer = (ms * loops) / 1000
    else
      switchTimer = ms / 1000
    end
  else
    switchTimer = math.huge
  end
  setInfo()
end

local function pickNext()
  --local pool = {}
  --for i=1,#ANIMS do
  --  if ANIMS[i].seq ~= currentSeq then table.insert(pool, ANIMS[i]) end
  --end
  --if #pool == 0 then pool = ANIMS end
  --return pool[math.random(1,#pool)]
end

local function setDisplay(index)
  currentModelId = math.max(1, math.min(index, #MODEL_LIST))
  local entry = MODEL_LIST[currentModelId]
  modelFrame:ClearModel()
  modelFrame:SetModelScale(1)
  modelFrame:SetDisplayInfo(entry.displayID)
  modelFrame:SetModelScale(entry.modelScale * 2 or 1)
  modelFrame:SetAnimation(entry.stand or 132)
  setInfo()
end

local function getSeqData(modelId, seqId)
  local d = MODEL_LIST[modelId]
  return d.seqData[seqId] or {seq = 69, ms = 100}
end

------------------------------------------------------------
-- OnUpdate: manual timing & random switching
------------------------------------------------------------
f:SetScript("OnUpdate", function(_, elapsed)
  if not running then return end

  if currentMode == "manual" and currentSeq then
    local ms = currentSeq or 8000
    currentSeqProgressMs = ((currentSeqProgressMs + elapsed * 1000) % ms) / 2
    
    print(currentSeqProgressMs)
    modelFrame:SetSequenceTime(currentSeq, currentSeqProgressMs)
  else
    print(currentSeqProgressMs)
    currentSeqProgressMs = (currentSeqProgressMs + elapsed * 1000)
    if currentSeqProgressMs > getSeqData(currentModelId,currentSeq).ms then
      currentSeqProgressMs = getSeqData(currentModelId,currentSeq).ms or 8000
      currentSeqProgressMs = 0
      --modelFrame:SetAnimation(entry.stand or 132)
      modelFrame:SetAnimation(currentSeq)
    end
  end

  if randomMode then
    switchTimer = switchTimer - elapsed
    if switchTimer <= 0 then
      local e = pickNext()
      play(e.seq, e.mode or "auto")
    end
  end
end)

------------------------------------------------------------
-- UI: Buttons & Controls
------------------------------------------------------------
-- Flexible NewButton: supports both short and long SetPoint forms
-- short: NewButton(parent, text, w, h, point, x, y, onClick)
-- long : NewButton(parent, text, w, h, point, relativeTo, relativePoint, x, y, onClick)
local function NewButton(parent, text, w, h, point, a, b, c, d, onClick)
  local btn = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
  btn:SetSize(w, h)

  if type(b) == "string" or type(a) == "table" then
    -- long form: point, relativeTo(a), relativePoint(b), x(c), y(d), onClick
    btn:SetPoint(point, a, b, c, d)
    btn:SetScript("OnClick", onClick)
  else
    -- short form: point, x(a), y(b), onClick(c)
    btn:SetPoint(point, a, b)
    btn:SetScript("OnClick", c)
  end

  btn:SetText(text)
  return btn
end

-- Random toggle (when running, this controls switching)
local btnRandom = NewButton(f, "Random On", 84, 24, "TOPRIGHT", -12, -96, function(self)
  randomMode = not randomMode
  self:SetText(randomMode and "Random On" or "Random Off")
  if running then
    -- reset timer for current sequence
    local ms = (getSeqData(currentModelId, currentSeqId) or 132) or 4000
    if currentMode == "manual" then
      local loops = math.random(1, 2)
      switchTimer = (ms * loops) / 1000
    else
      switchTimer = ms / 1000
    end
  end
  setInfo()
end)

-- Prev / Next model
local btnPrev = NewButton(f, "< Model", 84, 24, "TOPRIGHT", -12, -138, function()
  local idx = currentModelId - 1; if idx < 1 then idx = #MODEL_LIST end
  setDisplay(idx)
end)
local btnNext = NewButton(f, "Model >", 84, 24, "TOPRIGHT", -12, -168, function()
  local idx = currentModelId + 1; if idx > #MODEL_LIST then idx = 1 end
  setDisplay(idx)
end)

-- Quick sequence row: 69 / 213 / 214 / 215 / 216
local seqLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
seqLabel:SetPoint("TOPLEFT", modelFrame, "BOTTOMLEFT", 0, -6)
seqLabel:SetText("Sequences:")

local bx = 0
for i=1,#MODEL_LIST[0].seqData do
  local e = #MODEL_LIST[0].seqData[i]
  local b = NewButton(f, e.label or tostring(e.seq), 68, 22, "TOPLEFT", modelFrame, "BOTTOMLEFT", bx, -26, function()
    running = true
    randomMode = false
    play(e.seq, e.mode)
  end)
  bx = bx + 72
end

-- Duration editor for current sequence
local durLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
durLabel:SetPoint("TOPLEFT", modelFrame, "BOTTOMLEFT", 0, -58)
durLabel:SetText("Duration (ms) for current seq:")

local durBox = CreateFrame("EditBox", nil, f, "InputBoxTemplate")
durBox:SetSize(80, 24)
durBox:SetPoint("TOPLEFT", durLabel, "BOTTOMLEFT", 0, -4)
durBox:SetAutoFocus(false)
durBox:SetNumeric(true)
durBox:SetNumber(8000)

local btnSetDur = NewButton(f, "Set", 48, 24, "LEFT", durBox, "RIGHT", 6, 0, function()
  local seq = currentSeq or (MODEL_LIST[currentModelId].stand or 132)
  local ms = tonumber(durBox:GetText())
  if seq and ms and ms > 0 then
    getSeqData(currentModelId, currentModelId).ms = ms
    print(("EMD: seq %d duration set to %d ms"):format(seq, ms))
    -- restart dwell timer if running
    if running then
      if currentMode == "manual" then
        currentSeqProgressMs = 0
        local loops = randomMode and math.random(1, 2) or 1
        switchTimer = (ms * loops) / 1000
      else
        switchTimer = (randomMode and (ms/1000) or math.huge)
      end
    end
    setInfo()
  end
end)

local btnSetDur = NewButton(f, "Next Frame", 75, 24, "LEFT", btnSetDur, "RIGHT", 6, 0, function()
  local seq = currentSeq or (MODEL_LIST[currentModelId].stand or 132)
  local ms = tonumber(durBox:GetText())
  if seq and ms and ms > 0 then
    getSeqData(currentModelId, currentModelId).ms = ms
    print(("EMD: seq %d duration set to %d ms"):format(seq, ms))
    -- restart dwell timer if running
    if running then
      if currentMode == "manual" then
        currentSeqProgressMs = 0
        local loops = randomMode and math.random(1, 2) or 1
        switchTimer = (ms * loops) / 1000
      else
        switchTimer = (randomMode and (ms/1000) or math.huge)
      end
    end
    setInfo()
  end
end)

-- Current model label
local modelName = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
modelName:SetPoint("LEFT", btnPrev, "LEFT", 0, 22)
modelName:SetText("")

-- keep name updated when display changes
--hooksecurefunc(f, "OnShow", function() end)
--local function refreshModelName()
--  modelName:SetText(MODEL_LIST[currentModelId].name)
--end

------------------------------------------------------------
-- Init
------------------------------------------------------------
setDisplay(currentModelId)
--refreshModelName()
modelFrame:Show()
f:Show()
setInfo()
