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
    {
        title = "Unbound",
        artist = "Jake Lefkowitz, David Arkenstone",
        album = "OST: The War Within",
        duration = 375,
        files = {
            {
                path = "sound\\music\\warwithin\\mus_110_earthen_countryside_h.mp3",
                duration = 254,
                id = 6034326,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_dorn_country_h.mp3",
		        duration = 121,
		        id = 6068106,
            },
        }
    },
    {
        title = "The Wilds",
        artist = "Adam Burgess, Leo Kaliski",
        album = "OST: The War Within",
        duration = 409,
        files = {
            {
                path = "sound\\music\\warwithin\\mus_110_boulder_springs_h.mp3",
		        duration = 192,
		        id = 6037075,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_boulder_springs_c.mp3",
	        	duration = 124,
		        id = 6042853,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_boulder_springs_g.mp3",
                duration = 93,
                id = 6042861,
            }
        }
    },
    {
        title = "Gundargaz",
        artist = "David Arkenstone",
        album = "OST: The War Within",
        duration = 252,
        files = {
            {
                path = "sound\\music\\warwithin\\mus_110_gundargaz_a.mp3",
                duration = 125,
                id = 6065459,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_gundargaz_b.mp3",
                duration = 127,
                id = 6065455,
            },
        }
    },
    {
        title = "Earthenworks",
        artist = "Jake Lefkowitz",
        album = "OST: The War Within",
        duration = 500,
        files = {
            {
                path = "sound\\music\\warwithin\\mus_110_earthen_works_a.mp3",
                duration = 136,
                id = 6065707,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_earthen_combat_e.mp3",
                duration = 111,
                id = 6065671,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_earthen_combat_h.mp3",
                duration = 253,
                id = 6065661,
            },
        }
    },
    {
        title = "Nerub'ar",
        artist = "Neal Acree, Jake Lefkowitz",
        album = "OST: The War Within",
        duration = 124,
        files = {
            {
                path = "sound\\music\\warwithin\\mus_110_scene_09.mp3",
                duration = 21,
                id = 6074203,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_arachnophobia_h.mp3",
                duration = 103,
                id = 6068160,
            },
        }
    },
    {
        title = "Taelloch",
        artist = "Leo Kaliski",
        album = "OST: The War Within",
        duration = 419,
        files = {
            {
                path = "sound\\music\\warwithin\\mus_110_ringing_deeps_base_h.mp3",
                duration = 214,
                id = 6055566,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_taelloch_e.mp3",
                duration = 205,
                id = 6055590,
            },
        }
    },
    {
        title = "Bloom in the Deeps",
        artist = "Adam Burgess, David Arkenstone",
        album = "OST: The War Within",
        duration = 322,
        files = {
            {
                path = "sound\\music\\warwithin\\mus_110_ancient_falls_d.mp3",
		        duration = 128,
		        id = 6034306,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_ancient_falls_h.mp3",
		        duration = 127,
		        id = 6034308,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_ancient_falls_a.mp3",
		        duration = 67,
		        id = 6034300,
            },
        }
    },
    {
        title = "The Silken Path",
        artist = "Leo Kaliski",
        album = "OST: The War Within",
        duration = 251,
        files = {
            {
                path = "sound\\music\\warwithin\\mus_110_scene_12.mp3",
                duration = 59,
                id = 6074209,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_crawling_chasm_h2.mp3",
                duration = 94,
                id = 6055511,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_hallowfall_h.mp3",
                duration = 98,
                id = 6065790,
            },
        }
    },
    {
        title = "Legacy of Arathor",
        artist = "Glenn Stafford, Adam Burgess",
        album = "OST: The War Within",
        duration = 377,
        files = {
            {
                path = "sound\\music\\warwithin\\mus_110_hallowfall_b.mp3",
                duration = 93,
                id = 6065780,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_sunless_strand_h.mp3",
                duration = 151,
                id = 6037098,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_order_of_night_h.mp3",
                duration = 133,
                id = 6065802,
            },
        }
    },
    {
        title = "Sacred Flame",
        artist = "Leo Kaliski",
        album = "OST: The War Within",
        duration = 375,
        files = {
            {
                path = "sound\\music\\warwithin\\mus_110_arathi_memorial_h.mp3",
                duration = 279,
                id = 6055471,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_arathi_memorial_f.mp3",
                duration = 96,
                id = 6065441,
            },
        }
    },
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
    {
        title = "Holders of Hope",
        artist = "Adam Burgess, Jake Lefkowitz",
        album = "OST: The War Within",
        duration = 257,
        files = {
            {
                path = "sound\\music\\warwithin\\mus_110_mereldar_h.mp3",
		        duration = 138,
		        id = 6037088,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_lorels_crossing_g.mp3",
		        duration = 119,
		        id = 6065751,
            },
        }
    },
    {
        title = "City of Threads",
        artist = "Jake Lefkowitz, Leo Kaliski",
        album = "OST: The War Within",
        duration = 466,
        files = {
            {
                path = "sound\\music\\warwithin\\mus_110_city_of_threads_f.mp3",
                duration = 109,
                id = 6055493,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_weavers_lair_h.mp3",
                duration = 132,
                id = 6068162,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_city_of_threads_h.mp3",
                duration = 225,
                id = 6075162,
            },
        }
    },
    {
        title = "Long Live Ansurek",
        artist = "Neal Acree, Leo Kaliski",
        album = "OST: The War Within",
        duration = 105,
        files = {
            {
                path = "sound\\music\\warwithin\\mus_110_scene_13.mp3",
                duration = 41,
                id = 6067052,
            },
            {
                path = "sound\\music\\warwithin\\mus_110_queen_ansurek_c.mp3",
                duration = 64,
                did = 6034346,
            },
        }
    },
}end)