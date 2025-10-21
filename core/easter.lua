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
				album = "ingame",
				title = string.format("Gratulations to level %s! :)", maxlevel),
				path = "sound\\music\\musical moments\\angelic\\angelic01.mp3",
				duration = 47,
				artist  = "",
				id = 303111,
			}
			play(self, song)
		end
	end
end

function EpicMusicPlayer:CheckDate()
	local datetime = date("%d%m%H%M")
	if datetime == "1010000" then
		song = {
			id = 53260,
			album = "ingame",
			title = "Happy New Year! ;)",
			path = "Sound\\Music\\WorldEvents\\HordeFirepole.mp3",
			duration = 72,
			artist  = "",
		}
		play(self, song)
	end
end

EpicMusicPlayer:RegisterEvent("PLAYER_LEVEL_UP", EpicMusicPlayer.OnPlayerLevelUp)
local _, _, _, tocversion = GetBuildInfo()
if tocversion < 80200 then EpicMusicPlayer:ScheduleRepeatingTimer("CheckDate", 30) end
