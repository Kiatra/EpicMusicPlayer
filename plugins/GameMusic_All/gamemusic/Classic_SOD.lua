--Created by kiatra (https://github.com/Kiatra/EpicMusicPlayer)
local emp = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer", true) ---@class emp
if not emp then return end

-- playlist metadata
local requiredExpansion = "Classic"

emp:RegisterPlaylist(requiredExpansion, function()
	return {
		listName = "Classic SOD?",
		playlistVersion = "5.0",
		{
			album = "WoW: Classic",
			title = "Karazhan Crypts 1",
			tagged_title = "",
			path = "sound\\music\\classic\\mus_115_karazhan_crypts_1.mp3",
			duration = 0,
			artist = "",
			id = 6653571,
		},
		{
			album = "WoW: Classic",
			title = "Karazhan Crypts 2",
			tagged_title = "",
			path = "sound\\music\\classic\\mus_115_karazhan_crypts_2.mp3",
			duration = 0,
			artist = "",
			id = 6653573,
		},
		{
			album = "WoW: Classic",
			title = "Karazhan Crypts 3",
			tagged_title = "",
			path = "sound\\music\\classic\\mus_115_karazhan_crypts_3.mp3",
			duration = 0,
			artist = "",
			id = 6653575,
		},
	}
end)
