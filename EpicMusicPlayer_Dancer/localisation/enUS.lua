--by yess
local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("EpicMusicDancer", "enUS", true)
if not L then return end

---- added v1.5
L["Frame strata"] = true
--

--options
L["MusicDancer"] = true 

L["Show Dancer"] = true
L["Toggle show model."] = true

L["Random Model"] = true
L["Show a random model when playing a new song."] = true

L["Set Model"] = true
L["Select a model"] = true

L["Model Size"] = true
L["Adjust the size of the model frame"] = true

L["Lock"] = true
L["Unlock to allow moving the model. Moving will relese the model from the gui. Use reset to reattatch."] = true

L["Show Background"] = true

L["Enable Mouse"] = true
L["Click me or scroll me. I won\'t bite. 8==8"] = true

L["Show Pedestal"] = true

L["Show Tooltip"] = true

L["Reset Position"] = true
L["This will set the model to the default size and attatch it to the gui."] = true

L["Toggle with Gui"] = true
L["Showing/hiding the Gui will show/hide the dancer."] = true