--Created by YourDevil54
local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
if not EpicMusicPlayer then return end

local Shadowlands = {
	["listName"] = "Shadowlands",
	["playlistVersion"] = "4.0",
	["locked"] =  "true",
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Through The Roof of the World",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_throughtheroofoftheworld_maintitle.mp3",
        ["Id"] = 3850553,
        ["Length"] = 684,
        ["Artist"] = "Main Title",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_a.mp3",
        ["Id"] = 3853182,
        ["Length"] = 155,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Ambient A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_ambient_a.mp3",
        ["Id"] = 3853184,
        ["Length"] = 59,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Ambient B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_ambient_b.mp3",
        ["Id"] = 3853186,
        ["Length"] = 106,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Ambient C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_ambient_c.mp3",
        ["Id"] = 3853188,
        ["Length"] = 107,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Ambient D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_ambient_d.mp3",
        ["Id"] = 3853190,
        ["Length"] = 82,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Ambient H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_ambient_h.mp3",
        ["Id"] = 3853192,
        ["Length"] = 135,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_b.mp3",
        ["Id"] = 3853194,
        ["Length"] = 130,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_c.mp3",
        ["Id"] = 3853196,
        ["Length"] = 99,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Dark A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_dark_a.mp3",
        ["Id"] = 3853198,
        ["Length"] = 92,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Dark B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_dark_b.mp3",
        ["Id"] = 3853200,
        ["Length"] = 103,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Dark C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_dark_c.mp3",
        ["Id"] = 3853202,
        ["Length"] = 136,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Dark D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_dark_d.mp3",
        ["Id"] = 3853204,
        ["Length"] = 78,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Dark Domination",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_dark_domination.mp3",
        ["Id"] = 3857085,
        ["Length"] = 140,
        ["Artist"] = "David Arkenstone, Neal Acree, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Dark H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_dark_h.mp3",
        ["Id"] = 3853206,
        ["Length"] = 156,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Dark Sting A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_dark_sting_a.mp3",
        ["Id"] = 3853208,
        ["Length"] = 25,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Dark Sting B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_dark_sting_b.mp3",
        ["Id"] = 3853210,
        ["Length"] = 21,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Desolate A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_desolate_a.mp3",
        ["Id"] = 3853212,
        ["Length"] = 112,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Desolate B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_desolate_b.mp3",
        ["Id"] = 3853214,
        ["Length"] = 94,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Desolate C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_desolate_c.mp3",
        ["Id"] = 3853216,
        ["Length"] = 97,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Desolate D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_desolate_d.mp3",
        ["Id"] = 3853218,
        ["Length"] = 71,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Desolate E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_desolate_e.mp3",
        ["Id"] = 3853220,
        ["Length"] = 94,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Desolate H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_desolate_h.mp3",
        ["Id"] = 3853222,
        ["Length"] = 150,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Desolate Sting A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_desolate_sting_a.mp3",
        ["Id"] = 3853224,
        ["Length"] = 21,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Desolate Sting B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_desolate_sting_b.mp3",
        ["Id"] = 3853226,
        ["Length"] = 20,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Desolate Sting C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_desolate_sting_c.mp3",
        ["Id"] = 3853228,
        ["Length"] = 28,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion Desolate Sting D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_desolate_sting_d.mp3",
        ["Id"] = 3853230,
        ["Length"] = 21,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Oblivion H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_h.mp3",
        ["Id"] = 3853232,
        ["Length"] = 215,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_a.mp3",
        ["Id"] = 3853234,
        ["Length"] = 99,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_b.mp3",
        ["Id"] = 3853236,
        ["Length"] = 89,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_c.mp3",
        ["Id"] = 3853238,
        ["Length"] = 62,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_d.mp3",
        ["Id"] = 3853240,
        ["Length"] = 37,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_e.mp3",
        ["Id"] = 3853242,
        ["Length"] = 75,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_f.mp3",
        ["Id"] = 3853244,
        ["Length"] = 159,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_h.mp3",
        ["Id"] = 3853246,
        ["Length"] = 159,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth Lullaby A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_lullaby_a.mp3",
        ["Id"] = 3853258,
        ["Length"] = 83,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth Lullaby B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_lullaby_b.mp3",
        ["Id"] = 3853260,
        ["Length"] = 110,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth Lullaby C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_lullaby_c.mp3",
        ["Id"] = 3853262,
        ["Length"] = 108,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth Lullaby D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_lullaby_d.mp3",
        ["Id"] = 3885784,
        ["Length"] = 99,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth Lullaby H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_lullaby_h.mp3",
        ["Id"] = 3885786,
        ["Length"] = 168,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth Lullaby Relaxed D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_lullaby_relaxed_d.mp3",
        ["Id"] = 3885434,
        ["Length"] = 71,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth Lullaby Sting A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_lullaby_sting_a.mp3",
        ["Id"] = 3853264,
        ["Length"] = 21,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth Lullaby Sting B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_lullaby_sting_b.mp3",
        ["Id"] = 3853266,
        ["Length"] = 19,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth Lullaby Sting C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_lullaby_sting_c.mp3",
        ["Id"] = 3853268,
        ["Length"] = 21,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth Lullabyrelaxed",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_lullabyrelaxed.mp3",
        ["Id"] = 3853248,
        ["Length"] = 71,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth Lullabyrelaxed A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_lullabyrelaxed_a.mp3",
        ["Id"] = 3853250,
        ["Length"] = 71,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth Lullabyrelaxed B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_lullabyrelaxed_b.mp3",
        ["Id"] = 3853252,
        ["Length"] = 79,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth Lullabyrelaxed C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_lullabyrelaxed_c.mp3",
        ["Id"] = 3853254,
        ["Length"] = 82,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Choice Rebirth Lullabyrelaxed H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_lullabyrelaxed_h.mp3",
        ["Id"] = 3853256,
        ["Length"] = 99,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Bwonsamdi Zg A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_bwonsamdi_zg_a.mp3",
        ["Id"] = 3885798,
        ["Length"] = 90,
        ["Artist"] = "Sam Cardon, Derek Duke",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Bwonsamdi Zg B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_bwonsamdi_zg_b.mp3",
        ["Id"] = 3885800,
        ["Length"] = 77,
        ["Artist"] = "Sam Cardon, Derek Duke",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Bwonsamdi Zg C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_bwonsamdi_zg_c.mp3",
        ["Id"] = 3885802,
        ["Length"] = 71,
        ["Artist"] = "Sam Cardon, Derek Duke",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Bwonsamdi Zg Combat A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_bwonsamdi_zg_combat_a.mp3",
        ["Id"] = 3885804,
        ["Length"] = 87,
        ["Artist"] = "Sam Cardon, Derek Duke",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Bwonsamdi Zg Combat B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_bwonsamdi_zg_combat_b.mp3",
        ["Id"] = 3885806,
        ["Length"] = 108,
        ["Artist"] = "Sam Cardon, Derek Duke",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Maintheme Aw A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_maintheme_aw_a.mp3",
        ["Id"] = 3885808,
        ["Length"] = 114,
        ["Artist"] = "Sam Cardon, Glenn Stafford, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Maintheme Aw B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_maintheme_aw_b.mp3",
        ["Id"] = 3885810,
        ["Length"] = 110,
        ["Artist"] = "Sam Cardon, Glenn Stafford, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Maintheme Aw C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_maintheme_aw_c.mp3",
        ["Id"] = 3885812,
        ["Length"] = 105,
        ["Artist"] = "Sam Cardon, Glenn Stafford, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Maintheme Post Aw D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_maintheme_post_aw_d.mp3",
        ["Id"] = 3885814,
        ["Length"] = 91,
        ["Artist"] = "Sam Cardon, Glenn Stafford, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Maintheme Pre Aw D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_maintheme_pre_aw_d.mp3",
        ["Id"] = 3885816,
        ["Length"] = 91,
        ["Artist"] = "Sam Cardon, Glenn Stafford, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Muehzala A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_muehzala_a.mp3",
        ["Id"] = 3853270,
        ["Length"] = 144,
        ["Artist"] = "Sam Cardon",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Muehzala B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_muehzala_b.mp3",
        ["Id"] = 3853272,
        ["Length"] = 94,
        ["Artist"] = "Sam Cardon",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Muehzala C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_muehzala_c.mp3",
        ["Id"] = 3853274,
        ["Length"] = 94,
        ["Artist"] = "Sam Cardon",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Muehzala D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_muehzala_d.mp3",
        ["Id"] = 3853276,
        ["Length"] = 134,
        ["Artist"] = "Sam Cardon",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Muehzala E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_muehzala_e.mp3",
        ["Id"] = 3853278,
        ["Length"] = 106,
        ["Artist"] = "Sam Cardon",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Muehzala H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_muehzala_h.mp3",
        ["Id"] = 3853280,
        ["Length"] = 136,
        ["Artist"] = "Sam Cardon",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Shadra Mg A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_shadra_mg_a.mp3",
        ["Id"] = 3885788,
        ["Length"] = 117,
        ["Artist"] = "Sam Cardon, Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Shadra Mg B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_shadra_mg_b.mp3",
        ["Id"] = 3885790,
        ["Length"] = 101,
        ["Artist"] = "Sam Cardon, Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Shadra Mg C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_shadra_mg_c.mp3",
        ["Id"] = 3885792,
        ["Length"] = 88,
        ["Artist"] = "Sam Cardon, Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Shadra Mg Combat A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_shadra_mg_combat_a.mp3",
        ["Id"] = 3885794,
        ["Length"] = 107,
        ["Artist"] = "Sam Cardon, Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Loa Shadra Mg Combat B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_shadra_mg_combat_b.mp3",
        ["Id"] = 3885796,
        ["Length"] = 103,
        ["Artist"] = "Sam Cardon, Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nightfae A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nightfae_a.mp3",
        ["Id"] = 3853282,
        ["Length"] = 114,
        ["Artist"] = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nightfae B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nightfae_b.mp3",
        ["Id"] = 3853284,
        ["Length"] = 119,
        ["Artist"] = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nightfae C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nightfae_c.mp3",
        ["Id"] = 3853286,
        ["Length"] = 130,
        ["Artist"] = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nightfae D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nightfae_d.mp3",
        ["Id"] = 3853288,
        ["Length"] = 123,
        ["Artist"] = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nightfae F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nightfae_f.mp3",
        ["Id"] = 3853290,
        ["Length"] = 101,
        ["Artist"] = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nightfae G",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nightfae_g.mp3",
        ["Id"] = 3853292,
        ["Length"] = 96,
        ["Artist"] = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nightfae H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nightfae_h.mp3",
        ["Id"] = 3853294,
        ["Length"] = 171,
        ["Artist"] = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nightfae I",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nightfae_i.mp3",
        ["Id"] = 3853296,
        ["Length"] = 122,
        ["Artist"] = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nightfae Intro A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nightfae_intro_a.mp3",
        ["Id"] = 3853298,
        ["Length"] = 62,
        ["Artist"] = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nightfae Intro B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nightfae_intro_b.mp3",
        ["Id"] = 3853300,
        ["Length"] = 62,
        ["Artist"] = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nightfae Intro C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nightfae_intro_c.mp3",
        ["Id"] = 3853302,
        ["Length"] = 62,
        ["Artist"] = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nightfae J",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nightfae_j.mp3",
        ["Id"] = 3853304,
        ["Length"] = 126,
        ["Artist"] = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nightfae K",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nightfae_k.mp3",
        ["Id"] = 3853306,
        ["Length"] = 145,
        ["Artist"] = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nightfae L",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nightfae_l.mp3",
        ["Id"] = 3853308,
        ["Length"] = 103,
        ["Artist"] = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nightfae M",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nightfae_m.mp3",
        ["Id"] = 3853310,
        ["Length"] = 132,
        ["Artist"] = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Celestial A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_celestial_a.mp3",
        ["Id"] = 3853312,
        ["Length"] = 122,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Celestial B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_celestial_b.mp3",
        ["Id"] = 3853314,
        ["Length"] = 122,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Celestial C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_celestial_c.mp3",
        ["Id"] = 3853316,
        ["Length"] = 132,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Celestial D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_celestial_d.mp3",
        ["Id"] = 3853318,
        ["Length"] = 132,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Celestial E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_celestial_e.mp3",
        ["Id"] = 3853320,
        ["Length"] = 118,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Celestial H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_celestial_h.mp3",
        ["Id"] = 3853322,
        ["Length"] = 122,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Celestial Harp A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_celestial_harp_a.mp3",
        ["Id"] = 3885818,
        ["Length"] = 29,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Celestial Harp B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_celestial_harp_b.mp3",
        ["Id"] = 3885820,
        ["Length"] = 24,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Celestial Harp C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_celestial_harp_c.mp3",
        ["Id"] = 3885822,
        ["Length"] = 27,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Celestial Harp D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_celestial_harp_d.mp3",
        ["Id"] = 3885824,
        ["Length"] = 30,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Celestial I",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_celestial_i.mp3",
        ["Id"] = 3853324,
        ["Length"] = 103,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Celestial J",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_celestial_j.mp3",
        ["Id"] = 3853326,
        ["Length"] = 125,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Celestial K",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_celestial_k.mp3",
        ["Id"] = 3853328,
        ["Length"] = 113,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Celestial L",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_celestial_l.mp3",
        ["Id"] = 3853330,
        ["Length"] = 113,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Celestial M",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_celestial_m.mp3",
        ["Id"] = 3853332,
        ["Length"] = 125,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Devious A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_devious_a.mp3",
        ["Id"] = 3853334,
        ["Length"] = 123,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Devious B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_devious_b.mp3",
        ["Id"] = 3853336,
        ["Length"] = 89,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Devious C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_devious_c.mp3",
        ["Id"] = 3853338,
        ["Length"] = 68,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Devious D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_devious_d.mp3",
        ["Id"] = 3853340,
        ["Length"] = 88,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Devious Domination",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_devious_domination.mp3",
        ["Id"] = 3857087,
        ["Length"] = 94,
        ["Artist"] = "David Arkenstone, Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Devious E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_devious_e.mp3",
        ["Id"] = 3853342,
        ["Length"] = 95,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Devious F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_devious_f.mp3",
        ["Id"] = 3853344,
        ["Length"] = 78,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Devious G",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_devious_g.mp3",
        ["Id"] = 3853346,
        ["Length"] = 95,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Devious H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_devious_h.mp3",
        ["Id"] = 3853348,
        ["Length"] = 123,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Devious Sting A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_devious_sting_a.mp3",
        ["Id"] = 3853350,
        ["Length"] = 17,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Devious Sting B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_devious_sting_b.mp3",
        ["Id"] = 3853352,
        ["Length"] = 18,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Flute Sting A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_flute_sting_a.mp3",
        ["Id"] = 3885407,
        ["Length"] = 12,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Flute Sting B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_flute_sting_b.mp3",
        ["Id"] = 3885409,
        ["Length"] = 11,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Flute Sting C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_flute_sting_c.mp3",
        ["Id"] = 3885411,
        ["Length"] = 10,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Flute Sting D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_flute_sting_d.mp3",
        ["Id"] = 3885413,
        ["Length"] = 11,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Flute Sting E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_flute_sting_e.mp3",
        ["Id"] = 3885415,
        ["Length"] = 11,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Flute Sting F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_flute_sting_f.mp3",
        ["Id"] = 3885417,
        ["Length"] = 11,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Flute Sting G",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_flute_sting_g.mp3",
        ["Id"] = 3885419,
        ["Length"] = 11,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Hollow A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hollow_a.mp3",
        ["Id"] = 3853354,
        ["Length"] = 160,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Hollow B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hollow_b.mp3",
        ["Id"] = 3853356,
        ["Length"] = 158,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Hollow C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hollow_c.mp3",
        ["Id"] = 3853358,
        ["Length"] = 158,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Hollow D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hollow_d.mp3",
        ["Id"] = 3853360,
        ["Length"] = 156,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Hollow E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hollow_e.mp3",
        ["Id"] = 3853362,
        ["Length"] = 156,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Hollow H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hollow_h.mp3",
        ["Id"] = 3853364,
        ["Length"] = 156,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Hunger A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hunger_a.mp3",
        ["Id"] = 3853366,
        ["Length"] = 135,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Hunger B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hunger_b.mp3",
        ["Id"] = 3853368,
        ["Length"] = 88,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Hunger C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hunger_c.mp3",
        ["Id"] = 3853370,
        ["Length"] = 75,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Hunger Domination",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hunger_domination.mp3",
        ["Id"] = 3857089,
        ["Length"] = 96,
        ["Artist"] = "David Arkenstone, Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Hunger H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hunger_h.mp3",
        ["Id"] = 3853376,
        ["Length"] = 137,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Hunger Sting A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hunger_sting_a.mp3",
        ["Id"] = 3885436,
        ["Length"] = 19,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Hunger Sting B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hunger_sting_b.mp3",
        ["Id"] = 3885438,
        ["Length"] = 20,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Melancholy Dream A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_melancholy_dream_a.mp3",
        ["Id"] = 3853378,
        ["Length"] = 143,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Melancholy Dream B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_melancholy_dream_b.mp3",
        ["Id"] = 3853380,
        ["Length"] = 143,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Melancholy Dream C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_melancholy_dream_c.mp3",
        ["Id"] = 3853382,
        ["Length"] = 122,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Melancholy Dream D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_melancholy_dream_d.mp3",
        ["Id"] = 3853384,
        ["Length"] = 122,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Melancholy Dream E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_melancholy_dream_e.mp3",
        ["Id"] = 3853386,
        ["Length"] = 131,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Melancholy Dream F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_melancholy_dream_f.mp3",
        ["Id"] = 3853388,
        ["Length"] = 133,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Melancholy Dream H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_melancholy_dream_h.mp3",
        ["Id"] = 3853390,
        ["Length"] = 122,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Melancholy Dream Harp A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_melancholy_dream_harp_a.mp3",
        ["Id"] = 3885826,
        ["Length"] = 34,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Melancholy Dream Harp B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_melancholy_dream_harp_b.mp3",
        ["Id"] = 3885828,
        ["Length"] = 45,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Melancholy Dream Harp C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_melancholy_dream_harp_c.mp3",
        ["Id"] = 3885830,
        ["Length"] = 45,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Melancholy Dream I",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_melancholy_dream_i.mp3",
        ["Id"] = 3853392,
        ["Length"] = 122,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Melancholy Dream K",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_melancholy_dream_k.mp3",
        ["Id"] = 3853394,
        ["Length"] = 109,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Melancholy Dream L",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_melancholy_dream_l.mp3",
        ["Id"] = 3853396,
        ["Length"] = 78,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Melancholy Dream M",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_melancholy_dream_m.mp3",
        ["Id"] = 3853398,
        ["Length"] = 102,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Mischief A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_mischief_a.mp3",
        ["Id"] = 3853400,
        ["Length"] = 95,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Mischief B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_mischief_b.mp3",
        ["Id"] = 3853402,
        ["Length"] = 80,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Mischief C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_mischief_c.mp3",
        ["Id"] = 3853404,
        ["Length"] = 83,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Mischief H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_mischief_h.mp3",
        ["Id"] = 3853406,
        ["Length"] = 117,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Mischief Harploop",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_mischief_harploop.mp3",
        ["Id"] = 3853408,
        ["Length"] = 27,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Mischief Harpsting",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_mischief_harpsting.mp3",
        ["Id"] = 3853410,
        ["Length"] = 9,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Nocturne Mischief Mushroomring",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_mischief_mushroomring.mp3",
        ["Id"] = 3857091,
        ["Length"] = 94,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Soulsofdarnassus",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_soulsofdarnassus.mp3",
        ["Id"] = 3930256,
        ["Length"] = 127,
        ["Artist"] = "Jake Lefkowitz, Jason Hayes",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Thedreamer A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_thedreamer_a.mp3",
        ["Id"] = 3930252,
        ["Length"] = 106,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Thedreamer B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_thedreamer_b.mp3",
        ["Id"] = 3930254,
        ["Length"] = 79,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Thedreamer Procession A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_thedreamer_procession_a.mp3",
        ["Id"] = 3930258,
        ["Length"] = 179,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aw Thedreamer Procession B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_thedreamer_procession_b.mp3",
        ["Id"] = 3930260,
        ["Length"] = 40,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_a.mp3",
        ["Id"] = 3853412,
        ["Length"] = 169,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney Arenastart A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_arenastart_a.mp3",
        ["Id"] = 3853414,
        ["Length"] = 30,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney Arenastart B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_arenastart_b.mp3",
        ["Id"] = 3853416,
        ["Length"] = 28,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney Arenastart C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_arenastart_c.mp3",
        ["Id"] = 3853418,
        ["Length"] = 43,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_b.mp3",
        ["Id"] = 3853420,
        ["Length"] = 166,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_c.mp3",
        ["Id"] = 3853422,
        ["Length"] = 85,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney Combat A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_combat_a.mp3",
        ["Id"] = 3853424,
        ["Length"] = 107,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney Combat B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_combat_b.mp3",
        ["Id"] = 3853426,
        ["Length"] = 90,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney Combat C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_combat_c.mp3",
        ["Id"] = 3853428,
        ["Length"] = 80,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_d.mp3",
        ["Id"] = 3853430,
        ["Length"] = 87,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney Doubt A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_doubt_a.mp3",
        ["Id"] = 3853432,
        ["Length"] = 114,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney Doubt B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_doubt_b.mp3",
        ["Id"] = 3853434,
        ["Length"] = 111,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney Doubt C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_doubt_c.mp3",
        ["Id"] = 3853436,
        ["Length"] = 115,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney Doubt D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_doubt_d.mp3",
        ["Id"] = 3853438,
        ["Length"] = 59,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney Doubt Domination",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_doubt_domination.mp3",
        ["Id"] = 3857093,
        ["Length"] = 114,
        ["Artist"] = "Glenn Stafford, Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney Doubt H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_doubt_h.mp3",
        ["Id"] = 3853440,
        ["Length"] = 118,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_e.mp3",
        ["Id"] = 3853442,
        ["Length"] = 77,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_f.mp3",
        ["Id"] = 3853444,
        ["Length"] = 73,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney G",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_g.mp3",
        ["Id"] = 3853446,
        ["Length"] = 104,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney I",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_i.mp3",
        ["Id"] = 3853448,
        ["Length"] = 94,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney J",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_j.mp3",
        ["Id"] = 3853450,
        ["Length"] = 95,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney Sting A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_sting_a.mp3",
        ["Id"] = 3853452,
        ["Length"] = 13,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Aspirantsjourney Sting B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_sting_b.mp3",
        ["Id"] = 3853454,
        ["Length"] = 11,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Kyrian A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_kyrian_a.mp3",
        ["Id"] = 3853456,
        ["Length"] = 149,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Kyrian B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_kyrian_b.mp3",
        ["Id"] = 3853458,
        ["Length"] = 149,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Kyrian C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_kyrian_c.mp3",
        ["Id"] = 3853460,
        ["Length"] = 121,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Kyrian D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_kyrian_d.mp3",
        ["Id"] = 3853462,
        ["Length"] = 128,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Kyrian E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_kyrian_e.mp3",
        ["Id"] = 3853464,
        ["Length"] = 136,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Kyrian F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_kyrian_f.mp3",
        ["Id"] = 3853466,
        ["Length"] = 135,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Kyrian G",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_kyrian_g.mp3",
        ["Id"] = 3853468,
        ["Length"] = 109,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Kyrian H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_kyrian_h.mp3",
        ["Id"] = 3853470,
        ["Length"] = 239,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Kyrian I",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_kyrian_i.mp3",
        ["Id"] = 3853472,
        ["Length"] = 152,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Kyrian Intro A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_kyrian_intro_a.mp3",
        ["Id"] = 3853474,
        ["Length"] = 74,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Kyrian Intro B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_kyrian_intro_b.mp3",
        ["Id"] = 3853476,
        ["Length"] = 74,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Kyrian Intro C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_kyrian_intro_c.mp3",
        ["Id"] = 3853478,
        ["Length"] = 72,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Kyrian J",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_kyrian_j.mp3",
        ["Id"] = 3853480,
        ["Length"] = 116,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Kyrian K",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_kyrian_k.mp3",
        ["Id"] = 3853482,
        ["Length"] = 106,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Kyrian L",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_kyrian_l.mp3",
        ["Id"] = 3853550,
        ["Length"] = 133,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Kyrian M",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_kyrian_m.mp3",
        ["Id"] = 3853484,
        ["Length"] = 92,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Steward Hootndoot Arr A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_steward_hootndoot_arr_a.mp3",
        ["Id"] = 3885331,
        ["Length"] = 10,
        ["Artist"] = "Jake Lefkowitz, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Steward Hootndoot Mel A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_steward_hootndoot_mel_a.mp3",
        ["Id"] = 3885333,
        ["Length"] = 28,
        ["Artist"] = "Jake Lefkowitz, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Steward Hootndoot Mel Arr A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_steward_hootndoot_mel_arr_a.mp3",
        ["Id"] = 3885335,
        ["Length"] = 10,
        ["Artist"] = "Jake Lefkowitz, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Steward Hootndoot Mel B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_steward_hootndoot_mel_b.mp3",
        ["Id"] = 3885337,
        ["Length"] = 21,
        ["Artist"] = "Jake Lefkowitz, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Steward Hootndoot Mel C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_steward_hootndoot_mel_c.mp3",
        ["Id"] = 3885339,
        ["Length"] = 19,
        ["Artist"] = "Jake Lefkowitz, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Steward Hootndoot Solo A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_steward_hootndoot_solo_a.mp3",
        ["Id"] = 3885341,
        ["Length"] = 17,
        ["Artist"] = "Jake Lefkowitz, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Steward Hootndoot Solo B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_steward_hootndoot_solo_b.mp3",
        ["Id"] = 3885343,
        ["Length"] = 14,
        ["Artist"] = "Jake Lefkowitz, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Steward Hootndoot Solo C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_steward_hootndoot_solo_c.mp3",
        ["Id"] = 3885345,
        ["Length"] = 14,
        ["Artist"] = "Jake Lefkowitz, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Steward Hootndoot Solo D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_steward_hootndoot_solo_d.mp3",
        ["Id"] = 3885347,
        ["Length"] = 18,
        ["Artist"] = "Jake Lefkowitz, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Steward Hootndoot Solo E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_steward_hootndoot_solo_e.mp3",
        ["Id"] = 3885349,
        ["Length"] = 18,
        ["Artist"] = "Jake Lefkowitz, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Steward Hootndoot Solo F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_steward_hootndoot_solo_f.mp3",
        ["Id"] = 3885351,
        ["Length"] = 17,
        ["Artist"] = "Jake Lefkowitz, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_a.mp3",
        ["Id"] = 3853486,
        ["Length"] = 125,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_b.mp3",
        ["Id"] = 3853488,
        ["Length"] = 111,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_c.mp3",
        ["Id"] = 3853490,
        ["Length"] = 66,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_d.mp3",
        ["Id"] = 3853492,
        ["Length"] = 56,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian Domination",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_domination.mp3",
        ["Id"] = 3857095,
        ["Length"] = 77,
        ["Artist"] = "Glenn Stafford, Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian Doubt A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_doubt_a.mp3",
        ["Id"] = 3853494,
        ["Length"] = 46,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian Doubt B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_doubt_b.mp3",
        ["Id"] = 3853496,
        ["Length"] = 43,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian Doubt C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_doubt_c.mp3",
        ["Id"] = 3853498,
        ["Length"] = 57,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian Doubt D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_doubt_d.mp3",
        ["Id"] = 3853500,
        ["Length"] = 76,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian Doubt E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_doubt_e.mp3",
        ["Id"] = 3853502,
        ["Length"] = 74,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian Doubt F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_doubt_f.mp3",
        ["Id"] = 3853504,
        ["Length"] = 75,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian Doubt G",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_doubt_g.mp3",
        ["Id"] = 3853506,
        ["Length"] = 43,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian Doubt H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_doubt_h.mp3",
        ["Id"] = 3853508,
        ["Length"] = 194,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian Doubt I",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_doubt_i.mp3",
        ["Id"] = 3853510,
        ["Length"] = 47,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian Doubt J",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_doubt_j.mp3",
        ["Id"] = 3853512,
        ["Length"] = 48,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian Doubt K",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_doubt_k.mp3",
        ["Id"] = 3853514,
        ["Length"] = 56,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian Doubt Sting A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_doubt_sting_a.mp3",
        ["Id"] = 3853516,
        ["Length"] = 11,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian Doubt Sting B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_doubt_sting_b.mp3",
        ["Id"] = 3853518,
        ["Length"] = 11,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian Doubt Sting C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_doubt_sting_c.mp3",
        ["Id"] = 3853520,
        ["Length"] = 13,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_e.mp3",
        ["Id"] = 3853522,
        ["Length"] = 113,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_f.mp3",
        ["Id"] = 3853524,
        ["Length"] = 136,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian G",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_g.mp3",
        ["Id"] = 3853526,
        ["Length"] = 109,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_h.mp3",
        ["Id"] = 3853528,
        ["Length"] = 366,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian I",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_i.mp3",
        ["Id"] = 3853530,
        ["Length"] = 118,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian J",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_j.mp3",
        ["Id"] = 3853532,
        ["Length"] = 121,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian O",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_o.mp3",
        ["Id"] = 3853534,
        ["Length"] = 137,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian P",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_p.mp3",
        ["Id"] = 3853536,
        ["Length"] = 99,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian Q",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_q.mp3",
        ["Id"] = 3853538,
        ["Length"] = 98,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian R",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_r.mp3",
        ["Id"] = 3853540,
        ["Length"] = 111,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian Sting K",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_sting_k.mp3",
        ["Id"] = 3853542,
        ["Length"] = 28,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian Sting L",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_sting_l.mp3",
        ["Id"] = 3853544,
        ["Length"] = 23,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian Sting M",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_sting_m.mp3",
        ["Id"] = 3853546,
        ["Length"] = 13,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Ba Tobekyrian Sting N",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_tobekyrian_sting_n.mp3",
        ["Id"] = 3853548,
        ["Length"] = 27,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Hopeabandoned A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_hopeabandoned_a.mp3",
        ["Id"] = 3853552,
        ["Length"] = 144,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Hopeabandoned B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_hopeabandoned_b.mp3",
        ["Id"] = 3853554,
        ["Length"] = 124,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Hopeabandoned C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_hopeabandoned_c.mp3",
        ["Id"] = 3853556,
        ["Length"] = 120,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Hopeabandoned D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_hopeabandoned_d.mp3",
        ["Id"] = 3853558,
        ["Length"] = 136,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Hopeabandoned Domination",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_hopeabandoned_domination.mp3",
        ["Id"] = 3885313,
        ["Length"] = 136,
        ["Artist"] = "Grant Kirkhope, Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Hopeabandoned E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_hopeabandoned_e.mp3",
        ["Id"] = 3853560,
        ["Length"] = 140,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Hopeabandoned F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_hopeabandoned_f.mp3",
        ["Id"] = 3853562,
        ["Length"] = 92,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Hopeabandoned H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_hopeabandoned_h.mp3",
        ["Id"] = 3853564,
        ["Length"] = 140,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Themaw Ambient A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_themaw_ambient_a.mp3",
        ["Id"] = 3919997,
        ["Length"] = 121,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Themaw Ambient B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_themaw_ambient_b.mp3",
        ["Id"] = 3919999,
        ["Length"] = 124,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Themaw Ambient C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_themaw_ambient_c.mp3",
        ["Id"] = 3920001,
        ["Length"] = 126,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Themaw Ambient D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_themaw_ambient_d.mp3",
        ["Id"] = 3920003,
        ["Length"] = 116,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Themaw Ambient E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_themaw_ambient_e.mp3",
        ["Id"] = 3920005,
        ["Length"] = 114,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Themaw Ambient F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_themaw_ambient_f.mp3",
        ["Id"] = 3920007,
        ["Length"] = 118,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Action A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_action_a.mp3",
        ["Id"] = 3853566,
        ["Length"] = 129,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Action B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_action_b.mp3",
        ["Id"] = 3853568,
        ["Length"] = 106,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Action C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_action_c.mp3",
        ["Id"] = 3853570,
        ["Length"] = 126,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Action D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_action_d.mp3",
        ["Id"] = 3853572,
        ["Length"] = 122,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Action E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_action_e.mp3",
        ["Id"] = 3853574,
        ["Length"] = 86,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Action H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_action_h.mp3",
        ["Id"] = 3853576,
        ["Length"] = 129,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Ambient A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_ambient_a.mp3",
        ["Id"] = 3853578,
        ["Length"] = 77,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Ambient B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_ambient_b.mp3",
        ["Id"] = 3853580,
        ["Length"] = 67,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Ambient C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_ambient_c.mp3",
        ["Id"] = 3853582,
        ["Length"] = 73,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Ambient D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_ambient_d.mp3",
        ["Id"] = 3853584,
        ["Length"] = 79,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Ambient E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_ambient_e.mp3",
        ["Id"] = 3853586,
        ["Length"] = 72,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Ambient F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_ambient_f.mp3",
        ["Id"] = 3853588,
        ["Length"] = 74,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Ambient G",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_ambient_g.mp3",
        ["Id"] = 3853590,
        ["Length"] = 79,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Ambient H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_ambient_h.mp3",
        ["Id"] = 3853592,
        ["Length"] = 77,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Ambient I",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_ambient_i.mp3",
        ["Id"] = 3853594,
        ["Length"] = 71,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Ambient J",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_ambient_j.mp3",
        ["Id"] = 3931036,
        ["Length"] = 115,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Ambient K",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_ambient_k.mp3",
        ["Id"] = 3931038,
        ["Length"] = 102,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Ambient L",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_ambient_l.mp3",
        ["Id"] = 3931040,
        ["Length"] = 89,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Ambient M",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_ambient_m.mp3",
        ["Id"] = 3931042,
        ["Length"] = 94,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Ambient N",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_ambient_n.mp3",
        ["Id"] = 3931044,
        ["Length"] = 104,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Maw Torghast Tarragrue Sting",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_maw_torghast_tarragrue_sting.mp3",
        ["Id"] = 3885440,
        ["Length"] = 36,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_a.mp3",
        ["Id"] = 3853596,
        ["Length"] = 45,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield Ambient A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_ambient_a.mp3",
        ["Id"] = 3853598,
        ["Length"] = 171,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield Ambient B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_ambient_b.mp3",
        ["Id"] = 3853600,
        ["Length"] = 105,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield Ambient C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_ambient_c.mp3",
        ["Id"] = 3853602,
        ["Length"] = 145,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield Ambient D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_ambient_d.mp3",
        ["Id"] = 3853604,
        ["Length"] = 101,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield Ambient E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_ambient_e.mp3",
        ["Id"] = 3853606,
        ["Length"] = 96,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield Ambient F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_ambient_f.mp3",
        ["Id"] = 3853608,
        ["Length"] = 113,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield Ambient G",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_ambient_g.mp3",
        ["Id"] = 3853610,
        ["Length"] = 125,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield Ambient H1",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_ambient_h1.mp3",
        ["Id"] = 3853614,
        ["Length"] = 171,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield Ambient H2",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_ambient_h2.mp3",
        ["Id"] = 3853616,
        ["Length"] = 171,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield Ambient H3",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_ambient_h3.mp3",
        ["Id"] = 3853618,
        ["Length"] = 171,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield Ambient I",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_ambient_i.mp3",
        ["Id"] = 3885442,
        ["Length"] = 63,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_b.mp3",
        ["Id"] = 3853620,
        ["Length"] = 73,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_c.mp3",
        ["Id"] = 3853622,
        ["Length"] = 56,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_d.mp3",
        ["Id"] = 3853624,
        ["Length"] = 106,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_e.mp3",
        ["Id"] = 3853626,
        ["Length"] = 83,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_f.mp3",
        ["Id"] = 3853628,
        ["Length"] = 93,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield G",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_g.mp3",
        ["Id"] = 3853630,
        ["Length"] = 75,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield H1",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_h1.mp3",
        ["Id"] = 3853632,
        ["Length"] = 209,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield H2",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_h2.mp3",
        ["Id"] = 3853634,
        ["Length"] = 212,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield I",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_i.mp3",
        ["Id"] = 3892768,
        ["Length"] = 105,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield J",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_j.mp3",
        ["Id"] = 3892770,
        ["Length"] = 88,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield K",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_k.mp3",
        ["Id"] = 3892772,
        ["Length"] = 121,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield Plaguesb",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_plaguesb.mp3",
        ["Id"] = 3892774,
        ["Length"] = 96,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield Plaguesc",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_plaguesc.mp3",
        ["Id"] = 3892776,
        ["Length"] = 101,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield Spiderstinga",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_spiderstinga.mp3",
        ["Id"] = 3892778,
        ["Length"] = 11,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield Spiderstingb",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_spiderstingb.mp3",
        ["Id"] = 3892780,
        ["Length"] = 10,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Deathisabattlefield Stinga",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_deathisabattlefield_stinga.mp3",
        ["Id"] = 3892782,
        ["Length"] = 12,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Necrolord A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_necrolord_a.mp3",
        ["Id"] = 3853636,
        ["Length"] = 133,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Necrolord B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_necrolord_b.mp3",
        ["Id"] = 3853638,
        ["Length"] = 132,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Necrolord C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_necrolord_c.mp3",
        ["Id"] = 3853640,
        ["Length"] = 112,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Necrolord D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_necrolord_d.mp3",
        ["Id"] = 3853642,
        ["Length"] = 117,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Necrolord E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_necrolord_e.mp3",
        ["Id"] = 3853644,
        ["Length"] = 94,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Necrolord F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_necrolord_f.mp3",
        ["Id"] = 3853646,
        ["Length"] = 122,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Necrolord G",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_necrolord_g.mp3",
        ["Id"] = 3853648,
        ["Length"] = 125,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Necrolord H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_necrolord_h.mp3",
        ["Id"] = 3853650,
        ["Length"] = 232,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Necrolord I",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_necrolord_i.mp3",
        ["Id"] = 3853652,
        ["Length"] = 121,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Necrolord Intro A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_necrolord_intro_a.mp3",
        ["Id"] = 3853654,
        ["Length"] = 73,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Necrolord Intro B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_necrolord_intro_b.mp3",
        ["Id"] = 3853656,
        ["Length"] = 72,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Necrolord Intro C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_necrolord_intro_c.mp3",
        ["Id"] = 3853658,
        ["Length"] = 73,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Necrolord J",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_necrolord_j.mp3",
        ["Id"] = 3853660,
        ["Length"] = 115,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Necrolord K",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_necrolord_k.mp3",
        ["Id"] = 3853662,
        ["Length"] = 122,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Necrolord L",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_necrolord_l.mp3",
        ["Id"] = 3853722,
        ["Length"] = 128,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_a.mp3",
        ["Id"] = 3853664,
        ["Length"] = 67,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_b.mp3",
        ["Id"] = 3853666,
        ["Length"] = 24,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_c.mp3",
        ["Id"] = 3853668,
        ["Length"] = 38,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_d.mp3",
        ["Id"] = 3853670,
        ["Length"] = 38,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus Domination",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_domination.mp3",
        ["Id"] = 3857097,
        ["Length"] = 69,
        ["Artist"] = "Glenn Stafford, Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_e.mp3",
        ["Id"] = 3853672,
        ["Length"] = 39,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_f.mp3",
        ["Id"] = 3853674,
        ["Length"] = 66,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus G",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_g.mp3",
        ["Id"] = 3853676,
        ["Length"] = 23,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_h.mp3",
        ["Id"] = 3853678,
        ["Length"] = 166,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus Hero A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_hero_a.mp3",
        ["Id"] = 3853680,
        ["Length"] = 110,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus Hero B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_hero_b.mp3",
        ["Id"] = 3853682,
        ["Length"] = 107,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus Hero C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_hero_c.mp3",
        ["Id"] = 3853684,
        ["Length"] = 116,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus Hero D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_hero_d.mp3",
        ["Id"] = 3853686,
        ["Length"] = 124,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus Hero H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_hero_h.mp3",
        ["Id"] = 3853688,
        ["Length"] = 133,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus L",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_l.mp3",
        ["Id"] = 3853694,
        ["Length"] = 66,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus M",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_m.mp3",
        ["Id"] = 3853696,
        ["Length"] = 102,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus Paranoid A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_paranoid_a.mp3",
        ["Id"] = 3853698,
        ["Length"] = 49,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus Paranoid B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_paranoid_b.mp3",
        ["Id"] = 3853700,
        ["Length"] = 58,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus Paranoid C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_paranoid_c.mp3",
        ["Id"] = 3853702,
        ["Length"] = 35,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus Paranoid D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_paranoid_d.mp3",
        ["Id"] = 3853704,
        ["Length"] = 51,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus Paranoid E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_paranoid_e.mp3",
        ["Id"] = 3853706,
        ["Length"] = 53,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus Paranoid F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_paranoid_f.mp3",
        ["Id"] = 3853708,
        ["Length"] = 101,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus Paranoid G",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_paranoid_g.mp3",
        ["Id"] = 3853710,
        ["Length"] = 72,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus Paranoid H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_paranoid_h.mp3",
        ["Id"] = 3853712,
        ["Length"] = 108,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus Paranoid Sting A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_paranoid_sting_a.mp3",
        ["Id"] = 3853714,
        ["Length"] = 12,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus Paranoid Sting B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_paranoid_sting_b.mp3",
        ["Id"] = 3853716,
        ["Length"] = 17,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus Sting A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_sting_a.mp3",
        ["Id"] = 3853718,
        ["Length"] = 15,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Mx Sansprimus Sting B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_mx_sansprimus_sting_b.mp3",
        ["Id"] = 3853720,
        ["Length"] = 15,
        ["Artist"] = "Glenn Stafford, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Nightwake Maw",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_nightwake_maw.mp3",
        ["Id"] = 3931032,
        ["Length"] = 136,
        ["Artist"] = "Leo Kaliski, Jason Hayes",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Nightwake Torghast",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_nightwake_torghast.mp3",
        ["Id"] = 3931034,
        ["Length"] = 131,
        ["Artist"] = "Leo Kaliski, Jason Hayes",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Npe Onlyhuman A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_npe_onlyhuman_a.mp3",
        ["Id"] = 3850459,
        ["Length"] = 139,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Npe Onlyhuman B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_npe_onlyhuman_b.mp3",
        ["Id"] = 3850461,
        ["Length"] = 139,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Npe Onlyhuman C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_npe_onlyhuman_c.mp3",
        ["Id"] = 3850463,
        ["Length"] = 103,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Npe Onlyhuman D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_npe_onlyhuman_d.mp3",
        ["Id"] = 3850465,
        ["Length"] = 112,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Npe Onlyhuman H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_npe_onlyhuman_h.mp3",
        ["Id"] = 3850467,
        ["Length"] = 142,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Npe Orc2orc A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_npe_orc2orc_a.mp3",
        ["Id"] = 3850469,
        ["Length"] = 128,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Npe Orc2orc B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_npe_orc2orc_b.mp3",
        ["Id"] = 3850471,
        ["Length"] = 109,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Npe Orc2orc C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_npe_orc2orc_c.mp3",
        ["Id"] = 3850473,
        ["Length"] = 99,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Npe Orc2orc D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_npe_orc2orc_d.mp3",
        ["Id"] = 3850475,
        ["Length"] = 95,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Npe Orc2orc E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_npe_orc2orc_e.mp3",
        ["Id"] = 3850477,
        ["Length"] = 87,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Npe Orc2orc H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_npe_orc2orc_h.mp3",
        ["Id"] = 3850479,
        ["Length"] = 151,
        ["Artist"] = "Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Broker Calculated A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_broker_calculated_a.mp3",
        ["Id"] = 3857099,
        ["Length"] = 248,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Broker Calculated B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_broker_calculated_b.mp3",
        ["Id"] = 3857101,
        ["Length"] = 248,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Broker Calculated C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_broker_calculated_c.mp3",
        ["Id"] = 3857103,
        ["Length"] = 263,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Broker Calculated D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_broker_calculated_d.mp3",
        ["Id"] = 3857105,
        ["Length"] = 250,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Broker Calculated H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_broker_calculated_h.mp3",
        ["Id"] = 3857107,
        ["Length"] = 248,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Broker Opulence A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_broker_opulence_a.mp3",
        ["Id"] = 3857109,
        ["Length"] = 143,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Broker Opulence B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_broker_opulence_b.mp3",
        ["Id"] = 3857111,
        ["Length"] = 134,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Broker Opulence C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_broker_opulence_c.mp3",
        ["Id"] = 3857113,
        ["Length"] = 121,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Broker Opulence H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_broker_opulence_h.mp3",
        ["Id"] = 3857115,
        ["Length"] = 121,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Inbetween End Aw",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_inbetween_end_aw.mp3",
        ["Id"] = 3931046,
        ["Length"] = 31,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Inbetween End Ba",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_inbetween_end_ba.mp3",
        ["Id"] = 3931048,
        ["Length"] = 31,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Inbetween End Mx",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_inbetween_end_mx.mp3",
        ["Id"] = 3931050,
        ["Length"] = 26,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Inbetween End Rd",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_inbetween_end_rd.mp3",
        ["Id"] = 3931052,
        ["Length"] = 24,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Inbetween Middle A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_inbetween_middle_a.mp3",
        ["Id"] = 3931054,
        ["Length"] = 36,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Inbetween Middle B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_inbetween_middle_b.mp3",
        ["Id"] = 3931056,
        ["Length"] = 36,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Inbetween Middle C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_inbetween_middle_c.mp3",
        ["Id"] = 3931058,
        ["Length"] = 36,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Inbetween Start A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_inbetween_start_a.mp3",
        ["Id"] = 3931060,
        ["Length"] = 43,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Inbetween Start B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_inbetween_start_b.mp3",
        ["Id"] = 3931062,
        ["Length"] = 41,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Inbetween Start C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_inbetween_start_c.mp3",
        ["Id"] = 3931064,
        ["Length"] = 43,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_a.mp3",
        ["Id"] = 3853724,
        ["Length"] = 102,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_b.mp3",
        ["Id"] = 3853726,
        ["Length"] = 67,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_c.mp3",
        ["Id"] = 3853728,
        ["Length"] = 66,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos Intro",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_intro.mp3",
        ["Id"] = 3853730,
        ["Length"] = 67,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos Theeternalcity A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_theeternalcity_a.mp3",
        ["Id"] = 3853764,
        ["Length"] = 151,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos Theeternalcity B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_theeternalcity_b.mp3",
        ["Id"] = 3853732,
        ["Length"] = 150,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos Theeternalcity C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_theeternalcity_c.mp3",
        ["Id"] = 3853734,
        ["Length"] = 116,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos Theeternalcity D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_theeternalcity_d.mp3",
        ["Id"] = 3853736,
        ["Length"] = 117,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos Theeternalcity E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_theeternalcity_e.mp3",
        ["Id"] = 3853738,
        ["Length"] = 109,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos Theeternalcity H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_theeternalcity_h.mp3",
        ["Id"] = 3853740,
        ["Length"] = 150,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos Thepurpose B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_thepurpose_b.mp3",
        ["Id"] = 3853744,
        ["Length"] = 139,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos Thepurpose C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_thepurpose_c.mp3",
        ["Id"] = 3853746,
        ["Length"] = 132,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos Thepurpose D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_thepurpose_d.mp3",
        ["Id"] = 3853748,
        ["Length"] = 127,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos Thepurpose E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_thepurpose_e.mp3",
        ["Id"] = 3885832,
        ["Length"] = 140,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos Thepurpose H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_thepurpose_h.mp3",
        ["Id"] = 3853750,
        ["Length"] = 127,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos Theway A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_theway_a.mp3",
        ["Id"] = 3853752,
        ["Length"] = 132,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos Theway B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_theway_b.mp3",
        ["Id"] = 3853754,
        ["Length"] = 127,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos Theway C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_theway_c.mp3",
        ["Id"] = 3853756,
        ["Length"] = 129,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos Theway D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_theway_d.mp3",
        ["Id"] = 3853758,
        ["Length"] = 135,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos Theway E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_theway_e.mp3",
        ["Id"] = 3853760,
        ["Length"] = 126,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Or Oribos Theway H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_or_oribos_theway_h.mp3",
        ["Id"] = 3853762,
        ["Length"] = 126,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Castlenathria Council Diea",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_castlenathria_council_diea.mp3",
        ["Id"] = 3892784,
        ["Length"] = 68,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Castlenathria Council Dieb",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_castlenathria_council_dieb.mp3",
        ["Id"] = 3892786,
        ["Length"] = 69,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Castlenathria Council Inta",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_castlenathria_council_inta.mp3",
        ["Id"] = 3892788,
        ["Length"] = 34,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Castlenathria Council Intb",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_castlenathria_council_intb.mp3",
        ["Id"] = 3892790,
        ["Length"] = 32,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Castlenathria Council Intc",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_castlenathria_council_intc.mp3",
        ["Id"] = 3892792,
        ["Length"] = 36,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Castlenathria Intro Hvy",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_castlenathria_intro_hvy.mp3",
        ["Id"] = 3885315,
        ["Length"] = 31,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Castlenathria Themaster A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_castlenathria_themaster_a.mp3",
        ["Id"] = 3885317,
        ["Length"] = 94,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Castlenathria Themaster B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_castlenathria_themaster_b.mp3",
        ["Id"] = 3885319,
        ["Length"] = 88,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Castlenathria Themaster C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_castlenathria_themaster_c.mp3",
        ["Id"] = 3885321,
        ["Length"] = 98,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Castlenathria Themaster D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_castlenathria_themaster_d.mp3",
        ["Id"] = 3885323,
        ["Length"] = 114,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Castlenathria Themaster E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_castlenathria_themaster_e.mp3",
        ["Id"] = 3892794,
        ["Length"] = 78,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Castlenathria Themaster Falling 01",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_castlenathria_themaster_falling_01.mp3",
        ["Id"] = 3885325,
        ["Length"] = 12,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Castlenathria Themaster Falling 02",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_castlenathria_themaster_falling_02.mp3",
        ["Id"] = 3892796,
        ["Length"] = 14,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_a.mp3",
        ["Id"] = 3853766,
        ["Length"] = 90,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_b.mp3",
        ["Id"] = 3853768,
        ["Length"] = 118,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_c.mp3",
        ["Id"] = 3853770,
        ["Length"] = 78,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_d.mp3",
        ["Id"] = 3853772,
        ["Length"] = 84,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Drainageswamp A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_drainageswamp_a.mp3",
        ["Id"] = 3853774,
        ["Length"] = 118,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Drainageswamp B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_drainageswamp_b.mp3",
        ["Id"] = 3853776,
        ["Length"] = 86,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_e.mp3",
        ["Id"] = 3892798,
        ["Length"] = 136,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_f.mp3",
        ["Id"] = 3894463,
        ["Length"] = 137,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Fear A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_fear_a.mp3",
        ["Id"] = 3858393,
        ["Length"] = 62,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Fear B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_fear_b.mp3",
        ["Id"] = 3858395,
        ["Length"] = 71,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Fear C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_fear_c.mp3",
        ["Id"] = 3853778,
        ["Length"] = 63,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Fear Drainageswamp A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_fear_drainageswamp_a.mp3",
        ["Id"] = 3853780,
        ["Length"] = 74,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Fear Drainageswamp B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_fear_drainageswamp_b.mp3",
        ["Id"] = 3853782,
        ["Length"] = 75,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Fear H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_fear_h.mp3",
        ["Id"] = 3853784,
        ["Length"] = 109,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Fear Ruinedcastles A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_fear_ruinedcastles_a.mp3",
        ["Id"] = 3858397,
        ["Length"] = 104,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Fear Ruinedcastles B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_fear_ruinedcastles_b.mp3",
        ["Id"] = 3858399,
        ["Length"] = 98,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Fear Ruinedcastles C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_fear_ruinedcastles_c.mp3",
        ["Id"] = 3858401,
        ["Length"] = 118,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence G",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_g.mp3",
        ["Id"] = 3892800,
        ["Length"] = 92,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_h.mp3",
        ["Id"] = 3853786,
        ["Length"] = 145,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Hospitality A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_hospitality_a.mp3",
        ["Id"] = 3853788,
        ["Length"] = 134,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Hospitality B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_hospitality_b.mp3",
        ["Id"] = 3853790,
        ["Length"] = 147,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Hospitality C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_hospitality_c.mp3",
        ["Id"] = 3853792,
        ["Length"] = 116,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Hospitality D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_hospitality_d.mp3",
        ["Id"] = 3853794,
        ["Length"] = 108,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Hospitality E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_hospitality_e.mp3",
        ["Id"] = 3853796,
        ["Length"] = 104,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Hospitality F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_hospitality_f.mp3",
        ["Id"] = 3853798,
        ["Length"] = 108,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Hospitality G",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_hospitality_g.mp3",
        ["Id"] = 3853800,
        ["Length"] = 114,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Hospitality H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_hospitality_h.mp3",
        ["Id"] = 3853802,
        ["Length"] = 156,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Hospitality I",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_hospitality_i.mp3",
        ["Id"] = 3853804,
        ["Length"] = 104,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Hospitality J",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_hospitality_j.mp3",
        ["Id"] = 3853806,
        ["Length"] = 92,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Pride A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_pride_a.mp3",
        ["Id"] = 3853808,
        ["Length"] = 131,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Pride B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_pride_b.mp3",
        ["Id"] = 3853810,
        ["Length"] = 133,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Pride C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_pride_c.mp3",
        ["Id"] = 3853812,
        ["Length"] = 73,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Pride D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_pride_d.mp3",
        ["Id"] = 3853814,
        ["Length"] = 126,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Pride Domination",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_pride_domination.mp3",
        ["Id"] = 3885327,
        ["Length"] = 77,
        ["Artist"] = "Jake Lefkowitz, David Arkenstone, Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Pride Drainageswamp A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_pride_drainageswamp_a.mp3",
        ["Id"] = 3853816,
        ["Length"] = 98,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Pride Drainageswamp B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_pride_drainageswamp_b.mp3",
        ["Id"] = 3853818,
        ["Length"] = 97,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Pride H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_pride_h.mp3",
        ["Id"] = 3853820,
        ["Length"] = 184,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Pride Stinga",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_pride_stinga.mp3",
        ["Id"] = 3892802,
        ["Length"] = 25,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Pride Stingb",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_pride_stingb.mp3",
        ["Id"] = 3892804,
        ["Length"] = 19,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Pride Stingc",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_pride_stingc.mp3",
        ["Id"] = 3892806,
        ["Length"] = 16,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Pride Stingd",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_pride_stingd.mp3",
        ["Id"] = 3892808,
        ["Length"] = 19,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Pride Stinge",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_pride_stinge.mp3",
        ["Id"] = 3892810,
        ["Length"] = 16,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Pride Stingf",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_pride_stingf.mp3",
        ["Id"] = 3892812,
        ["Length"] = 16,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Pride Venthyra",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_pride_venthyra.mp3",
        ["Id"] = 3892814,
        ["Length"] = 98,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Pride Venthyrb",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_pride_venthyrb.mp3",
        ["Id"] = 3892816,
        ["Length"] = 89,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Pride Venthyrc",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_pride_venthyrc.mp3",
        ["Id"] = 3892818,
        ["Length"] = 92,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Decadence Pride Venthyrd",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_decadence_pride_venthyrd.mp3",
        ["Id"] = 3892820,
        ["Length"] = 92,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Embercourtband Ardenweald",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_embercourtband_ardenweald.mp3",
        ["Id"] = 3858314,
        ["Length"] = 90,
        ["Artist"] = "Glenn Stafford, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Embercourtband Pridedecadence",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_embercourtband_pridedecadence.mp3",
        ["Id"] = 3858315,
        ["Length"] = 94,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Embercourtband Ritual",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_embercourtband_ritual.mp3",
        ["Id"] = 3858317,
        ["Length"] = 87,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Embercourtband Sanprimus",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_embercourtband_sanprimus.mp3",
        ["Id"] = 3858318,
        ["Length"] = 94,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Embercourtband Sting A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_embercourtband_sting_a.mp3",
        ["Id"] = 3858319,
        ["Length"] = 9,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Embercourtband Sting B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_embercourtband_sting_b.mp3",
        ["Id"] = 3858320,
        ["Length"] = 10,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Embercourtband Sting C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_embercourtband_sting_c.mp3",
        ["Id"] = 3892822,
        ["Length"] = 8,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Embercourtband Tobekyrian",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_embercourtband_tobekyrian.mp3",
        ["Id"] = 3858321,
        ["Length"] = 89,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_a.mp3",
        ["Id"] = 3853822,
        ["Length"] = 140,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_b.mp3",
        ["Id"] = 3853824,
        ["Length"] = 128,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_c.mp3",
        ["Id"] = 3853826,
        ["Length"] = 112,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_d.mp3",
        ["Id"] = 3853828,
        ["Length"] = 91,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual Decay A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_decay_a.mp3",
        ["Id"] = 3853830,
        ["Length"] = 106,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual Decay B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_decay_b.mp3",
        ["Id"] = 3853832,
        ["Length"] = 105,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual Decay C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_decay_c.mp3",
        ["Id"] = 3853834,
        ["Length"] = 91,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual Decay D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_decay_d.mp3",
        ["Id"] = 3853836,
        ["Length"] = 101,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual Decay H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_decay_h.mp3",
        ["Id"] = 3853838,
        ["Length"] = 75,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_e.mp3",
        ["Id"] = 3853840,
        ["Length"] = 106,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual Feral A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_feral_a.mp3",
        ["Id"] = 3853842,
        ["Length"] = 135,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual Feral B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_feral_b.mp3",
        ["Id"] = 3853844,
        ["Length"] = 119,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual Feral C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_feral_c.mp3",
        ["Id"] = 3853846,
        ["Length"] = 105,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual Feral D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_feral_d.mp3",
        ["Id"] = 3853848,
        ["Length"] = 105,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual Feral E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_feral_e.mp3",
        ["Id"] = 3853850,
        ["Length"] = 91,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual Feral H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_feral_h.mp3",
        ["Id"] = 3853852,
        ["Length"] = 129,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_h.mp3",
        ["Id"] = 3853854,
        ["Length"] = 128,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual Sinister A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_sinister_a.mp3",
        ["Id"] = 3853856,
        ["Length"] = 79,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual Sinister B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_sinister_b.mp3",
        ["Id"] = 3853858,
        ["Length"] = 92,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual Sinister C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_sinister_c.mp3",
        ["Id"] = 3853860,
        ["Length"] = 103,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual Sinister D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_sinister_d.mp3",
        ["Id"] = 3853862,
        ["Length"] = 91,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual Sinister Domination",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_sinister_domination.mp3",
        ["Id"] = 3885329,
        ["Length"] = 101,
        ["Artist"] = "Grant Kirkhope, David Arkenstone, Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual Sinister E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_sinister_e.mp3",
        ["Id"] = 3853864,
        ["Length"] = 135,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual Sinister F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_sinister_f.mp3",
        ["Id"] = 3853866,
        ["Length"] = 106,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual Sinister H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_sinister_h.mp3",
        ["Id"] = 3853868,
        ["Length"] = 138,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Ritual Sinister Sting A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_ritual_sinister_sting_a.mp3",
        ["Id"] = 3892824,
        ["Length"] = 30,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Venthyr A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_venthyr_a.mp3",
        ["Id"] = 3853870,
        ["Length"] = 115,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Venthyr B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_venthyr_b.mp3",
        ["Id"] = 3853872,
        ["Length"] = 114,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Venthyr D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_venthyr_d.mp3",
        ["Id"] = 3853874,
        ["Length"] = 105,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Venthyr E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_venthyr_e.mp3",
        ["Id"] = 3853876,
        ["Length"] = 122,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Venthyr F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_venthyr_f.mp3",
        ["Id"] = 3853878,
        ["Length"] = 117,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Venthyr G",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_venthyr_g.mp3",
        ["Id"] = 3853880,
        ["Length"] = 108,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Venthyr H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_venthyr_h.mp3",
        ["Id"] = 3853882,
        ["Length"] = 201,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Venthyr Hallsofatonement A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_venthyr_hallsofatonement_a.mp3",
        ["Id"] = 3885444,
        ["Length"] = 119,
        ["Artist"] = "Grant Kirkhope, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Venthyr Hallsofatonement B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_venthyr_hallsofatonement_b.mp3",
        ["Id"] = 3885446,
        ["Length"] = 124,
        ["Artist"] = "Grant Kirkhope, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Venthyr Hallsofatonement C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_venthyr_hallsofatonement_c.mp3",
        ["Id"] = 3885448,
        ["Length"] = 153,
        ["Artist"] = "Grant Kirkhope, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Venthyr Hallsofatonement D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_venthyr_hallsofatonement_d.mp3",
        ["Id"] = 3885450,
        ["Length"] = 102,
        ["Artist"] = "Grant Kirkhope, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Venthyr I",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_venthyr_i.mp3",
        ["Id"] = 3853884,
        ["Length"] = 132,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Venthyr Intro A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_venthyr_intro_a.mp3",
        ["Id"] = 3853886,
        ["Length"] = 83,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Venthyr Intro B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_venthyr_intro_b.mp3",
        ["Id"] = 3853888,
        ["Length"] = 83,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Venthyr Intro C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_venthyr_intro_c.mp3",
        ["Id"] = 3853890,
        ["Length"] = 83,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Venthyr J",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_venthyr_j.mp3",
        ["Id"] = 3853892,
        ["Length"] = 134,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Venthyr K",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_venthyr_k.mp3",
        ["Id"] = 3853894,
        ["Length"] = 127,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rd Venthyr L",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rd_venthyr_l.mp3",
        ["Id"] = 3853896,
        ["Length"] = 70,
        ["Artist"] = "Jake Lefkowitz, Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Acc Alliance",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_acc_alliance.mp3",
        ["Id"] = 3850535,
        ["Length"] = 61,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Acc Horde",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_acc_horde.mp3",
        ["Id"] = 3850537,
        ["Length"] = 61,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Aci",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_aci.mp3",
        ["Id"] = 3885834,
        ["Length"] = 48,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Ahl",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_ahl.mp3",
        ["Id"] = 3885836,
        ["Length"] = 83,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Amd",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_amd.mp3",
        ["Id"] = 3885838,
        ["Length"] = 44,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Atg",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_atg.mp3",
        ["Id"] = 3885840,
        ["Length"] = 46,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Bad",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_bad.mp3",
        ["Id"] = 3194029,
        ["Length"] = 40,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Bao",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_bao.mp3",
        ["Id"] = 3885842,
        ["Length"] = 60,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Brc",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_brc.mp3",
        ["Id"] = 3885844,
        ["Length"] = 45,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Btv",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_btv.mp3",
        ["Id"] = 3885846,
        ["Length"] = 56,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Cal",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_cal.mp3",
        ["Id"] = 3885848,
        ["Length"] = 33,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Coh",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_coh.mp3",
        ["Id"] = 3894465,
        ["Length"] = 95,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Cso",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_cso.mp3",
        ["Id"] = 3885850,
        ["Length"] = 56,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Ddr",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_ddr.mp3",
        ["Id"] = 3885852,
        ["Length"] = 69,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Dha",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_dha.mp3",
        ["Id"] = 3894467,
        ["Length"] = 55,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Dpd",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_dpd.mp3",
        ["Id"] = 3885854,
        ["Length"] = 43,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Fca",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_fca.mp3",
        ["Id"] = 3885856,
        ["Length"] = 37,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Fcs",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_fcs.mp3",
        ["Id"] = 3885858,
        ["Length"] = 80,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Grp",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_grp.mp3",
        ["Id"] = 3850547,
        ["Length"] = 38,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Grp Alliance",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_grp_alliance.mp3",
        ["Id"] = 3850539,
        ["Length"] = 38,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Grp Horde",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_grp_horde.mp3",
        ["Id"] = 3850541,
        ["Length"] = 38,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Gtp",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_gtp.mp3",
        ["Id"] = 3885860,
        ["Length"] = 60,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Hcd",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_hcd.mp3",
        ["Id"] = 3885862,
        ["Length"] = 76,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Isf Alliance",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_isf_alliance.mp3",
        ["Id"] = 3850543,
        ["Length"] = 46,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Isf Horde",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_isf_horde.mp3",
        ["Id"] = 3850545,
        ["Length"] = 47,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Itf",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_itf.mp3",
        ["Id"] = 3885864,
        ["Length"] = 28,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Jcb",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_jcb.mp3",
        ["Id"] = 3885866,
        ["Length"] = 52,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Jtb",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_jtb.mp3",
        ["Id"] = 3885868,
        ["Length"] = 25,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Mcc",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_mcc.mp3",
        ["Id"] = 3892826,
        ["Length"] = 92,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Mgi",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_mgi.mp3",
        ["Id"] = 3885870,
        ["Length"] = 112,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Mhs",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_mhs.mp3",
        ["Id"] = 3892828,
        ["Length"] = 46,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Mis",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_mis.mp3",
        ["Id"] = 3885872,
        ["Length"] = 38,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Mka",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_mka.mp3",
        ["Id"] = 3885874,
        ["Length"] = 21,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Mrc",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_mrc.mp3",
        ["Id"] = 3885876,
        ["Length"] = 21,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Mta",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_mta.mp3",
        ["Id"] = 3885878,
        ["Length"] = 90,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Mtc",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_mtc.mp3",
        ["Id"] = 3885880,
        ["Length"] = 40,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Mtg",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_mtg.mp3",
        ["Id"] = 3885882,
        ["Length"] = 154,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Mtm",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_mtm.mp3",
        ["Id"] = 3885884,
        ["Length"] = 84,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Nla",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_nla.mp3",
        ["Id"] = 3885886,
        ["Length"] = 48,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Raw",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_raw.mp3",
        ["Id"] = 3892830,
        ["Length"] = 36,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Rct",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_rct.mp3",
        ["Id"] = 3885888,
        ["Length"] = 58,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Rdi",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_rdi.mp3",
        ["Id"] = 3885890,
        ["Length"] = 55,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Rss",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_rss.mp3",
        ["Id"] = 3885892,
        ["Length"] = 20,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Sbc",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_sbc.mp3",
        ["Id"] = 3885894,
        ["Length"] = 21,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Scp Alliance",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_scp_alliance.mp3",
        ["Id"] = 3850549,
        ["Length"] = 47,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Scp Horde",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_scp_horde.mp3",
        ["Id"] = 3850551,
        ["Length"] = 46,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Sin",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_sin.mp3",
        ["Id"] = 3885896,
        ["Length"] = 69,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Sit",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_sit.mp3",
        ["Id"] = 3885898,
        ["Length"] = 48,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Sta",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_sta.mp3",
        ["Id"] = 3885900,
        ["Length"] = 40,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Tbr",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_tbr.mp3",
        ["Id"] = 3885902,
        ["Length"] = 98,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Tno",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_tno.mp3",
        ["Id"] = 3885904,
        ["Length"] = 38,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Tul",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_tul.mp3",
        ["Id"] = 3892832,
        ["Length"] = 27,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Vtm",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_vtm.mp3",
        ["Id"] = 3885906,
        ["Length"] = 63,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Rtc Wrl",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_rtc_wrl.mp3",
        ["Id"] = 3885908,
        ["Length"] = 103,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Death A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_death_a.mp3",
        ["Id"] = 3853898,
        ["Length"] = 93,
        ["Artist"] = "Glenn Stafford, Jason Hayes",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Death B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_death_b.mp3",
        ["Id"] = 3853900,
        ["Length"] = 129,
        ["Artist"] = "Glenn Stafford, Jason Hayes",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Death C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_death_c.mp3",
        ["Id"] = 3853902,
        ["Length"] = 105,
        ["Artist"] = "Glenn Stafford, Jason Hayes",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Death H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_death_h.mp3",
        ["Id"] = 3853904,
        ["Length"] = 154,
        ["Artist"] = "Glenn Stafford, Jason Hayes",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Domination Ambient Tension A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_domination_ambient_tension_a.mp3",
        ["Id"] = 3850481,
        ["Length"] = 69,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Domination Ambient Tension B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_domination_ambient_tension_b.mp3",
        ["Id"] = 3850483,
        ["Length"] = 79,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Domination Ambient Tension C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_domination_ambient_tension_c.mp3",
        ["Id"] = 3850485,
        ["Length"] = 79,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Domination Battle A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_domination_battle_a.mp3",
        ["Id"] = 3850487,
        ["Length"] = 112,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Domination Battle B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_domination_battle_b.mp3",
        ["Id"] = 3850489,
        ["Length"] = 110,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Domination Battle C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_domination_battle_c.mp3",
        ["Id"] = 3850491,
        ["Length"] = 110,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Domination Battle H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_domination_battle_h.mp3",
        ["Id"] = 3850493,
        ["Length"] = 110,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Domination H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_domination_h.mp3",
        ["Id"] = 3850495,
        ["Length"] = 80,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Inbetween A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_inbetween_a.mp3",
        ["Id"] = 3861372,
        ["Length"] = 89,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Inbetween B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_inbetween_b.mp3",
        ["Id"] = 3931390,
        ["Length"] = 89,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Inbetween C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_inbetween_c.mp3",
        ["Id"] = 3931392,
        ["Length"] = 88,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Revelation A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_revelation_a.mp3",
        ["Id"] = 3853906,
        ["Length"] = 102,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Revelation B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_revelation_b.mp3",
        ["Id"] = 3853908,
        ["Length"] = 99,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Revelation C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_revelation_c.mp3",
        ["Id"] = 3853910,
        ["Length"] = 100,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Revelation H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_revelation_h.mp3",
        ["Id"] = 3853912,
        ["Length"] = 90,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Sylvanas Freewill A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_sylvanas_freewill_a.mp3",
        ["Id"] = 3850497,
        ["Length"] = 139,
        ["Artist"] = "Sam Cardon, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Sylvanas Freewill B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_sylvanas_freewill_b.mp3",
        ["Id"] = 3850499,
        ["Length"] = 122,
        ["Artist"] = "Sam Cardon, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Sylvanas Freewill C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_sylvanas_freewill_c.mp3",
        ["Id"] = 3850501,
        ["Length"] = 117,
        ["Artist"] = "Sam Cardon, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Sylvanas Freewill D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_sylvanas_freewill_d.mp3",
        ["Id"] = 3850503,
        ["Length"] = 144,
        ["Artist"] = "Sam Cardon, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Sylvanas Freewill H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_sylvanas_freewill_h.mp3",
        ["Id"] = 3850505,
        ["Length"] = 172,
        ["Artist"] = "Sam Cardon, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Unbrokenwill Action A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_unbrokenwill_action_a.mp3",
        ["Id"] = 3850507,
        ["Length"] = 86,
        ["Artist"] = "Neal Acree, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Unbrokenwill Action B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_unbrokenwill_action_b.mp3",
        ["Id"] = 3850509,
        ["Length"] = 33,
        ["Artist"] = "Neal Acree, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Unbrokenwill Action C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_unbrokenwill_action_c.mp3",
        ["Id"] = 3850511,
        ["Length"] = 53,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Unbrokenwill Action H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_unbrokenwill_action_h.mp3",
        ["Id"] = 3850513,
        ["Length"] = 137,
        ["Artist"] = "Neal Acree, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Unbrokenwill Ambient A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_unbrokenwill_ambient_a.mp3",
        ["Id"] = 3850515,
        ["Length"] = 62,
        ["Artist"] = "Neal Acree, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Unbrokenwill Ambient B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_unbrokenwill_ambient_b.mp3",
        ["Id"] = 3850517,
        ["Length"] = 56,
        ["Artist"] = "Neal Acree, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Unbrokenwill Ambient C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_unbrokenwill_ambient_c.mp3",
        ["Id"] = 3850519,
        ["Length"] = 53,
        ["Artist"] = "Neal Acree, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Unbrokenwill Ambient D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_unbrokenwill_ambient_d.mp3",
        ["Id"] = 3850521,
        ["Length"] = 133,
        ["Artist"] = "Neal Acree, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Unbrokenwill Ambient E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_unbrokenwill_ambient_e.mp3",
        ["Id"] = 3850523,
        ["Length"] = 131,
        ["Artist"] = "Neal Acree, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Shadow Unbrokenwill Ambient H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_shadow_unbrokenwill_ambient_h.mp3",
        ["Id"] = 3850525,
        ["Length"] = 130,
        ["Artist"] = "Neal Acree, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Utherconfront",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_utherconfront.mp3",
        ["Id"] = 3931066,
        ["Length"] = 164,
        ["Artist"] = "Glenn Stafford, Tracy Bush",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Broker Cartel H",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_broker_cartel_h.mp3",
        ["Id"] = 4198417,
        ["Length"] = 130,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Broker Curiosities H",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_broker_curiosities_h.mp3",
        ["Id"] = 4198419,
        ["Length"] = 114,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Broker Engage A",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_broker_engage_a.mp3",
        ["Id"] = 4198421,
        ["Length"] = 119,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Broker Engage B",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_broker_engage_b.mp3",
        ["Id"] = 4198423,
        ["Length"] = 119,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Broker Engage C",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_broker_engage_c.mp3",
        ["Id"] = 4198427,
        ["Length"] = 104,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Broker Engage D",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_broker_engage_d.mp3",
        ["Id"] = 4198429,
        ["Length"] = 122,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Broker Engage H",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_broker_engage_h.mp3",
        ["Id"] = 4198425,
        ["Length"] = 150,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Broker Engage Stinger",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_broker_engage_stinger.mp3",
        ["Id"] = 4198435,
        ["Length"] = 18,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Broker Hospitality H",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_broker_hospitality_h.mp3",
        ["Id"] = 4198431,
        ["Length"] = 106,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Broker Hospitality Stinger",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_broker_hospitality_stinger.mp3",
        ["Id"] = 4198433,
        ["Length"] = 25,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Broker Kultiran Highseas",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_broker_kultiran_highseas.mp3",
        ["Id"] = 4198415,
        ["Length"] = 29,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Broker Market H",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_broker_market_h.mp3",
        ["Id"] = 4198437,
        ["Length"] = 116,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Broker Patrol A",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_broker_patrol_a.mp3",
        ["Id"] = 4198443,
        ["Length"] = 111,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Broker Patrol H",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_broker_patrol_h.mp3",
        ["Id"] = 4198439,
        ["Length"] = 111,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Broker Stormheim",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_broker_stormheim.mp3",
        ["Id"] = 4198441,
        ["Length"] = 24,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Domination Anduin",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_domination_anduin.mp3",
        ["Id"] = 4198457,
        ["Length"] = 134,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Domination Inchains A",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_domination_inchains_a.mp3",
        ["Id"] = 4198459,
        ["Length"] = 96,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Domination Inchains B",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_domination_inchains_b.mp3",
        ["Id"] = 4198461,
        ["Length"] = 70,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Domination Inchains C",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_domination_inchains_c.mp3",
        ["Id"] = 4198463,
        ["Length"] = 120,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Domination Inchains D",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_domination_inchains_d.mp3",
        ["Id"] = 4204917,
        ["Length"] = 96,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Domination Inchains H",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_domination_inchains_h.mp3",
        ["Id"] = 4198469,
        ["Length"] = 125,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Domination Zovaal",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_domination_zovaal.mp3",
        ["Id"] = 4198471,
        ["Length"] = 79,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Domination Zovaal Intro B",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_domination_zovaal_intro_b.mp3",
        ["Id"] = 4204919,
        ["Length"] = 26,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Draka Boundbyblood A",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_draka_boundbyblood_a.mp3",
        ["Id"] = 4198379,
        ["Length"] = 98,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Draka Boundbyblood B",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_draka_boundbyblood_b.mp3",
        ["Id"] = 4198381,
        ["Length"] = 88,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Draka Boundbyblood C",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_draka_boundbyblood_c.mp3",
        ["Id"] = 4198383,
        ["Length"] = 63,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Draka Boundbyblood D",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_draka_boundbyblood_d.mp3",
        ["Id"] = 4198473,
        ["Length"] = 67,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Draka Boundbyblood H",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_draka_boundbyblood_h.mp3",
        ["Id"] = 4198385,
        ["Length"] = 146,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Goel Boundbyblood A",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_goel_boundbyblood_a.mp3",
        ["Id"] = 4198393,
        ["Length"] = 61,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Goel Boundbyblood B",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_goel_boundbyblood_b.mp3",
        ["Id"] = 4198397,
        ["Length"] = 61,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Goel Boundbyblood C",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_goel_boundbyblood_c.mp3",
        ["Id"] = 4198401,
        ["Length"] = 86,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Goel Boundbyblood D",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_goel_boundbyblood_d.mp3",
        ["Id"] = 4198403,
        ["Length"] = 84,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Goel Boundbyblood E",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_goel_boundbyblood_e.mp3",
        ["Id"] = 4198407,
        ["Length"] = 86,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Goel Boundbyblood H",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_goel_boundbyblood_h.mp3",
        ["Id"] = 4198405,
        ["Length"] = 146,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Goel Boundbyblood Stinger",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_goel_boundbyblood_stinger.mp3",
        ["Id"] = 4198413,
        ["Length"] = 13,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Korthia Cityofsecrets A",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_korthia_cityofsecrets_a.mp3",
        ["Id"] = 4198304,
        ["Length"] = 77,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Korthia Cityofsecrets B",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_korthia_cityofsecrets_b.mp3",
        ["Id"] = 4198306,
        ["Length"] = 57,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Korthia Cityofsecrets C",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_korthia_cityofsecrets_c.mp3",
        ["Id"] = 4198308,
        ["Length"] = 95,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Korthia Cityofsecrets D",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_korthia_cityofsecrets_d.mp3",
        ["Id"] = 4198310,
        ["Length"] = 72,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Korthia Cityofsecrets H",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_korthia_cityofsecrets_h.mp3",
        ["Id"] = 4198312,
        ["Length"] = 118,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Korthia General A",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_korthia_general_a.mp3",
        ["Id"] = 4204877,
        ["Length"] = 153,
        ["Artist"] = "Glenn Stafford, Derek Duke",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Korthia General B",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_korthia_general_b.mp3",
        ["Id"] = 4204879,
        ["Length"] = 197,
        ["Artist"] = "Glenn Stafford, Derek Duke",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Korthia General C",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_korthia_general_c.mp3",
        ["Id"] = 4204881,
        ["Length"] = 279,
        ["Artist"] = "Glenn Stafford, Derek Duke",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Korthia General D",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_korthia_general_d.mp3",
        ["Id"] = 4204883,
        ["Length"] = 187,
        ["Artist"] = "Glenn Stafford, Derek Duke",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Korthia General E",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_korthia_general_e.mp3",
        ["Id"] = 4204885,
        ["Length"] = 355,
        ["Artist"] = "Glenn Stafford, Derek Duke",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Korthia General F",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_korthia_general_f.mp3",
        ["Id"] = 4204887,
        ["Length"] = 188,
        ["Artist"] = "Glenn Stafford, Derek Duke",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Korthia General G",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_korthia_general_g.mp3",
        ["Id"] = 4204889,
        ["Length"] = 116,
        ["Artist"] = "Glenn Stafford, Derek Duke",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Korthia Lostarchives A",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_korthia_lostarchives_a.mp3",
        ["Id"] = 4198314,
        ["Length"] = 153,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Korthia Lostarchives B",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_korthia_lostarchives_b.mp3",
        ["Id"] = 4198316,
        ["Length"] = 153,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Korthia Lostarchives H",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_korthia_lostarchives_h.mp3",
        ["Id"] = 4198318,
        ["Length"] = 160,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Nightwarrior Tides A",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_nightwarrior_tides_a.mp3",
        ["Id"] = 4204863,
        ["Length"] = 115,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Nightwarrior Tides B",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_nightwarrior_tides_b.mp3",
        ["Id"] = 4204921,
        ["Length"] = 115,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Nightwarrior Tides H",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_nightwarrior_tides_h.mp3",
        ["Id"] = 4204865,
        ["Length"] = 115,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Revendreth Sired A",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_revendreth_sired_a.mp3",
        ["Id"] = 4198445,
        ["Length"] = 98,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Revendreth Sired B",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_revendreth_sired_b.mp3",
        ["Id"] = 4198447,
        ["Length"] = 114,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Revendreth Sired C",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_revendreth_sired_c.mp3",
        ["Id"] = 4198449,
        ["Length"] = 99,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Revendreth Sired D",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_revendreth_sired_d.mp3",
        ["Id"] = 4198451,
        ["Length"] = 99,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Revendreth Sired H",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_revendreth_sired_h.mp3",
        ["Id"] = 4198453,
        ["Length"] = 126,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Sanctum Of Domination A",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_sanctum_of_domination_a.mp3",
        ["Id"] = 4204903,
        ["Length"] = 95,
        ["Artist"] = "D Arkenstone, G Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Sanctum Of Domination Ambient A",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_sanctum_of_domination_ambient_a.mp3",
        ["Id"] = 4204893,
        ["Length"] = 121,
        ["Artist"] = "D Arkenstone, G Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Sanctum Of Domination Ambient B",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_sanctum_of_domination_ambient_b.mp3",
        ["Id"] = 4204895,
        ["Length"] = 79,
        ["Artist"] = "D Arkenstone, G Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Sanctum Of Domination Ambient C",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_sanctum_of_domination_ambient_c.mp3",
        ["Id"] = 4204897,
        ["Length"] = 113,
        ["Artist"] = "D Arkenstone, G Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Sanctum Of Domination Ambient D",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_sanctum_of_domination_ambient_d.mp3",
        ["Id"] = 4204899,
        ["Length"] = 132,
        ["Artist"] = "D Arkenstone, G Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Sanctum Of Domination Ambient E",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_sanctum_of_domination_ambient_e.mp3",
        ["Id"] = 4204901,
        ["Length"] = 122,
        ["Artist"] = "D Arkenstone, G Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Sanctum Of Domination B",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_sanctum_of_domination_b.mp3",
        ["Id"] = 4204905,
        ["Length"] = 91,
        ["Artist"] = "D Arkenstone, G Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Sanctum Of Domination C",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_sanctum_of_domination_c.mp3",
        ["Id"] = 4204907,
        ["Length"] = 109,
        ["Artist"] = "D Arkenstone, G Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Sanctum Of Domination D",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_sanctum_of_domination_d.mp3",
        ["Id"] = 4204909,
        ["Length"] = 100,
        ["Artist"] = "D Arkenstone, G Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Sanctum Of Domination E",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_sanctum_of_domination_e.mp3",
        ["Id"] = 4204911,
        ["Length"] = 113,
        ["Artist"] = "D Arkenstone, G Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Sanctum Of Domination F",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_sanctum_of_domination_f.mp3",
        ["Id"] = 4204915,
        ["Length"] = 103,
        ["Artist"] = "D Arkenstone, G Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Sanctum Of Domination H",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_sanctum_of_domination_h.mp3",
        ["Id"] = 4204913,
        ["Length"] = 101,
        ["Artist"] = "D Arkenstone, G Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Anduin Takes Sigil",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_anduin_takes_sigil.mp3",
        ["Id"] = 4204815,
        ["Length"] = 40,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Anduins Goodbye",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_anduins_goodbye.mp3",
        ["Id"] = 4204811,
        ["Length"] = 93,
        ["Artist"] = "N Acree, D Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Ardenweald Dispelling Decoys",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_ardenweald_dispelling_decoys.mp3",
        ["Id"] = 4204809,
        ["Length"] = 41,
        ["Artist"] = "Jake Lefkowitz, Sam Cardon",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Ardenweald Sigil Restored",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_ardenweald_sigil_restored.mp3",
        ["Id"] = 4204813,
        ["Length"] = 75,
        ["Artist"] = "D Arkenstone, G Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Bastion Paragon Adrestes",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_bastion_paragon_adrestes.mp3",
        ["Id"] = 4204817,
        ["Length"] = 85,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Bastion Uther",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_bastion_uther.mp3",
        ["Id"] = 4204821,
        ["Length"] = 63,
        ["Artist"] = "Glenn Stafford, Tracy Bush",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Campaign Find Huln",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_campaign_find_huln.mp3",
        ["Id"] = 4204823,
        ["Length"] = 37,
        ["Artist"] = "J Lefkowitz, G Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Dreadqueen Reveals Herself",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_dreadqueen_reveals_herself.mp3",
        ["Id"] = 4204829,
        ["Length"] = 59,
        ["Artist"] = "Acree, Lefkowitz, Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Entry Into Korthia",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_entry_into_korthia.mp3",
        ["Id"] = 4204833,
        ["Length"] = 47,
        ["Artist"] = "Acree, Stafford, Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Eye Jailer Retreats",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_eye_jailer_retreats.mp3",
        ["Id"] = 4204831,
        ["Length"] = 48,
        ["Artist"] = "D Arkenstone, G Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Garroshs Fate",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_garroshs_fate.mp3",
        ["Id"] = 4204819,
        ["Length"] = 54,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Maw Assault Ardenweald",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_maw_assault_ardenweald.mp3",
        ["Id"] = 4204835,
        ["Length"] = 41,
        ["Artist"] = "N Acree, D Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Maw Assault Bastion",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_maw_assault_bastion.mp3",
        ["Id"] = 4204837,
        ["Length"] = 35,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Maw Assault Maldraxxus",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_maw_assault_maldraxxus.mp3",
        ["Id"] = 4204839,
        ["Length"] = 33,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Maw Assault Revendreth",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_maw_assault_revendreth.mp3",
        ["Id"] = 4204841,
        ["Length"] = 32,
        ["Artist"] = "J Lefkowitz, G Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Maw Escaping Helya",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_maw_escaping_helya.mp3",
        ["Id"] = 4204843,
        ["Length"] = 68,
        ["Artist"] = "Grant Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Necropolis Teleports Maw",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_necropolis_teleports_maw.mp3",
        ["Id"] = 4204845,
        ["Length"] = 23,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Primus Banishes Helya",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_primus_banishes_helya.mp3",
        ["Id"] = 4204847,
        ["Length"] = 33,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Primus Returns",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_primus_returns.mp3",
        ["Id"] = 4204825,
        ["Length"] = 81,
        ["Artist"] = "Acree, Stafford, Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Primus Sigil Lost",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_primus_sigil_lost.mp3",
        ["Id"] = 4204827,
        ["Length"] = 54,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Raid Sylvanas Final Transition",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_raid_sylvanas_final_transition.mp3",
        ["Id"] = 4204851,
        ["Length"] = 12,
        ["Artist"] = "D Arkenstone, G Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Raid Sylvanas Interstitial",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_raid_sylvanas_interstitial.mp3",
        ["Id"] = 4204849,
        ["Length"] = 36,
        ["Artist"] = "N Acree, D Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Saving Tyrande Ritual",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_saving_tyrande_ritual.mp3",
        ["Id"] = 4204855,
        ["Length"] = 36,
        ["Artist"] = "Pedro Macedo Camacho",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Sigil Of Venthyr",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_sigil_of_venthyr.mp3",
        ["Id"] = 4204853,
        ["Length"] = 33,
        ["Artist"] = "J Lefkowitz, G Kirkhope",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Temple Of Devotion",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_temple_of_devotion.mp3",
        ["Id"] = 4204857,
        ["Length"] = 103,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Voices Of Eternal",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_voices_of_eternal.mp3",
        ["Id"] = 4204859,
        ["Length"] = 122,
        ["Artist"] = "Neal Acree, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Scene Where Dreadlords Dare",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_scene_where_dreadlords_dare.mp3",
        ["Id"] = 4204861,
        ["Length"] = 48,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh A",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_a.mp3",
        ["Id"] = 4202746,
        ["Length"] = 35,
        ["Artist"] = "J Lefkowitz, Jeff Kurtenacker",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh B",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_b.mp3",
        ["Id"] = 4202748,
        ["Length"] = 34,
        ["Artist"] = "J Lefkowitz, Jeff Kurtenacker",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh C",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_c.mp3",
        ["Id"] = 4202750,
        ["Length"] = 13,
        ["Artist"] = "J Lefkowitz, Jeff Kurtenacker",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh D",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_d.mp3",
        ["Id"] = 4202752,
        ["Length"] = 17,
        ["Artist"] = "J Lefkowitz, Jeff Kurtenacker",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh H",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_h.mp3",
        ["Id"] = 4202754,
        ["Length"] = 34,
        ["Artist"] = "Jake Lefkowitz, Jeff Kurtenac",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Brass 1",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_brass_1.ogg",
        ["Id"] = 4202802,
        ["Length"] = 4,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Brass 2",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_brass_2.ogg",
        ["Id"] = 4202804,
        ["Length"] = 4,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Brass 3",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_brass_3.ogg",
        ["Id"] = 4202806,
        ["Length"] = 3,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Brass 4",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_brass_4.ogg",
        ["Id"] = 4202808,
        ["Length"] = 5,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Brass 5",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_brass_5.ogg",
        ["Id"] = 4202810,
        ["Length"] = 5,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Brass 6",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_brass_6.ogg",
        ["Id"] = 4202812,
        ["Length"] = 5,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Brass 7",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_brass_7.ogg",
        ["Id"] = 4202814,
        ["Length"] = 5,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Brass Magic 1",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_brass_magic_1.ogg",
        ["Id"] = 4202772,
        ["Length"] = 4,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Brass Magic 2",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_brass_magic_2.ogg",
        ["Id"] = 4202774,
        ["Length"] = 5,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Brass Magic 3",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_brass_magic_3.ogg",
        ["Id"] = 4202776,
        ["Length"] = 5,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Brass Magic 4",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_brass_magic_4.ogg",
        ["Id"] = 4202778,
        ["Length"] = 9,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Brass Magic 5",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_brass_magic_5.ogg",
        ["Id"] = 4202780,
        ["Length"] = 7,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Brass Magic 6",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_brass_magic_6.ogg",
        ["Id"] = 4202782,
        ["Length"] = 7,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Brass Magic 7",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_brass_magic_7.ogg",
        ["Id"] = 4202784,
        ["Length"] = 7,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Brass Magic 8",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_brass_magic_8.ogg",
        ["Id"] = 4202786,
        ["Length"] = 6,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Guitar 1",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_guitar_1.ogg",
        ["Id"] = 4202756,
        ["Length"] = 5,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Guitar 2",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_guitar_2.ogg",
        ["Id"] = 4202758,
        ["Length"] = 5,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Guitar 3",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_guitar_3.ogg",
        ["Id"] = 4202760,
        ["Length"] = 4,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Guitar 4",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_guitar_4.ogg",
        ["Id"] = 4202762,
        ["Length"] = 4,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Guitar 5",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_guitar_5.ogg",
        ["Id"] = 4202764,
        ["Length"] = 5,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Guitar 6",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_guitar_6.ogg",
        ["Id"] = 4202766,
        ["Length"] = 4,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Guitar 7",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_guitar_7.ogg",
        ["Id"] = 4202768,
        ["Length"] = 4,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Guitar 8",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_guitar_8.ogg",
        ["Id"] = 4202770,
        ["Length"] = 4,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Woodwind 1",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_woodwind_1.ogg",
        ["Id"] = 4202788,
        ["Length"] = 3,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Woodwind 2",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_woodwind_2.ogg",
        ["Id"] = 4202790,
        ["Length"] = 4,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Woodwind 3",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_woodwind_3.ogg",
        ["Id"] = 4202792,
        ["Length"] = 5,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Woodwind Ethnic 1",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_woodwind_ethnic_1.ogg",
        ["Id"] = 4202794,
        ["Length"] = 6,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Woodwind Ethnic 2",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_woodwind_ethnic_2.ogg",
        ["Id"] = 4202796,
        ["Length"] = 5,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Woodwind Ethnic 3",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_woodwind_ethnic_3.ogg",
        ["Id"] = 4202798,
        ["Length"] = 5,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Tazavesh Stinger Woodwind Ethnic 4",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_tazavesh_stinger_woodwind_ethnic_4.ogg",
        ["Id"] = 4202800,
        ["Length"] = 5,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Uther Devotion A",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_uther_devotion_a.mp3",
        ["Id"] = 4198337,
        ["Length"] = 108,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Uther Devotion B",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_uther_devotion_b.mp3",
        ["Id"] = 4198339,
        ["Length"] = 90,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Uther Devotion H",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_uther_devotion_h.mp3",
        ["Id"] = 4198341,
        ["Length"] = 107,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Uther Reflection A",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_uther_reflection_a.mp3",
        ["Id"] = 4198343,
        ["Length"] = 67,
        ["Artist"] = "Glenn Stafford, Tracy Bush",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Uther Reflection B",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_uther_reflection_b.mp3",
        ["Id"] = 4198345,
        ["Length"] = 51,
        ["Artist"] = "Glenn Stafford, Tracy Bush",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Uther Reflection C",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_uther_reflection_c.mp3",
        ["Id"] = 4198347,
        ["Length"] = 76,
        ["Artist"] = "Glenn Stafford, Tracy Bush",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Uther Reflection D",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_uther_reflection_d.mp3",
        ["Id"] = 4198349,
        ["Length"] = 49,
        ["Artist"] = "Glenn Stafford, Tracy Bush",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Uther Reflection H",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_uther_reflection_h.mp3",
        ["Id"] = 4198351,
        ["Length"] = 123,
        ["Artist"] = "Glenn Stafford, Tracy Bush",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Veiled Market A",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_veiled_market_a.mp3",
        ["Id"] = 4204867,
        ["Length"] = 28,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Veiled Market B",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_veiled_market_b.mp3",
        ["Id"] = 4204869,
        ["Length"] = 47,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Veiled Market C",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_veiled_market_c.mp3",
        ["Id"] = 4204871,
        ["Length"] = 30,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Veiled Market D",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_veiled_market_d.mp3",
        ["Id"] = 4204873,
        ["Length"] = 28,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.1.0 Shadowlands",
        ["Song"] = "Veiled Market E",
        ["Name"] = "sound\\music\\shadowlands\\mus_91_veiled_market_e.mp3",
        ["Id"] = 4204875,
        ["Length"] = 17,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Anduin Moment Sylvanas",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_anduin_moment_sylvanas.mp3",
        ["Id"] = 4423198,
        ["Length"] = 22,
        ["Artist"] = "Sam Cardon",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Anduin Moment Uther",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_anduin_moment_uther.mp3",
        ["Id"] = 4423202,
        ["Length"] = 23,
        ["Artist"] = "Tracy Bush",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Celestial Battle A",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_celestial_battle_a.mp3",
        ["Id"] = 4423088,
        ["Length"] = 115,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Celestial Battle B",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_celestial_battle_b.mp3",
        ["Id"] = 4423090,
        ["Length"] = 123,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Celestial Battle C",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_celestial_battle_c.mp3",
        ["Id"] = 4423092,
        ["Length"] = 130,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Celestial Battle D",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_celestial_battle_d.mp3",
        ["Id"] = 4423094,
        ["Length"] = 120,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Celestial Battle Domination A",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_celestial_battle_domination_a.mp3",
        ["Id"] = 4423096,
        ["Length"] = 111,
        ["Artist"] = "Jake Lefkowitz; Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Celestial Battle Domination B",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_celestial_battle_domination_b.mp3",
        ["Id"] = 4423098,
        ["Length"] = 104,
        ["Artist"] = "Jake Lefkowitz; Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Celestial Battle Domination C",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_celestial_battle_domination_c.mp3",
        ["Id"] = 4423100,
        ["Length"] = 110,
        ["Artist"] = "Jake Lefkowitz; Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Celestial Battle Domination D",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_celestial_battle_domination_d.mp3",
        ["Id"] = 4423102,
        ["Length"] = 105,
        ["Artist"] = "Jake Lefkowitz; Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Celestial Battle E",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_celestial_battle_e.mp3",
        ["Id"] = 4423104,
        ["Length"] = 128,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Celestial Battle F",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_celestial_battle_f.mp3",
        ["Id"] = 4423106,
        ["Length"] = 135,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Celestial Battle G",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_celestial_battle_g.mp3",
        ["Id"] = 4423108,
        ["Length"] = 135,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Celestial Battle H",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_celestial_battle_h.mp3",
        ["Id"] = 4423110,
        ["Length"] = 175,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Celestial Battle I",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_celestial_battle_i.mp3",
        ["Id"] = 4423112,
        ["Length"] = 133,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Celestial Battle Unbroken A",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_celestial_battle_unbroken_a.mp3",
        ["Id"] = 4423120,
        ["Length"] = 98,
        ["Artist"] = "J. Lefkowitz, G. Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Celestial Battle Unbroken B",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_celestial_battle_unbroken_b.mp3",
        ["Id"] = 4423122,
        ["Length"] = 95,
        ["Artist"] = "J. Lefkowitz, G. Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Celestial Battle Unbroken C",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_celestial_battle_unbroken_c.mp3",
        ["Id"] = 4423124,
        ["Length"] = 80,
        ["Artist"] = "J. Lefkowitz, G. Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Celestial Battle Unbroken D",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_celestial_battle_unbroken_d.mp3",
        ["Id"] = 4423126,
        ["Length"] = 123,
        ["Artist"] = "J. Lefkowitz, G. Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Celestial Battle Unbroken E",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_celestial_battle_unbroken_e.mp3",
        ["Id"] = 4423128,
        ["Length"] = 88,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Compassion H1",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_compassion_h1.mp3",
        ["Id"] = 4438827,
        ["Length"] = 141,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Compassion H2",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_compassion_h2.mp3",
        ["Id"] = 4438829,
        ["Length"] = 141,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Cosmic Crypts A",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_cosmic_crypts_a.mp3",
        ["Id"] = 4423212,
        ["Length"] = 124,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Cosmic Crypts B",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_cosmic_crypts_b.mp3",
        ["Id"] = 4423214,
        ["Length"] = 112,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Cosmic Crypts C",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_cosmic_crypts_c.mp3",
        ["Id"] = 4423216,
        ["Length"] = 118,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Cosmic Crypts H",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_cosmic_crypts_h.mp3",
        ["Id"] = 4423218,
        ["Length"] = 160,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Creation Catalyst A",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_creation_catalyst_a.mp3",
        ["Id"] = 4423220,
        ["Length"] = 112,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Creation Catalyst B",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_creation_catalyst_b.mp3",
        ["Id"] = 4423222,
        ["Length"] = 135,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Creation Catalyst H",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_creation_catalyst_h.mp3",
        ["Id"] = 4423224,
        ["Length"] = 171,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Darkmoondance Calltoarms Fail",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_darkmoondance_calltoarms_fail.mp3",
        ["Id"] = 4438805,
        ["Length"] = 8,
        ["Artist"] = "Glenn Stafford, Jason Hayes",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Darkmoondance Calltoarms H",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_darkmoondance_calltoarms_h.mp3",
        ["Id"] = 4438803,
        ["Length"] = 82,
        ["Artist"] = "Glenn Stafford, Jason Hayes",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Darkmoondance Calltoarms Pass",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_darkmoondance_calltoarms_pass.mp3",
        ["Id"] = 4438807,
        ["Length"] = 11,
        ["Artist"] = "Glenn Stafford, Jason Hayes",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Darkmoondance Calltoarms Victory",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_darkmoondance_calltoarms_victory.mp3",
        ["Id"] = 4438809,
        ["Length"] = 9,
        ["Artist"] = "Glenn Stafford, Jason Hayes",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Darkmoondance Lionspride Fail",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_darkmoondance_lionspride_fail.mp3",
        ["Id"] = 4438813,
        ["Length"] = 10,
        ["Artist"] = "David Arkenstone, Jason Hayes",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Darkmoondance Lionspride H",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_darkmoondance_lionspride_h.mp3",
        ["Id"] = 4438811,
        ["Length"] = 80,
        ["Artist"] = "David Arkenstone, Jason Hayes",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Darkmoondance Lionspride Pass",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_darkmoondance_lionspride_pass.mp3",
        ["Id"] = 4438815,
        ["Length"] = 11,
        ["Artist"] = "David Arkenstone, Jason Hayes",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Darkmoondance Lionspride Victory",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_darkmoondance_lionspride_victory.mp3",
        ["Id"] = 4438817,
        ["Length"] = 11,
        ["Artist"] = "David Arkenstone, Jason Hayes",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Darkmoondance Prideoftheseas Fail",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_darkmoondance_prideoftheseas_fail.mp3",
        ["Id"] = 4438821,
        ["Length"] = 9,
        ["Artist"] = "Sam Cardon",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Darkmoondance Prideoftheseas H",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_darkmoondance_prideoftheseas_h.mp3",
        ["Id"] = 4438819,
        ["Length"] = 80,
        ["Artist"] = "Sam Cardon",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Darkmoondance Prideoftheseas Pass",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_darkmoondance_prideoftheseas_pass.mp3",
        ["Id"] = 4438823,
        ["Length"] = 8,
        ["Artist"] = "Sam Cardon",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Darkmoondance Prideoftheseas Victory",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_darkmoondance_prideoftheseas_victory.mp3",
        ["Id"] = 4438825,
        ["Length"] = 8,
        ["Artist"] = "Sam Cardon",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Domination Anduin Action A",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_domination_anduin_action_a.mp3",
        ["Id"] = 4423076,
        ["Length"] = 103,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Domination Anduin Action B",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_domination_anduin_action_b.mp3",
        ["Id"] = 4423078,
        ["Length"] = 105,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Domination Anduin Action C",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_domination_anduin_action_c.mp3",
        ["Id"] = 4423080,
        ["Length"] = 105,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Domination Anduin Ambient A",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_domination_anduin_ambient_a.mp3",
        ["Id"] = 4423082,
        ["Length"] = 64,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Domination Anduin Ambient B",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_domination_anduin_ambient_b.mp3",
        ["Id"] = 4423084,
        ["Length"] = 64,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Domination Anduin Ambient C",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_domination_anduin_ambient_c.mp3",
        ["Id"] = 4423086,
        ["Length"] = 63,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Domination Point H1",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_domination_point_h1.mp3",
        ["Id"] = 4423184,
        ["Length"] = 114,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Domination Point H2",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_domination_point_h2.mp3",
        ["Id"] = 4423186,
        ["Length"] = 113,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Ephemeral Plains A",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_ephemeral_plains_a.mp3",
        ["Id"] = 4423130,
        ["Length"] = 117,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Ephemeral Plains B",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_ephemeral_plains_b.mp3",
        ["Id"] = 4423132,
        ["Length"] = 129,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Ephemeral Plains C",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_ephemeral_plains_c.mp3",
        ["Id"] = 4423134,
        ["Length"] = 132,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Ephemeral Plains D",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_ephemeral_plains_d.mp3",
        ["Id"] = 4423136,
        ["Length"] = 108,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Ephemeral Plains E",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_ephemeral_plains_e.mp3",
        ["Id"] = 4423138,
        ["Length"] = 114,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Ephemeral Plains F",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_ephemeral_plains_f.mp3",
        ["Id"] = 4423140,
        ["Length"] = 134,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Ephemeral Plains G",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_ephemeral_plains_g.mp3",
        ["Id"] = 4423142,
        ["Length"] = 139,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Ephemeral Plains H",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_ephemeral_plains_h.mp3",
        ["Id"] = 4423144,
        ["Length"] = 178,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Ephemeral Plains I",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_ephemeral_plains_i.mp3",
        ["Id"] = 4423146,
        ["Length"] = 109,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Ephemeral Plains Stinger",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_ephemeral_plains_stinger.mp3",
        ["Id"] = 4423148,
        ["Length"] = 33,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Forge Of Afterlives A",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_forge_of_afterlives_a.mp3",
        ["Id"] = 4423226,
        ["Length"] = 70,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Forge Of Afterlives B",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_forge_of_afterlives_b.mp3",
        ["Id"] = 4423228,
        ["Length"] = 69,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Forge Of Afterlives C",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_forge_of_afterlives_c.mp3",
        ["Id"] = 4423230,
        ["Length"] = 43,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Forge Of Afterlives D",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_forge_of_afterlives_d.mp3",
        ["Id"] = 4423232,
        ["Length"] = 65,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Forge Of Afterlives E",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_forge_of_afterlives_e.mp3",
        ["Id"] = 4423234,
        ["Length"] = 95,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Forge Of Afterlives F",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_forge_of_afterlives_f.mp3",
        ["Id"] = 4423236,
        ["Length"] = 43,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Forge Of Afterlives G",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_forge_of_afterlives_g.mp3",
        ["Id"] = 4467524,
        ["Length"] = 114,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Forge Of Afterlives H",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_forge_of_afterlives_h.mp3",
        ["Id"] = 4423238,
        ["Length"] = 169,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Forge Of Afterlives I",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_forge_of_afterlives_i.mp3",
        ["Id"] = 4467526,
        ["Length"] = 66,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Forge Of Afterlives J",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_forge_of_afterlives_j.mp3",
        ["Id"] = 4467528,
        ["Length"] = 86,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Found In Faith A",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_found_in_faith_a.mp3",
        ["Id"] = 4423240,
        ["Length"] = 139,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Found In Faith B",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_found_in_faith_b.mp3",
        ["Id"] = 4423242,
        ["Length"] = 137,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Found In Faith C",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_found_in_faith_c.mp3",
        ["Id"] = 4423276,
        ["Length"] = 144,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Found In Faith H",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_found_in_faith_h.mp3",
        ["Id"] = 4423244,
        ["Length"] = 148,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Grand Design A",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_grand_design_a.mp3",
        ["Id"] = 4423154,
        ["Length"] = 123,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Grand Design B",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_grand_design_b.mp3",
        ["Id"] = 4423156,
        ["Length"] = 134,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Grand Design C",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_grand_design_c.mp3",
        ["Id"] = 4423158,
        ["Length"] = 144,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Grand Design D",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_grand_design_d.mp3",
        ["Id"] = 4423160,
        ["Length"] = 129,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Grand Design E",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_grand_design_e.mp3",
        ["Id"] = 4423162,
        ["Length"] = 119,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Grand Design F",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_grand_design_f.mp3",
        ["Id"] = 4423164,
        ["Length"] = 123,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Grand Design G",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_grand_design_g.mp3",
        ["Id"] = 4423166,
        ["Length"] = 124,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Grand Design H",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_grand_design_h.mp3",
        ["Id"] = 4479075,
        ["Length"] = 214,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Grand Design I",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_grand_design_i.mp3",
        ["Id"] = 4423168,
        ["Length"] = 130,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Grand Design J",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_grand_design_j.mp3",
        ["Id"] = 4423172,
        ["Length"] = 116,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Grand Design K",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_grand_design_k.mp3",
        ["Id"] = 4423174,
        ["Length"] = 134,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Grand Design Stinger",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_grand_design_stinger.mp3",
        ["Id"] = 4423178,
        ["Length"] = 17,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Inside The Crypts A",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_inside_the_crypts_a.mp3",
        ["Id"] = 4423278,
        ["Length"] = 111,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Inside The Crypts B",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_inside_the_crypts_b.mp3",
        ["Id"] = 4423280,
        ["Length"] = 120,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Inside The Crypts H",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_inside_the_crypts_h.mp3",
        ["Id"] = 4423282,
        ["Length"] = 127,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Jailers Chain A",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_jailers_chain_a.mp3",
        ["Id"] = 4423294,
        ["Length"] = 117,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Jailers Chain B",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_jailers_chain_b.mp3",
        ["Id"] = 4423296,
        ["Length"] = 116,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Jailers Chain H",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_jailers_chain_h.mp3",
        ["Id"] = 4423298,
        ["Length"] = 179,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Lexical Glades A",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_lexical_glades_a.mp3",
        ["Id"] = 4423300,
        ["Length"] = 145,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Lexical Glades B",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_lexical_glades_b.mp3",
        ["Id"] = 4423302,
        ["Length"] = 121,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Lexical Glades H",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_lexical_glades_h.mp3",
        ["Id"] = 4423304,
        ["Length"] = 129,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Scene Architect Battle",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_scene_architect_battle.mp3",
        ["Id"] = 4423262,
        ["Length"] = 63,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Scene Domination Anduin",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_scene_domination_anduin.mp3",
        ["Id"] = 4423274,
        ["Length"] = 63,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Scene Drake Flight",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_scene_drake_flight.mp3",
        ["Id"] = 4423270,
        ["Length"] = 44,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Scene General Draven",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_scene_general_draven.mp3",
        ["Id"] = 4423252,
        ["Length"] = 53,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Scene Jailer Arrival Zereth",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_scene_jailer_arrival_zereth.mp3",
        ["Id"] = 4423246,
        ["Length"] = 44,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Scene Oracle Creates Pocopoc",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_scene_oracle_creates_pocopoc.mp3",
        ["Id"] = 4423248,
        ["Length"] = 36,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Scene Oracle Opens Sepulcher",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_scene_oracle_opens_sepulcher.mp3",
        ["Id"] = 4423250,
        ["Length"] = 63,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Scene Pelagos Transformation",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_scene_pelagos_transformation.mp3",
        ["Id"] = 4423264,
        ["Length"] = 71,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Scene Pocopoc Introduction",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_scene_pocopoc_introduction.mp3",
        ["Id"] = 4423254,
        ["Length"] = 24,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Scene Portal To Zereth",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_scene_portal_to_zereth.mp3",
        ["Id"] = 4423266,
        ["Length"] = 77,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Scene Pre Jailer",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_scene_pre_jailer.mp3",
        ["Id"] = 4423256,
        ["Length"] = 21,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Scene Reforging The Helm",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_scene_reforging_the_helm.mp3",
        ["Id"] = 4423268,
        ["Length"] = 51,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Scene Revelation",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_scene_revelation.mp3",
        ["Id"] = 4423260,
        ["Length"] = 55,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Scene Sylvanas Free Will",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_scene_sylvanas_free_will.mp3",
        ["Id"] = 4423272,
        ["Length"] = 83,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Scene Sylvanas Judgement Pt1",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_scene_sylvanas_judgement_pt1.mp3",
        ["Id"] = 4438838,
        ["Length"] = 115,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Scene Sylvanas Judgement Pt2",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_scene_sylvanas_judgement_pt2.mp3",
        ["Id"] = 4438836,
        ["Length"] = 138,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Scene Worldbreaker Appears",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_scene_worldbreaker_appears.mp3",
        ["Id"] = 4423258,
        ["Length"] = 36,
        ["Artist"] = "Blizzard Entertainment",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Untamed Verdure A",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_untamed_verdure_a.mp3",
        ["Id"] = 4423328,
        ["Length"] = 125,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Untamed Verdure B",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_untamed_verdure_b.mp3",
        ["Id"] = 4423330,
        ["Length"] = 144,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Untamed Verdure H",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_untamed_verdure_h.mp3",
        ["Id"] = 4423332,
        ["Length"] = 167,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Winds Of Verdure A",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_winds_of_verdure_a.mp3",
        ["Id"] = 4423334,
        ["Length"] = 99,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Winds Of Verdure B",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_winds_of_verdure_b.mp3",
        ["Id"] = 4423336,
        ["Length"] = 134,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Winds Of Verdure H",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_winds_of_verdure_h.mp3",
        ["Id"] = 4423338,
        ["Length"] = 140,
        ["Artist"] = "Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Zereth Mortis Barren A",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_zereth_mortis_barren_a.mp3",
        ["Id"] = 4423204,
        ["Length"] = 204,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Zereth Mortis Barren B",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_zereth_mortis_barren_b.mp3",
        ["Id"] = 4423206,
        ["Length"] = 116,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Zereth Mortis Barren C",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_zereth_mortis_barren_c.mp3",
        ["Id"] = 4423208,
        ["Length"] = 136,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Zereth Mortis Barren H",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_zereth_mortis_barren_h.mp3",
        ["Id"] = 4423210,
        ["Length"] = 197,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Zereth Mortis Intro A",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_zereth_mortis_intro_a.mp3",
        ["Id"] = 4423284,
        ["Length"] = 68,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Zereth Mortis Intro B",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_zereth_mortis_intro_b.mp3",
        ["Id"] = 4423286,
        ["Length"] = 148,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Zereth Mortis Intro C",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_zereth_mortis_intro_c.mp3",
        ["Id"] = 4423288,
        ["Length"] = 132,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Zereth Mortis Intro D",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_zereth_mortis_intro_d.mp3",
        ["Id"] = 4423290,
        ["Length"] = 132,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Zereth Mortis Intro H",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_zereth_mortis_intro_h.mp3",
        ["Id"] = 4423292,
        ["Length"] = 250,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Zereth Mortis Mystery A",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_zereth_mortis_mystery_a.mp3",
        ["Id"] = 4423306,
        ["Length"] = 94,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Zereth Mortis Mystery B",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_zereth_mortis_mystery_b.mp3",
        ["Id"] = 4423308,
        ["Length"] = 164,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Zereth Mortis Mystery H",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_zereth_mortis_mystery_h.mp3",
        ["Id"] = 4423310,
        ["Length"] = 105,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Zereth Mortis Tranquility A",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_zereth_mortis_tranquility_a.mp3",
        ["Id"] = 4423312,
        ["Length"] = 41,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Zereth Mortis Tranquility B",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_zereth_mortis_tranquility_b.mp3",
        ["Id"] = 4423314,
        ["Length"] = 108,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Zereth Mortis Tranquility C",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_zereth_mortis_tranquility_c.mp3",
        ["Id"] = 4423316,
        ["Length"] = 70,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Zereth Mortis Tranquility D",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_zereth_mortis_tranquility_d.mp3",
        ["Id"] = 4423318,
        ["Length"] = 104,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Zereth Mortis Tranquility E",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_zereth_mortis_tranquility_e.mp3",
        ["Id"] = 4423320,
        ["Length"] = 162,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Zereth Mortis Tranquility F",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_zereth_mortis_tranquility_f.mp3",
        ["Id"] = 4423322,
        ["Length"] = 165,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Zereth Mortis Tranquility G",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_zereth_mortis_tranquility_g.mp3",
        ["Id"] = 4423326,
        ["Length"] = 178,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.0 Shadowlands",
        ["Song"] = "Zereth Mortis Tranquility H",
        ["Name"] = "sound\\music\\shadowlands\\mus_92_zereth_mortis_tranquility_h.mp3",
        ["Id"] = 4423324,
        ["Length"] = 164,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.5 Shadowlands",
        ["Song"] = "Highborne",
        ["Name"] = "sound\\music\\shadowlands\\mus_925_highborne.mp3",
        ["Id"] = 4543971,
        ["Length"] = 45,
        ["Artist"] = "R Brower, Derek Duke",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.5 Shadowlands",
        ["Song"] = "Scene Anduin Sylvanas Epilogue",
        ["Name"] = "sound\\music\\shadowlands\\mus_925_scene_anduin_sylvanas_epilogue.mp3",
        ["Id"] = 4547329,
        ["Length"] = 159,
        ["Artist"] = "G Stafford, J Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.5 Shadowlands",
        ["Song"] = "Scene Lilian Calia",
        ["Name"] = "sound\\music\\shadowlands\\mus_925_scene_lilian_calia.mp3",
        ["Id"] = 4547331,
        ["Length"] = 112,
        ["Artist"] = "Adam Burgess",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.2.5 Shadowlands",
        ["Song"] = "Scene Queens Gift",
        ["Name"] = "sound\\music\\shadowlands\\mus_925_scene_queens_gift.mp3",
        ["Id"] = 4547335,
        ["Length"] = 150,
        ["Artist"] = "G Stafford, D Arkenstone",
        ["Wow"] = "true"
    }
}

if LE_EXPANSION_LEVEL_CURRENT > 7 then
    EpicMusicPlayer:AddPlayList("Shadowlands", Shadowlands, false, true)
end