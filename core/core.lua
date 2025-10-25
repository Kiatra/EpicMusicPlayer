--EpicMusicPlayer by yess
local emp = LibStub("AceAddon-3.0"):NewAddon("EpicMusicPlayer", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0","AceComm-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")
local media = LibStub:GetLibrary("LibSharedMedia-3.0", true) or nil
local AceCfgDlg = LibStub("AceConfigDialog-3.0")
--"/etrace"
local _G, eventtimer = _G, ""
local db, movesong
local timer = "" -- timer for display of seconds

emp.controlslist = {
	TogglePlay = L["Play/Stop"], OnNextClick = L["Play Next Song"], OpenMenu = L["Drop Down Menu"],
	ShowConfig = L["Config"], ToggleMute = L["Mute / unmute music sound."], TogglePlayListGui = L["Playlist"],
	PlayLast = L["Play Last Song"], TogglePlayerGui = L["Toggle show GUI"], ToggleRandom = L["Toggle shuffle"],
	RemoveCurrendSong = L["Remove Song"], SpamDefault = L["Send song name to default channel"],
}
emp.version = C_AddOns.GetAddOnMetadata("emp","Version")
emp.tocversion = select(4, GetBuildInfo());

local function Debug(...)
	--@debug@
	local t = date("%H:%M:%S")
	local fakeMs=math.floor((debugprofilestop()%1000));
	local s = (format("[%s.%03d] EMP Debug:", t, fakeMs))
	--local s = "["..t.."] EMP Debug:"
	if not emp.dataBase then
		s = "EMP Initialize:"
    elseif not emp.dataBase.char.debug then
		return
	end

	for i=1,select("#", ...) do
		local x = select(i, ...)
		s = strjoin("  ",s,tostring(x))
	end
	DEFAULT_CHAT_FRAME:AddMessage(s)
	--@end-debug@
end

local function error(...)
	local s = "EMP Error:"
	for i=1,select("#", ...) do
		local x = select(i, ...)
		s = strjoin("  ",s,tostring(x))
	end
	DEFAULT_CHAT_FRAME:AddMessage(s)
end

function emp:Debug(...)
	Debug(self, ...)
end

function emp:Error(...)
	Debug(self, ...)
end
------------------------------------------------------------------------------
-- ace load functions
-------------------------------------------------------------------------------
function emp:OnInitialize()
	  local defaults = {
		profile = {
			volume = 1,
			oldversion = "",
			spam = false,
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
				LeftButton="TogglePlayListGui",
				RightButton="OpenMenu",
				MiddleButton="OnNextClick",
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
			broker = {
				MaxTextLength = 20,
				enabled = true,
				showtime = true,
				scroll = false,
				showtitle = true,
				shownumber = false,
				showartist = false,
				minimapButton = {
					hide = LibStub("AceAddon-3.0"):GetAddon("ChocolateBar", true) and true,
				},
			},
			model = {
				random = true,
				defaultmodel = "bloodelf",
				scale = 1,
				guitoggle = true;
				strata = "MEDIUM"
			},
			eventZones = {},
		},
	}

	self.dataBase = LibStub("AceDB-3.0"):New("EpicMusicPlayerDB", defaults, "Default")

	AceCfgDlg:AddToBlizOptions("emp", "emp")
	AceCfgDlg:SetDefaultSize("emp", 700, 500)
	emp:AddProfile(self.dataBase)

	emp:UpdateOldSavedSongs()

	db = self.dataBase.profile
	self.db = db
	if not self.SetOptionDB then
		error("Error loading emp options!")
		return
	end
	
	self:SetOptionDB(db)
	if db and type(db.song) == "table" then
		db.song = 1
	end
	
	self:RegisterChatCommand("emp", "ChatCommand")
	self:RegisterChatCommand("epicmusicplayer", "ChatCommand")

	self.IsSearching = false
	self.UpdateInterval = 1
	self.playing = false

	self:UpdateListnames()

	if media then
		media:Register("font", "Adventure", "Interface\\AddOns\\emp\\media\\Adventure.ttf")
		media:Register("font", "BlackChancery", "Interface\\AddOns\\emp\\media\\BlackChancery.ttf")
		self.media = media
	end
	if not db.font then
		db.font = media:GetDefault("font")
	end

	if not db.addGameMusic then
		emp:RemoveGameMusicLists()
	end

	for name,key in pairs(db.eventZones) do
		emp:AddEventOptions(name)
	end

	--@debug@
	EMP = emp
	if self:ShowAnimTestFrame() then end
	if self:ShowTestPlaylist() then self:SetTestScrollListData(self.playlists) end
	--@end-debug@
end

function emp:OnEnable(first)
	self:RegisterEvent("PLAYER_ENTERING_WORLD", emp.OnEnteringWorld, "PLAYER_ENTERING_WORLD")
	self:RegisterEvent("CHAT_MSG_WHISPER_INFORM", emp.OnWhisperInform)
    self:RegisterEvent("ZONE_CHANGED_NEW_AREA", emp.OnZoneChangedNewArea)
	self:RegisterEvent("PLAYER_ALIVE", emp.OnPlayerAlive)
	

	if(self.Playing == false)then
        if(db.auto) then
			emp:Play()
        else
			if(db.disablewowmusic) then
				SetCVar("Sound_EnableMusic", 0);
			else
				SetCVar("Sound_EnableMusic", 1);
			end
			emp:Stop()
        end
    end

	if EpicMusicPlayerGui then
		if self.db.showgui then
			EpicMusicPlayerGui:Show()
		else
			EpicMusicPlayerGui:Hide()
		end
	end

	self:_BuildPlaylistsFromCallbacks()
	self:CheckPlayList()
end

function emp:OnDisable()
	emp:Stop()
end

------------------------------------------------------------------------------
-- event functions
------------------------------------------------------------------------------
function emp:OnZoneChangedNewArea(event)
	if db.enableEvents then
		local zone = GetZoneText()
		for name,key in pairs(db.eventZones) do
			if zone == name then
				local list, listIndex = emp:_GetListByName(key)
				if db.list ~= listIndex then
					song, db.list, db.song = emp:GetRandomSong(listIndex)
					emp:Play()
					return 1
				elseif not emp.Playing then
					emp:Play()
					return 1
				end
			end
		end
	end
end

-- patch 2.4.3  workaround
function emp:OnEnteringWorld(event)
	emp:CancelTimer(eventtimer,true)
	eventtimer = emp:ScheduleTimer(function()
		if emp.Playing and not db.usePlaySoundFile then
			SetCVar("Sound_EnableMusic", 0);
			emp:Play(emp.currentsong)
		else
			emp:OnZoneChangedNewArea()
		end
	end, 5)
end

-- patch 3.0.8  workaround
function emp:OnPlayerAlive(event)
    if( UnitIsDeadOrGhost("Player") and emp.Playing and not db.usePlaySoundFile )then
		SetCVar("Sound_EnableMusic", 0);
		emp:CancelTimer(eventtimer,true)
		eventtimer = emp:ScheduleTimer(function()
			if(emp.Playing)then
				emp:Play()
			end
		end, 2)
	end
end

-- called on user clicked next song, do not call directly
-- can't call PlayNext() directly because we need to set loopsong to false
function emp:OnNextClick()
	--db.loopsong = false
	emp:PlayNext()
end

-- save the name of the last whisper
function emp:OnWhisperInform()
	emp.whisper = arg2
end

function emp:GetFonts()
	return media:HashTable("font")
end

------------------------------------------------------------------------------
-- functions used by modules
------------------------------------------------------------------------------
function emp:GetCurrentListIndex()
	return db.list;
end

function emp:GetCurrentSong()
	if self.Playing then
		return self.currentsong
	else
		return nil
	end
end

function emp:GetCurrentSongName()
	if(playing and self.currentsong)then
		return self.currentsong.title
	else
		if(db.disablewowmusic) then
			return L["Music off"]
		else
			return L["Game Music"]
		end
	end
end

function emp:GetCurrentArtstName()
	if(playing and self.currentsong)then
		return self.currentsong.artist
	else
		return ""
	end
end

function emp:GetCurrentListName()
	return emp:GetListName(db.list) or ""
end

function emp:RemoveCurrendSong()
	self:RemoveSong(db.list,db.song)
	self:PlayNext()
end

function emp:ShowConfig()
	emp:ChatCommand()
end

function emp:OnDisplayClick(parent, button)
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

function emp:GetFont(fontname)
	local font
	if media then
		font = media:Fetch("font",fontname or db.font)
	else
		font = GameFontNormal:GetFont()
	end
	return font
end

function emp:_defer(func)
  -- Create a queue the first time it's called
  if not self._deferQueue then
    self._deferQueue = {}

    -- Create a one-time frame to handle the event
    local f = CreateFrame("Frame")
    f:RegisterEvent("PLAYER_ENTERING_WORLD")
    f:SetScript("OnEvent", function(frame, event)
      -- Run all queued functions safely
      for _, fn in ipairs(emp._deferQueue) do
        local ok, err = pcall(fn)
        if not ok then
          geterrorhandler()("|cffff8080[EpicMusicPlayer:_defer]|r " .. tostring(err))
        end
      end

      -- Clean up
      emp._deferQueue = nil
      frame:UnregisterEvent(event)
      frame:SetScript("OnEvent", nil)
    end)
  end

  -- Add this function to the queue
  table.insert(self._deferQueue, func)
end
