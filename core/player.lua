local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")
local debug = EpicMusicPlayer.Debug
------------------------------------------------------------
-- private play/stop functions
------------------------------------------------------------
local queue = nil
local musicdir = "MyMusic\\" -- path to the CustomMusic

local function play(self, file)
	self:ForceMusicVolume(self.db.volume)
	if self.db.usePlaySoundFile then
		if self.db.soundHandle then StopSound(self.db.soundHandle) end
		local willplay, soundHandle = PlaySoundFile(file, "Ambience")
		self.db.soundHandle = soundHandle
	else
		PlayMusic(file)
	end
end

------------------------------------------------------------
-- public play/stop functions
------------------------------------------------------------
function EpicMusicPlayer:Play(song, stillPlaying)
	if not song then -- no song given try to play last song again
		song = self:GetSong(self.db.list,self.db.song)
		if not song then -- song not found get next
			song, self.db.list,self.db.song = self:GetNextSong(self.db.song,self.db.list,self.db.looplist)
		end
	end

	self:CancelTimer(timer,true)

	if not stillPlaying then
		self.db.playedSeconds = 0
	end

	self.Playing = true;
	songlength = song.Length

	if not stillPlaying then
		if song.Id then
			local _, _, _, tocversion = GetBuildInfo()
			if tocversion < 80200 then
				-- shipped music can not be played via file id in classic wow 1.13.2 (31407)
				play(self, song.Name)
			else
				-- shipped music can only be played via file id in 8.2 retail
				play(self, song.Id) 	
			end
		else
			-- auto enable usePlaySoundFile for non WoW music until the PlayMusc() API is fixed
			-- see: http://us.battle.net/forums/en/wow/topic/20747574714#1
			if not self.db.usePlaySoundFile then
				self.db.usePlaySoundFile = true
				print(L["The option to use PlaySoundFile was auto enabled as the WoW API PlayMusic(file) is broken for non WoW music. See FAQ for details."])
			end
			play(self, musicdir..song.Name)
		end
	end
	stillPlaying = nil

	timer = self:ScheduleRepeatingTimer(function()
		self:SendMessage("EMPUpdateTime", self.db.playedSeconds)
		self.db.playedSeconds = self.db.playedSeconds + 1
		if(self.db.playedSeconds >= songlength)then
			if self.scheduledStop then
					self:ScheduledStop()
					return
			end
			if self.db.loopsong then
				self:Play()
			else
				self:PlayNext()
			end
		end
	end, 1)

	if(self.db.showmessage)then
		self:UpdateMessageFrameText(song.Artist, song.Song)
	end

	self.currentsong = song
	self:UpdateTooltip()
	self:PrintSongToChat(song)
	self:SendMessage("EMPUpdatePlay", song.Artist, song.Song, song.Length, song.Album)
end

function EpicMusicPlayer:PlayNext()
	local self = EpicMusicPlayer;
	local song

	if(self.db.random) then
        song, listIndex, songIndex = EpicMusicPlayer:GetNextSongFromHistory()
		if song then
			self.db.list = listIndex
			self.db.song = songIndex
			historyInUse = true
		else
			song, self.db.list,self.db.song = self:GetRandomSong(self.db.list)
			EpicMusicPlayer:AddSongToHistory(song,self.db.list,self.db.song)
			historyInUse = false
		end
	else
		song, self.db.list,self.db.song = EpicMusicPlayer:GetNextSong(self.db.list,self.db.song,self.db.looplist)
    end
	self:Play(song)
end

function EpicMusicPlayer:Stop()
	self:CancelTimer(timer,true)
	local text = self.db.disablewowmusic and L["Music off"] or  L["Game Music"]
	self:RestoreSoundVolume()
	self:RestoreMusic()
	if self.db.usePlaySoundFile and self.db.soundHandle then
		StopSound(self.db.soundHandle)
	else
		StopMusic()
	end
	self.Playing = false;
	self:SendMessage("EMPUpdateStop", "", text, 0)
end

function EpicMusicPlayer:PlayLast()
  local song
	--self.db.loopsong = false
	if not self.db.random then
		song, self.db.list,self.db.song = EpicMusicPlayer:GetLastSong(self.db.list,self.db.song,self.db.looplist);
		EpicMusicPlayer:Play(song)
	else
		song, listIndex, songIndex = EpicMusicPlayer:GetLastSongFromHistory()
		if song then
			self.db.list = listIndex
			self.db.song = songIndex
			historyInUse = true
		else
			historyInUse = false
			EpicMusicPlayer:GetSong(self.db.list, self.db.song)
		end
		EpicMusicPlayer:Play(song);
	end
end

function EpicMusicPlayer:PlaySong(list, song)
		historyInUse = false
		self.db.list = list
		self.db.song = song
    EpicMusicPlayer:AddSongToHistory(EpicMusicPlayer:GetSong(list, song),list, song)
		self:Play()
	--end
end
