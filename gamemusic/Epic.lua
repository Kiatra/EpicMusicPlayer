local _, _, _, tocversion = GetBuildInfo()
if tocversion < 80200 then return end

local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")

local BestofWoW = {
  ["listName"] = L["Epic"],
  ["playlistVersion"] = "4.0",
  ["locked"] =  "true",
  {
    ["Album"] = "WarCraft III Expansion",
    ["Song"] = "Power Of The Horde",
    ["Name"] = "Sound\\Music\\ZoneMusic\\DMF_L70ETC01.mp3",
    ["Id"] = 53438,
    ["Length"] = 282,
    ["Artist"] =  "Tenth Level Tauren Chieftain",
    ["WoW"] = true,
  }, -- [2]
  {
    ["Album"] = "WoW Main Theme",
    ["Song"] = "Main Title - Vanilla",
    ["Name"] = "Sound\\Music\\GlueScreenMusic\\wow_main_theme.mp3",
    ["Id"] = 53223,
    ["Length"] = 161,
    ["Artist"] =  "Main Title",
    ["WoW"] = true,
  }, -- [3]
  {
    ["Album"] = "BC Main Theme",
    ["Song"] = "Main Title - The Burning Legion",
    ["Name"] = "Sound\\Music\\GlueScreenMusic\\BC_main_theme.mp3",
    ["Id"] = 53220,
    ["Length"] = 226,
    ["Artist"] =  "",
    ["WoW"] = true,
  }, -- [4]
  {
    ["Album"] = "WotLK Main Theme",
    ["Song"] = "Main Title - Wrath of the Lich King",
    ["Name"] = "Sound\\Music\\GlueScreenMusic\\WotLK_main_title.mp3",
    ["Id"] = 53222,
    ["Length"] = 544,
    ["Artist"] =  "",
    ["WoW"] = true,
  }, -- [5]
  {
    ["Album"] = "The Shattering",
    ["Song"] = "Main Title - Cataclysm",
    ["Name"] = "Sound\\Music\\cataclysm\\MUS_Shattering_UU01.mp3",
    ["Id"] = 441737,
    ["Length"] = 725,
    ["Artist"] =  "",
    ["WoW"] = true,
  }, -- [6]
  {
    ["Album"] = "Heart of Pandaria",
    ["Song"] = "Main Title - Mists of Pandaria",
    ["Name"] = "Sound\\Music\\Pandaria\\MUS_50_HeartofPandaria_01.mp3",
    ["Id"] = 625753,
    ["Length"] = 480,
    ["Artist"] =  "",
    ["WoW"] = true,
  }, -- [7]
  {
    ["Album"] = "A Siege of Worlds",
    ["Song"] = "Main Title - Warlords of Dreanor",
    ["Name"] = "Sound\\Music\\Draenor\\MUS_60_ASiegeofWorlds_MainTitle.mp3",
    ["Id"] = 1042428,
    ["Length"] = 726,
    ["Artist"] =  "",
    ["WoW"] = true,
  },
  {
    ["Album"] = "Kingdoms Will Burn",
    ["Song"] = "Main Title - Legion",
    ["Name"] = "Sound\\music\\Legion\\MUS_70_Kingdomswillburn_MainTitle.mp3",
    ["Id"] = 1496267,
    ["Length"] = 650,
    ["Artist"] = "",
    ["WoW"] = true,
  },
  {
	["Album"] = "Before the Storm",
	["Song"] = "Main Title - Battle for Azeroth",
	["Name"] = "sound\\music\\battleforazeroth\\mus_80_beforethestorm_maintitle.mp3",
    ["Id"] = 2146580,
	["Length"] = 677,
	["Artist"] = "",
	["WoW"] =  "true",
  },
  {
    ["Album"] = "WoWX5",
    ["Song"] = "Gecko_2_V1",
    ["Name"] = "Sound\\Music\\ZoneMusic\\WanderingIsle\\MUS_50_WanderingIsleB_Hero_UU01.mp3",
    ["Id"] = 574908,
    ["Length"] = 135,
    ["Artist"] =  "WanderingIsle (Neal Acree)",
    ["WoW"] = true,
  }, -- [8]
  {
    ["Album"] = "",
    ["Song"] = "Valley of the Four Winds H",
    ["Name"] = "Sound\\Music\\Pandaria\\MUS_50_BalloonRide_Hero_01.mp3",
    ["Id"] = 642176,
    ["Length"] = 169,
    ["Artist"] =  "Pandaria",
    ["WoW"] = true,
  }, -- [9]
  {
    ["Album"] = "WoW 5",
    ["Song"] = "Song of Liulang Orch plus Vox 1H",
    ["Name"] = "Sound\\Music\\Pandaria\\MUS_50_SongofLiulang_VOX_Hero_01.mp3",
    ["Id"] = 642577,
    ["Length"] = 170,
    ["Artist"] =  "Pandaria (Russell Brower)",
    ["WoW"] = true,
  }, -- [10]
  {
    ["Album"] = "",
    ["Song"] = "MUS_50_SerpentRiders_SerpentRace",
    ["Name"] = "Sound\\Music\\Pandaria\\MUS_50_SerpentRiders_SerpentRace.mp3",
    ["Id"] = 653741,
    ["Length"] = 238,
    ["Artist"] =  "Pandaria",
    ["WoW"] = true,
  }, -- [11]
  {
    ["Album"] = "",
    ["Song"] = "Ginsu Valor 3H",
    ["Name"] = "Sound\\Music\\Pandaria\\MUS_50_ShadoPan_A_Hero_03.mp3",
    ["Id"] = 642268,
    ["Length"] = 172,
    ["Artist"] =  "Pandaria",
    ["WoW"] = true,
  }, -- [12]
  {
    ["Album"] = "",
    ["Song"] = "WoW Cardon 4 Strings",
    ["Name"] = "Sound\\Music\\Pandaria\\MUS_50_ShadoPan_A_Walk_02.mp3",
    ["Id"] = 644930,
    ["Length"] = 66,
    ["Artist"] =  "Pandaria",
    ["WoW"] = true,
  }, -- [13]
  {
    ["Album"] = "",
    ["Song"] = "Way of the Monk v2",
    ["Name"] = "Sound\\Music\\Pandaria\\MUS_50_Monk_Windwalker_A_01.mp3",
    ["Id"] = 642243,
    ["Length"] = 157,
    ["Artist"] =  "Pandaria",
    ["WoW"] = true,
  }, -- [14]
  {
    ["Album"] = "",
    ["Song"] = "Night Elves 1",
    ["Name"] = "Sound\\Music\\cataclysm\\MUS_NightElves_GU01.mp3",
    ["Id"] = 441705,
    ["Length"] = 160,
    ["Artist"] =  "cataclysm (Neal Acree)",
    ["WoW"] = true,
  }, -- [15]
  {
    ["Album"] = "",
    ["Song"] = "Sunwell Flyby",
    ["Name"] = "Sound\\Music\\ZoneMusic\\Sunwell\\SW_SunwellFlybyUni01.mp3",
    ["Id"] = 53733,
    ["Length"] = 57,
    ["Artist"] =  "Sunwell (Russell Brower)",
    ["WoW"] = true,
  }, -- [16]
  {
    ["Album"] = "",
    ["Song"] = "CT_BrazensFlightIntroUni",
    ["Name"] = "Sound\\Music\\ZoneMusic\\CavernsOfTime\\CT_BrazensFlightIntroUni.mp3",
    ["Id"] = 53379,
    ["Length"] = 93,
    ["Artist"] =  "CavernsOfTime (Russell Brower)",
    ["WoW"] = true,
  }, -- [17]
  {
    ["Album"] = "",
    ["Song"] = "CT_DurnholdeKeepExtWalk3Uni",
    ["Name"] = "Sound\\Music\\ZoneMusic\\CavernsOfTime\\CT_DurnholdeKeepExtWalk3Uni.mp3",
    ["Id"] = 53394,
    ["Length"] = 70,
    ["Artist"] =  "CavernsOfTime (Russell Brower)",
    ["WoW"] = true,
  }, -- [18]
  {
    ["Album"] = "",
    ["Song"] = "CT_EscapeDurnIntroUni",
    ["Name"] = "Sound\\Music\\ZoneMusic\\CavernsOfTime\\CT_EscapeDurnIntroUni.mp3",
    ["Id"] = 53401,
    ["Length"] = 112,
    ["Artist"] =  "CavernsOfTime (Russell Brower)",
    ["WoW"] = true,
  }, -- [19]
  {
    ["Album"] = "",
    ["Song"] = "CT_HillsbradExtWalk2Uni",
    ["Name"] = "Sound\\Music\\ZoneMusic\\CavernsOfTime\\CT_HillsbradExtWalk2Uni.mp3",
    ["Id"] = 53403,
    ["Length"] = 56,
    ["Artist"] =  "CavernsOfTime (Jason Hayes)",
    ["WoW"] = true,
  }, -- [20]
  {
    ["Album"] = "",
    ["Song"] = "CT_HyjalExtWalk7Uni",
    ["Name"] = "Sound\\Music\\ZoneMusic\\CavernsOfTime\\CT_HyjalExtWalk7Uni.mp3",
    ["Id"] = 53404,
    ["Length"] = 66,
    ["Artist"] =  "CavernsOfTime (Jason Hayes)",
    ["WoW"] = true,
  }, -- [21]
  {
    ["Album"] = "",
    ["Song"] = "CT_HyjalExtWalk8Uni",
    ["Name"] = "Sound\\Music\\ZoneMusic\\CavernsOfTime\\CT_HyjalExtWalk8Uni.mp3",
    ["Id"] = 53405,
    ["Length"] = 70,
    ["Artist"] =  "CavernsOfTime (Jason Hayes)",
    ["WoW"] = true,
  }, -- [22]
  {
    ["Album"] = "",
    ["Song"] = "CT_StratholmePastAlleyIntro",
    ["Name"] = "Sound\\Music\\ZoneMusic\\StratholmePast\\CT_StratholmePastAlleyIntro.mp3",
    ["Id"] = 229969,
    ["Length"] = 99,
    ["Artist"] =  "StratholmePast",
    ["WoW"] = true,
  }, -- [23]
  {
    ["Album"] = "",
    ["Song"] = "CT_ThrallEscapeIntroUni",
    ["Name"] = "Sound\\Music\\ZoneMusic\\CavernsOfTime\\CT_ThrallEscapeIntroUni.mp3",
    ["Id"] = 53425,
    ["Length"] = 45,
    ["Artist"] =  "CavernsOfTime (Russell Brower)",
    ["WoW"] = true,
  }, -- [24]
  {
    ["Album"] = "",
    ["Song"] = "Fire Festival",
    ["Name"] = "Sound\\Music\\WorldEvents\\AllianceFirepole.mp3",
    ["Id"] = 53255,
    ["Length"] = 68,
    ["Artist"] =  "WorldEvents (David Arkenstone)",
    ["WoW"] = true,
  }, -- [25]
  {
    ["Album"] = "",
    ["Song"] = "Joust",
    ["Name"] = "Sound\\Music\\ZoneMusic\\ArgentTournament\\AT_JoustEvent.mp3",
    ["Id"] = 303111,
    ["Length"] = 123,
    ["Artist"] =  "ArgentTournament (David Arkenstone)",
    ["WoW"] = true,
  }, -- [26]
  {
    ["Album"] = "",
    ["Song"] = "battle01",
    ["Name"] = "Sound\\Music\\Musical Moments\\battle\\battle01.mp3",
    ["Id"] = 53225,
    ["Length"] = 48,
    ["Artist"] =  "battle",
    ["WoW"] = true,
  }, -- [27]
  {
    ["Album"] = "",
    ["Song"] = "EnchantedForest01",
    ["Name"] = "Sound\\Music\\ZoneMusic\\EnchantedForest\\EnchantedForest01.mp3",
    ["Id"] = 53453,
    ["Length"] = 50,
    ["Artist"] =  "EnchantedForest (Jason Hayes)",
    ["WoW"] = true,
  }, -- [28]
  {
    ["Album"] = "",
    ["Song"] = "Dalaran 1",
    ["Name"] = "Sound\\Music\\ZoneMusic\\Dalaran\\DC_GeneralWalkUni01.mp3",
    ["Id"] = 229800,
    ["Length"] = 67,
    ["Artist"] =  "Dalaran (Russell Brower)",
    ["WoW"] = true,
  }, -- [29]
  {
    ["Album"] = "",
    ["Song"] = "Dalaran Intro",
    ["Name"] = "Sound\\Music\\ZoneMusic\\Dalaran\\DC_IntroUni01.mp3",
    ["Id"] = 229804,
    ["Length"] = 68,
    ["Artist"] =  "Dalaran (Russell Brower)",
    ["WoW"] = true,
  }, -- [30]
  {
    ["Album"] = "",
    ["Song"] = "Ebon Hold 1",
    ["Name"] = "Sound\\Music\\ZoneMusic\\Ebon Hold\\EH_GeneralWalkUni01.mp3",
    ["Id"] = 229831,
    ["Length"] = 82,
    ["Artist"] =  "Ebon Hold (Russell Brower)",
    ["WoW"] = true,
  }, -- [31]
  {
    ["Album"] = "",
    ["Song"] = "Assault 2",
    ["Name"] = "Sound\\Music\\ZoneMusic\\Ebon Hold\\EH_AssaultUni02.mp3",
    ["Id"] = 229825,
    ["Length"] = 70,
    ["Artist"] =  "Ebon Hold (Russell Brower)",
    ["WoW"] = true,
  }, -- [32]
  {
    ["Album"] = "",
    ["Song"] = "Gates_9",
    ["Name"] = "Sound\\Music\\ZoneMusic\\BlackTemple\\BT_IllidariWalkHero09.mp3",
    ["Id"] = 53309,
    ["Length"] = 74,
    ["Artist"] =  "BlackTemple (Russell Brower)",
    ["WoW"] = true,
  }, -- [33]
  {
    ["Album"] = "",
    ["Song"] = "GH1 Harpa",
    ["Name"] = "Sound\\Music\\ZoneMusic\\GrizzlyHills\\GH_Intro1Uni01.mp3",
    ["Id"] = 229834,
    ["Length"] = 284,
    ["Artist"] =  "GrizzlyHills (Russell Brower)",
    ["WoW"] = true,
  }, -- [34]
  {
    ["Album"] = "",
    ["Song"] = "GH2 Hero v3",
    ["Name"] = "Sound\\Music\\ZoneMusic\\GrizzlyHills\\GH_Intro2Uni01.mp3",
    ["Id"] = 229835,
    ["Length"] = 149,
    ["Artist"] =  "GrizzlyHills (Russell Brower)",
    ["WoW"] = true,
  }, -- [35]
  {
    ["Album"] = "",
    ["Song"] = "IronforgeWalking02",
    ["Name"] = "Sound\\Music\\CityMusic\\Ironforge\\IronForge Walking 02.mp3",
    ["Id"] = 53193,
    ["Length"] = 50,
    ["Artist"] =  "Ironforge (Brian Farr)",
    ["WoW"] = true,
  }, -- [36]
  {
    ["Album"] = "",
    ["Song"] = "Lament of the Highborne",
    ["Name"] = "Sound\\Music\\GlueScreenMusic\\BCCredits_Lament_of_the_Highborne.mp3",
    ["Id"] = 53221,
    ["Length"] = 171,
    ["Artist"] =  "GlueScreenMusic (Russell Brower & Derek Duke)",
    ["WoW"] = true,
  }, -- [37]
  {
    ["Album"] = "",
    ["Song"] = "LI_Event_Rescue01",
    ["Name"] = "Sound\\Music\\cataclysm\\MUS_LIRescue_EU01.mp3",
    ["Id"] = 443303,
    ["Length"] = 37,
    ["Artist"] =  "cataclysm (Derek Duke)",
    ["WoW"] = true,
  }, -- [38]
  {
    ["Album"] = "",
    ["Song"] = "NR_Dwarf_GeneralWalkB_Day02",
    ["Name"] = "Sound\\Music\\ZoneMusic\\Northrend\\IronDwarf\\NR_Dwarf_GeneralWalkB_Day02.mp3",
    ["Id"] = 229894,
    ["Length"] = 97,
    ["Artist"] =  "IronDwarf",
    ["WoW"] = true,
  }, -- [39]
  {
    ["Album"] = "",
    ["Song"] = "NR_Dwarf_GeneralWalkDDark_Uni05",
    ["Name"] = "Sound\\Music\\ZoneMusic\\Northrend\\IronDwarf\\NR_Dwarf_GeneralWalkDDark_Uni05.mp3",
    ["Id"] = 229903,
    ["Length"] = 69,
    ["Artist"] =  "IronDwarf",
    ["WoW"] = true,
  }, -- [40]
  {
    ["Album"] = "",
    ["Song"] = "pvp_d",
    ["Name"] = "Sound\\Music\\ZoneMusic\\PVP\\pvp3.mp3",
    ["Id"] = 53686,
    ["Length"] = 40,
    ["Artist"] =  "PVP (Derek Duke)",
    ["WoW"] = true,
  }, -- [41]
  {
    ["Album"] = "",
    ["Song"] = "Shorel'Aran Vocal",
    ["Name"] = "Sound\\Music\\ZoneMusic\\Sunwell\\SW_ShorelAranWalkUni01.mp3",
    ["Id"] = 53731,
    ["Length"] = 87,
    ["Artist"] =  "Sunwell (Russell Brower)",
    ["WoW"] = true,
  }, -- [42]
  {
    ["Album"] = "",
    ["Song"] = "Silvermoon 2",
    ["Name"] = "Sound\\Music\\ZoneMusic\\Sunwell\\SW_MagistersAsylumWalkUni01.mp3",
    ["Id"] = 53713,
    ["Length"] = 97,
    ["Artist"] =  "Sunwell (Russell Brower)",
    ["WoW"] = true,
  }, -- [43]
  {
    ["Album"] = "",
    ["Song"] = "SP_GeneralWalkB_Day02",
    ["Name"] = "Sound\\Music\\ZoneMusic\\StormPeaks\\SP_GeneralWalkB_Day02.mp3",
    ["Id"] = 229956,
    ["Length"] = 82,
    ["Artist"] =  "StormPeaks",
    ["WoW"] = true,
  }, -- [44]
  {
    ["Album"] = "",
    ["Song"] = "SP_GeneralWalkB_Uni02",
    ["Name"] = "Sound\\Music\\ZoneMusic\\StormPeaks\\SP_GeneralWalkB_Uni02.mp3",
    ["Id"] = 229958,
    ["Length"] = 82,
    ["Artist"] =  "StormPeaks",
    ["WoW"] = true,
  }, -- [45]
  {
    ["Album"] = "",
    ["Song"] = "spooky01-moment",
    ["Name"] = "Sound\\Music\\Musical Moments\\spooky\\spooky01-moment.mp3",
    ["Id"] = 53252,
    ["Length"] = 25,
    ["Artist"] =  "spooky (Jason Hayes)",
    ["WoW"] = true,
  }, -- [46]
  {
    ["Album"] = "",
    ["Song"] = "stormwind02-moment",
    ["Name"] = "Sound\\Music\\CityMusic\\Stormwind\\stormwind01-moment.mp3",
    ["Id"] = 53202,
    ["Length"] = 54,
    ["Artist"] =  "Stormwind (Jason Hayes)",
    ["WoW"] = true,
  }, -- [47]
  {
    ["Album"] = "",
    ["Song"] = "stormwind07-live",
    ["Name"] = "Sound\\Music\\CityMusic\\Stormwind\\stormwind07-zone.mp3",
    ["Id"] = 53208,
    ["Length"] = 87,
    ["Artist"] =  "Stormwind (Jason Hayes)",
    ["WoW"] = true,
  }, -- [48]
  {
    ["Album"] = "",
    ["Song"] = "stormwind_intro-moment",
    ["Name"] = "Sound\\Music\\CityMusic\\Stormwind\\stormwind_intro-moment.mp3",
    ["Id"] = 53211,
    ["Length"] = 66,
    ["Artist"] =  "Stormwind (Jason Hayes)",
    ["WoW"] = true,
  }, -- [49]
  {
    ["Album"] = "",
    ["Song"] = "Stormwind_Variation_NA_v4",
    ["Name"] = "Sound\\Music\\cataclysm\\MUS_Stormwind_GU04.mp3",
    ["Id"] = 441767,
    ["Length"] = 66,
    ["Artist"] =  "cataclysm (Neal Acree)",
    ["WoW"] = true,
  }, -- [50]
  {
    ["Album"] = "",
    ["Song"] = "ZulGurubVoodoo",
    ["Name"] = "Sound\\Music\\Musical Moments\\ZulGurubVooDoo.mp3",
    ["Id"] = 53254,
    ["Length"] = 84,
    ["Artist"] =  "Musical Moments (Derek Duke)",
    ["WoW"] = true,
  }, -- [51]
  {
    ["Album"] = "",
    ["Song"] = "Darnassus_Intro_New_NA_v1",
    ["Name"] = "Sound\\Music\\cataclysm\\MUS_Darnassus_GI01.mp3",
    ["Id"] = 441574,
    ["Length"] = 48,
    ["Artist"] =  "cataclysm (Neal Acree)",
    ["WoW"] = true,
  }, -- [52]
  {
    ["Album"] = "",
    ["Song"] = "Druids of the Flame 1H",
    ["Name"] = "Sound\\Music\\cataclysm\\MUS_42_DruidsoftheFlameA_Hero_UU01.mp3",
    ["Id"] = 528352,
    ["Length"] = 91,
    ["Artist"] =  "cataclysm (Russell Brower)",
    ["WoW"] = true,
  }, -- [53]
  {
    ["Album"] = "",
    ["Song"] = "MUS_42_ThrallAggraB_ED01",
    ["Name"] = "Sound\\Music\\cataclysm\\MUS_42_ThrallAggraB_ED01.mp3",
    ["Id"] = 528176,
    ["Length"] = 53,
    ["Artist"] =  "cataclysm",
    ["WoW"] = true,
  }, -- [54]
  {
    ["Album"] = "",
    ["Song"] = "Aftermath 1",
    ["Name"] = "Sound\\Music\\cataclysm\\MUS_Aftermath_UU01.mp3",
    ["Id"] = 441521,
    ["Length"] = 125,
    ["Artist"] =  "cataclysm (David Arkenstone)",
    ["WoW"] = true,
  }, -- [55]
  {
    ["Album"] = "",
    ["Song"] = "BC_Two_1",
    ["Name"] = "Sound\\Music\\ZoneMusic\\BlackTemple\\BT_SummitWalkUni03.mp3",
    ["Id"] = 53347,
    ["Length"] = 41,
    ["Artist"] =  "BlackTemple (Russell Brower)",
    ["WoW"] = true,
  }, -- [56]
  {
    ["Album"] = "",
    ["Song"] = "UnderCityThorneRoom",
    ["Name"] = "Sound\\Ambience\\WMOAmbience\\UnderCityThorneRoom.wav",
    ["Length"] = 118,
    ["Artist"] =  "WMOAmbience",
    ["WoW"] = true,
  }, -- [57]
}

local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")

if not EpicMusicPlayer then return end

EpicMusicPlayer:AddPlayList("Best of Wow", BestofWoW, false)
