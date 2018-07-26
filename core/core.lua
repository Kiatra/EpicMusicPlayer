--EpicMusicPlayer by yess
local EpicMusicPlayer = LibStub("AceAddon-3.0"):NewAddon("EpicMusicPlayer", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0","AceComm-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")
local media = LibStub:GetLibrary("LibSharedMedia-3.0", true) or nil
local AceCfgDlg = LibStub("AceConfigDialog-3.0")

local _G, eventtimer = _G, ""
local db, movesong
local timer = "" -- timer for display of seconds
local historyInUse = false --true when a sond from histroy is played

EpicMusicPlayer.controlslist = {
	TogglePlay = L["Play/Stop"], OnNextClick = L["Play Next Song"], OpenMenu = L["Drop Down Menu"],
	ShowConfig = L["Config"], ToggleMute = L["Mute / unmute music sound."], TogglePlayListGui = L["Playlist"],
	PlayLast = L["Play Last Song"], TogglePlayerGui = L["Toggle show GUI"], ToggleRandom = L["Toggle shuffle"],
	RemoveCurrendSong = L["Remove Song"], SpamDefault = L["Send song name to default channel"],
}
EpicMusicPlayer.version = GetAddOnMetadata("EpicMusicPlayer","Version")
EpicMusicPlayer.tocversion = select(4, GetBuildInfo());

------------------------------------------------------------------------------
-- ace load functions
-------------------------------------------------------------------------------
function EpicMusicPlayer:OnInitialize()
	  local defaults = {
		profile = {
			volume = 1,
			oldversion = "",
			spam = true,
			song = 2,
			list = 1,
			skin = "quest",
			defaultchannel = "PARTY",
			playlistPoint = "CENTER",
			playlistOffx = 0,
			playlistOffy = 0,
			playlistWidth = 900,
			playlistHeight = 602,
			playlistScale = 1,
			guiscale = 1,
			addGameMusic = true,
			maxLevelSong = true,
			controlset = {
				LeftButton="OnNextClick",
				RightButton="OpenMenu",
				MiddleButton="TogglePlay",
				Button4="TogglePlayListGui",
				Button5="TogglePlayListGui",
				leftaltcontrol = "RemoveCurrendSong",
				leftalt = "TogglePlay",
				leftcontrol = "SpamDefault",
				leftshift = "PlayLast",
			},
			artistcolour = {r=1, g=0.82, b=0, a=1},
			titlecolour = {r=1,g=1,b=1,a=1},
			backcolour = {r=1,g=1,b=1,a=1},
			bordercolour = {r=1,g=1,b=1,a=0.28},
			buttoncolour = {r=1,g=1,b=1,a=1},
			useartistcolour = true,
			guistrata = "MEDIUM",
			liststrata = "HIGH",
			fontindex = 2,
			guifontsize = 12,
			fontsize = 46,
			playlistfont = media:GetDefault("font"),
			gui = {
				scroll = true
			},
			eventZones = {},
		},
	}

	self.dataBase = LibStub("AceDB-3.0"):New("EpicMusicPlayerDB", defaults, "Default")

  AceCfgDlg:AddToBlizOptions("EpicMusicPlayer", "EpicMusicPlayer")
	AceCfgDlg:SetDefaultSize("EpicMusicPlayer", 700, 500)

	db = self.dataBase.profile
	self.db = db
	self:SetOptionDB(db)

	--fix previous bug
	if type(db.song) == "table" then
		db.song = 1
	end

	self:RegisterChatCommand("emp", "ChatCommand")
  self:RegisterChatCommand("epicmusicplayer", "ChatCommand")

	self.IsSearching = false
	self.UpdateInterval = 1
	self.playing = false

	self:UpdateListnames()

	if media then
		media:Register("font", "Adventure", "Interface\\AddOns\\EpicMusicPlayer\\media\\Adventure.ttf")
		media:Register("font", "BlackChancery", "Interface\\AddOns\\EpicMusicPlayer\\media\\BlackChancery.ttf")
		self.media = media
	end
	if not db.font then
		db.font = media:GetDefault("font")
	end
	self:RegisterComm("EpicMusicPlayer", "ReciveMessage")
	self:ScheduleRepeatingTimer("CheckDate", 30)

	if not db.addGameMusic then
		EpicMusicPlayer:RemoveGameMusicLists()
	end

	for name,key in pairs(db.eventZones) do
		EpicMusicPlayer:AddEventOptions(name)
	end
end

function EpicMusicPlayer:OnEnable(first)
	self:RegisterEvent("PLAYER_ENTERING_WORLD", EpicMusicPlayer.OnEnteringWorld, "PLAYER_ENTERING_WORLD")
	self:RegisterEvent("CHAT_MSG_WHISPER_INFORM", EpicMusicPlayer.OnWhisperInform)
  self:RegisterEvent("ZONE_CHANGED_NEW_AREA", EpicMusicPlayer.OnZoneChangedNewArea)
	self:RegisterEvent("PLAYER_ALIVE", EpicMusicPlayer.OnPlayerAlive)
	self:RegisterEvent("PLAYER_LEVEL_UP", EpicMusicPlayer.OnPlayerLevelUp)

	if(self.Playing == false)then
        if(db.auto) then
			EpicMusicPlayer:Play()
        else
			if(db.disablewowmusic) then
				SetCVar("Sound_EnableMusic", 0);
			else
				SetCVar("Sound_EnableMusic", 1);
			end
			EpicMusicPlayer:Stop()
        end
    end

	if(EpicMusicPlayerGui)then
		if(not self.dataBase.char.showgui)then
			EpicMusicPlayerGui:Toggle()
		end
	end

	self:CheckPlayList()
	if EpicMusicPlayer.playlist2 then
		EpicMusicPlayer:AddPlayList("Playlist", EpicMusicPlayer.playlist2, false)
		EpicMusicPlayer:RemovePlayList("Common")
	end
end

function EpicMusicPlayer:OnDisable()
	EpicMusicPlayer:Stop()
end

------------------------------------------------------------------------------
-- event functions
------------------------------------------------------------------------------
function EpicMusicPlayer:OnZoneChangedNewArea(event)
	if db.enableEvents then
		local zone = GetZoneText()
		for name,key in pairs(db.eventZones) do
			if zone == name then
				local list, listIndex = EpicMusicPlayer:GetListByName(key)
				if db.list ~= listIndex then
					song, db.list, db.song = EpicMusicPlayer:GetRandomSong(listIndex)
					EpicMusicPlayer:Play()
					return 1
				elseif not EpicMusicPlayer.Playing then
					EpicMusicPlayer:Play()
					return 1
				end
			end
		end
	end
end

-- patch 2.4.3  workaround
function EpicMusicPlayer:OnEnteringWorld(event)
	EpicMusicPlayer:CancelTimer(eventtimer,true)
	eventtimer = EpicMusicPlayer:ScheduleTimer(function()
		if EpicMusicPlayer.Playing and not db.usePlaySoundFile then
			SetCVar("Sound_EnableMusic", 0);
			EpicMusicPlayer:Play(EpicMusicPlayer.currentsong)
		else
			EpicMusicPlayer:OnZoneChangedNewArea()
		end
	end, 5)
end

-- patch 3.0.8  workaround
function EpicMusicPlayer:OnPlayerAlive(event)
    if( UnitIsDeadOrGhost("Player") and EpicMusicPlayer.Playing and not db.usePlaySoundFile )then
		SetCVar("Sound_EnableMusic", 0);
		EpicMusicPlayer:CancelTimer(eventtimer,true)
		eventtimer = EpicMusicPlayer:ScheduleTimer(function()
			if(EpicMusicPlayer.Playing)then
				EpicMusicPlayer:Play()
			end
		end, 2)
	end
end

-- called on user clicked next song, do not call directly
-- can't call PlayNext() directly because we need to set loopsong to false
function EpicMusicPlayer:OnNextClick()
	--db.loopsong = false
	EpicMusicPlayer:PlayNext()
end

-- save the name of the last whisper
function EpicMusicPlayer:OnWhisperInform()
	EpicMusicPlayer.whisper = arg2
end

-- move song if one is marked
function EpicMusicPlayer:CheckSongToMove()
	if(movesong)then
		self:MoveSong(self.moveoldlistIndex, self.movenewlistIndex, self.movesongIndex)
		movesong = nil
	end
end

function EpicMusicPlayer:GetFonts()
	return media:HashTable("font")
end

------------------------------------------------------------------------------
-- functions used by modules
------------------------------------------------------------------------------
function EpicMusicPlayer:GetCurrentListIndex()
	return db.list;
end

function EpicMusicPlayer:GetCurrentSong()
	if self.Playing then
		return self.currentsong
	else
		return nil
	end
end

function EpicMusicPlayer:GetCurrentSongName()
	if(playing and self.currentsong)then
		return self.currentsong.Song
	else
		if(db.disablewowmusic) then
			return L["Music off"]
		else
			return L["Game Music"]
		end
	end
end

function EpicMusicPlayer:GetCurrentArtstName()
	if(playing and self.currentsong)then
		return self.currentsong.Artist
	else
		return ""
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

		self:Print(L["Current will be moved on playing next song."])
		movesong = true
		self.movesongIndex = db.song
		self.movenewlistIndex = newListIndex
		self.moveoldlistIndex = db.list
	end
end

function EpicMusicPlayer:ShowConfig()
	EpicMusicPlayer:ChatCommand()
end

function EpicMusicPlayer:OnDisplayClick(parent, button)
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
		local func = self.db.controlset[button]
		self[func](self, parent)
	end
end

function EpicMusicPlayer:GetFont(fontname)
	local font
	if media then
		font = media:Fetch("font",fontname or db.font)
	else
		font = GameFontNormal:GetFont()
	end
	return font
end
