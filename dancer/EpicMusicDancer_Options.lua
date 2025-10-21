local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local EpicMusicDancer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicDancer")
EpicMusicPlayer.EpicMusicDancer = EpicMusicDancer

local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")

-- ---------------------------------------------------------------------------
-- Options
-- ---------------------------------------------------------------------------
local options = {
  name = L["MusicDancer"],
  order = 5,
  type = "group",
  args = {
    show = {
      type = "toggle", order = 1, name = L["Show Dancer"], desc = L["Toggle show model."],
      get = function() return EpicMusicDancer:IsVisible() end,
      set = function() EpicMusicDancer:ToggleShow() end,
    },
    guihide = {
      type = "toggle", order = 2, name = L["Toggle with GUI"],
      desc = L["Showing/hiding the GUI will show/hide the dancer."],
      get = function() return EpicMusicDancer:IsGuiToggle() end,
      set = function() EpicMusicDancer:ToggleGuiToggle() end,
    },
    random = {
      type = "toggle", order = 3, name = L["Random Model"],
      desc = L["Show a random model when playing a new song."],
      get = function() return EpicMusicDancer:IsRandom() end,
      set = function() EpicMusicDancer:ToggleRandom() end,
    },
    setmodel = {
      type = "select", order = 4, name = L["Set Model"], desc = L["Select a model"],
      values = {
        bloodelf="Sid Nicious", undead="Bergrisst", troll="Mai'Kyl",
        tauren="Chief Thunder-Skins", orc="Samuro", guard="Bloodelf Guard",
        murloccostume="Murloccostume",
      },
      get = function() return EpicMusicDancer:GetDefaultModel() end,
      set = function(info, value) EpicMusicDancer:SetDefaultModel(info, value) end,
    },
    scale = {
      type = "range", order = 8, name = L["Model Size"],
      desc = L["Adjust the size of the model frame"], step = 0.1, min = 0.1, max = 5,
      get = function() return EpicMusicDancer:GetScale() end,
      set = function(_, v) EpicMusicDancer:SetScale(v) end,
    },
    lock = {
      type = "toggle", order = 9, name = L["Lock"],
      desc = L["Unlock to allow moving the model. Moving will release the model from the GUI. Use reset to reattach."],
      get = function() return lockPos end,
      set = function() EpicMusicDancer:ToggleLock() end,
    },
    mouse = {
      type = "toggle", order = 11, name = L["Enable Mouse"],
      desc = L["Click me or scroll me. I won\'t bite. 8==8"],
      get = function() return EpicMusicDancer:IsMouse() end,
      set = function() EpicMusicDancer:ToggleMouse() end,
    },
    tooltip = {
      type = "toggle", order = 12, name = L["Show Tooltip"], desc = L["Show Tooltip"],
      get = function() return EpicMusicDancer:IsShowTooltip() end,
      set = function() EpicMusicDancer:ToggleShowTooltip() end,
    },
    strata = {
      type = "select", order = 13, name = L["Frame strata"], desc = L["Frame strata"],
      values = {
        FULLSCREEN_DIALOG="Fullscreen_Dialog", FULLSCREEN="Fullscreen", DIALOG="Dialog",
        HIGH="High", MEDIUM="Medium", LOW="Low", BACKGROUND="Background"
      },
      get = function() return EpicMusicDancer.db.model.strata end,
      set = function(_, v)
        EpicMusicDancer.db.model.strata = v
        EpicMusicDancer.frame:SetFrameStrata(v)
      end,
    },
    reset = {
      type = "execute", order = -1, name = L["Reset Position"],
      desc = L["This will set the model to the default size and attach it to the GUI."],
      func = function() EpicMusicDancer:ResetPos() end,
    },
  }
}