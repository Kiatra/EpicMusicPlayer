--german local by yess
--Email:  yessica@fantasymail.de

local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("EpicMusicPlayerBroker", "deDE")
if not L then return end

-- added emp 1.4
L["Left click"] = "Linksklick"
L["Middle click"] = "Mittelklick"
L["Right click"] = "Rechtsklick"
L["Alt click"] = "Alt+klick"
L["Shift click"] = "Shift+klick"
L["Ctrl click"] = "Strg+klick"
--

L["List"] = "Liste"
L['Show List/Song Numbers'] = "Liste/Tietel Nr."
L['Show playlist and song number'] = "Liste und Tietel Nummer anzeigen"
					
L['Show Title'] = "Titel anzeigen"
L['Toggle show title'] = "Titel anzeigen an/aus"

L["Show time"] = "Zeit zeigen"
L["Toggle show time"] = "Zeit zeigen an/aus"

L["Max song text length"] = "Max. Titel Länge"
L["The maximum text length of the song displayed in the Panel."] = "Maximale Länge des Song Titels in der leiste."

L["Music volume: "] = "Musik Lautst.: "
L["Effects volume: "] = "Sound Lautst.: "
L["Stopped"] = "Gestoppt"

L["Artist"] = "Interpret"
L["Song"] = "Titel"
L["Album"] = true
L["Length"] = "Länge"
L["Playlist"] = "Liste"

L["Use scroll wheel - adjust music volume"] = true
L["Ctrl + use scroll wheel - adjust effects volume"] = true
L["Alt + use scroll wheel - fine adjust volume"] = true

L["Ctrl click - Write artist and title to default chat. (guild,party etc.)"] = true 