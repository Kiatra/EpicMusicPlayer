local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")

function EpicMusicPlayer:OnPlayerLevelUp(level)
	if level == 120 and db.maxLevelSong then
		self:ForceMusicVolume()
		if(EpicMusicPlayerGui)then
			if(not EpicMusicPlayer.dataBase.char.showgui)then
				EpicMusicPlayer.dataBase.char.showgui = true
				EpicMusicPlayerGui:Toggle()
			end
		end
		song = {
			["WoW"] = true,
			["Album"] = "ingame",
			["Song"] = "Gratulations to level 110!!!",
			["Name"] = "Sound\\Music\\ZoneMusic\\ArgentTournament\\AT_JoustEvent.mp3",
			["Length"] = 123,
			["Artist"] = "",
		}
		EpicMusicPlayer:Play(song)
	end
end

function EpicMusicPlayer:CheckDate()
	local datetime = date("%d%m%H%M")
	if datetime == "01010000" then
		self:ForceMusicVolume()
		if(EpicMusicPlayerGui)then
			if(not EpicMusicPlayer.dataBase.char.showgui)then
				EpicMusicPlayer.dataBase.char.showgui = true
				EpicMusicPlayerGui:Toggle()
			end
		end
		song = {
			["WoW"] = true,
			["Album"] = "ingame",
			["Song"] = "Happy New Year! ;)",
			["Name"] = "Sound\\Music\\WorldEvents\\HordeFirepole.mp3",
			["Length"] = 72,
			["Artist"] = "",
		}
		EpicMusicPlayer:Play(song)
	end
end
