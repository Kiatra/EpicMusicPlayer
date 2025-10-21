local emp = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer", true) ---@class emp
if not emp then return end

-- playlist metadata
local requiredExpansion = "The War Within"

emp:RegisterPlaylist(requiredExpansion, function()
return {
	listName = "OST: The War Within",
	playlistVersion = "5.0",
    {
        title = "The War Within",
        artist = "Leo Kaliski, Jake Lefkowitz, Adam Burgess, Neal Acree, Glenn Stafford, David Arkenstone, & Jason Hayes",
        album = "OST: The War Within",
        path = "sound\\music\\warwithin\\mus_110_thewarwithin_maintitle.mp3",
        id =  6075186,
        duration = 684,
    },
    {
        title = "Echoes of the World Soul",
        artist = "Adam Burgess, Leo Kaliski",
        album = "OST: The War Within",
        path = "sound\\music\\warwithin\\mus_110_the_war_soul_saga_h.mp3",
        id =  6037118,
        duration = 155,
    },
}end)