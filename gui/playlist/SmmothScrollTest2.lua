-- container
local f = CreateFrame("Frame", "SmoothScrollDemo", UIParent, "BackdropTemplate")
f:SetPoint("CENTER"); f:SetSize(320, 420)
f:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background" })
f:SetBackdropColor(0,0,0,0.6)

-- ScrollBox + ScrollBar
local scrollBox = CreateFrame("Frame", "$parentScrollBox", f, "WowScrollBoxList")
scrollBox:SetPoint("TOPLEFT", 10, -10)
scrollBox:SetPoint("BOTTOMRIGHT", -24, 10)

local scrollBar = CreateFrame("EventFrame", "$parentScrollBar", f, "WowTrimScrollBar")
scrollBar:SetPoint("TOPRIGHT", -6, -10)
scrollBar:SetPoint("BOTTOMRIGHT", -6, 10)

-- View: factory is a *function*. Use 2-arg form: factory(type, initializerFn)
local view = CreateScrollBoxListLinearView()
view:SetElementExtent(22)  -- uniform row height -> faster
view:SetElementFactory(function(factory, elementData)
  factory("Button", function(button, data)
    -- init once
    if not button._init then
      button:SetHeight(22)
      button:SetNormalFontObject(GameFontNormal)
      button:SetHighlightTexture("Interface/Buttons/UI-Listbox-Highlight2")
      button:SetScript("OnClick", function(self) print("Clicked:", self:GetText()) end)
      button._init = true
    end
    -- update per-bind
    button:SetText(data.text or "")
  end)
end)

-- Wire it up
ScrollUtil.InitScrollBoxListWithScrollBar(scrollBox, scrollBar, view)

-- Data
local provider = CreateDataProvider()
for i = 1, 500 do provider:Insert({ text = ("Item %d"):format(i) }) end
scrollBox:SetDataProvider(provider)

-- Optional: smooth / momentum scrolling
local pos, target, vel = 0, 0, 0
local stiffness, damping = 18, 10
scrollBox:EnableMouseWheel(true)
scrollBox:SetScript("OnMouseWheel", function(_, d)
  target = math.min(1, math.max(0, target - d * 0.06))
end)
f:SetScript("OnUpdate", function(_, dt)
  vel = (vel + (target - pos) * stiffness * dt) * math.max(0, 1 - damping * dt)
  pos = math.min(1, math.max(0, pos + vel * dt))
  scrollBox:SetScrollPercentage(pos)
end)
