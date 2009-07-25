--EpicMusicPlayer by yess
EpicMusicPlayer = LibStub("AceAddon-3.0"):NewAddon("EpicMusicPlayer", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0","AceComm-3.0")

local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")
local media = LibStub:GetLibrary("LibSharedMedia-3.0", true) or nil
--local AceComm = LibStub("AceComm-3.0")

local musicdir = "" -- path to the music :)
local volume = 0 -- remember volume on mute
local messageframe = nil -- song and artst display

--  ace timers
local songtimer = "" -- timer for next song countdown
local timer = "" -- timer vor display seconds 
local voltimer = "" -- volum chanded disply countdown
local eventtimer = ""
local db
local movesong
local currentsong
local historyInUse = false --true wwhen a sond from histroy is played

--EpicMusicPlayer.fonts = {"Default"}
--EpicMusicPlayer.fontslist = {default="WoW Default", Adventure="Adventure", BlackChancery="BlackChancery"}
EpicMusicPlayer.controlslist = {
	TogglePlay = L["Play/Stop"], OnNextClick = L["Play Next Song"], OpenMenu = L["Drop Down Menu"],
	ShowConfig = L["Config"], ToggleMute = L["Mute / unmute music sound."], TogglePlaylist = L["Playlist"],
	PlayLast = L["Play Last Song"], TogglePlayerGui = L["Toggle show gui"], ToggleRandom = L["Toggle shuffle"],
	RemoveCurrendSong = L["Remove Song"], SpamDefault = L["Spam to default channel"],
	ToBadList = L["Move to bad songs list"], ToBestList = L["Move song to favorite list"],
}
EpicMusicPlayer.version = GetAddOnMetadata("EpicMusicPlayer","Version")
EpicMusicPlayer.tocversion = select(4, GetBuildInfo());

------------------------------------------------------------------------------
-- ace load functions 
-------------------------------------------------------------------------------
function EpicMusicPlayer:OnInitialize()
	self.Playing = false
	self.IsSearching = false
	self.sec = 0
	self.UpdateInterval = 1
		
    self.db = LibStub("AceDB-3.0"):New("EpicMusicPlayerDB", defaults, "Default")

    local optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("EpicMusicPlayer", "EpicMusicPlayer")
	LibStub("AceConfigDialog-3.0"):SetDefaultSize("EpicMusicPlayer", 500, 400)

	self.db:RegisterDefaults({
		profile = {
			random = false,
			auto = false,
			volume = 1,
			spam = trume,
			--first song = 2 (song 1 is playlist name)
			song = 2,
			list = 1,
			skin = "default2",
			looplist = false,
			loopsong = false,
			disablewowmusic = false,
			showmessage = true,
			minimapbutton = false,
			defaultchannel = "PARTY",
			link = false,
			badlist = nil,
			guiscale = 1,
			controlset = {
				left="OnNextClick",
				right="OpenMenu",
				middle="TogglePlay",
				button4="TogglePlaylist",
				leftaltcontrol = "RemoveCurrendSong",
				leftalt = "TogglePlay",
				leftcontrol = "SpamDefault",
				leftshift =  "PlayLast",
			},
			artistcolour = {r=0.6,g=0.2,b=0.8,a=0.8},
			titlecolour = {r=1,g=1,b=1,a=1},
			backcolour = {r=0,g=0,b=0,a=1},
			bordercolour = {r=1,g=1,b=1,a=0.28},
			buttoncolour = {r=0.6,g=0.2,b=0.8,a=0.8},
			useartistcolour = true,
			guistrata = "MEDIUM",
			fontindex = 2,
			guifontsize = 12,
			fontsize = 46,
			gui = {
				scroll = true
			},
		},
		char = {
			showgui = true,
			debug = false,
		}
	})
	db = self.db.profile
	
	self:RegisterChatCommand("emp", "ChatCommand")
    self:RegisterChatCommand("epicmusicplayer", "ChatCommand")
	
	musicdir = self:CheckPlayList()
	self:UpdateListnames()
	
	if media then
		media:Register("font", "Adventure", "Interface\\AddOns\\EpicMusicPlayer\\fonts\\Adventure.ttf")
		media:Register("font", "BlackChancery", "Interface\\AddOns\\EpicMusicPlayer\\fonts\\BlackChancery.ttf")
		self.media = media
	end
	if not db.font then 
		db.font = media:GetDefault("font")
	end
	self:RegisterComm("EpicMusicPlayer", "ReciveMessage")
end

function EpicMusicPlayer:OnEnable(first)
	self:RegisterEvent("PLAYER_ENTERING_WORLD", EpicMusicPlayer.OnEnteringWorld, "PLAYER_ENTERING_WORLD")
	self:RegisterEvent("CHAT_MSG_WHISPER_INFORM", EpicMusicPlayer.OnWhisperInform)
	self:RegisterEvent("PLAYER_ALIVE", EpicMusicPlayer.OnPplayerAlive)
	
	if(self.Playing == false)then
        if(db.auto) then
			EpicMusicPlayer:Play()
        else
			if(db.disablewowmusic) then 
				SetCVar("Sound_EnableMusic", 0);
				--/run SetCVar("Sound_NumChannels", 128);
			else
				SetCVar("Sound_EnableMusic", 1);	
			end
			EpicMusicPlayer:Stop()
        end
    end
	
	if(EpicMusicPlayerGui)then
		if(db.minimapbutton)then
			--EpicMusicPlayerGui:CreateMinimapButton()
		end
		if(not self.db.char.showgui)then
			EpicMusicPlayerGui:Toggle()
		end
	end
	
end

function EpicMusicPlayer:OnDisable()
	EpicMusicPlayer:Stop()
end

------------------------------------------------------------------------------
-- event functions 
-------------------------------------------------------------------------------
-- save the name of the last whisper
function EpicMusicPlayer:OnWhisperInform()
	EpicMusicPlayer.whisper = arg2
end

-- patch 2.4.3  workaround
function EpicMusicPlayer:OnEnteringWorld(event)
	EpicMusicPlayer:Debug(event)
    if(EpicMusicPlayer.Playing)then
		SetCVar("Sound_EnableMusic", 0);
		
		EpicMusicPlayer:CancelTimer(eventtimer,true)
		
		eventtimer = EpicMusicPlayer:ScheduleTimer(function() 
			if(EpicMusicPlayer.Playing)then
				EpicMusicPlayer:Play()
			end
		end, 2, arg)
	end
end

-- patch 3.0.8  workaround
function EpicMusicPlayer:OnPplayerAlive(event)
	EpicMusicPlayer:Debug(event)
    if( UnitIsDeadOrGhost("Player") and EpicMusicPlayer.Playing)then
		SetCVar("Sound_EnableMusic", 0);
		
		EpicMusicPlayer:CancelTimer(eventtimer,true)
		
		eventtimer = EpicMusicPlayer:ScheduleTimer(function() 
			if(EpicMusicPlayer.Playing)then
				EpicMusicPlayer:Play()
			end
		end, 2, arg)
	end
end

------------------------------------------------------------
-- play/stop functions
------------------------------------------------------------
function EpicMusicPlayer:Play(song)
	self:CheckSongToMove()
	--EpicMusicPlayer:GetNextSong(db.list,db.song)

	if not song then -- no song given try to play last song again
		song = self:GetSong(db.list,db.song)
		if not song then -- song not found get next
			song, db.list,db.song = self:GetNextSong(db.song,db.list,db.looplist)
			self:AddSongToHistory(song)
		end
	end
	
	--EpicMusicPlayer:Debug("playing list=", db.list, "song=",db.song,"song.Song", song.Song)
	self:CancelTimer(timer,true)
	SetCVar("Sound_EnableMusic", 1);	
	
	self.sec = 0
	self.Playing = true;
	songlength = song.Length
	
	if(song.Album == "ingame") then
		-- ingame music do not add addon mp3 path
		PlayMusic(song.Name)
	else
		PlayMusic(musicdir..song.Name)
	end
	
	if(db.spam) then
		DEFAULT_CHAT_FRAME:AddMessage("|TInterface\\AddOns\\EpicMusicPlayer\\icon.tga:18|t |c"
		..self:ToHex(db.artistcolour)..song.Artist.."|r - |c"..self:ToHex(db.titlecolour)..song.Song)
	end
	
	timer = self:ScheduleRepeatingTimer(function()	
		self:SendMessage("EMPUpdateTime", self.sec)
		self.sec = self.sec + 1
		if(self.sec >= songlength)then
			self:PlayNext()
		end
	end, 1)
	
	if(db.showmessage)then
		self:UpdateMessageFrameText(song.Artist, song.Song)
	end
	
	currentsong = song
	self:UpdateTooltip()
	self:SendMessage("EMPUpdatePlay", song.Artist, song.Song, song.Length, song.Album)
end

function EpicMusicPlayer:Stop()
	EpicMusicPlayer:CheckSongToMove()
	self:CancelTimer(songtimer,true)
	self:CancelTimer(timer,true)
	
	local wowmusic
	if(db.disablewowmusic) then 
		SetCVar("Sound_EnableMusic", 0);
		wowmusic = L["Music off"]		
	else
		wowmusic = L["Game Music"]
	end
	StopMusic()
	self.Playing = false;
	self:SendMessage("EMPUpdateStop", "", wowmusic, 0)
end

function EpicMusicPlayer:PlayNext()
	historyInUse = false
	local self = EpicMusicPlayer;
	local song
	-- check random play
    if db.loopsong then
		EpicMusicPlayer:Debug("loopsong")
		song = currentsong
	elseif(db.random) then
        song = self:GetRandomSong(db.list)
    else        
        EpicMusicPlayer:Debug("EpicMusicPlayer:PlayNext() loopList=", loopList)
		song, db.list,db.song = EpicMusicPlayer:GetNextSong(db.list,db.song,db.looplist)
    end  
    EpicMusicPlayer:AddSongToHistory(song)
	self:Play(song)	
end

function EpicMusicPlayer:PlayLast()
    historyInUse = true
	db.loopsong = false
	EpicMusicPlayer:CheckSongToMove()
	EpicMusicPlayer:Play(EpicMusicPlayer:GetSongFromHistory());
end

function EpicMusicPlayer:PlaySong(list, song)
	historyInUse = false
	db.list = list
	db.song = song
    EpicMusicPlayer:AddSongToHistory(EpicMusicPlayer:GetSong(list, song))
	EpicMusicPlayer:Play()
end

-- called on user clicked next song, do not call directly 
-- can't call PlayNext() directly because we need to set loopsong to false
function EpicMusicPlayer:OnNextClick()
	db.loopsong = false
	EpicMusicPlayer:PlayNext()
end

-- move song if one is marked
function EpicMusicPlayer:CheckSongToMove()
	if(movesong)then
		self:MoveSong(self.moveoldlistIndex, self.movenewlistIndex, self.movesongIndex)
		movesong = nil
	end
end



--------------------------------------------------------
-- adjust the music volume
--------------------------------------------------------
function EpicMusicPlayer:SetVolume(vol, voltype)
    self:CancelTimer(voltimer,true)
	
	if(voltype == "music")then
		db.volume = vol;
		SetCVar("Sound_MusicVolume", vol);
		self:SendMessage("EMPUpdateVolume", "music", vol)
    else
		SetCVar("Sound_SFXVolume", vol);
		self:SendMessage("EMPUpdateVolume", "sound", vol)
	end
	
	voltimer = self:ScheduleTimer(EpicMusicPlayer.VolumeDone, 3, arg)
end

function EpicMusicPlayer:VolumeDone()
	EpicMusicPlayer:SendMessage("EMPUpdateVolume", "done")
end

------------------------------------------------------------------------------
-- send song info
-------------------------------------------------------------------------------
function EpicMusicPlayer:SpamDefault()
	self:Spam(db.defaultchannel)
end

local origSetItemRef = SetItemRef; 
SetItemRef = function(...)
	local link, text, button = ...;
	--EpicMusicPlayer:Debug(link, text, buttton)
	if type(text) == "string" and text.find(text,"epicmusicplayer") and not IsModifiedClick() then
		return ShowSongTip(link); 
	end
	return origSetItemRef(...);
end

function ShowSongTip(link)
	local a, b, c, title, artist, album, length, path = strfind(link, "(.+):(.+):(.+):(.+):(.+):(.+)");
	EpicMusicPlayer:Debug("ShowSongTip:",title, lenght, path)

	local lastsearch, listIndex = EpicMusicPlayer:GetListByName("lastsearch")
	if lastsearch then
		table.insert(lastsearch,
		{
			["Album"] = album,
			["Song"] = title,
			["Name"] = path,
			["Length"] = tonumber(length),
			["Artist"] =  artist,
		})


		db.song = #lastsearch
		db.list = listIndex
		EpicMusicPlayer:Play()
	end
end

function EpicMusicPlayer:Spam(chat)
	local song = EpicMusicPlayer:GetCurrentSong()
	local title = song.Song
	local artist = song.Artist
	local album = song.Album
	local text = ""
	
	text = title
	if(artist~="") then 
		text = artist.." - "..text
	end
	if(artist~="") then 
		text = text.." ("..album..")"
	end
	text = L["[~mymusic~] "]..text
	
	if(chat == "WHISPER") then
		if(self.whisper)then
			target = self.whisper
		else
			return
		end
	end

	if(chat == "TARGET") then
		target = UnitName("target")
		chat = "WHISPER"
		if(not target) then
			EpicMusicPlayer:Print(L["No Target"])
			return
		end
	end
	
	SendChatMessage(text,chat,nil,target)
	
	--EpicMusicPlayer:Debug("album: ",album)
	if album == "ingame" and target then
		--local a, b, mptext, title, artist, album, quality, genre = strfind(link, "(.+):(.+):(.+):(.+):(.+):(.+)");
		local songlink = strjoin(":",title,artist,album,song.Length, song.Name)
		--EpicMusicPlayer:Debug(song)
		EpicMusicPlayer:SendSearch(songlink, target)
	else
		if(db.link) then
			local link = title.." "..artist
			link  = string.gsub(link, " ", "+")
			link = "http://www.youtube.com/results?search_query="..link.."&search_type=&aq=f"
			
			SendChatMessage(link,chat,nil,target)
		end
    end
end

function EpicMusicPlayer:GetFonts()
	return media:HashTable("font")
end

------------------------------------------------------------------------------
-- osd display
-------------------------------------------------------------------------------
function EpicMusicPlayer:UpdateMessageFrameText(artist,title)
	if not messageframe then self:CreateMessageFrame() end
	local c = db.artistcolour
	messageframe:AddMessage(artist.."\n |c"..self:ToHex(db.titlecolour)..title, c.r,c.g,c.b, 53, 5);
end

function EpicMusicPlayer:CreateMessageFrame()
	messageframe = CreateFrame("MessageFrame",nil,UIParent)
	messageframe:SetFrameStrata("BACKGROUND")
	messageframe:SetWidth(600) 
	messageframe:SetHeight(50)
	messageframe:SetPoint("CENTER",0,300)
	messageframe:Show()

	local font = self:GetFont()
	if font then
		messageframe:SetFont(font, db.fontsize)	
	else
		messageframe:SetFont(GameFontNormal:GetFont(),db.fontsize)
	end

	messageframe:SetShadowColor(0, 0, 0,0.8) 
	messageframe:SetShadowOffset(1, -1) 
end

function EpicMusicPlayer:UpdateMessageFrame()
	if(not messageframe)then
			self:CreateMessageFrame()
	end
	local font = EpicMusicPlayer:GetFont()
	if font then
		messageframe:SetFont(font, 
								db.fontsize)
		EpicMusicPlayer:UpdateMessageFrameText(EpicMusicPlayer:GetCurrentArtistName(), 
												EpicMusicPlayer:GetCurrentSongName())
	else
		messageframe:SetFont(GameFontNormal:GetFont(),db.fontsize)
	end
end

------------------------------------------------------------------------------
-- functions used by modules 
-------------------------------------------------------------------------------
function EpicMusicPlayer:ToBestList()
	local self = EpicMusicPlayer
	if not self.Playing then
		self:Print(L["Not playing."])
		return
	end
	local list, listIndex = self:GetListByName(db.bestlist)
	if listIndex then 
		--move the song
		self:MoveCurrentSong(listIndex)
	else
		self:Print(L["Best list not found."].." "..L["Please set a favorites list."])
	end
end

function EpicMusicPlayer:ToBadList()
	local self = EpicMusicPlayer
	if not self.Playing then
		self:Print(L["Not playing."])
		return
	end
	local list, listIndex = self:GetListByName(db.badlist)
	if listIndex then 
		--move the song
		self:MoveCurrentSong(listIndex)
	else
	self:Print(L["Bad list not found."].." "..L["Please set a bad songs list."])
	end
end

function EpicMusicPlayer:GetCurrentListIndex()
	return db.list;
end

function EpicMusicPlayer:GetCurrentSong()
	if self.Playing then
		return currentsong
	else
		return nil
	end
end

function EpicMusicPlayer:GetCurrentSongName()
	if(playing and currentsong)then
		return currentsong.Song
	else
		if(db.disablewowmusic) then 
			return L["Music off"]	
		else
			return L["Game Music"]
		end
	end
end

function EpicMusicPlayer:GetCurrentListName()
	return EpicMusicPlayer:GetListName(db.list) or ""
end

function EpicMusicPlayer:RemoveCurrendSong()
	if historyInUse then
		self:Print(L["Playing song from history."]);	
	else
		self:RemoveSong(db.list,db.song)
	end
	self:PlayNext()
end

-- move song after current song
function EpicMusicPlayer:MoveCurrentSong(newListIndex)
	if historyInUse then
		self:Print(L["Playing song from history."]);	
	else
		if(db.list == newListIndex)then
			self:Print(L["Song is already in that list."])
			return false;
		end
		
		--todo localization
		self:Print(L["Current will be moved on playing next song."])
		movesong = true
		self.movesongIndex = db.song
		self.movenewlistIndex = newListIndex
		self.moveoldlistIndex = db.list
	end
end

function EpicMusicPlayer:ShowConfig()
	LibStub("AceConfigDialog-3.0"):Open("EpicMusicPlayer")
end

function EpicMusicPlayer:OnDisplayClick(parent)
	if(arg1 == "MiddleButton")then
			self[db.controlset.middle](self, parent)
	elseif(arg1 == "RightButton")then
		self[db.controlset.right](self, parent)
	elseif(arg1 == "Button4")then
		self[db.controlset.button4](self, parent)
	elseif(arg1 == "Button5")then
		self[db.controlset.button5](self, parent)
	else
		if(IsAltKeyDown())then
			if(IsControlKeyDown())then
				self[db.controlset.leftaltcontrol](self, parent)
			else
				self[db.controlset.leftalt](self, parent)
			end
		elseif(IsShiftKeyDown()) then
			self[db.controlset.leftshift](self, parent)
		elseif(IsControlKeyDown()) then
			self[db.controlset.leftcontrol](self, parent)
		else --no key pressed
			self[db.controlset.left](self, parent)
		end
	end
end

function EpicMusicPlayer:DisplyScrollHandler()
		local vol
		if(IsControlKeyDown()) then --adjust sound volume
			vol = GetCVar("Sound_SFXVolume")

			if(arg1 == 1) then --volume up 
			  if(IsAltKeyDown()) then -- fine tune
				vol = vol +.01
			  else
				vol = vol +.1
	          end
			  
			  if(vol > 1) then 
	              vol = 1
	          end
			else -- volume down
	          if(IsAltKeyDown()) then -- fine tune
				vol = vol -.01
			  else
				vol = vol -.1
	          end
			  if(vol < 0) then
	              vol = 0
	          end
			end
			EpicMusicPlayer:SetVolume(vol,"sound")
			
		else --adjust music volume
			vol = GetCVar("Sound_MusicVolume")
		
			if(arg1 == 1) then --volume up 
			  if(IsAltKeyDown()) then -- fine tune
				vol = vol +.01
			  else
				vol = vol +.1
	          end
			  
			  if(vol > 1) then 
	              vol = 1
	          end
			else -- volume down
	          if(IsAltKeyDown()) then -- fine tune
				vol = vol -.01
			  else
				vol = vol -.1
	          end
			  if(vol < 0) then
	              vol = 0
	          end
			end
			EpicMusicPlayer:SetVolume(vol,"music") 
		end   
end

function EpicMusicPlayer:GetFont()
	local font
	if media then
		font = media:Fetch("font",db.font)
	else
		font = GameFontNormal:GetFont()
	end
	return font
end

function EpicMusicPlayer:ToHex(r,g,b)
	if type(r) == "table" then
		r,g,b = r.r, r.g, r.b
	end
	return ("%02x%02x%02x%02x"):format(1*255,r*255, g*255, b*255)	
end

function EpicMusicPlayer:GetTimeSTring(seconds)
    local min = seconds / 60
		local sec = mod(seconds, 60)
		if( sec < 10) then
		    -- add zero 
        return string.format("%d:0%d", min, sec)
    end
		return string.format("%d:%d", min, sec)
end

function EpicMusicPlayer:Debug(...)
	if(EpicMusicPlayer.db.char.debug)then
	 	local s = "EMP Debug:"
		for i=1,select("#", ...) do
			local x = select(i, ...)
			s = strjoin("  ",s,tostring(x))
		end
		DEFAULT_CHAT_FRAME:AddMessage(s)
	end
end