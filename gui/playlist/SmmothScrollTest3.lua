-- container
local f = CreateFrame("Frame", "SmoothScrollDemo", UIParent, "BackdropTemplate")
f:SetPoint("CENTER"); f:SetSize(320, 420)
f:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background" })
f:SetBackdropColor(0,0,0,0.6)

-- ScrollBox + ScrollBar (TWW)
local scrollBox = CreateFrame("Frame", "$parentScrollBox", f, "WowScrollBoxList")
scrollBox:SetPoint("TOPLEFT", 10, -10)
scrollBox:SetPoint("BOTTOMRIGHT", -24, 10)

local scrollBar = CreateFrame("EventFrame", "$parentScrollBar", f, "WowTrimScrollBar")
scrollBar:SetPoint("TOPRIGHT", -6, -10)
scrollBar:SetPoint("BOTTOMRIGHT", -6, 10)

-- View (ONE view, ONE wiring)
local view = CreateScrollBoxListLinearView()
view:SetElementExtent(22)  -- uniform height = perf
view:SetElementFactory(function(factory, elementData)
  factory("Button", function(button, data)
    if not button._init then
      button:SetHeight(22)
      -- text
      local fs = button:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
      fs:SetPoint("LEFT", 8, 0)
      button.text = fs
      -- hover highlight
      local hl = button:CreateTexture(nil, "HIGHLIGHT")
      hl:SetAllPoints()
      hl:SetColorTexture(1,1,1,0.08)
      button:SetHighlightTexture(hl)
      -- click
      button:SetScript("OnClick", function(self) print("Clicked:", self.text:GetText()) end)
      button._init = true
    end
    button.text:SetText(data.text or "")
  end)
end)

ScrollUtil.InitScrollBoxListWithScrollBar(scrollBox, scrollBar, view)

-- Data
local provider = CreateDataProvider()
for i = 1, 500 do provider:Insert({ text = ("Item %d"):format(i) }) end
scrollBox:SetDataProvider(provider)

-- Selection (optional)
local selection = ScrollUtil.AddSelectionBehavior(scrollBox)
selection:RegisterCallback("OnSelectionChanged", function(_, elementData, selected)
  -- tint or handle selection here if you want
end)

-- --- Smooth / momentum scrolling ---
-- Declare these BEFORE registering any handlers:
local pos, target, vel = 0, 0, 0
local stiffness, damping = 18, 10

-- Mouse wheel -> adjust target
scrollBox:EnableMouseWheel(true)
scrollBox:SetScript("OnMouseWheel", function(_, d)
  target = math.min(1, math.max(0, target - d * 0.06))
end)

-- Scrollbar interactions (thumb drag, track clicks, steppers) -> take control
if scrollBar.Event and scrollBar.Event.OnScroll then
  scrollBar:RegisterCallback(scrollBar.Event.OnScroll, function(_, pct)
    pos = pct; target = pct; vel = 0
  end, scrollBox)
end

-- Momentum update drives ScrollBox
f:SetScript("OnUpdate", function(_, dt)
  vel = (vel + (target - pos) * stiffness * dt) * math.max(0, 1 - damping * dt)
  pos = math.min(1, math.max(0, pos + vel * dt))
  scrollBox:SetScrollPercentage(pos)
end)
