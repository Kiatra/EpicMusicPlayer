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
    {
		title = "Heed Her Call",
        artist = "Adam Burgess",
        album = "OST: The War Within",
		path = "sound\\music\\warwithin\\mus_110_alleria_h.mp3",
		duration = 263,
		id = 6034298,
	},
    {
        title = "Harbinger of the Void",
        artist = "Leo Kaliski",
        album = "OST: The War Within",
        path = "sound\\music\\warwithin\\mus_110_xalatath_h.mp3",
        duration = 234,
        id = 6055592,
    },
    {
        title = "To Face the Dark",
        artist = "Adam Burgess",
        album = "OST: The War Within",
        path = "sound\\music\\warwithin\\mus_110_the_aegis_wall_h.mp3",
        duration = 185,
        id = 6034358,
    },
    {
        title = "Dornogal",
        artist = "Jake Lefkowitz",
        album = "OST: The War Within",
        duration = 499,
        files = {
            {
                path = "sound\\music\\warwithin\\mus_110_dornogal_i.mp3",
                duration = 21,
                id = 6065659,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_dornogal_h.mp3",
                duration = 174,
                id = 6068108,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_earthen_memorial_a.mp3",
                duration = 121,
                id = 6065697,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_scene_04.mp3",
                duration = 49, --365
                id = 6074189,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_dornogal_d.mp3",
		        duration = 134, --499
		        id = 6065651,
            },
        },
    },
    {
        title = "Stones Throw",
        artist = "David Arkenstone",
        album = "OST: The War Within",
        duration = 391,
        files = {
            {
                path = "sound\\music\\warwithin\\mus_110_stonelight_rest_a.mp3",
                duration = 117,
                id = 6074933,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_proscenium_b.mp3",
                duration = 148,
                artist = "David Arkenstone",
                id = 6074883,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_cinderbrew_meadery_h.mp3",
		        duration = 126,
		        artist = "David Arkenstone",
		        id = 6065447,
            }
        }
    },
    --[[
    {
            title = Unbound by Jake Lefkowitz, David Arkenstone
            artist = 
            album = "OST: The War Within",
            path = 
            duration = 
            id = 
    }
    ]]--[[
    {
            title = The Wilds by Adam Burgess, Leo Kaliski
            artist = 
            album = "OST: The War Within",
            path = 
            duration = 
            id = 
    }
    ]]--[[
    {
            title = Gundargaz by David Arkenstone
            artist = 
            album = "OST: The War Within",
            path = 
            duration = 
            id = 
    }
    ]]--[[
    {
            title = Earthenworks by Jake Lefkowitz
            artist = 
            album = "OST: The War Within",
            path = 
            duration = 
            id = 
    }
    ]]--[[
    {
            title = Nerub'ar by Neal Acree, Jake Lefkowitz
            artist = 
            album = "OST: The War Within",
            path = 
            duration = 
            id = 
    }
    ]]--[[
    {
            title = Taelloch by Leo Kaliski
            artist = 
            album = "OST: The War Within",
            path = 
            duration = 
            id = 
    }
    ]]--[[
    {
            title = Bloom in the Deeps by Adam Burgess, David Arkenstone
            artist = 
            album = "OST: The War Within",
            path = 
            duration = 
            id = 
    }
    ]]
    --[[
    {
            title = The Silken Path by Leo Kaliski
            artist = 
            album = "OST: The War Within",
            path = 
            duration = 
            id = 
    }
    ]]
    --[[
    {
            title = Legacy of Arathor by Glenn Stafford, Adam Burgess
            artist = 
            album = "OST: The War Within",
            path = 
            duration = 
            id = 
    }
    ]]
    --[[
    {
            title = Sacred Flame by Leo Kaliski
            artist = 
            album = "OST: The War Within",
            path = 
            duration = 
            id = 
    },
    ]]
    {
        title = "Galleons of the Sky",
        artist = "David Arkenstone, Adam Burgess",
        album = "OST: The War Within",
        duration = 304,
        files = {
            {
                path = "sound\\music\\warwithin\\mus_110_arathi_combat_light_h.mp3",
		        duration = 126,
		        id = 6042847,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_arathi_airships_h.mp3",
                duration = 178, --304
                id = 6034310,
            },
        }
    },
    --[[
    {
            title = Holders of Hope by Adam Burgess, Jake Lefkowitz
            artist = 
            album = "OST: The War Within",
            path = 
            duration = 
            id = 
    }
    ]]--[[
    {
            title = City of Threads by Jake Lefkowitz, Leo Kaliski
            artist = 
            album = "OST: The War Within",
            path = 
            duration = 
            id = 
    }
    ]]--[[
    {
            title = Long Live Ansurek by Neal Acree, Leo Kaliski
            artist = 
            album = "OST: The War Within",
            path = 
            duration = 
            id = 
    }
    ]]
}end)