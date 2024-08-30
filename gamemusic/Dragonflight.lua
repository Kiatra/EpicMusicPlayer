--Created by YourDevil54
local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
if not EpicMusicPlayer then return end

local Dragonflight = {
	["listName"] = "Dragonflight",
	["playlistVersion"] = "4.0",
	["locked"] =  "true",
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "The Isles Awaken",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_theislesawaken_maintitle.mp3",
        ["Id"] = 4880327,
        ["Length"] = 763,
        ["Artist"] = "Main Title",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "The Isles Awaken Short",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_theislesawaken_maintitle_short.mp3",
        ["Id"] = 4887931,
        ["Length"] = 641,
        ["Artist"] = "Main Title",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "The Isles Awaken Beta",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_theislesawaken_maintitle_beta.mp3",
        ["Id"] = 4861186,
        ["Length"] = 171,
        ["Artist"] = "Main Title",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Dgn Rubylifepools 1A",
        ["Name"] = "sound\\music\\dragonflight\\dgn_100_rubylifepools_1_a.mp3",
        ["Id"] = 4880405,
        ["Length"] = 95,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Bluedragon 1A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_bluedragon_1_a.mp3",
        ["Id"] = 4889865,
        ["Length"] = 118,
        ["Artist"] = "D. Arkenstone, D. Duke",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Bluedragon 1B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_bluedragon_1_b.mp3",
        ["Id"] = 4889867,
        ["Length"] = 117,
        ["Artist"] = "D. Arkenstone, D. Duke",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Bluedragon 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_bluedragon_1_h.mp3",
        ["Id"] = 4889863,
        ["Length"] = 117,
        ["Artist"] = "D. Arkenstone, D. Duke",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Bluedragon 2A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_bluedragon_2_a.mp3",
        ["Id"] = 4889871,
        ["Length"] = 118,
        ["Artist"] = "D. Arkenstone, D. Duke",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Bluedragon 2B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_bluedragon_2_b.mp3",
        ["Id"] = 4889873,
        ["Length"] = 118,
        ["Artist"] = "D. Arkenstone, D. Duke",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Bluedragon 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_bluedragon_2_h.mp3",
        ["Id"] = 4889869,
        ["Length"] = 118,
        ["Artist"] = "D. Arkenstone, D. Duke",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Explorer A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_explorer_a.mp3",
        ["Id"] = 4880281,
        ["Length"] = 148,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Explorer B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_explorer_b.mp3",
        ["Id"] = 4887895,
        ["Length"] = 172,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Explorer C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_explorer_c.mp3",
        ["Id"] = 4887897,
        ["Length"] = 144,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Explorer H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_explorer_h.mp3",
        ["Id"] = 4872416,
        ["Length"] = 153,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Frost A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_frost_a.mp3",
        ["Id"] = 4880287,
        ["Length"] = 101,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Frost B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_frost_b.mp3",
        ["Id"] = 4880289,
        ["Length"] = 102,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Frost C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_frost_c.mp3",
        ["Id"] = 4880291,
        ["Length"] = 109,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Frost H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_frost_h.mp3",
        ["Id"] = 4872420,
        ["Length"] = 130,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Frost Intro A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_frost_intro_a.mp3",
        ["Id"] = 4890270,
        ["Length"] = 29,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Frost Intro B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_frost_intro_b.mp3",
        ["Id"] = 4890272,
        ["Length"] = 36,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Ruins A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_ruins_a.mp3",
        ["Id"] = 4880283,
        ["Length"] = 110,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Ruins B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_ruins_b.mp3",
        ["Id"] = 4880285,
        ["Length"] = 98,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Ruins C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_ruins_c.mp3",
        ["Id"] = 4887899,
        ["Length"] = 125,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Ruins H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_ruins_h.mp3",
        ["Id"] = 4872418,
        ["Length"] = 219,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Tundra 1A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_tundra_1_a.mp3",
        ["Id"] = 4880295,
        ["Length"] = 114,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Tundra 1B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_tundra_1_b.mp3",
        ["Id"] = 4880297,
        ["Length"] = 97,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Tundra 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_tundra_1_h.mp3",
        ["Id"] = 4872422,
        ["Length"] = 125,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Tundra 1 Intro A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_tundra_1_intro_a.mp3",
        ["Id"] = 4890266,
        ["Length"] = 22,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Tundra 1 Intro B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_tundra_1_intro_b.mp3",
        ["Id"] = 4890268,
        ["Length"] = 24,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Tundra 2A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_tundra_2_a.mp3",
        ["Id"] = 4880293,
        ["Length"] = 102,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Tundra 2B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_tundra_2_b.mp3",
        ["Id"] = 4887901,
        ["Length"] = 128,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Tundra 2C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_tundra_2_c.mp3",
        ["Id"] = 4887903,
        ["Length"] = 108,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Tundra 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_tundra_2_h.mp3",
        ["Id"] = 4872424,
        ["Length"] = 213,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Tundra 2 Intro A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_tundra_2_intro_a.mp3",
        ["Id"] = 4890258,
        ["Length"] = 32,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Tundra 2 Intro B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_tundra_2_intro_b.mp3",
        ["Id"] = 4890260,
        ["Length"] = 26,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Tundra 2 Intro C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_tundra_2_intro_c.mp3",
        ["Id"] = 4890262,
        ["Length"] = 30,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Azurespan Tundra 2 Intro D",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_azurespan_tundra_2_intro_d.mp3",
        ["Id"] = 4890264,
        ["Length"] = 20,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Brackenhidehollow A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_brackenhidehollow_a.mp3",
        ["Id"] = 4880335,
        ["Length"] = 106,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Brackenhidehollow B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_brackenhidehollow_b.mp3",
        ["Id"] = 4887937,
        ["Length"] = 99,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Brackenhidehollow Boss H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_brackenhidehollow_boss_h.mp3",
        ["Id"] = 4887939,
        ["Length"] = 117,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Brackenhidehollow H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_brackenhidehollow_h.mp3",
        ["Id"] = 4872450,
        ["Length"] = 138,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Djaradin 1A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_djaradin_1_a.mp3",
        ["Id"] = 4880299,
        ["Length"] = 120,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Djaradin 1B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_djaradin_1_b.mp3",
        ["Id"] = 4880301,
        ["Length"] = 138,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Djaradin 1C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_djaradin_1_c.mp3",
        ["Id"] = 4880303,
        ["Length"] = 135,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Djaradin 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_djaradin_1_h.mp3",
        ["Id"] = 4872426,
        ["Length"] = 131,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Djaradin 2A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_djaradin_2_a.mp3",
        ["Id"] = 4880305,
        ["Length"] = 135,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Djaradin 2B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_djaradin_2_b.mp3",
        ["Id"] = 4880307,
        ["Length"] = 112,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Djaradin 2C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_djaradin_2_c.mp3",
        ["Id"] = 4880309,
        ["Length"] = 144,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Djaradin 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_djaradin_2_h.mp3",
        ["Id"] = 4872428,
        ["Length"] = 154,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Dragonisles Drum 1",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_dragonisles_drum_1.mp3",
        ["Id"] = 4889895,
        ["Length"] = 18,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Dragonisles Drum 2",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_dragonisles_drum_2.mp3",
        ["Id"] = 4889897,
        ["Length"] = 18,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Dragonisles Drum 3",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_dragonisles_drum_3.mp3",
        ["Id"] = 4889899,
        ["Length"] = 18,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Dragonisles Drum 4",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_dragonisles_drum_4.mp3",
        ["Id"] = 4889901,
        ["Length"] = 18,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Dragonisles Inn 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_dragonisles_inn_1_h.mp3",
        ["Id"] = 4887953,
        ["Length"] = 130,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Dragonisles Inn 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_dragonisles_inn_2_h.mp3",
        ["Id"] = 4887955,
        ["Length"] = 126,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Dragonisles Inn 3H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_dragonisles_inn_3_h.mp3",
        ["Id"] = 4887957,
        ["Length"] = 121,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Dragonnpc Harp 1",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_dragonnpc_harp_1.mp3",
        ["Id"] = 4889877,
        ["Length"] = 41,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Dragonnpc Harp 2",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_dragonnpc_harp_2.mp3",
        ["Id"] = 4889879,
        ["Length"] = 80,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Dragonnpc Harp 3",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_dragonnpc_harp_3.mp3",
        ["Id"] = 4889881,
        ["Length"] = 75,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Dragonrace Finish",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_dragonrace_finish.mp3",
        ["Id"] = 4887935,
        ["Length"] = 10,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Dragonrace H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_dragonrace_h.mp3",
        ["Id"] = 4887933,
        ["Length"] = 165,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Dragonrace Lite",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_dragonrace_lite.mp3",
        ["Id"] = 4889875,
        ["Length"] = 31,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Forbiddenreach 1A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_forbiddenreach_1_a.mp3",
        ["Id"] = 4880317,
        ["Length"] = 93,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Forbiddenreach 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_forbiddenreach_1_h.mp3",
        ["Id"] = 4880311,
        ["Length"] = 127,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Forbiddenreach 2A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_forbiddenreach_2_a.mp3",
        ["Id"] = 4880313,
        ["Length"] = 114,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Forbiddenreach 2B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_forbiddenreach_2_b.mp3",
        ["Id"] = 4880315,
        ["Length"] = 113,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Forbiddenreach 2C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_forbiddenreach_2_c.mp3",
        ["Id"] = 4887905,
        ["Length"] = 127,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Forbiddenreach 2D",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_forbiddenreach_2_d.mp3",
        ["Id"] = 4887907,
        ["Length"] = 96,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Forbiddenreach 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_forbiddenreach_2_h.mp3",
        ["Id"] = 4880319,
        ["Length"] = 101,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Forbiddenreach 3A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_forbiddenreach_3_a.mp3",
        ["Id"] = 4887971,
        ["Length"] = 109,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Forbiddenreach 3B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_forbiddenreach_3_b.mp3",
        ["Id"] = 4887973,
        ["Length"] = 98,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Forbiddenreach 3C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_forbiddenreach_3_c.mp3",
        ["Id"] = 4887975,
        ["Length"] = 105,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Forbiddenreach 3H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_forbiddenreach_3_h.mp3",
        ["Id"] = 4872480,
        ["Length"] = 174,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Forbiddenreach Vaultdefense H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_forbiddenreach_vaultdefense_h.mp3",
        ["Id"] = 4872436,
        ["Length"] = 104,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Gnoll A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_gnoll_a.mp3",
        ["Id"] = 4880329,
        ["Length"] = 129,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Gnoll B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_gnoll_b.mp3",
        ["Id"] = 4880331,
        ["Length"] = 110,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Gnoll C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_gnoll_c.mp3",
        ["Id"] = 4880333,
        ["Length"] = 116,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Gnoll H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_gnoll_h.mp3",
        ["Id"] = 4872448,
        ["Length"] = 121,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Lifepools Growth 1A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_lifepools_growth_1_a.mp3",
        ["Id"] = 4889903,
        ["Length"] = 86,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Lifepools Growth 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_lifepools_growth_1_h.mp3",
        ["Id"] = 4872498,
        ["Length"] = 170,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Lifepools Growth 2A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_lifepools_growth_2_a.mp3",
        ["Id"] = 4880407,
        ["Length"] = 158,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Lifepools Growth 2B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_lifepools_growth_2_b.mp3",
        ["Id"] = 4880409,
        ["Length"] = 175,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Lifepools Growth 2C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_lifepools_growth_2_c.mp3",
        ["Id"] = 4880411,
        ["Length"] = 170,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Lifepools Growth 2D",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_lifepools_growth_2_d.mp3",
        ["Id"] = 4880413,
        ["Length"] = 139,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Lifepools Growth 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_lifepools_growth_2_h.mp3",
        ["Id"] = 4872502,
        ["Length"] = 175,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Lifepools Growth 3A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_lifepools_growth_3_a.mp3",
        ["Id"] = 4880415,
        ["Length"] = 168,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Lifepools Growth 3H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_lifepools_growth_3_h.mp3",
        ["Id"] = 4872504,
        ["Length"] = 165,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Neltharus Djaradin Battle 2",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_neltharus_djaradin_battle_2.mp3",
        ["Id"] = 4889889,
        ["Length"] = 80,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Centaur 1A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_centaur_1_a.mp3",
        ["Id"] = 4880361,
        ["Length"] = 107,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Centaur 1B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_centaur_1_b.mp3",
        ["Id"] = 4880363,
        ["Length"] = 137,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Centaur 1C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_centaur_1_c.mp3",
        ["Id"] = 4887959,
        ["Length"] = 110,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Centaur 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_centaur_1_h.mp3",
        ["Id"] = 4872464,
        ["Length"] = 123,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Centaur 2A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_centaur_2_a.mp3",
        ["Id"] = 4880365,
        ["Length"] = 117,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Centaur 2B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_centaur_2_b.mp3",
        ["Id"] = 4887961,
        ["Length"] = 121,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Centaur 2C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_centaur_2_c.mp3",
        ["Id"] = 4887963,
        ["Length"] = 117,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Centaur 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_centaur_2_h.mp3",
        ["Id"] = 4872466,
        ["Length"] = 149,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Centaur 3A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_centaur_3_a.mp3",
        ["Id"] = 4880367,
        ["Length"] = 101,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Centaur 3B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_centaur_3_b.mp3",
        ["Id"] = 4880369,
        ["Length"] = 116,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Centaur 3C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_centaur_3_c.mp3",
        ["Id"] = 4887965,
        ["Length"] = 120,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Centaur 3H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_centaur_3_h.mp3",
        ["Id"] = 4872468,
        ["Length"] = 133,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Centaur 4A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_centaur_4_a.mp3",
        ["Id"] = 4880371,
        ["Length"] = 120,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Centaur 4B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_centaur_4_b.mp3",
        ["Id"] = 4880373,
        ["Length"] = 126,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Centaur 4C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_centaur_4_c.mp3",
        ["Id"] = 4887967,
        ["Length"] = 98,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Centaur 4H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_centaur_4_h.mp3",
        ["Id"] = 4872470,
        ["Length"] = 140,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Foothills 1A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_foothills_1_a.mp3",
        ["Id"] = 4880383,
        ["Length"] = 104,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Foothills 1B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_foothills_1_b.mp3",
        ["Id"] = 4880385,
        ["Length"] = 110,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Foothills 1C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_foothills_1_c.mp3",
        ["Id"] = 4880387,
        ["Length"] = 129,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Foothills 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_foothills_1_h.mp3",
        ["Id"] = 4872478,
        ["Length"] = 161,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Groves 1A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_groves_1_a.mp3",
        ["Id"] = 4880341,
        ["Length"] = 114,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Groves 1B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_groves_1_b.mp3",
        ["Id"] = 4880343,
        ["Length"] = 119,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Groves 1C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_groves_1_c.mp3",
        ["Id"] = 4880345,
        ["Length"] = 112,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Groves 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_groves_1_h.mp3",
        ["Id"] = 4872460,
        ["Length"] = 178,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Groves 2A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_groves_2_a.mp3",
        ["Id"] = 4880347,
        ["Length"] = 125,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Groves 2B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_groves_2_b.mp3",
        ["Id"] = 4880349,
        ["Length"] = 107,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Groves 2C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_groves_2_c.mp3",
        ["Id"] = 4880351,
        ["Length"] = 109,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Groves 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_groves_2_h.mp3",
        ["Id"] = 4872462,
        ["Length"] = 159,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Groves 3A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_groves_3_a.mp3",
        ["Id"] = 4880353,
        ["Length"] = 106,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Groves 3B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_groves_3_b.mp3",
        ["Id"] = 4880355,
        ["Length"] = 116,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Groves 3C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_groves_3_c.mp3",
        ["Id"] = 4880357,
        ["Length"] = 98,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Groves 3H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_groves_3_h.mp3",
        ["Id"] = 4880359,
        ["Length"] = 156,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Groves 4A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_groves_4_a.mp3",
        ["Id"] = 4880381,
        ["Length"] = 102,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Groves 4B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_groves_4_b.mp3",
        ["Id"] = 4887969,
        ["Length"] = 112,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Groves 4H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_groves_4_h.mp3",
        ["Id"] = 4872474,
        ["Length"] = 142,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Plains 1A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_plains_1_a.mp3",
        ["Id"] = 4880375,
        ["Length"] = 115,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Plains 1B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_plains_1_b.mp3",
        ["Id"] = 4880377,
        ["Length"] = 131,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Plains 1C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_plains_1_c.mp3",
        ["Id"] = 4880379,
        ["Length"] = 111,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Ohnahran Plains 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_ohnahran_plains_1_h.mp3",
        ["Id"] = 4872472,
        ["Length"] = 149,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Primalist 1A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_primalist_1_a.mp3",
        ["Id"] = 4880337,
        ["Length"] = 109,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Primalist 1B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_primalist_1_b.mp3",
        ["Id"] = 4880339,
        ["Length"] = 108,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Primalist 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_primalist_1_h.mp3",
        ["Id"] = 4872454,
        ["Length"] = 120,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Primalist 2A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_primalist_2_a.mp3",
        ["Id"] = 4887941,
        ["Length"] = 113,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Primalist 2B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_primalist_2_b.mp3",
        ["Id"] = 4887943,
        ["Length"] = 99,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Primalist 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_primalist_2_h.mp3",
        ["Id"] = 4872452,
        ["Length"] = 135,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Primalist 3A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_primalist_3_a.mp3",
        ["Id"] = 4887945,
        ["Length"] = 96,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Primalist 3B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_primalist_3_b.mp3",
        ["Id"] = 4887947,
        ["Length"] = 94,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Primalist 3H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_primalist_3_h.mp3",
        ["Id"] = 4872456,
        ["Length"] = 118,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Primalist 4A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_primalist_4_a.mp3",
        ["Id"] = 4887949,
        ["Length"] = 142,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Primalist 4B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_primalist_4_b.mp3",
        ["Id"] = 4887951,
        ["Length"] = 106,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Primalist 4H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_primalist_4_h.mp3",
        ["Id"] = 4872458,
        ["Length"] = 136,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Primalist Battle H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_primalist_battle_h.mp3",
        ["Id"] = 4889893,
        ["Length"] = 107,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Rubylifepools 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_rubylifepools_1_h.mp3",
        ["Id"] = 4872500,
        ["Length"] = 85,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Abandoning Forbidden Reach",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_abandoning_forbidden_reach.mp3",
        ["Id"] = 4888009,
        ["Length"] = 56,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Alexstrazsa Oathstone Explanation",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_alexstrazsa_oathstone_explanation.mp3",
        ["Id"] = 4889883,
        ["Length"] = 84,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Azure Oathstone Empowerment",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_azure_oathstone_empowerment.mp3",
        ["Id"] = 4888053,
        ["Length"] = 67,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Black Empire Arriving",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_black_empire_arriving.mp3",
        ["Id"] = 4888011,
        ["Length"] = 41,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Black Empire Leaving",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_black_empire_leaving.mp3",
        ["Id"] = 4889885,
        ["Length"] = 24,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Black Empire Leaving B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_black_empire_leaving_b.mp3",
        ["Id"] = 4889887,
        ["Length"] = 111,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Camera Zoom Djaradin Riders Elements",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_camera_zoom_djaradin_riders_elements.mp3",
        ["Id"] = 4888017,
        ["Length"] = 18,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Camera Zoom Riders",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_camera_zoom_riders.mp3",
        ["Id"] = 4888033,
        ["Length"] = 74,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Camp Antonidas Protection",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_camp_antonidas_protection.mp3",
        ["Id"] = 4888015,
        ["Length"] = 23,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Chromie Nozdormu",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_chromie_nozdormu.mp3",
        ["Id"] = 4888059,
        ["Length"] = 125,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Dracthyr Arrival Orgrimmar",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_dracthyr_arrival_orgrimmar.mp3",
        ["Id"] = 4879657,
        ["Length"] = 85,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Dracthyr Arrival Stormwind",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_dracthyr_arrival_stormwind.mp3",
        ["Id"] = 4879659,
        ["Length"] = 66,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Dragon Lapisagos Reveal",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_dragon_lapisagos_reveal.mp3",
        ["Id"] = 4888019,
        ["Length"] = 48,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Eranog Fire Transformation",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_eranog_fire_transformation.mp3",
        ["Id"] = 4888021,
        ["Length"] = 105,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Forbidden Reach",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_forbidden_reach.mp3",
        ["Id"] = 4889891,
        ["Length"] = 93,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Forbidden Reach Flashes",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_forbidden_reach_flashes.mp3",
        ["Id"] = 4888023,
        ["Length"] = 34,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Green Oathstone Empowerment",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_green_oathstone_empowerment.mp3",
        ["Id"] = 4888025,
        ["Length"] = 96,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Kalecgos Gnolls",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_kalecgos_gnolls.mp3",
        ["Id"] = 4888049,
        ["Length"] = 96,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Kalecgos Primalist Report",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_kalecgos_primalist_report.mp3",
        ["Id"] = 4888029,
        ["Length"] = 56,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Kalecgos Sindragosa",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_kalecgos_sindragosa.mp3",
        ["Id"] = 4888051,
        ["Length"] = 118,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Koranos Explains Tyrhold",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_koranos_explains_tyrhold.mp3",
        ["Id"] = 4888027,
        ["Length"] = 82,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Lost In Time",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_lost_in_time.mp3",
        ["Id"] = 4888031,
        ["Length"] = 61,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Malfurion Tyrande Goodbye",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_malfurion_tyrande_goodbye.mp3",
        ["Id"] = 4888057,
        ["Length"] = 112,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Obsidian Oathstone Empowerment",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_obsidian_oathstone_empowerment.mp3",
        ["Id"] = 4888035,
        ["Length"] = 45,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Plains Blowing Horn",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_plains_blowing_horn.mp3",
        ["Id"] = 4888037,
        ["Length"] = 50,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Primalist Reveal",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_primalist_reveal.mp3",
        ["Id"] = 4888039,
        ["Length"] = 40,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Raszageth Intro",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_raszageth_intro.mp3",
        ["Id"] = 4888599,
        ["Length"] = 19,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Recalling The Blue Dragons",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_recalling_the_blue_dragons.mp3",
        ["Id"] = 4888041,
        ["Length"] = 56,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Rtc Wma",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_rtc_wma.mp3",
        ["Id"] = 4888069,
        ["Length"] = 88,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Ruby Oathstone Empowered",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_ruby_oathstone_empowered.mp3",
        ["Id"] = 4888595,
        ["Length"] = 86,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Silver Purpose",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_silver_purpose.mp3",
        ["Id"] = 4888067,
        ["Length"] = 72,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Stormsunder Crater Ritual",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_stormsunder_crater_ritual.mp3",
        ["Id"] = 4888043,
        ["Length"] = 68,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Tuskarr Cooking",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_tuskarr_cooking.mp3",
        ["Id"] = 4888065,
        ["Length"] = 17,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Tuskarr Funeral",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_tuskarr_funeral.mp3",
        ["Id"] = 4890255,
        ["Length"] = 98,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Vaultoftheincarnates Raszageth 01",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_vaultoftheincarnates_raszageth_01.mp3",
        ["Id"] = 4888055,
        ["Length"] = 103,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Vaultoftheincarnates Raszageth 02",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_vaultoftheincarnates_raszageth_02.mp3",
        ["Id"] = 4888061,
        ["Length"] = 92,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Vaultoftheincarnates Raszageth 03",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_vaultoftheincarnates_raszageth_03.mp3",
        ["Id"] = 4888597,
        ["Length"] = 56,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Windsong Showdown",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_windsong_showdown.mp3",
        ["Id"] = 4888047,
        ["Length"] = 36,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Wrathion And Ebyssian Meet Emberthal",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_wrathion_and_ebyssian_meet_emberthal.mp3",
        ["Id"] = 4888045,
        ["Length"] = 90,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Wrathion Sabellian Throne",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_wrathion_sabellian_throne.mp3",
        ["Id"] = 4888071,
        ["Length"] = 55,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Ysera Empowerment",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_ysera_empowerment.mp3",
        ["Id"] = 4888593,
        ["Length"] = 34,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Scene Ysera Returns",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_scene_ysera_returns.mp3",
        ["Id"] = 4888073,
        ["Length"] = 58,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus 1A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_1_a.mp3",
        ["Id"] = 4880321,
        ["Length"] = 95,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_1_h.mp3",
        ["Id"] = 4872430,
        ["Length"] = 115,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus 2A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_2_a.mp3",
        ["Id"] = 4887917,
        ["Length"] = 108,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus 2B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_2_b.mp3",
        ["Id"] = 4887919,
        ["Length"] = 115,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus 2C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_2_c.mp3",
        ["Id"] = 4887921,
        ["Length"] = 117,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_2_h.mp3",
        ["Id"] = 4872438,
        ["Length"] = 141,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus 3A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_3_a.mp3",
        ["Id"] = 4887923,
        ["Length"] = 98,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus 3B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_3_b.mp3",
        ["Id"] = 4887925,
        ["Length"] = 94,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus 3H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_3_h.mp3",
        ["Id"] = 4872440,
        ["Length"] = 131,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus Race Through Time 01",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_race_through_time_01.mp3",
        ["Id"] = 4887911,
        ["Length"] = 29,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus Titan 1A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_titan_1_a.mp3",
        ["Id"] = 4887981,
        ["Length"] = 141,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus Titan 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_titan_1_h.mp3",
        ["Id"] = 4872482,
        ["Length"] = 119,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus Titan 2A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_titan_2_a.mp3",
        ["Id"] = 4887977,
        ["Length"] = 112,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus Titan 2B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_titan_2_b.mp3",
        ["Id"] = 4887979,
        ["Length"] = 112,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus Titan 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_titan_2_h.mp3",
        ["Id"] = 4872484,
        ["Length"] = 199,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus Titan 3B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_titan_3_b.mp3",
        ["Id"] = 4887989,
        ["Length"] = 87,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus Titan 3C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_titan_3_c.mp3",
        ["Id"] = 4887991,
        ["Length"] = 121,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus Titan 3H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_titan_3_h.mp3",
        ["Id"] = 4872486,
        ["Length"] = 123,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus Titan 4A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_titan_4_a.mp3",
        ["Id"] = 4887983,
        ["Length"] = 100,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus Titan 4B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_titan_4_b.mp3",
        ["Id"] = 4887985,
        ["Length"] = 104,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus Titan 4C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_titan_4_c.mp3",
        ["Id"] = 4887987,
        ["Length"] = 113,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Thaldraszus Titan 4H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_thaldraszus_titan_4_h.mp3",
        ["Id"] = 4872488,
        ["Length"] = 189,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Tuskarr 1A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_tuskarr_1_a.mp3",
        ["Id"] = 4880389,
        ["Length"] = 132,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Tuskarr 1B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_tuskarr_1_b.mp3",
        ["Id"] = 4880391,
        ["Length"] = 127,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Tuskarr 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_tuskarr_1_h.mp3",
        ["Id"] = 4872490,
        ["Length"] = 131,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Tuskarr 2A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_tuskarr_2_a.mp3",
        ["Id"] = 4880393,
        ["Length"] = 153,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Tuskarr 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_tuskarr_2_h.mp3",
        ["Id"] = 4872492,
        ["Length"] = 122,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Tuskarr 3A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_tuskarr_3_a.mp3",
        ["Id"] = 4880395,
        ["Length"] = 92,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Tuskarr 3H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_tuskarr_3_h.mp3",
        ["Id"] = 4872494,
        ["Length"] = 92,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Tuskarr 4A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_tuskarr_4_a.mp3",
        ["Id"] = 4880397,
        ["Length"] = 135,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Tuskarr 4B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_tuskarr_4_b.mp3",
        ["Id"] = 4880399,
        ["Length"] = 155,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Tuskarr 4C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_tuskarr_4_c.mp3",
        ["Id"] = 4880401,
        ["Length"] = 131,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Tuskarr 4D",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_tuskarr_4_d.mp3",
        ["Id"] = 4880403,
        ["Length"] = 130,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Tuskarr 4H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_tuskarr_4_h.mp3",
        ["Id"] = 4872496,
        ["Length"] = 127,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Uldaman Lostdwarves H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_uldaman_lostdwarves_h.mp3",
        ["Id"] = 4879661,
        ["Length"] = 51,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Uldaman Lostdwarves Stinger",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_uldaman_lostdwarves_stinger.mp3",
        ["Id"] = 4879663,
        ["Length"] = 22,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Valdrakken 1A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_valdrakken_1_a.mp3",
        ["Id"] = 4880323,
        ["Length"] = 112,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Valdrakken 1B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_valdrakken_1_b.mp3",
        ["Id"] = 4880325,
        ["Length"] = 100,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Valdrakken 1C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_valdrakken_1_c.mp3",
        ["Id"] = 4887909,
        ["Length"] = 130,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Valdrakken 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_valdrakken_1_h.mp3",
        ["Id"] = 4872432,
        ["Length"] = 141,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Valdrakken 2A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_valdrakken_2_a.mp3",
        ["Id"] = 4887913,
        ["Length"] = 106,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Valdrakken 2B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_valdrakken_2_b.mp3",
        ["Id"] = 4887915,
        ["Length"] = 92,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Valdrakken 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_valdrakken_2_h.mp3",
        ["Id"] = 4872434,
        ["Length"] = 143,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Valdrakken 3A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_valdrakken_3_a.mp3",
        ["Id"] = 4887927,
        ["Length"] = 112,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Valdrakken 3B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_valdrakken_3_b.mp3",
        ["Id"] = 4887929,
        ["Length"] = 103,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Valdrakken 3H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_valdrakken_3_h.mp3",
        ["Id"] = 4872442,
        ["Length"] = 168,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Wakingshore A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_wakingshore_a.mp3",
        ["Id"] = 4887993,
        ["Length"] = 115,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Wakingshore B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_wakingshore_b.mp3",
        ["Id"] = 4887995,
        ["Length"] = 111,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Wakingshore C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_wakingshore_c.mp3",
        ["Id"] = 4887997,
        ["Length"] = 117,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Wakingshore D",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_wakingshore_d.mp3",
        ["Id"] = 4887999,
        ["Length"] = 135,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Wakingshore E",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_wakingshore_e.mp3",
        ["Id"] = 4888001,
        ["Length"] = 112,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Wakingshore F",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_wakingshore_f.mp3",
        ["Id"] = 4888003,
        ["Length"] = 98,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Wakingshore G",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_wakingshore_g.mp3",
        ["Id"] = 4888005,
        ["Length"] = 98,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Wakingshore H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_wakingshore_h.mp3",
        ["Id"] = 4888007,
        ["Length"] = 146,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Wakingshore Volcanic 1A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_wakingshore_volcanic_1_a.mp3",
        ["Id"] = 4880417,
        ["Length"] = 113,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Wakingshore Volcanic 1B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_wakingshore_volcanic_1_b.mp3",
        ["Id"] = 4880419,
        ["Length"] = 101,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Wakingshore Volcanic 1C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_wakingshore_volcanic_1_c.mp3",
        ["Id"] = 4880421,
        ["Length"] = 117,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Wakingshore Volcanic 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_wakingshore_volcanic_1_h.mp3",
        ["Id"] = 4872506,
        ["Length"] = 137,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Wakingshore Volcanic 2A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_wakingshore_volcanic_2_a.mp3",
        ["Id"] = 4880423,
        ["Length"] = 133,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Wakingshore Volcanic 2B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_wakingshore_volcanic_2_b.mp3",
        ["Id"] = 4880425,
        ["Length"] = 118,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Wakingshore Volcanic 2C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_wakingshore_volcanic_2_c.mp3",
        ["Id"] = 4880427,
        ["Length"] = 99,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Wakingshore Volcanic 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_wakingshore_volcanic_2_h.mp3",
        ["Id"] = 4872508,
        ["Length"] = 144,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Wakingshore Volcanic 3A",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_wakingshore_volcanic_3_a.mp3",
        ["Id"] = 4880429,
        ["Length"] = 140,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Wakingshore Volcanic 3B",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_wakingshore_volcanic_3_b.mp3",
        ["Id"] = 4880431,
        ["Length"] = 105,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Wakingshore Volcanic 3C",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_wakingshore_volcanic_3_c.mp3",
        ["Id"] = 4880433,
        ["Length"] = 118,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.0 Dragonflight",
        ["Song"] = "Wakingshore Volcanic 3H",
        ["Name"] = "sound\\music\\dragonflight\\mus_100_wakingshore_volcanic_3_h.mp3",
        ["Id"] = 4872510,
        ["Length"] = 143,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Forbidden Reach Return 1 H1",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_forbidden_reach_return_1_h1.mp3",
        ["Id"] = 5097561,
        ["Length"] = 124,
        ["Artist"] = "G Stafford, C Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Forbidden Reach Return 1 H2",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_forbidden_reach_return_1_h2.mp3",
        ["Id"] = 5097563,
        ["Length"] = 125,
        ["Artist"] = "G Stafford, C Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Forbidden Reach Return 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_forbidden_reach_return_2_h.mp3",
        ["Id"] = 5097565,
        ["Length"] = 98,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Forbidden Reach Return 3 H1",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_forbidden_reach_return_3_h1.mp3",
        ["Id"] = 5097567,
        ["Length"] = 134,
        ["Artist"] = "G Stafford, C Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Forbidden Reach Return 3 H2",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_forbidden_reach_return_3_h2.mp3",
        ["Id"] = 5097569,
        ["Length"] = 133,
        ["Artist"] = "G Stafford, C Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Old Hatreds A",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_old_hatreds_a.mp3",
        ["Id"] = 5097553,
        ["Length"] = 75,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Old Hatreds B",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_old_hatreds_b.mp3",
        ["Id"] = 5097555,
        ["Length"] = 76,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Old Hatreds C",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_old_hatreds_c.mp3",
        ["Id"] = 5097557,
        ["Length"] = 77,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Old Hatreds H",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_old_hatreds_h.mp3",
        ["Id"] = 5097559,
        ["Length"] = 76,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Primalist Redux 1A",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_primalist_redux_1_a.mp3",
        ["Id"] = 5097545,
        ["Length"] = 110,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Primalist Redux 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_primalist_redux_1_h.mp3",
        ["Id"] = 5097573,
        ["Length"] = 108,
        ["Artist"] = "G Stafford, C Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Primalist Redux 2A",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_primalist_redux_2_a.mp3",
        ["Id"] = 5097543,
        ["Length"] = 83,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Primalist Redux 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_primalist_redux_2_h.mp3",
        ["Id"] = 5097571,
        ["Length"] = 119,
        ["Artist"] = "G Stafford, C Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Primalist Redux 3A",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_primalist_redux_3_a.mp3",
        ["Id"] = 5097551,
        ["Length"] = 85,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Primalist Redux 3H",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_primalist_redux_3_h.mp3",
        ["Id"] = 5097549,
        ["Length"] = 83,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Primalist Redux 4A",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_primalist_redux_4_a.mp3",
        ["Id"] = 5097547,
        ["Length"] = 152,
        ["Artist"] = "G. Stafford, C. Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Primalist Redux 4 H1",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_primalist_redux_4_h1.mp3",
        ["Id"] = 5097575,
        ["Length"] = 133,
        ["Artist"] = "G Stafford, C Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Primalist Redux 4 H2",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_primalist_redux_4_h2.mp3",
        ["Id"] = 5097577,
        ["Length"] = 133,
        ["Artist"] = "G Stafford, C Nguyen",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Scene Baine Too Late",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_scene_baine_too_late.mp3",
        ["Id"] = 5097581,
        ["Length"] = 54,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Scene Emberthal Ebyssian Epilogue",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_scene_emberthal_ebyssian_epilogue.mp3",
        ["Id"] = 5099650,
        ["Length"] = 150,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Scene Human Heritage",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_scene_human_heritage.mp3",
        ["Id"] = 5097583,
        ["Length"] = 92,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Scene Orc Heritage",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_scene_orc_heritage.mp3",
        ["Id"] = 5097585,
        ["Length"] = 70,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Scene Sarkareth Ambush",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_scene_sarkareth_ambush.mp3",
        ["Id"] = 5099652,
        ["Length"] = 101,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.0.7 Dragonflight",
        ["Song"] = "Scene Tomul Saves Baine",
        ["Name"] = "sound\\music\\dragonflight\\mus_1007_scene_tomul_saves_baine.mp3",
        ["Id"] = 5097579,
        ["Length"] = 41,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Aberrus A",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_aberrus_a.mp3",
        ["Id"] = 5168404,
        ["Length"] = 178,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Aberrus B",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_aberrus_b.mp3",
        ["Id"] = 5168406,
        ["Length"] = 189,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Aberrus C",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_aberrus_c.mp3",
        ["Id"] = 5168408,
        ["Length"] = 186,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Aberrus H",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_aberrus_h.mp3",
        ["Id"] = 5168410,
        ["Length"] = 189,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Blue Dragonflight Family H",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_blue_dragonflight_family_h.mp3",
        ["Id"] = 5168438,
        ["Length"] = 131,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Crystal Fields A",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_crystal_fields_a.mp3",
        ["Id"] = 5168520,
        ["Length"] = 153,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Crystal Fields H",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_crystal_fields_h.mp3",
        ["Id"] = 5168522,
        ["Length"] = 144,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Djaradin A",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_djaradin_a.mp3",
        ["Id"] = 5168412,
        ["Length"] = 111,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Djaradin B",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_djaradin_b.mp3",
        ["Id"] = 5168414,
        ["Length"] = 111,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Djaradin C",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_djaradin_c.mp3",
        ["Id"] = 5168416,
        ["Length"] = 113,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Djaradin D",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_djaradin_d.mp3",
        ["Id"] = 5168418,
        ["Length"] = 111,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Djaradin H",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_djaradin_h.mp3",
        ["Id"] = 5168420,
        ["Length"] = 111,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Dragon Race 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_dragon_race_2_h.mp3",
        ["Id"] = 5168440,
        ["Length"] = 135,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Ebyssian Earthwarder H",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_ebyssian_earthwarder_h.mp3",
        ["Id"] = 5168436,
        ["Length"] = 129,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Fyrakk A",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_fyrakk_a.mp3",
        ["Id"] = 5168442,
        ["Length"] = 26,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Fyrakk B",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_fyrakk_b.mp3",
        ["Id"] = 5168444,
        ["Length"] = 112,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Fyrakk C",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_fyrakk_c.mp3",
        ["Id"] = 5168446,
        ["Length"] = 59,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Fyrakk D",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_fyrakk_d.mp3",
        ["Id"] = 5168448,
        ["Length"] = 26,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Fyrakk E",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_fyrakk_e.mp3",
        ["Id"] = 5168450,
        ["Length"] = 108,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Fyrakk F",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_fyrakk_f.mp3",
        ["Id"] = 5168452,
        ["Length"] = 59,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Fyrakk G",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_fyrakk_g.mp3",
        ["Id"] = 5168454,
        ["Length"] = 111,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Fyrakk H",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_fyrakk_h.mp3",
        ["Id"] = 5168456,
        ["Length"] = 179,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Fyrakk I",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_fyrakk_i.mp3",
        ["Id"] = 5168458,
        ["Length"] = 59,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Glimmerogg 1A",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_glimmerogg_1_a.mp3",
        ["Id"] = 5168478,
        ["Length"] = 125,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Glimmerogg 1B",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_glimmerogg_1_b.mp3",
        ["Id"] = 5168480,
        ["Length"] = 121,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Glimmerogg 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_glimmerogg_1_h.mp3",
        ["Id"] = 5168482,
        ["Length"] = 169,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Glimmerogg 2A",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_glimmerogg_2_a.mp3",
        ["Id"] = 5168484,
        ["Length"] = 132,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Glimmerogg 2B",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_glimmerogg_2_b.mp3",
        ["Id"] = 5168486,
        ["Length"] = 115,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Glimmerogg 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_glimmerogg_2_h.mp3",
        ["Id"] = 5168488,
        ["Length"] = 172,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Loamm Inn A",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_loamm_inn_a.mp3",
        ["Id"] = 5168460,
        ["Length"] = 134,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Loamm Inn H",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_loamm_inn_h.mp3",
        ["Id"] = 5168462,
        ["Length"] = 124,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Loamm Town A",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_loamm_town_a.mp3",
        ["Id"] = 5168464,
        ["Length"] = 144,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Loamm Town B",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_loamm_town_b.mp3",
        ["Id"] = 5168466,
        ["Length"] = 144,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Loamm Town H",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_loamm_town_h.mp3",
        ["Id"] = 5168468,
        ["Length"] = 179,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Mysterious A",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_mysterious_a.mp3",
        ["Id"] = 5168490,
        ["Length"] = 126,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Mysterious B",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_mysterious_b.mp3",
        ["Id"] = 5168492,
        ["Length"] = 181,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Mysterious H",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_mysterious_h.mp3",
        ["Id"] = 5168494,
        ["Length"] = 181,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Scene Alexstrasza Informed",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_scene_alexstrasza_informed.mp3",
        ["Id"] = 5168611,
        ["Length"] = 78,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Scene Aspects Of Our Legacy",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_scene_aspects_of_our_legacy.mp3",
        ["Id"] = 5168625,
        ["Length"] = 66,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Scene Djaradin Danger",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_scene_djaradin_danger.mp3",
        ["Id"] = 5168631,
        ["Length"] = 60,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Scene Flame Extinguished",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_scene_flame_extinguished.mp3",
        ["Id"] = 5172541,
        ["Length"] = 40,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Scene Forbidden Reach",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_scene_forbidden_reach.mp3",
        ["Id"] = 5168615,
        ["Length"] = 23,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Scene Fyrakk Reveal",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_scene_fyrakk_reveal.mp3",
        ["Id"] = 5168621,
        ["Length"] = 56,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Scene Fyrakk Shadowflame Empowerment",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_scene_fyrakk_shadowflame_empowerment.mp3",
        ["Id"] = 5168623,
        ["Length"] = 73,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Scene Into Zaralek Caverns",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_scene_into_zaralek_caverns.mp3",
        ["Id"] = 5168637,
        ["Length"] = 44,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Scene Last Conflict Intro",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_scene_last_conflict_intro.mp3",
        ["Id"] = 5168613,
        ["Length"] = 39,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Scene Legacy Reforged",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_scene_legacy_reforged.mp3",
        ["Id"] = 5172543,
        ["Length"] = 174,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Scene Malygos Sindragosa Sendoff",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_scene_malygos_sindragosa_sendoff.mp3",
        ["Id"] = 5172536,
        ["Length"] = 108,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Scene Rescued By Honeypelt",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_scene_rescued_by_honeypelt.mp3",
        ["Id"] = 5168627,
        ["Length"] = 54,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Scene Saving Slitherdrake",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_scene_saving_slitherdrake.mp3",
        ["Id"] = 5168619,
        ["Length"] = 66,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Scene Scoping Caldera",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_scene_scoping_caldera.mp3",
        ["Id"] = 5172535,
        ["Length"] = 28,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Scene Senagos Farewell",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_scene_senagos_farewell.mp3",
        ["Id"] = 5168629,
        ["Length"] = 103,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Scene Stopping Sarkareth",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_scene_stopping_sarkareth.mp3",
        ["Id"] = 5172539,
        ["Length"] = 83,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Scene Symbol Of Hope",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_scene_symbol_of_hope.mp3",
        ["Id"] = 5168635,
        ["Length"] = 66,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Scene Tyr Sacrifice",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_scene_tyr_sacrifice.mp3",
        ["Id"] = 5168633,
        ["Length"] = 85,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Scene Upper Hand",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_scene_upper_hand.mp3",
        ["Id"] = 5168617,
        ["Length"] = 91,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Shadowflame A",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_shadowflame_a.mp3",
        ["Id"] = 5168470,
        ["Length"] = 97,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Shadowflame B",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_shadowflame_b.mp3",
        ["Id"] = 5168472,
        ["Length"] = 73,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Shadowflame C",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_shadowflame_c.mp3",
        ["Id"] = 5168474,
        ["Length"] = 78,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Shadowflame H",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_shadowflame_h.mp3",
        ["Id"] = 5168476,
        ["Length"] = 234,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Sulfur Wastes A",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_sulfur_wastes_a.mp3",
        ["Id"] = 5168524,
        ["Length"] = 123,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Sulfur Wastes B",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_sulfur_wastes_b.mp3",
        ["Id"] = 5168526,
        ["Length"] = 123,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Sulfur Wastes C",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_sulfur_wastes_c.mp3",
        ["Id"] = 5168528,
        ["Length"] = 123,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Sulfur Wastes D",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_sulfur_wastes_d.mp3",
        ["Id"] = 5168530,
        ["Length"] = 110,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Sulfur Wastes H",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_sulfur_wastes_h.mp3",
        ["Id"] = 5168532,
        ["Length"] = 123,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Sundered Flame A",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_sundered_flame_a.mp3",
        ["Id"] = 5168422,
        ["Length"] = 167,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Sundered Flame B",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_sundered_flame_b.mp3",
        ["Id"] = 5168424,
        ["Length"] = 167,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Sundered Flame C",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_sundered_flame_c.mp3",
        ["Id"] = 5168426,
        ["Length"] = 169,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Sundered Flame D",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_sundered_flame_d.mp3",
        ["Id"] = 5168428,
        ["Length"] = 169,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Sundered Flame E",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_sundered_flame_e.mp3",
        ["Id"] = 5168430,
        ["Length"] = 185,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Sundered Flame F",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_sundered_flame_f.mp3",
        ["Id"] = 5168434,
        ["Length"] = 185,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Sundered Flame H",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_sundered_flame_h.mp3",
        ["Id"] = 5168432,
        ["Length"] = 197,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Volcanic 1A",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_volcanic_1_a.mp3",
        ["Id"] = 5168508,
        ["Length"] = 120,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Volcanic 1B",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_volcanic_1_b.mp3",
        ["Id"] = 5168510,
        ["Length"] = 119,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Volcanic 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_volcanic_1_h.mp3",
        ["Id"] = 5168512,
        ["Length"] = 171,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Volcanic 2A",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_volcanic_2_a.mp3",
        ["Id"] = 5168514,
        ["Length"] = 98,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Volcanic 2B",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_volcanic_2_b.mp3",
        ["Id"] = 5168516,
        ["Length"] = 96,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Volcanic 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_volcanic_2_h.mp3",
        ["Id"] = 5168518,
        ["Length"] = 147,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Zaralek 1A",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_zaralek_1_a.mp3",
        ["Id"] = 5168496,
        ["Length"] = 132,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Zaralek 1B",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_zaralek_1_b.mp3",
        ["Id"] = 5168498,
        ["Length"] = 105,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Zaralek 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_zaralek_1_h.mp3",
        ["Id"] = 5168500,
        ["Length"] = 212,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Zaralek 2A",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_zaralek_2_a.mp3",
        ["Id"] = 5168502,
        ["Length"] = 117,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Zaralek 2B",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_zaralek_2_b.mp3",
        ["Id"] = 5168504,
        ["Length"] = 89,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.0 Dragonflight",
        ["Song"] = "Zaralek 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_101_zaralek_2_h.mp3",
        ["Id"] = 5168506,
        ["Length"] = 207,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Chronology 1A",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_chronology_1_a.mp3",
        ["Id"] = 5282277,
        ["Length"] = 106,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Chronology 1B",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_chronology_1_b.mp3",
        ["Id"] = 5282279,
        ["Length"] = 38,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Chronology 1C",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_chronology_1_c.mp3",
        ["Id"] = 5282281,
        ["Length"] = 88,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Chronology 1H",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_chronology_1_h.mp3",
        ["Id"] = 5282283,
        ["Length"] = 145,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Chronology 2A",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_chronology_2_a.mp3",
        ["Id"] = 5282285,
        ["Length"] = 105,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Chronology 2H",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_chronology_2_h.mp3",
        ["Id"] = 5282287,
        ["Length"] = 127,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Chronology 3H",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_chronology_3_h.mp3",
        ["Id"] = 5282289,
        ["Length"] = 101,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Dawn Of The Infinite A",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_dawn_of_the_infinite_a.mp3",
        ["Id"] = 5282291,
        ["Length"] = 120,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Dawn Of The Infinite B",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_dawn_of_the_infinite_b.mp3",
        ["Id"] = 5282293,
        ["Length"] = 95,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Dawn Of The Infinite C",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_dawn_of_the_infinite_c.mp3",
        ["Id"] = 5282295,
        ["Length"] = 118,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Dawn Of The Infinite H",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_dawn_of_the_infinite_h.mp3",
        ["Id"] = 5282297,
        ["Length"] = 150,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Epoch Watch A",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_epoch_watch_a.mp3",
        ["Id"] = 5282271,
        ["Length"] = 109,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Epoch Watch B",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_epoch_watch_b.mp3",
        ["Id"] = 5282273,
        ["Length"] = 140,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Epoch Watch H",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_epoch_watch_h.mp3",
        ["Id"] = 5282275,
        ["Length"] = 139,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Scene Morchie Mayhem",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_scene_morchie_mayhem.mp3",
        ["Id"] = 5282242,
        ["Length"] = 40,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Scene Rewind And Reconcile",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_scene_rewind_and_reconcile.mp3",
        ["Id"] = 5282240,
        ["Length"] = 136,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Scene Rough Edges",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_scene_rough_edges.mp3",
        ["Id"] = 5282244,
        ["Length"] = 134,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Time Rift Invasion A",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_time_rift_invasion_a.mp3",
        ["Id"] = 5282261,
        ["Length"] = 134,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Time Rift Invasion B",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_time_rift_invasion_b.mp3",
        ["Id"] = 5282263,
        ["Length"] = 121,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Time Rift Invasion C",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_time_rift_invasion_c.mp3",
        ["Id"] = 5282265,
        ["Length"] = 118,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Time Rift Invasion D",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_time_rift_invasion_d.mp3",
        ["Id"] = 5282267,
        ["Length"] = 136,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Time Rift Invasion H",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_time_rift_invasion_h.mp3",
        ["Id"] = 5282269,
        ["Length"] = 204,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Whelp Soul A1",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_whelp_soul_a1.mp3",
        ["Id"] = 5282246,
        ["Length"] = 25,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Whelp Soul A2",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_whelp_soul_a2.mp3",
        ["Id"] = 5282248,
        ["Length"] = 25,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Whelp Soul A3",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_whelp_soul_a3.mp3",
        ["Id"] = 5282250,
        ["Length"] = 23,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Whelp Soul H1",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_whelp_soul_h1.mp3",
        ["Id"] = 5282252,
        ["Length"] = 28,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.5 Dragonflight",
        ["Song"] = "Whelp Soul H2",
        ["Name"] = "sound\\music\\dragonflight\\mus_1015_whelp_soul_h2.mp3",
        ["Id"] = 5282254,
        ["Length"] = 29,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.7 Dragonflight",
        ["Song"] = "Scene Dracthyr Reconciliations",
        ["Name"] = "sound\\music\\dragonflight\\mus_1017_scene_dracthyr_reconciliations.mp3",
        ["Id"] = 5366210,
        ["Length"] = 100,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.7 Dragonflight",
        ["Song"] = "Scene Fate We Make",
        ["Name"] = "sound\\music\\dragonflight\\mus_1017_scene_fate_we_make.mp3",
        ["Id"] = 5366208,
        ["Length"] = 88,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.7 Dragonflight",
        ["Song"] = "Scene Forsaken Heritage 1",
        ["Name"] = "sound\\music\\dragonflight\\mus_1017_scene_forsaken_heritage_1.mp3",
        ["Id"] = 5366214,
        ["Length"] = 24,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.7 Dragonflight",
        ["Song"] = "Scene Forsaken Heritage 2",
        ["Name"] = "sound\\music\\dragonflight\\mus_1017_scene_forsaken_heritage_2.mp3",
        ["Id"] = 5366216,
        ["Length"] = 29,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.7 Dragonflight",
        ["Song"] = "Scene Forsaken Heritage 3",
        ["Name"] = "sound\\music\\dragonflight\\mus_1017_scene_forsaken_heritage_3.mp3",
        ["Id"] = 5366218,
        ["Length"] = 106,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.7 Dragonflight",
        ["Song"] = "Scene Fyrakk Vyranoth Argument",
        ["Name"] = "sound\\music\\dragonflight\\mus_1017_scene_fyrakk_vyranoth_argument.mp3",
        ["Id"] = 5366212,
        ["Length"] = 96,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.7 Dragonflight",
        ["Song"] = "Scene Night Elf Heritage 1",
        ["Name"] = "sound\\music\\dragonflight\\mus_1017_scene_night_elf_heritage_1.mp3",
        ["Id"] = 5366220,
        ["Length"] = 43,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.7 Dragonflight",
        ["Song"] = "Scene Night Elf Heritage 2",
        ["Name"] = "sound\\music\\dragonflight\\mus_1017_scene_night_elf_heritage_2.mp3",
        ["Id"] = 5366222,
        ["Length"] = 73,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.7 Dragonflight",
        ["Song"] = "Scene Tyr Guard Assemble",
        ["Name"] = "sound\\music\\dragonflight\\mus_1017_scene_tyr_guard_assemble.mp3",
        ["Id"] = 5371655,
        ["Length"] = 56,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.1.7 Dragonflight",
        ["Song"] = "Scene Vyranoth Valdrakken Arrival",
        ["Name"] = "sound\\music\\dragonflight\\mus_1017_scene_vyranoth_valdrakken_arrival.mp3",
        ["Id"] = 5366224,
        ["Length"] = 134,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Amirdrassil A",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_amirdrassil_a.mp3",
        ["Id"] = 5484575,
        ["Length"] = 106,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Amirdrassil B",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_amirdrassil_b.mp3",
        ["Id"] = 5484577,
        ["Length"] = 162,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Amirdrassil C",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_amirdrassil_c.mp3",
        ["Id"] = 5484579,
        ["Length"] = 133,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Amirdrassil D",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_amirdrassil_d.mp3",
        ["Id"] = 5484581,
        ["Length"] = 136,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Amirdrassil E",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_amirdrassil_e.mp3",
        ["Id"] = 5486240,
        ["Length"] = 120,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Amirdrassil F",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_amirdrassil_f.mp3",
        ["Id"] = 5486242,
        ["Length"] = 123,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Amirdrassil G",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_amirdrassil_g.mp3",
        ["Id"] = 5486244,
        ["Length"] = 139,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Amirdrassil H",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_amirdrassil_h.mp3",
        ["Id"] = 5484583,
        ["Length"] = 194,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Amirdrassil I",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_amirdrassil_i.mp3",
        ["Id"] = 5486246,
        ["Length"] = 81,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Amirdrassil J",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_amirdrassil_j.mp3",
        ["Id"] = 5486248,
        ["Length"] = 62,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Amirdrassil K",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_amirdrassil_k.mp3",
        ["Id"] = 5486250,
        ["Length"] = 119,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Ancient Bough A",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_ancient_bough_a.mp3",
        ["Id"] = 5484585,
        ["Length"] = 115,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Ancient Bough B",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_ancient_bough_b.mp3",
        ["Id"] = 5484587,
        ["Length"] = 151,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Ancient Bough C",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_ancient_bough_c.mp3",
        ["Id"] = 5484589,
        ["Length"] = 123,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Ancient Bough H",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_ancient_bough_h.mp3",
        ["Id"] = 5484591,
        ["Length"] = 226,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Barrows Of Flame A",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_barrows_of_flame_a.mp3",
        ["Id"] = 5484601,
        ["Length"] = 123,
        ["Artist"] = "Russell Brower",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Barrows Of Flame B",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_barrows_of_flame_b.mp3",
        ["Id"] = 5484603,
        ["Length"] = 113,
        ["Artist"] = "Russell Brower",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Barrows Of Flame H",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_barrows_of_flame_h.mp3",
        ["Id"] = 5484605,
        ["Length"] = 122,
        ["Artist"] = "Russell Brower",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Barrows Of Reverie A",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_barrows_of_reverie_a.mp3",
        ["Id"] = 5484593,
        ["Length"] = 97,
        ["Artist"] = "Russell Brower",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Barrows Of Reverie B",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_barrows_of_reverie_b.mp3",
        ["Id"] = 5484595,
        ["Length"] = 104,
        ["Artist"] = "Russell Brower",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Barrows Of Reverie C",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_barrows_of_reverie_c.mp3",
        ["Id"] = 5484597,
        ["Length"] = 88,
        ["Artist"] = "Russell Brower",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Barrows Of Reverie H",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_barrows_of_reverie_h.mp3",
        ["Id"] = 5484599,
        ["Length"] = 85,
        ["Artist"] = "Russell Brower",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Cinder Summit A",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_cinder_summit_a.mp3",
        ["Id"] = 5483945,
        ["Length"] = 93,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Cinder Summit B",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_cinder_summit_b.mp3",
        ["Id"] = 5483947,
        ["Length"] = 105,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Cinder Summit C",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_cinder_summit_c.mp3",
        ["Id"] = 5483949,
        ["Length"] = 115,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Cinder Summit H",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_cinder_summit_h.mp3",
        ["Id"] = 5483951,
        ["Length"] = 143,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Dreams Hope A",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_dreams_hope_a.mp3",
        ["Id"] = 5484549,
        ["Length"] = 22,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Dreams Hope B",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_dreams_hope_b.mp3",
        ["Id"] = 5484551,
        ["Length"] = 23,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Dreams Hope C",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_dreams_hope_c.mp3",
        ["Id"] = 5484553,
        ["Length"] = 130,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Dreams Hope D",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_dreams_hope_d.mp3",
        ["Id"] = 5484555,
        ["Length"] = 131,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Dreams Hope E",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_dreams_hope_e.mp3",
        ["Id"] = 5484557,
        ["Length"] = 86,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Dreams Hope F",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_dreams_hope_f.mp3",
        ["Id"] = 5484559,
        ["Length"] = 148,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Dreams Hope G",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_dreams_hope_g.mp3",
        ["Id"] = 5484561,
        ["Length"] = 108,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Dreams Hope H",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_dreams_hope_h.mp3",
        ["Id"] = 5484563,
        ["Length"] = 204,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Dreams Hope I",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_dreams_hope_i.mp3",
        ["Id"] = 5484565,
        ["Length"] = 157,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Dreams Hope J",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_dreams_hope_j.mp3",
        ["Id"] = 5484567,
        ["Length"] = 129,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Dreams Hope K",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_dreams_hope_k.mp3",
        ["Id"] = 5484569,
        ["Length"] = 129,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Dreams Hope L",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_dreams_hope_l.mp3",
        ["Id"] = 5484571,
        ["Length"] = 203,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Dreams Hope M",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_dreams_hope_m.mp3",
        ["Id"] = 5484573,
        ["Length"] = 133,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Dreamsurge A",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_dreamsurge_a.mp3",
        ["Id"] = 5486222,
        ["Length"] = 104,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Dreamsurge B",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_dreamsurge_b.mp3",
        ["Id"] = 5486224,
        ["Length"] = 105,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Dreamsurge C",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_dreamsurge_c.mp3",
        ["Id"] = 5486226,
        ["Length"] = 129,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Dreamsurge D",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_dreamsurge_d.mp3",
        ["Id"] = 5488889,
        ["Length"] = 121,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Dreamsurge E",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_dreamsurge_e.mp3",
        ["Id"] = 5488891,
        ["Length"] = 89,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Dreamsurge H",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_dreamsurge_h.mp3",
        ["Id"] = 5484517,
        ["Length"] = 126,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Emerald Dream A",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_emerald_dream_a.mp3",
        ["Id"] = 5484625,
        ["Length"] = 103,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Emerald Dream B",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_emerald_dream_b.mp3",
        ["Id"] = 5484627,
        ["Length"] = 64,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Emerald Dream C",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_emerald_dream_c.mp3",
        ["Id"] = 5484629,
        ["Length"] = 36,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Emerald Dream D",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_emerald_dream_d.mp3",
        ["Id"] = 5484631,
        ["Length"] = 40,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Emerald Dream E",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_emerald_dream_e.mp3",
        ["Id"] = 5484633,
        ["Length"] = 104,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Emerald Dream F",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_emerald_dream_f.mp3",
        ["Id"] = 5484635,
        ["Length"] = 63,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Emerald Dream G",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_emerald_dream_g.mp3",
        ["Id"] = 5484637,
        ["Length"] = 36,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Emerald Dream H",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_emerald_dream_h.mp3",
        ["Id"] = 5484639,
        ["Length"] = 228,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Emerald Dream I",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_emerald_dream_i.mp3",
        ["Id"] = 5484641,
        ["Length"] = 37,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Emerald Dream J",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_emerald_dream_j.mp3",
        ["Id"] = 5484643,
        ["Length"] = 133,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Emerald Dream K",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_emerald_dream_k.mp3",
        ["Id"] = 5484645,
        ["Length"] = 84,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Emerald Dream L",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_emerald_dream_l.mp3",
        ["Id"] = 5484647,
        ["Length"] = 47,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Emerald Dream M",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_emerald_dream_m.mp3",
        ["Id"] = 5484649,
        ["Length"] = 51,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Eye Of Ysera A",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_eye_of_ysera_a.mp3",
        ["Id"] = 5484284,
        ["Length"] = 120,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Eye Of Ysera B",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_eye_of_ysera_b.mp3",
        ["Id"] = 5484286,
        ["Length"] = 148,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Eye Of Ysera C",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_eye_of_ysera_c.mp3",
        ["Id"] = 5484288,
        ["Length"] = 128,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Eye Of Ysera D",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_eye_of_ysera_d.mp3",
        ["Id"] = 5484290,
        ["Length"] = 145,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Eye Of Ysera E",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_eye_of_ysera_e.mp3",
        ["Id"] = 5484292,
        ["Length"] = 157,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Eye Of Ysera F",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_eye_of_ysera_f.mp3",
        ["Id"] = 5484294,
        ["Length"] = 204,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Eye Of Ysera G",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_eye_of_ysera_g.mp3",
        ["Id"] = 5484296,
        ["Length"] = 204,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Eye Of Ysera H",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_eye_of_ysera_h.mp3",
        ["Id"] = 5484298,
        ["Length"] = 204,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Firebreach A",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_firebreach_a.mp3",
        ["Id"] = 5484519,
        ["Length"] = 107,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Firebreach B",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_firebreach_b.mp3",
        ["Id"] = 5484521,
        ["Length"] = 119,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Firebreach C",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_firebreach_c.mp3",
        ["Id"] = 5484523,
        ["Length"] = 113,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Firebreach D",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_firebreach_d.mp3",
        ["Id"] = 5484525,
        ["Length"] = 114,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Firebreach E",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_firebreach_e.mp3",
        ["Id"] = 5484527,
        ["Length"] = 97,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Firebreach F",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_firebreach_f.mp3",
        ["Id"] = 5484529,
        ["Length"] = 120,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Firebreach H",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_firebreach_h.mp3",
        ["Id"] = 5484531,
        ["Length"] = 289,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Flame Incursion A",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_flame_incursion_a.mp3",
        ["Id"] = 5486228,
        ["Length"] = 109,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Flame Incursion B",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_flame_incursion_b.mp3",
        ["Id"] = 5486230,
        ["Length"] = 100,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Flame Incursion C",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_flame_incursion_c.mp3",
        ["Id"] = 5486232,
        ["Length"] = 107,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Flame Incursion D",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_flame_incursion_d.mp3",
        ["Id"] = 5486234,
        ["Length"] = 96,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Flame Incursion E",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_flame_incursion_e.mp3",
        ["Id"] = 5486236,
        ["Length"] = 87,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Flame Incursion F",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_flame_incursion_f.mp3",
        ["Id"] = 5486238,
        ["Length"] = 93,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Flame Incursion H",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_flame_incursion_h.mp3",
        ["Id"] = 5484533,
        ["Length"] = 131,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Fury Incarnate A",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_fury_incarnate_a.mp3",
        ["Id"] = 5484535,
        ["Length"] = 82,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Fury Incarnate B",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_fury_incarnate_b.mp3",
        ["Id"] = 5484537,
        ["Length"] = 94,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Fury Incarnate C",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_fury_incarnate_c.mp3",
        ["Id"] = 5484539,
        ["Length"] = 84,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Fury Incarnate Combat A",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_fury_incarnate_combat_a.mp3",
        ["Id"] = 5488893,
        ["Length"] = 176,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Fury Incarnate Combat B",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_fury_incarnate_combat_b.mp3",
        ["Id"] = 5488895,
        ["Length"] = 140,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Fury Incarnate Combat C",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_fury_incarnate_combat_c.mp3",
        ["Id"] = 5488897,
        ["Length"] = 123,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Fury Incarnate D",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_fury_incarnate_d.mp3",
        ["Id"] = 5484541,
        ["Length"] = 94,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Fury Incarnate E",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_fury_incarnate_e.mp3",
        ["Id"] = 5484543,
        ["Length"] = 79,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Fury Incarnate F",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_fury_incarnate_f.mp3",
        ["Id"] = 5484545,
        ["Length"] = 76,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Fury Incarnate H",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_fury_incarnate_h.mp3",
        ["Id"] = 5484547,
        ["Length"] = 180,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Haven Cascades A",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_haven_cascades_a.mp3",
        ["Id"] = 5484607,
        ["Length"] = 126,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Haven Cascades B",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_haven_cascades_b.mp3",
        ["Id"] = 5484609,
        ["Length"] = 138,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Haven Cascades C",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_haven_cascades_c.mp3",
        ["Id"] = 5484611,
        ["Length"] = 100,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Haven Cascades H",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_haven_cascades_h.mp3",
        ["Id"] = 5484613,
        ["Length"] = 140,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Rootwoven Sanctuary A",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_rootwoven_sanctuary_a.mp3",
        ["Id"] = 5484651,
        ["Length"] = 203,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Rootwoven Sanctuary B",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_rootwoven_sanctuary_b.mp3",
        ["Id"] = 5484653,
        ["Length"] = 204,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Rootwoven Sanctuary C",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_rootwoven_sanctuary_c.mp3",
        ["Id"] = 5484655,
        ["Length"] = 203,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Rootwoven Sanctuary D",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_rootwoven_sanctuary_d.mp3",
        ["Id"] = 5484657,
        ["Length"] = 125,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Rootwoven Sanctuary E",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_rootwoven_sanctuary_e.mp3",
        ["Id"] = 5484659,
        ["Length"] = 176,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Rootwoven Sanctuary F",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_rootwoven_sanctuary_f.mp3",
        ["Id"] = 5484661,
        ["Length"] = 132,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Rootwoven Sanctuary G",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_rootwoven_sanctuary_g.mp3",
        ["Id"] = 5484663,
        ["Length"] = 121,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Rootwoven Sanctuary H",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_rootwoven_sanctuary_h.mp3",
        ["Id"] = 5484665,
        ["Length"] = 203,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Rootwoven Sanctuary I",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_rootwoven_sanctuary_i.mp3",
        ["Id"] = 5484667,
        ["Length"] = 117,
        ["Artist"] = "Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene Amirdrassil Finale 1",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_amirdrassil_finale_1.mp3",
        ["Id"] = 5493357,
        ["Length"] = 10,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene Amirdrassil Finale 2",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_amirdrassil_finale_2.mp3",
        ["Id"] = 5484685,
        ["Length"] = 7,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene Aspects Reempowered",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_aspects_reempowered.mp3",
        ["Id"] = 5484671,
        ["Length"] = 101,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene Assault On Wellspring",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_assault_on_wellspring.mp3",
        ["Id"] = 5484669,
        ["Length"] = 82,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene Blessing Of Teldrassil",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_blessing_of_teldrassil.mp3",
        ["Id"] = 5484693,
        ["Length"] = 98,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene Bloom Begins",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_bloom_begins.mp3",
        ["Id"] = 5484701,
        ["Length"] = 56,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene Elisande Timeway Escape",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_elisande_timeway_escape.mp3",
        ["Id"] = 5484679,
        ["Length"] = 57,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene Emerald Welcome",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_emerald_welcome.mp3",
        ["Id"] = 5484677,
        ["Length"] = 42,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene Forlorn Hope",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_forlorn_hope.mp3",
        ["Id"] = 5484695,
        ["Length"] = 68,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene Fyrakk And Prophet",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_fyrakk_and_prophet.mp3",
        ["Id"] = 5484683,
        ["Length"] = 100,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene Fyrakk Steals Smolderon",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_fyrakk_steals_smolderon.mp3",
        ["Id"] = 5484687,
        ["Length"] = 28,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene Fyrakk The Blazing",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_fyrakk_the_blazing.mp3",
        ["Id"] = 5484681,
        ["Length"] = 54,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene Galoks New Weapon",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_galoks_new_weapon.mp3",
        ["Id"] = 5484689,
        ["Length"] = 50,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene Halls Of Lightning",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_halls_of_lightning.mp3",
        ["Id"] = 5484675,
        ["Length"] = 24,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene Merithra Defeats Galok",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_merithra_defeats_galok.mp3",
        ["Id"] = 5484691,
        ["Length"] = 54,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene Prophet Transforms",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_prophet_transforms.mp3",
        ["Id"] = 5484703,
        ["Length"] = 35,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene Raid Fyrakk Intro",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_raid_fyrakk_intro.mp3",
        ["Id"] = 5484697,
        ["Length"] = 43,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene The Tide Turns",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_the_tide_turns.mp3",
        ["Id"] = 5484705,
        ["Length"] = 123,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene Tyrs Awakening",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_tyrs_awakening.mp3",
        ["Id"] = 5484699,
        ["Length"] = 50,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene Vyranoth Confronts Odyn",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_vyranoth_confronts_odyn.mp3",
        ["Id"] = 5484707,
        ["Length"] = 65,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Scene Ysera Goodbye",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_scene_ysera_goodbye.mp3",
        ["Id"] = 5484709,
        ["Length"] = 152,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Viridescent Thicket A",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_viridescent_thicket_a.mp3",
        ["Id"] = 5484615,
        ["Length"] = 136,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Viridescent Thicket B",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_viridescent_thicket_b.mp3",
        ["Id"] = 5484617,
        ["Length"] = 126,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Viridescent Thicket C",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_viridescent_thicket_c.mp3",
        ["Id"] = 5484619,
        ["Length"] = 134,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Viridescent Thicket D",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_viridescent_thicket_d.mp3",
        ["Id"] = 5484621,
        ["Length"] = 134,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.0 Dragonflight",
        ["Song"] = "Viridescent Thicket H",
        ["Name"] = "sound\\music\\dragonflight\\mus_102_viridescent_thicket_h.mp3",
        ["Id"] = 5484623,
        ["Length"] = 172,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.5 Dragonflight",
        ["Song"] = "Scene Beginning Of A New Dawn",
        ["Name"] = "sound\\music\\dragonflight\\mus_1025_scene_beginning_of_a_new_dawn.mp3",
        ["Id"] = 5554683,
        ["Length"] = 135,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.5 Dragonflight",
        ["Song"] = "Scene Fair Skies Strong Winds",
        ["Name"] = "sound\\music\\dragonflight\\mus_1025_scene_fair_skies_strong_winds.mp3",
        ["Id"] = 5554677,
        ["Length"] = 82,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.5 Dragonflight",
        ["Song"] = "Scene Gates Of Gilneas",
        ["Name"] = "sound\\music\\dragonflight\\mus_1025_scene_gates_of_gilneas.mp3",
        ["Id"] = 5554679,
        ["Length"] = 25,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.5 Dragonflight",
        ["Song"] = "Scene The Returning",
        ["Name"] = "sound\\music\\dragonflight\\mus_1025_scene_the_returning.mp3",
        ["Id"] = 5554681,
        ["Length"] = 133,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.6 Dragonflight",
        ["Song"] = "Plunderstorm A",
        ["Name"] = "sound\\music\\dragonflight\\mus_1026_plunderstorm_a.mp3",
        ["Id"] = 5700456,
        ["Length"] = 16,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.6 Dragonflight",
        ["Song"] = "Plunderstorm B",
        ["Name"] = "sound\\music\\dragonflight\\mus_1026_plunderstorm_b.mp3",
        ["Id"] = 5700458,
        ["Length"] = 7,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.6 Dragonflight",
        ["Song"] = "Plunderstorm C",
        ["Name"] = "sound\\music\\dragonflight\\mus_1026_plunderstorm_c.mp3",
        ["Id"] = 5700460,
        ["Length"] = 17,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.6 Dragonflight",
        ["Song"] = "Plunderstorm D",
        ["Name"] = "sound\\music\\dragonflight\\mus_1026_plunderstorm_d.mp3",
        ["Id"] = 5700462,
        ["Length"] = 10,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 10.2.6 Dragonflight",
        ["Song"] = "Plunderstorm H",
        ["Name"] = "sound\\music\\dragonflight\\mus_1026_plunderstorm_h.mp3",
        ["Id"] = 5700464,
        ["Length"] = 148,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    }
}

if LE_EXPANSION_LEVEL_CURRENT > 8 then
    EpicMusicPlayer:AddPlayList("Dragonflight", Dragonflight, false, true)
end