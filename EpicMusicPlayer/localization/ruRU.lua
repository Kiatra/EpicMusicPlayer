
local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("EpicMusicPlayer", "ruRU")
if not L then return end

--@localization(locale="ruRU", format="lua_additive_table", handle-subnamespaces="concat")@

-- key binding variables
BINDING_HEADER_EPICMUSICPLAYER = "EpicMusicPlayer";
BINDING_NAME_PLAYSTOP = "Play/Stop";
BINDING_NAME_NEXT = "Play Next Song";
BINDING_NAME_LAST = "Play Last Song";
BINDING_NAME_TOGGLELIST = "Show/Hide Playlist";
BINDING_NAME_MUTE = "Toggle Mute";
BINDING_NAME_REMOVESONG = "Remove Song";
BINDING_NAME_GUI = "Show Controls and Options";
BINDING_NAME_BADLIST = "Move song to bad songs list.";
BINDING_NAME_BESTLIST = "Move song to best songs list.";



