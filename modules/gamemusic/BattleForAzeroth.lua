-- EpicMusicPlayer playlist created by EpicPlaylistCreator version 1.6.
local playlist1={
  {
    ["ListName"] = "Battle for Azeroth",
    ["PlaylistVersion"] = "3.1",
    ["PlaylistType"] = "generated",
    ["MusicDir"] = "MyMusic\\",
    ["Album"] = "WoW7.3.5",
    ["Song"] = "mus_735_pointofimpact_d",
    ["Name"] = "sound\\music\\battleforazeroth\\mus_735_pointofimpact_d.mp3",
    ["Length"] = 144,
    ["Artist"] = "Neal Acree",
    ["WoW"] = true,
  },

  {
    ["Album"] = "WoW7.3.5",
    ["Song"] = "mus_735_pointofimpact_b",
    ["Name"] = "sound\\music\\battleforazeroth\\mus_735_pointofimpact_b.mp3",
    ["Length"] = 143,
    ["Artist"] = "Neal Acree",
    ["WoW"] = true,
  },

  {
    ["Album"] = "WoW7.3.5",
    ["Song"] = "mus_735_pointofimpact_c",
    ["Name"] = "sound\\music\\battleforazeroth\\mus_735_pointofimpact_c.mp3",
    ["Length"] = 164,
    ["Artist"] = "Neal Acree",
    ["WoW"] = true,
  },

  {
    ["Album"] = "WoW7.3.5",
    ["Song"] = "mus_735_pointofimpact_a",
    ["Name"] = "sound\\music\\battleforazeroth\\mus_735_pointofimpact_a.mp3",
    ["Length"] = 135,
    ["Artist"] = "Neal Acree",
    ["WoW"] = true,
  },

  {
    ["Album"] = "WoW7.3.5",
    ["Song"] = "mus_735_pointofimpact_battle_h",
    ["Name"] = "sound\\music\\battleforazeroth\\mus_735_pointofimpact_battle_h.mp3",
    ["Length"] = 127,
    ["Artist"] = "Neal Acree",
    ["WoW"] = true,
  },

  {
    ["Album"] = "WoW7.3.5",
    ["Song"] = "mus_735_pointofimpact_h",
    ["Name"] = "sound\\music\\battleforazeroth\\mus_735_pointofimpact_h.mp3",
    ["Length"] = 145,
    ["Artist"] = "Neal Acree",
    ["WoW"] = true,
  },

}
local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")if not EpicMusicPlayer then return end
EpicMusicPlayer:AddPlayList("Battle for Azeroth", playlist1, false, true)
