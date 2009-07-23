--us local by yess
--Email:  yessica@fantasymail.de

local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("EpicMusicPlayerBroker", "enUS", true)
if not L then return end

-- added in 1.6.3
L['Show Artist'] = true
L['Toggle show Artist'] = true

-- added emp 1.4
L["Left click"] = true
L["Middle click"] = true
L["Right click"] = true
L["Alt click"] = true
L["Shift click"] = true
L["Ctrl click"] = true 
--

L["List"] = true
L['Show List/Song Numbers'] = true
L['Show playlist and song number'] = true
					
L['Show Title'] = true
L['Toggle show title'] = true

L["Show time"] = true
L["Toggle show time"] = true

L["Max song text length"] = true
L["The maximum text length of the song displayed in the Panel."] = true

L["Music volume: "] = true
L["Effects volume: "] = true
L["Stopped"] = true

L["Artist"] = true
L["Song"] = true
L["Album"] = true
L["Length"] = true
L["Playlist"] = true

L["Use scroll wheel - adjust music volume"] = true
L["Ctrl + use scroll wheel - adjust effects volume"] = true
L["Alt + use scroll wheel - fine adjust volume"] = true

L["Ctrl click - Write artist and title to default chat. (guild,party etc.)"] = true 