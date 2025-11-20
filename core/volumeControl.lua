local emp = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer") ---@class EpicMusicPlayer : AceAddon
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")


local function SetVolumeUnsaved(self, vol, voltypeCVar)
	self:CancelTimer(voltimer,true)
	SetCVar(voltypeCVar, vol);

	self:SendMessage("EMPUpdateVolume", voltypeCVar, vol)
	voltimer = self:ScheduleTimer(function() self:SendMessage("EMPUpdateVolumeTimerUp") end, 3)
end

local function isAmbienceChannelInUse()
	return emp.Playing and emp.db.usePlaySoundFile
end

function emp:SetVolume(vol, voltypeCVar)
	self.db.volume = vol;
	SetVolumeUnsaved(self, vol, voltypeCVar)
end

local suppressNextAmbienceUpdate = false
local frame = CreateFrame("Frame")
frame:RegisterEvent("CVAR_UPDATE")
frame:SetScript("OnEvent", function(self, event, name, value)
    if suppressNextAmbienceUpdate then
        suppressNextAmbienceUpdate = false
        emp:Debug("Ignoring internal CVAR_UPDATE", value)
        return
    end
	
	if name == "Sound_AmbienceVolume" then
		emp:Debug("Ambience CVAR_UPDATE callback: ", emp.db.nonPlayingAmbienceVolume)
		if isAmbienceChannelInUse() then
			SetCVar("Sound_MusicVolume", value) --lets set the music volume so when we stop playing the game music will have the right volume
		else
			emp.db.nonPlayingAmbienceVolume = value --lets remember the user set ambience when not playing music throug it
		end
    end

	-- lets adjust the ambience valume when the user set the music volume via the options and we are playing through it
	if name == "Sound_MusicVolume" then
		emp:Debug("Music CVAR_UPDATE callback")
		if isAmbienceChannelInUse() then
			SetCVar("Sound_AmbienceVolume", value)
		end
    end
end)

function emp:ToggleMute()
	if GetCVar(self:GetMusicVolumeCVar()) == "0" then
		self:UnMute()
	else
		self:Mute()
	end
end

function emp:Mute()
	SetVolumeUnsaved(self, 0, self:GetMusicVolumeCVar())
end

function emp:UnMute()
	SetVolumeUnsaved(self, self.db.volume, self:GetMusicVolumeCVar())
end

function emp:ForceMusicVolume()
	if self.db.usePlaySoundFile then
		suppressNextAmbienceUpdate = true
		SetCVar("Sound_EnableMusic", 0)
		SetCVar("Sound_AmbienceVolume", GetCVar("Sound_MusicVolume"))
	else
		SetCVar("Sound_EnableMusic", 1)
	end
end

function emp:RestoreMusic()
	if(self.disablewowmusic) then
		SetCVar("Sound_EnableMusic", 0);
	else
		SetCVar("Sound_EnableMusic", 1);
	end
end

-- when we stop playing, reset the ambience volume to the user set value (when we did not use it for music)
function emp:RestoreSoundVolume()
	if(self.db.usePlaySoundFile) then
		suppressNextAmbienceUpdate = true
		SetCVar("Sound_AmbienceVolume", self.db.nonPlayingAmbienceVolume);
	end
end

function emp:GetVolumeText(type)
	 return type == "Sound_SFXVolume" and L["Effects volume: "] or type == "Sound_MasterVolume" and L["Master volume: "] or L["Music volume: "]
end

function emp:GetMusicVolumeCVar()
	return self.db.usePlaySoundFile and self.Playing and "Sound_AmbienceVolume" or "Sound_MusicVolume"
end

function emp:DisplyScrollHandler(vector)
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
