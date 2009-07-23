--de localisation by yess
local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("EpicMusicPlayer", "deDE")
if not L then return end

--@localization(locale="deDE", format="lua_additive_table", handle-subnamespaces="concat")@


-- key binding variables
BINDING_HEADER_EPICMUSICPLAYER = "EpicMusicPlayer";
BINDING_NAME_PLAYSTOP = "Wiedergabe/Stopp";
BINDING_NAME_NEXT = "Nächsten Titel spielen";
BINDING_NAME_LAST = "Vorherigen Titel spielen";
BINDING_NAME_TOGGLELIST = "Musikliste anzeigen/verstecken";
BINDING_NAME_MUTE = "Stummschalten an/aus";
BINDING_NAME_REMOVESONG = "Song löschen";
BINDING_NAME_GUI = "Optionen anzeigen";
BINDING_NAME_BADLIST = "Song zur schlechte songs liste verschieben.";
BINDING_NAME_BESTLIST = "Song zur beste songs liste verschieben.";
