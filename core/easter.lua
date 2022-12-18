local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")

local function play(self, song)
	self:ForceMusicVolume()
	local spam = self.db.spam
	self.db.spam = true
	EpicMusicPlayer:Play(song)
	self.db.spam = spam
end

function EpicMusicPlayer:OnPlayerLevelUp(level)
	if _G.GetMaxLevelForPlayerExpansion then
		local maxlevel = GetMaxLevelForPlayerExpansion()
		if level == maxlevel and db.maxLevelSong then
			song = {
				["Album"] = "ingame",
				["Song"] = string.format("Gratulations to level %s! :)", maxlevel),
				["Name"] = "sound\\music\\musical moments\\angelic\\angelic01.mp3",
				["Length"] = 47,
				["Artist"] = "",
				["Id"] = 303111,
			}
			play(self, song)
		end
	end
end

function EpicMusicPlayer:CheckDate()
	local datetime = date("%d%m%H%M")
	if datetime == "01010000" then
		song = {
			["Id"] = 53260,
			["Album"] = "ingame",
			["Song"] = "Happy New Year! ;)",
			["Name"] = "Sound\\Music\\WorldEvents\\HordeFirepole.mp3",
			["Length"] = 72,
			["Artist"] = "",
		}
		play(self, song)
	end
end

EpicMusicPlayer:RegisterEvent("PLAYER_LEVEL_UP", EpicMusicPlayer.OnPlayerLevelUp)
local _, _, _, tocversion = GetBuildInfo()
if tocversion < 80200 then EpicMusicPlayer:ScheduleRepeatingTimer("CheckDate", 30) end
