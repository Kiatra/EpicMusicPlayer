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
  { name="Tauren Drummer (21661)",  displayID=21661, modelScale=0.10, stand=132, seqData = { 
      { seq=69, ms=5200 },
			{ seq=213, ms=4166 },
			{ seq=214, ms=1200},
      { seq=215, ms=2100 },
			{ seq=216, ms=1166 },
      { seq=132, ms=1166 },
	  },
  },
  { name="Blood Elf Guitar (21666)",displayID=21666, modelScale=0.30, stand=132, seqData = { 
      { seq = 69, ms = 3700 },
			{ seq = 213, ms = 4166 },
			{ seq = 214, ms = 1767 },
      { seq = 215, ms = 4333 },
			{ seq = 216, ms = 6766 },
      { seq=132},
    },    
  },
  { name="Player",displayID=-1, modelScale=1, stand=132, seqData = { 
      { seq = 69},
			{ seq = 213, ms = 4166 },
			{ seq = 214, ms = 1767 },
      { seq = 215, ms = 4333 },
			{ seq = 216, ms = 6766 },
      { seq=132, ms=1166 },
    },
  },
  { name="Human",displayID=1564, modelScale=1, stand=132, seqData = { 
      { seq = 69},
			{ seq = 213, ms = 4166 },
			{ seq = 214, ms = 1767 },
      { seq = 215, ms = 4333 },
			{ seq = 216, ms = 6766 },
      { seq=132, ms=1166 },
    },
  },       
  { name="Troll Guitar (21662)",    displayID=21662, modelScale=0.60, stand=132, seqData = { 
      { seq = 69},
			{ seq = 213, ms = 4166 },
			{ seq = 214, ms = 1767 },
      { seq = 215, ms = 4333 },
			{ seq = 216, ms = 6766 },
      { seq=132, ms=1166 },
    },
},
 -- [4] = { name="Undead Bass (21659)",     displayID=21659, modelScale=0.60, stand=132 },
 -- [5] = { name="Orc Singer (21665)",      displayID=21665, modelScale=0.60, stand=132 },
 -- [6] = { name="BE Guard (47519)",        displayID=47519, modelScale=0.70, stand=115 },
  { name="Murloc Suit (21723)",     displayID=21723, modelScale=0.70, stand=115, seqData = { 
      { seq = 69}, 
  },
}
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

local title= f:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
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

----

local dressFrame = CreateFrame("Frame", "EMD_SequenceTesterFrame", UIParent, BackdropTemplateMixin and "BackdropTemplate")
dressFrame:Hide()
local width2 = 660
local heigth2 = 600

dressFrame:SetSize(width2, heigth2)
dressFrame:SetPoint("CENTER")
dressFrame:SetBackdrop({
  bgFile="Interface/Tooltips/UI-Tooltip-Background",
  edgeFile="Interface/Tooltips/UI-Tooltip-Border",
  tile=true, tileSize=16, edgeSize=16,
  insets={left=4,right=4,top=4,bottom=4}
})
dressFrame:SetBackdropColor(0,0,0,0.85)
dressFrame:EnableMouse(true)
dressFrame:SetMovable(true)
dressFrame:RegisterForDrag("LeftButton")
dressFrame:SetScript("OnDragStart", f.StartMoving)
dressFrame:SetScript("OnDragStop", f.StopMovingOrSizing)

local title2 = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
title2:SetPoint("TOPLEFT", 12, -10)
title2:SetText("EMD Sequence Tester")

local modelDressFrame = CreateFrame("DressUpModel", nil, dressFrame)
modelDressFrame:SetPoint("TOPLEFT", 12, -36)
modelDressFrame:SetSize(width2, heigth2)
modelDressFrame:SetKeepModelOnHide(true)
modelDressFrame:SetCamera(1)

local infoText2 = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
infoText2:SetPoint("TOPLEFT", modelDrsssFrame, "TOPRIGHT", 12, 0)
infoText2:SetJustifyH("LEFT")
infoText2:SetText("—")

------------------------------------------------------------
-- State
------------------------------------------------------------
local currentModelId = 1
local running       = false
local randomMode    = false   -- when true, switcher runs
local currentSeqId  = 1
local currentSeq = 1
local currentModeAuto  = true  -- "manual" or "auto"
local currentSeqProgressMs  = 0
local currentSeqDurationMS = 1000
local switchTimer   = 0       -- seconds until switch

------------------------------------------------------------
-- Helpers
------------------------------------------------------------
local function debug(...)
  local s = "EMP Debug:"
	for i=1,select("#", ...) do
		local x = select(i, ...)
		s = strjoin("  ",s,tostring(x))
	end
	DEFAULT_CHAT_FRAME:AddMessage(s)
end

local function getSeqData(modelId, seqId)
  local d = MODEL_LIST[modelId]
  return d.seqData[seqId] or {seq = 69, ms = 100}
end

local function isAutoLoop(modelId, seqId)
  local d = MODEL_LIST[modelId]
  if d and d.seqData and d.seqData[seqId] and d.seqData[seqId].ms then
    return false
  else
    return true
  end
end


local function setInfo()
  local d = MODEL_LIST[currentModelId]
  local seqData = d.seqData[currentSeqId]
  CURR = currentSeqId
  local seq = seqData.seq or (d.stand or 132)
  local dur = seqData.ms or 0
  local status = running and (randomMode and "running: random" or "running: single") or "stopped"
  infoText:SetText((
    "Model: |cffffffff%s|r\nSeq: |cffffffff%d|r auto: (%s)\nDuration: |cffffffff%d ms|r\nStatus: |cffffffff%s|r"
  ):format(d.name, seq, tostring(currentModeAuto), dur, status))
end

local function onUpdate(_, elapsed)
  if not running then return end

  if not currentModeAuto and currentSeq then
    --local ms = currentSeq or 8000
    currentSeqProgressMs = ((currentSeqProgressMs + elapsed * 1000))
    
    print(currentSeqProgressMs)
    modelFrame:SetSequenceTime(currentSeq, currentSeqProgressMs)
    if currentSeqProgressMs > currentSeqDurationMS then
       currentSeqProgressMs = currentSeqDurationMS or 8000
       currentSeqProgressMs = 0
    end 
  else
    --print(currentSeqProgressMs)
    currentSeqProgressMs = (currentSeqProgressMs + elapsed * 1000)
    if currentSeqProgressMs > currentSeqDurationMS then
      currentSeqProgressMs = currentSeqDurationMS or 8000
      currentSeqProgressMs = 0
      --modelFrame:SetAnimation(entry.stand or 132)
      modelFrame:SetAnimation(currentSeq)
    end
  end

  if randomMode then
    switchTimer = switchTimer - elapsed
    if switchTimer <= 0 then
      local e = pickNext()
      play(e.seq)
    end
  end
end

local function play(seq, seqId)
  --currentModeAuto = mode or true
  currentSeq = seq
  debug("play seq:", seq, "mode:", currentModeAuto)
  currentSeqId = seqId or 1
   --currentSeqId = seq
  
  currentSeqProgressMs = 0
   
  if isAutoLoop(currentModelId, seqId) then
    f:SetScript("OnUpdate", nil)
    debug("OnUpdate = nil")
  else
    f:SetScript("OnUpdate", onUpdate)
    debug("OnUpdate", onUpdate)
  end

  if currentModeAuto then
    modelFrame:SetAnimation(seq)  -- client-driven loop but! band animations only run once, need to restart them
  else
    modelFrame:SetSequence(seq)   -- base pose
  end

  local ms = getSeqData(currentModelId, currentSeqId).ms or 4000
  currentSeqDurationMS = ms

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
  if (entry.displayID > 0 ) then
    --modelFrame:SetDisplayInfo(1624825)
   modelFrame:SetDisplayInfo(entry.displayID)
   --modelFrame:SetFileID(1624825)
  else
    modelFrame:SetUnit("player")
  end 
  modelFrame:SetCamera(1)      
  --modelFrame:SetCamDistanceScale(2) 
  modelFrame:SetModelScale(entry.modelScale * 2 or 1)
  modelFrame:SetAnimation(entry.stand or 132)
  --modelFrame:SetCustomRace(3, 3)
  setInfo()
end

--/run print(GetInventoryItemLink("player", 5)); 
--GetInventoryItemID("player", 5)

--/run print(GetInventoryItemLink("player", 5)); 
--GetInventoryItemID("player", 5)

C_TransmogCollection.GetItemInfo(235455)

--itemAppearanceID, itemModifiedAppearanceID = C_TransmogCollection.GetItemInfo(itemInfo)

local f2 = CreateFrame("Frame")
f2:RegisterEvent("PLAYER_LOGIN")
f2:SetScript("OnEvent", function()
  C_Timer.After(0, function()  -- next frame
    modelDressFrame:ClearModel()
    modelDressFrame:SetUnit("player")
    --local model = CreateFrame("DressUpModel", nil, UIParent)
    --local entry = MODEL_LIST[currentModelId]
   -- modelFrame:SetDisplayInfo(entry.displayID)
    modelDressFrame:Undress()                     -- remove all gear
    modelDressFrame:TryOn(19019) 
    modelDressFrame:SetCamera(0)            -- try 0 first, then 1
    modelDressFrame:SetPortraitZoom(0)
    modelDressFrame:SetCamDistanceScale(2)  -- tweak 0.8–2.0
    modelDressFrame:Undress()                     -- remove all gear
    local itemAppearanceID, itemModifiedAppearanceID = C_TransmogCollection.GetItemInfo(10040) --wedding dress
    --22279 22279
    local itemAppearanceID, itemModifiedAppearanceID = C_TransmogCollection.GetItemInfo(22279) --wedding dress
    modelDressFrame:TryOn(itemModifiedAppearanceID) 
    MODEL = modelDressFrame
    MODEL:TryOn(235455)
    --modelFrame:SetFacing(0)            -- turn to camera if needed
    modelDressFrame:SetAnimation(69)
    modelDressFrame:Show()
  end)
end)
f2:SetScript("OnDragStart", f.StartMoving)
f2:SetScript("OnDragStop", f.StopMovingOrSizing)


--C_Timer.After(0.05, function()
--  modelFrame:SetAnimation(69)  -- small delay so the client has loaded it
--end)

--/run C_Timer.After(2, function() print("Test") end)

------------------------------------------------------------
-- OnUpdate: manual timing & random switching
------------------------------------------------------------
f:SetScript("OnUpdate", onUpdate)

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
local btnRandom = NewButton(f, "Hide", 84, 24, "TOPRIGHT", -12, -10, function(self)
  f:Hide()
end)

-- Random toggle (when running, this controls switching)
local btnRandom = NewButton(f, "Auto On", 84, 24, "TOPRIGHT", -12, -50, function(self)
  currentModeAuto = not currentModeAuto
  setInfo()
  self:SetText(currentModeAuto and "Auto On" or "Auto Off")
end)

local btnRandom = NewButton(f, "Random On", 84, 24, "TOPRIGHT", -12, -96, function(self)
  randomMode = not randomMode
  self:SetText(randomMode and "Random On" or "Random Off")
  if running then
    -- reset timer for current sequence
    local ms = (getSeqData(currentModelId, currentSeqId).ms or 132) or 4000
    if currentModeAuto then
      switchTimer = ms / 1000
    else
      local loops = math.random(1, 2)
      switchTimer = (ms * loops) / 1000
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

-- Prev / Next model
local btnPrev = NewButton(f, "< Seq", 84, 24, "TOPRIGHT", -12, -208 , function()
  play(currentSeq - 1)
end)

local btnNext = NewButton(f, "Seq >", 84, 24, "TOPRIGHT", -12, -238, function()
  play(currentSeq + 1)
end)

-- Quick sequence row: 69 / 213 / 214 / 215 / 216
local seqLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
seqLabel:SetPoint("TOPLEFT", modelFrame, "BOTTOMLEFT", 0, -6)
seqLabel:SetText("Sequences:")

local bx = 0
for i=1,#MODEL_LIST[1].seqData do
  local e = MODEL_LIST[1].seqData[i]
  --MODEL1 = MODEL_LIST[1]
  --E1 = e
  --debug("Setting up play buttons: ", e, e.seq)

  local b = NewButton(f, string.format("[%s] %s",i , e.seq), 68, 22, "TOPLEFT", modelFrame, "BOTTOMLEFT", bx, -26, function()
    running = true
    randomMode = false   
    play(e.seq, i)
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
  local ms = tonumber(durBox:GetText()) or 0
  if ms and ms > 0 then
    --seqData.ms = ms
    print(("EMD: current duration set to %d ms"):format(ms))
    currentSeqDurationMS = ms
    setInfo()
    --play(currentSeq, nil, currentSeqId)
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
