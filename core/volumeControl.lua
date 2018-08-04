local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")


local function SetVolumeUnsaved(self, vol, voltypeCVar)
	self:CancelTimer(voltimer,true)
	SetCVar(voltypeCVar, vol);
	self:SendMessage("EMPUpdateVolume", voltypeCVar, vol)
	voltimer = self:ScheduleTimer(function() self:SendMessage("EMPUpdateVolumeTimerUp") end, 3)
end

function EpicMusicPlayer:SetVolume(vol, voltypeCVar)
	self.db.volume = vol;
	SetVolumeUnsaved(self, vol, voltypeCVar)
end

function EpicMusicPlayer:ToggleMute()
	if GetCVar(self:GetMusicVolumeCVar()) == "0" then
		self:UnMute()
	else
		self:Mute()
	end
end

function EpicMusicPlayer:Mute()
	SetVolumeUnsaved(self, 0, self:GetMusicVolumeCVar())
end

function EpicMusicPlayer:UnMute()
	SetVolumeUnsaved(self, self.db.volume, self:GetMusicVolumeCVar())
end

function EpicMusicPlayer:ForceMusicVolume(volume)
	if self.db.usePlaySoundFile then
		SetCVar("Sound_EnableMusic", 0)
	else
		SetCVar("Sound_EnableMusic", 1)
	end
end

function EpicMusicPlayer:RestoreMusic()
	if(self.disablewowmusic) then
		SetCVar("Sound_EnableMusic", 0);
	else
		SetCVar("Sound_EnableMusic", 1);
	end
end

function EpicMusicPlayer:RestoreSoundVolume()
	if(self.db.usePlaySoundFile) then
		SetCVar("Sound_AmbienceVolume", self.db.volume);
	end
end

function EpicMusicPlayer:GetVolumeText(type)
	 return type == "Sound_SFXVolume" and L["Effects volume: "] or type == "Sound_MasterVolume" and L["Master volume: "] or L["Music volume: "]
end

function EpicMusicPlayer:GetMusicVolumeCVar()
	return self.db.usePlaySoundFile and self.Playing and "Sound_AmbienceVolume" or "Sound_MusicVolume"
end

function EpicMusicPlayer:DisplyScrollHandler(vector)
		local cVar = IsControlKeyDown() and "Sound_SFXVolume" or self:GetMusicVolumeCVar()
		cVar = IsShiftKeyDown() and "Sound_MasterVolume" or cVar
		local vol = GetCVar(cVar)
		local step = IsAltKeyDown() and vector * .01 or vector * .1
		vol = vol + step
		if vol > 1 then vol = 1 end
		if vol < 0 then vol = 0 end
		self:SetVolume(vol,cVar)
		self:UpdateTooltip()
end
