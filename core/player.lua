local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")

------------------------------------------------------------
-- private play/stop functions
------------------------------------------------------------
local queue = nil
local musicdir = "MyMusic\\" -- path to the music :)

local function play(self, file)
	self:ForceMusicVolume(self.db.volume)
	if self.db.usePlaySoundFile then
		PlaySoundFile(file, "Ambience")
	else
		PlayMusic(file)
	end
end

function EpicMusicPlayer:ScheduledPlay(song, stillPlaying)
	self:CheckSongToMove()

	song = queue or song
	queue = nil

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

	self:Debug("song:", song,stillPlaying)
	if not stillPlaying then
		if(song.Album == "ingame" or song.WoW) then
			-- ingame music do not add addon mp3 path
			play(self, song.Name)
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
					self:Debug("self.scheduledStop:",self.scheduledStop)
					self:ScheduledStop()
					return
			end
			if self.db.loopsong then
				self:ScheduledPlay()
			else
				self:ScheduledPlayNext()
			end
		end
	end, 1)

	if(self.db.showmessage)then
		self:UpdateMessageFrameText(song.Artist, song.Song)
	end

	currentsong = song
	self:UpdateTooltip()
	self:PrintSongToChat(song)
	self:SendMessage("EMPUpdatePlay", song.Artist, song.Song, song.Length, song.Album)
end

function EpicMusicPlayer:ScheduledPlayNext()
	self:Debug("scheduledPlayNext")
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
	self:ScheduledPlay(song)
end

function EpicMusicPlayer:ScheduledStop()
	self.scheduledStop = false
	EpicMusicPlayer:CheckSongToMove()
	self:CancelTimer(timer,true)
	local text = self.db.disablewowmusic and L["Music off"] or  L["Game Music"]
	self:RestoreSoundVolume()
	self:RestoreMusic()
	StopMusic()
	self.Playing = false;
	self:SendMessage("EMPUpdateStop", "", text, 0)
end
------------------------------------------------------------
-- public play/stop functions
------------------------------------------------------------

function EpicMusicPlayer:Stop()
	self:RestoreMusic()
	if self.db.usePlaySoundFile then
		self:Mute()
		self.scheduledStop = true
	else
		self:ScheduledStop()
	end
end


function EpicMusicPlayer:Play(song)
	if self.db.usePlaySoundFile and self.Playing then
		if song then
		print("|TInterface\\AddOns\\EpicMusicPlayer\\media\\icon.tga:18|t "..L["Next"]..": |c"
		..self:ToHex(self.db.artistcolour)..song.Artist.."|r - |c"..self:ToHex(self.db.titlecolour)..song.Song)
		queue = song
		end
	else
		self:ScheduledPlay(song)
	end
end

function EpicMusicPlayer:PlayLast()
  local song
	--self.db.loopsong = false
	EpicMusicPlayer:CheckSongToMove()
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
	--self:Debug(list, song, "self.Playing:", self.Playing, "self.db.usePlaySoundFile",self.db.usePlaySoundFile)
	if self.db.usePlaySoundFile and self.Playing then
		song = EpicMusicPlayer:GetSong(list,song)
		if song then
			print("|TInterface\\AddOns\\EpicMusicPlayer\\media\\icon.tga:18|t "..L["Next"]..": |c"
			..self:ToHex(self.db.artistcolour)..song.Artist.."|r - |c"..self:ToHex(self.db.titlecolour)..song.Song)
			queue = song
			self.db.list = list
			self.db.song = song
			self.scheduledStop = false
		end
	else
		historyInUse = false
		self.db.list = list
		self.db.song = song
    EpicMusicPlayer:AddSongToHistory(EpicMusicPlayer:GetSong(list, song),list, song)
		self:ScheduledPlay()
	end
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
