local emp = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer") ---@type any
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")

------------------------------------------------------------
-- private play/stop functions
------------------------------------------------------------
local queue = nil
local timer
local soundtrackFileIndex = 1 --lets remember the last index for track with multiple files (soundtrack)

local function play(self, file)
	self:ForceMusicVolume()
	if self.db.usePlaySoundFile then
		if self.db.soundHandle then StopSound(self.db.soundHandle) end
		local willplay, soundHandle = PlaySoundFile(file, "Ambience")
		self.db.soundHandle = soundHandle
	else
		PlayMusic(file)
	end
end

local function playGameMusic(self, id, path)
	local _, _, _, tocversion = GetBuildInfo()
	if tocversion < 80200 then
		-- shipped music can not be played via file id in classic wow 1.13.2 (31407)
		play(self, path)
	else
		-- shipped music can only be played via file id in 8.2 retail
		play(self, id)
	end
end

local function playMp3Music(self, path)
	-- auto enable usePlaySoundFile for non WoW music until the PlayMusc() API is fixed
	-- see: http://us.battle.net/forums/en/wow/topic/20747574714#1
	if not self.db.usePlaySoundFile then
		self.db.usePlaySoundFile = true
		print(L["The option to use PlaySoundFile was auto enabled as the WoW API PlayMusic(file) is broken for non WoW music. See FAQ for details."])
	end
	
	local musicdir = "MyMusic\\" -- path to the CustomMusic
	play(self, musicdir..path)
end

local function playNextSoundtrack()
end

------------------------------------------------------------
-- public play/stop functions
------------------------------------------------------------
function emp:Play(song, stillPlaying)
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

	--for sceduling the soundtrack sub files 
	local subFileIndex = 1
	local subFilePlayedSeconds = 0
    local subFileDuration = 0

	if not stillPlaying then
		if song.files then --soundtrack
			local id = song.files[1].id
			local path = song.files[1].path
			subFileDuration = song.files[1].duration
			playGameMusic(self, id, path)
		else --single song (defauly)
			if song.id then
				playGameMusic(self, song.id, song.path)
			else
				playMp3Music(self, song.path)
			end
		end
	end

	stillPlaying = nil

	timer = self:ScheduleRepeatingTimer(
		function()
			self:SendMessage("EMPUpdateTime", self.db.playedSeconds)
			self.db.playedSeconds = self.db.playedSeconds + 1
			
			if song.files then
				subFilePlayedSeconds = subFilePlayedSeconds + 1
				if subFilePlayedSeconds > subFileDuration then
					subFileIndex = subFileIndex + 1
					if subFileIndex > #song.files then
						self:PlayNext()
					else
						local id = song.files[subFileIndex].id
						local path = song.files[subFileIndex].path
						subFileDuration = song.files[subFileIndex].duration
						subFilePlayedSeconds = 0
						playGameMusic(self, id, path)
					end
				end
			end
			
			if(self.db.playedSeconds >= song.duration)then
				if self.scheduledStop then
					self:ScheduledStop()
					return
				end
				self:PlayNext()
			end
	end, 1)

	if(self.db.showmessage)then
		self:UpdateMessageFrameText(song.artist, song.title)
	end

	self.currentsong = song
	self:UpdateTooltip()
	self:PrintSongToChat(song)
	self:SendMessage("EMPUpdatePlay", song.artist, song.title, song.duration, song.album)
end

function emp:PlayNext()
	local self = emp;
	local song, listIndex, songIndex

	if self.db.loopsong then
		self:Play()
		return
	end

	if(self.db.random) then
        song, listIndex, songIndex = emp:GetNextSongFromHistory()
		if song then
			self.db.list = listIndex
			self.db.song = songIndex
		else
			song, self.db.list,self.db.song = self:GetRandomSong(self.db.list)
			emp:AddSongToHistory(song,self.db.list,self.db.song)
		end
	else
		song, self.db.list,self.db.song = emp:GetNextSong(self.db.list,self.db.song,self.db.looplist)
    end
	self:Play(song)
end

function emp:Stop()
	self.Playing = false;
	self:CancelTimer(timer,true)
	local text = self.db.disablewowmusic and L["Music off"] or  L["Game Music"]
	self:RestoreSoundVolume()
	self:RestoreMusic()
	if self.db.usePlaySoundFile and self.db.soundHandle then
		StopSound(self.db.soundHandle)
	else
		StopMusic()
	end
	self:SendMessage("EMPUpdateStop", "", text, 0)
end

function emp:PlayLast()
	local song, listIndex, songIndex
	if not self.db.random then
		song, self.db.list,self.db.song = emp:GetLastSong(self.db.list,self.db.song,self.db.looplist);
		emp:Play(song)
	else
		song, listIndex, songIndex = emp:GetLastSongFromHistory()
		if song and listIndex and songIndex then
			self.db.list = listIndex
			self.db.song = songIndex
		else
			emp:GetSong(self.db.list, self.db.song)
		end
		emp:Play(song);
	end
end

function emp:PlaySong(list, song)
		self.db.list = list
		self.db.song = song
    	emp:AddSongToHistory(emp:GetSong(list, song),list, song)
		self:Play()
end
