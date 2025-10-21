local emp = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")

local ScrollBox = CreateFrame("Frame", nil, UIParent, "WowScrollBoxList")
ScrollBox:SetPoint("CENTER")
ScrollBox:SetSize(300, 200)
ScrollBox:Hide()

local ScrollBar = CreateFrame("EventFrame", nil, UIParent, "MinimalScrollBar")
ScrollBar:SetPoint("TOPLEFT", ScrollBox, "TOPRIGHT")
ScrollBar:SetPoint("BOTTOMLEFT", ScrollBox, "BOTTOMRIGHT")
ScrollBar:Hide()

-- View (ONE view, ONE wiring)
local ScrollView = CreateScrollBoxListLinearView()
ScrollView:SetElementExtent(22)  -- uniform height = perf


ScrollUtil.InitScrollBoxListWithScrollBar(ScrollBox, ScrollBar, ScrollView)

local DataProvider = CreateDataProvider()

-- The 'button' argument is the frame that our data will inhabit in our list
-- The 'data' argument will be the data table mentioned above
local function Initializer(button, data)
  local i = data.index
  local title = data.title
  local artist = data.artist

  button:SetScript("OnClick", function()
    print(i, title, artist)
  end)
  button:SetText(("%d %s"):format(i, title))
end


-- The first argument here can either be a frame type or frame template. We're just passing the "UIPanelButtonTemplate" template here
ScrollView:SetElementInitializer("UIPanelButtonTemplate", Initializer)

 -- Optional Resetter function which you can use to reset your frame or data element.
local function Resetter(frame, data)
   
    -- Insert reset code here

end
ScrollView:SetElementResetter(Resetter)

local defaultList = {
  { title = "Ghost",   artist = "Priest" },
  { title = "Jaina",   artist = "Mage" },
  { title = "Thrall",  artist = "Shaman" },
  { title = "Valeera", artist = "Rogue" },
  { title = "Uther",   artist = "Paladin" },
  { title = "A",   artist = "Priest" },
  { title = "B",   artist = "Mage" },
  { title = "C",  artist = "Shaman" },
  { title = "D", artist = "Rogue" },
  { title = "E",   artist = "Paladin" },
  { title = "F",   artist = "Priest" },
  { title = "G",   artist = "Mage" },
  { title = "H",  artist = "Shaman" },
  { title = "I", artist = "Rogue" },
  { title = "J",   artist = "Paladin" },
}

--DataProvider:Insert(players)

DataProvider:InsertTable(defaultList)
ScrollView:SetDataProvider(DataProvider)

function emp:SetTestScrollListData(playlist)
  emp:Debug(playlist)
  local l = (playlist and playlist[1]) or defaultList
  DataProvider:Flush()
  DataProvider:InsertTable(l)

  ScrollBar:Show()
  ScrollBox:Show()
end

