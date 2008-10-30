--EpicMusicPlayer v1.6 by yess
	
EpicMusicPlayer = LibStub("AceAddon-3.0"):NewAddon("EpicMusicPlayer", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0")

local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")
local media = LibStub:GetLibrary("LibSharedMedia-3.0", true) or nil

local musicdir = "" -- path to the music :)
local searchlist = {} --serach result
local playedhistory = {} --todo, not used yet 
local selectedlist = 1 -- selected list in playlist only 
local songmoved = false 
local backuplist = nil -- a missing or broken playlist wil be overwritten this is to remember and restore the original list on logout

local volume = 0 -- remember volume on mute
local messageframe = nil -- song and artst display
--  remember song and list bevore moving song
local oldlist = 1
local oldsong = 2
--  ace timers
local songtimer = "" -- timer for next song countdown
local timer = "" -- timer vor display seconds 
local voltimer = "" -- volum chanded disply countdown
local eventtimer = ""
EpicMusicPlayer.listnames = {}
EpicMusicPlayer.fonts = {"Default"}
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
-------------------------------------------------------------------------------
-- drop down control tables
-------------------------------------------------------------------------------
local dropdownmove = {}
local dropdownchat = nil
local dropdownmenu = nil
-------------------------------------------------------------------------------
-- ace options table
-------------------------------------------------------------------------------
local empoptions = { 
    name = "EpicMusicPlayer "..EpicMusicPlayer.version,
    handler = EpicMusicPlayer,
	--childGroups = "tab",
	type='group',
	desc = 'Play the Music',
    args = {
		console={
			name=L["Console Controls"],
			type="group",
			order = -1,
			guiHidden = true,
			args={
				play = {
		            type = 'execute',
		            width = "half",
					order = 0,
					name = L["Play"],
		            desc = L["Play the Music"],
		            func = "Play",
		        },
		        stop = {
		            type = 'execute',
					width = "half",
					order = 1,
		            name = L["Stop"],
		            desc = L["Stop playing."],
		            func = "Stop"
		        },
		        next = {
		            type = 'execute',
					width = "half",
					order = 2,
		            name = L["Next"],
		            desc = L["Plays the next song."],
		            func = "PlayNext"
		        },
				last = {
		            type = 'execute',
					width = "half",
					order = 3,
		            name = L["Last"],
		            desc = L["Plays the last song."],
		            func = "PlayLast"
		        },
				playlist = {
		            type = 'execute',
					width = "half",
					order = 4,
		            name = L["Playlist"],
		            desc = L["Show the Music."],
		            func = function()
						 EpicMusicPlayer:ShowList()
					end
		        },
				del = {
		            type = 'execute',
					--width = "half",
					order = -1,
		            name = L["Remove Song"],
		            desc = L["Remove the playing song from list"],
		            func = function()
						if(EpicMusicPlayer.Playing)then
							EpicMusicPlayer:RemoveSong(EpicMusicPlayer.db.profile.list,EpicMusicPlayer.db.profile.song);
						else
							EpicMusicPlayer:Print(L["Not playing."])
						end
						
					end
		        },
			},
		},
		general={
			name=L["General"],
			order = 0,
			type="group",
			args={
				colours={
					name=L["Font & Colours"],
					order = 0,
					type="group",
					args={
						artistcolour = {
							type = "color",
							name = L["Artist color"],
							desc = L["Artist color"],
							hasAlpha = false,
							get = function(info)
								local r = EpicMusicPlayer.db.profile.artistcolour.r
								local g = EpicMusicPlayer.db.profile.artistcolour.g
								local b = EpicMusicPlayer.db.profile.artistcolour.b
								local a = EpicMusicPlayer.db.profile.artistcolour.a
								return r, g, b, a
							end,
							set = function(info, r, g, b, a)
								EpicMusicPlayer.db.profile.artistcolour.r = r
								EpicMusicPlayer.db.profile.artistcolour.g = g
								EpicMusicPlayer.db.profile.artistcolour.b = b
								EpicMusicPlayer.db.profile.artistcolour.a = a
								EpicMusicPlayer.db.profile.artistcolour.hex = EpicMusicPlayer:GetColorString(r,g,b,a)
								
								if(EpicMusicPlayer.db.profile.useartistcolour)then
									EpicMusicPlayer.db.profile.buttoncolour.r = r
									EpicMusicPlayer.db.profile.buttoncolour.g = g
									EpicMusicPlayer.db.profile.buttoncolour.b = b
									EpicMusicPlayer.db.profile.buttoncolour.a = a
								end
								
								--update gui
								if(EpicMusicPlayerGui)then
									EpicMusicPlayerGui:UpdateFrame(EpicMusicPlayer)
								end
							end
						},
						titlecolour = {
							type = "color",
							name = L["Title color"],
							desc = L["Title color"],
							hasAlpha = false,
							get = function(info)
								local r = EpicMusicPlayer.db.profile.titlecolour.r
								local g = EpicMusicPlayer.db.profile.titlecolour.g
								local b = EpicMusicPlayer.db.profile.titlecolour.b
								local a = EpicMusicPlayer.db.profile.titlecolour.a
								return r, g, b, a
							end,
							set = function(info, r, g, b, a)
								EpicMusicPlayer.db.profile.titlecolour.r = r
								EpicMusicPlayer.db.profile.titlecolour.g = g
								EpicMusicPlayer.db.profile.titlecolour.b = b
								EpicMusicPlayer.db.profile.titlecolour.a = a
								EpicMusicPlayer.db.profile.titlecolour.hex = EpicMusicPlayer:GetColorString(r,g,b,a)
								--update gui
								if(EpicMusicPlayerGui)then
									EpicMusicPlayerGui:UpdateFrame(EpicMusicPlayer)
								end
							end
						},
						font = {
							type = 'select',
							values = EpicMusicPlayer.fonts,
							order = 1,
							name = L["Font"],
							desc = L["Font"],
							get = function() 
								return EpicMusicPlayer.db.profile.fontindex
							end,
							set = function(info, value)
								EpicMusicPlayer.db.profile.fontindex = value
								--update gui
								if(EpicMusicPlayerGui)then
									EpicMusicPlayerGui:UpdateFrame(EpicMusicPlayer)
								end
								EpicMusicPlayer:UpdateMessageFrame()
							end,
						},
					},
				},
				controls={
					name=L["Mouse Setup"],
					order = -1,
					type="group",
					args={
						left = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 1,
							name = L["Left Click"],
							desc = L["Left Click"],
							get = function() 
								return EpicMusicPlayer.db.profile.controlset.left
							end,
							set = function(info, value)
								EpicMusicPlayer.db.profile.controlset.left = value
							end,
						},
						right = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 2,
							name = L["Right Click"],
							desc = L["Right Click"],
							get = function() 
								return EpicMusicPlayer.db.profile.controlset.right
							end,
							set = function(info, value)
								EpicMusicPlayer.db.profile.controlset.right = value
							end,
						},
						middle = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 3,
							name = L["Middle Click"],
							desc = L["Middle Click"],
							get = function() 
								return EpicMusicPlayer.db.profile.controlset.middle
							end,
							set = function(info, value)
								EpicMusicPlayer.db.profile.controlset.middle = value
							end,
						},
						button4 = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 4,
							name = L["Button4"],
							desc = L["Button4"],
							get = function() 
								return EpicMusicPlayer.db.profile.controlset.button4
							end,
							set = function(info, value)
								EpicMusicPlayer.db.profile.controlset.button4 = value
							end,
						},
						button5 = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 5,
							name = L["Button5"],
							desc = L["Button5"],
							get = function() 
								return EpicMusicPlayer.db.profile.controlset.button5
							end,
							set = function(info, value)
								EpicMusicPlayer.db.profile.controlset.button5 = value
							end,
						},
						leftalt = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 6,
							name = L["Alt+Click"],
							desc = "",
							get = function() 
								return EpicMusicPlayer.db.profile.controlset.leftalt
							end,
							set = function(info, value)
								EpicMusicPlayer.db.profile.controlset.leftalt = value
							end,
						},
						leftshift = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 7,
							name = L["Shift+Click"],
							desc = "",
							get = function() 
								return EpicMusicPlayer.db.profile.controlset.leftshift
							end,
							set = function(info, value)
								EpicMusicPlayer.db.profile.controlset.leftshift = value
							end,
						},
						leftcontrol = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 8,
							name = L["Control+Click"],
							desc = "",
							get = function() 
								return EpicMusicPlayer.db.profile.controlset.leftcontrol
							end,
							set = function(info, value)
								EpicMusicPlayer.db.profile.controlset.leftcontrol = value
							end,
						},
						leftaltcontrol = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 9,
							name = L["Alt+Control+Click"],
							desc = "",
							get = function() 
								return EpicMusicPlayer.db.profile.controlset.leftaltcontrol
							end,
							set = function(info, value)
								EpicMusicPlayer.db.profile.controlset.leftaltcontrol = value
							end,
						},
					},
				},	
				list = {
		            type = 'execute',
		            --width = "half",
					order = -1,
					name = L["Console"],
		            desc = L["Show console commands"],
		            func = "List"
				},
		        mute = {
		            type = 'toggle',
					--width = "half",
					order = 1,
					name = L["Mute"],
		            desc = L["Mute / unmute music sound."],
		            get = "IsMute",
		            set = "ToggleMute"
		        },
				wowmusic = {
		            type = 'toggle',
					--width = "half",
					order = 2,
		            name = L["Disable WoW Music"],
		            desc = L["Disable WoW Music when not Playing."],
		            get = "IsDisWoWMusic",
		            set = "ToggleDisWoWMusic"
				},
				auto = {
		            type = 'toggle',
					--width = "half",
					order = 3,
					name = L["Autoplay"],
		            desc = L["Toggles auto play on load."],
		            get = "IsAuto",
		            set = "ToggleAuto"
		        },
				info = {
		            type = 'toggle',
					--width = "half",
					order = 4,
					name = L["Show Info"],
		            desc = L["Show song and artist on new song"],
		            get = "IsShowMessage",
		            set = "ToggleShowMessage",
		        },
		        spam = {
		            type = 'toggle',
					--width = "half",
					order = 5,
		            name = L["Show Song In Chat"],
		            desc = L["Show message in your chat when playing a new song."],
		            get = "IsSpam",
		            set = "ToggleSpam"
				},
				badlist = {
		            type = 'select',
					values = EpicMusicPlayer.listnames,
					order = 6,
					name = L["Bad list"],
		            desc = L["This list will not be played. Unless you select it."].." "..L["Set a key in the key bindings menu to move a song to the selected list by that key."],
					get = function() 
						return EpicMusicPlayer.db.profile.badlist
					end,
		            set = function(info, value)
						EpicMusicPlayer.db.profile.badlist = value
		            end,
				},
				bestlist = {
		            type = 'select',
					values = EpicMusicPlayer.listnames,
					order = 7,
					name = L["Favorites List"],
		            desc = L["Set a key in the key bindings menu to move a song to the selected list by that key."],
					get = function() 
						return EpicMusicPlayer.db.profile.bestlist
					end,
		            set = function(info, value)
						EpicMusicPlayer.db.profile.bestlist = value
		            end,
				},
				defaultchat = {
		            type = 'select',
					values = {GUILD=L["Guild"],
							  PARTY=L["Party"],SAY=L["Say"],TARGET=L["To target"],RAID=L["Raid"]},
					order = 8,
		            name = L["Default Channel"],
		            desc = L["Select the default channel to spam on ctrl+click"],
					get = "GetDefaultChannel",
		            set = "SetDefaultChannel"
				},
				link = {
		            type = 'toggle',
					--width = "half",
					order = 9,
		            name = L["Spam Link"],
		            desc = L["Add a youtube link to chat spam."],
		            get = "IsLink",
		            set = "ToggleLink"
				},
			}
		},
		list={
			name="Playlist",
			order = 1,
			type="group",
			args={
				shuffle = {
		            type = 'toggle',
					--width = "half",
					order = 1,
		            name = L["Shuffle"],
		            desc = L["Toggle shuffle"],
		            get = "IsRandom",
		            set = "ToggleRandom"
		        },
				looplist = {
		            type = 'toggle',
					--width = "half",
					order = 2,
		            name = L["Loop Playlist"],
		            desc = L["Playing the last song of a list will not switch to the next list."],
		            get = "IsLoopList",
		            set = "ToggleLoopList"
				},
				loopsong = {
		            type = 'toggle',
					--width = "half",
					order = 3,
		            name = L["Loop Song"],
		            desc = L["Play the current song again and again and again...until your head will explode. A click on next song will disable this."],
		            get = function()
					  return EpicMusicPlayer.db.profile.loopsong
					end,
					set = function(info, v)
					  EpicMusicPlayer.db.profile.loopsong = not EpicMusicPlayer.db.profile.loopsong
					end,
				},
				addlist = {
					type = 'input',
					order = 5,
					name = L["Add Playlist"],
					desc = L["Add Playlist"],
					usage = "<name>",
					get = function()
					  return ""
					end,
					set = function(info, name)
					  EpicMusicPlayer:AddPlayList(name)
					end,
				},
				dellist = {
					type = 'input',
					order = 6,
					name = L["Remove Playlist"],
					desc = L["Remove Playlist"],
					usage = "<name>",
					get = function()
					  return ""
					end,
					set = function(info, name)
					  EpicMusicPlayer:RemovePlayList(name)
					end,
				},
			},
		},
	}
}

------------------------------------------------------------------------------
-- ace load functions 
-------------------------------------------------------------------------------
function EpicMusicPlayer:OnInitialize()	
	-- Called when the addon is loaded
	self.Playing = false
	self.IsSearching = false
	self.sec = 0
	self.UpdateInterval = 1
		
    self.db = LibStub("AceDB-3.0"):New("EpicMusicPlayerDB", defaults, "Default")

	LibStub("AceConfig-3.0"):RegisterOptionsTable("EpicMusicPlayer", empoptions)
    local optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("EpicMusicPlayer", "EpicMusicPlayer")
	LibStub("AceConfigDialog-3.0"):SetDefaultSize("EpicMusicPlayer", 500, 400)
	
	EpicMusicPlayerScrollBar:Show()
	EpicMusicPlayerListsScrollBar:Show()
	
	self.db:RegisterDefaults({
		profile = {
			random = false,
			auto = false,
			volume = 1,
			spam = trume,
			--first song = 2 (song 1 is playlist name)
			song = 2,
			list = 1,
			looplist = false,
			loopsong = false,
			disablewowmusic = false,
			showmessage = true,
			minimapbutton = true,
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
			--todo set default colors
			artistcolour = {r=0.6,g=0.2,b=0.8,a=0.8, hex = "FF9933CC"},
			titlecolour = {r=1,g=1,b=1,a=1,hex = "ffffffff"},
			backcolour = {r=0,g=0,b=0,a=1},
			bordercolour = {r=1,g=1,b=1,a=0.28},
			buttoncolour = {r=0.6,g=0.2,b=0.8,a=0.8},
			useartistcolour = true,
			guistrata = "MEDIUM",
			font = "Adventure",
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
	if(self.db.profile.list == 0)then
		self.db.profile.list = 1
	end
		
	self:RegisterMessage("EMPUpdateTime")
	self:RegisterChatCommand("emp", "ChatCommand")
    self:RegisterChatCommand("epicmusicplayer", "ChatCommand")
	
	self:CheckPlayList()
	self:UpdateListnames()
	
	self:SetNextPlayable(self.db.profile.list,self.db.profile.song)
	
	EMPStringArtist:SetText(L["Artist"])
	EMPStringTitle:SetText(L[" - Title"])
	EMPStringPlaylists:SetText(L["Playlists"])
	EpicMusicPlayerSearchEditBoxChildFrameButtonClose:SetText(L["Close"])
	EpicMusicPlayerSearchEditBoxChildFrameButtonClear:SetText(L["Clear"])
	
	if media then
		media:Register("font", "Adventure", "Interface\\AddOns\\EpicMusicPlayer\\fonts\\Adventure.ttf")
		media:Register("font", "Black Chancery", "Interface\\AddOns\\EpicMusicPlayer\\fonts\\BlackChancery.ttf")
		
		self.fonts = media:List("font")
		empoptions.args.general.args.colours.args.font.values = self.fonts
	end
end

function EpicMusicPlayer:OnEnable(first)
    
	self:RegisterEvent("PLAYER_LOGOUT", EpicMusicPlayer.OnLogout)
	self:RegisterEvent("PLAYER_ENTERING_WORLD", EpicMusicPlayer.OnEnteringWorld, "PLAYER_ENTERING_WORLD")
	self:RegisterEvent("CHAT_MSG_WHISPER_INFORM", EpicMusicPlayer.OnWhisperInform)
	
	if(self.Playing == false)then
        if(self.db.profile.auto) then
			EpicMusicPlayer:Play()
        else
			if(self.db.profile.disablewowmusic) then 
				SetCVar("Sound_EnableMusic", 0);	
			else
				SetCVar("Sound_EnableMusic", 1);	
			end
        end
    end
	
	if(EpicMusicPlayerGui)then
		if(self.db.profile.minimapbutton)then
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

function EpicMusicPlayer:OnLogout()
	if(backuplist)then
		--EpicMusicPlayer_PlayList = backuplist
	end
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

function EpicMusicPlayer:OnWhisperInform()
	--EpicMusicPlayer:Debug(arg1,arg2)
	EpicMusicPlayer.whisper = arg2
end

-- update the list with the listnames
function EpicMusicPlayer:UpdateListnames()
	EpicMusicPlayer.listnames = {};
	for i, list in ipairs(EpicMusicPlayer_PlayList) do
		EpicMusicPlayer.listnames[list[1].ListName] = list[1].ListName
	end
	--local options = LibStub.libs["AceConfigRegistry-3.0"]:GetOptionsTable("EpicMusicPlayer","dialog","EpicMusicPlayer-1.1")
	empoptions.args.general.args.badlist.values = EpicMusicPlayer.listnames
	empoptions.args.general.args.bestlist.values = EpicMusicPlayer.listnames
	--LibStub("AceConfigRegistry-3.0"):NotifyChange("EpicMusicPlayer")
	--return EpicMusicPlayer.listnames
end

-------------------------------------------------------------------------------
-- option functions
-------------------------------------------------------------------------------
function EpicMusicPlayer:IsPlayerGui()
    if(EMPGUI)then
		if(EMPGUI:IsVisible())then
			return true
		end
	end
	
	return false
end

function EpicMusicPlayer:TogglePlayerGui()
    if(EpicMusicPlayerGui)then
		EpicMusicPlayerGui:Toggle()
	else
		EpicMusicPlayer:Print(L["Gui not found"])
	end
	EpicMusicPlayer.db.char.showgui = not EpicMusicPlayer.db.char.showgui
	
end

function EpicMusicPlayer:IsMinimap()
    if(EpicMusicPlayerMiniButton)then
		if(EpicMusicPlayerMiniButton:IsVisible())then
			return true
		end
	end	
	return false
end

function EpicMusicPlayer:ToggleMinimap()
    if(EpicMusicPlayerGui)then
		EpicMusicPlayerGui:ToggleMinimap()
	else
		EpicMusicPlayer:Print(L["Gui not found"])
	end
	EpicMusicPlayer.db.profile.minimapbutton = not EpicMusicPlayer.db.profile.minimapbutton
end

function EpicMusicPlayer:GetDefaultChannel()
    return EpicMusicPlayer.db.profile.defaultchannel
end

function EpicMusicPlayer:SetDefaultChannel(info,value)
    EpicMusicPlayer.db.profile.defaultchannel = value
end

function EpicMusicPlayer:IsPlay()
    return self.Playing
end

function EpicMusicPlayer:TogglePlay()
    if(self.Playing) then
        EpicMusicPlayer:Stop()
    else
        EpicMusicPlayer:Play()
    end
end

function EpicMusicPlayer:IsShowMessage()
    return EpicMusicPlayer.db.profile.showmessage
end

function EpicMusicPlayer:ToggleShowMessage()
    EpicMusicPlayer.db.profile.showmessage = not EpicMusicPlayer.db.profile.showmessage
end

function EpicMusicPlayer:IsMute()
    return self.mute
end

function EpicMusicPlayer:ToggleMute()
	self = EpicMusicPlayer
	if(self.mute) then
        EpicMusicPlayer:SetVolume(volume,"music")
    else
        volume = self.db.profile.volume
		EpicMusicPlayer:SetVolume(0,"music")
    end
	self.mute = not self.mute
end

function EpicMusicPlayer:IsSpam()
	return self.db.profile.spam
end

function EpicMusicPlayer:ToggleSpam()
    EpicMusicPlayer.db.profile.spam = not self.db.profile.spam
end

function EpicMusicPlayer:IsLink()
	return self.db.profile.link
end

function EpicMusicPlayer:ToggleLink()
    EpicMusicPlayer.db.profile.link = not self.db.profile.link
end


function EpicMusicPlayer:IsLoopList()
	return self.db.profile.looplist
end

function EpicMusicPlayer:ToggleLoopList()
    EpicMusicPlayer.db.profile.looplist = not self.db.profile.looplist
end

function EpicMusicPlayer:IsDisWoWMusic()
	return EpicMusicPlayer.db.profile.disablewowmusic
end

function EpicMusicPlayer:ToggleDisWoWMusic()
	if(not EpicMusicPlayer.Playing)then
		if(self.db.profile.disablewowmusic) then 
			SetCVar("Sound_EnableMusic", 1);	
		else
			SetCVar("Sound_EnableMusic", 0);	
		end
	end
	EpicMusicPlayer.db.profile.disablewowmusic = not EpicMusicPlayer.db.profile.disablewowmusic
end

function EpicMusicPlayer:IsRandom()
    return EpicMusicPlayer.db.profile.random
end

function EpicMusicPlayer:ToggleRandom()
    EpicMusicPlayer.db.profile.random = not EpicMusicPlayer.db.profile.random
	EpicMusicPlayer:SendMessage("EMPUpdateRandom",EpicMusicPlayer.db.profile.random)
end


function EpicMusicPlayer:IsAuto()
    return self.db.profile.auto
end

function EpicMusicPlayer:ToggleAuto()
    self.db.profile.auto = not self.db.profile.auto
end

function EpicMusicPlayer:ShowPlaylist()
    LibStub("AceConfigDialog-3.0"):Close("EpicMusicPlayer")
end


function EpicMusicPlayer:ChatCommand(input)
    if not input or input:trim() == "" then
        LibStub("AceConfigDialog-3.0"):Open("EpicMusicPlayer")
    else
        LibStub("AceConfigCmd-3.0").HandleCommand(EpicMusicPlayer, "emp", "EpicMusicPlayer", input)
    end
end

function EpicMusicPlayer:List()
    LibStub("AceConfigCmd-3.0").HandleCommand(EpicMusicPlayer, "emp", "EpicMusicPlayer", "")
end

function EpicMusicPlayer:ToggleGui()
	LibStub("AceConfigDialog-3.0"):Open("EpicMusicPlayer")
end

-------------------------------------------------------------------------------
-- playlist frame functions 
-------------------------------------------------------------------------------
function EpicMusicPlayer_ScrollBar_Update()
  --EpicMusicPlayer:Print(arg1)
 -- EpicMusicPlayer:Print(arg2)
  
  EpicMusicPlayerSearchEditBox:SetText(L["Search..."])
  
  local button;
  local list = selectedlist
  
  local max = table.getn(EpicMusicPlayer_PlayList[list])-1;
  
  
  -- 1 through 5 of our window to scroll
  local line; 
  -- an index into our data calculated from the scroll offset
  local lineplusoffset; 
  FauxScrollFrame_Update(EpicMusicPlayerScrollBar,max,11,16);
  for line=1,11 do
    lineplusoffset = line + FauxScrollFrame_GetOffset(EpicMusicPlayerScrollBar);
    
    button = getglobal("EpicMusicPlayerEntry"..line);
   
    if lineplusoffset <= max then
      getglobal("EpicMusicPlayerEntry"..line.."Index"):SetText(lineplusoffset);
      
	  local artist = EpicMusicPlayer_PlayList[list][lineplusoffset+1].Artist
	  if(artist == "")then
			getglobal("EpicMusicPlayerEntry"..line.."Artist"):SetText(EpicMusicPlayer_PlayList[list][lineplusoffset+1].Song);
	  else
			getglobal("EpicMusicPlayerEntry"..line.."Artist"):SetText(artist.." - "..EpicMusicPlayer_PlayList[list][lineplusoffset+1].Song);
	  end
	  
      --getglobal("EpicMusicPlayerEntry"..line.."Song"):SetText((EpicMusicPlayer_PlayList[list][lineplusoffset+1].Song));
      getglobal("EpicMusicPlayerEntry"..line):Show();
	  
	  --[[
	  if(lineplusoffset == EpicMusicPlayer.db.profile.song-1) then
			--getglobal("EpicMusicPlayerListEntry"..line.."Artist"):SetTextColor(255,0,0)
			button:LockHighlight() 
		else
		    --getglobal("EpicMusicPlayerListEntry"..line.."Artist"):SetTextColor(0,255,0)
			button:UnlockHighlight() 
		end
		--]]
    else
      getglobal("EpicMusicPlayerEntry"..line):Hide();
    end
    
	button:SetID(lineplusoffset);
    
  end
end

function EpicMusicPlayer_ListsScrollBar_Update()
  EpicMusicPlayer_ScrollBar_Update()
  
  local max = table.getn(EpicMusicPlayer_PlayList);
  local list = selectedlist
  
  -- 1 through 5 of our window to scroll
  local line; 
  -- an index into our data calculated from the scroll offset
  local lineplusoffset; 
  FauxScrollFrame_Update(EpicMusicPlayerListsScrollBar,max,11,16);
  for line=1,11 do
    lineplusoffset = line + FauxScrollFrame_GetOffset(EpicMusicPlayerListsScrollBar);
    
   
    button = getglobal("EpicMusicPlayerListEntry"..line);
	
	if lineplusoffset <= max then
      getglobal("EpicMusicPlayerListEntry"..line.."Index"):SetText(lineplusoffset);
      getglobal("EpicMusicPlayerListEntry"..line.."Artist"):SetText((EpicMusicPlayer_PlayList[lineplusoffset][1].ListName));
      getglobal("EpicMusicPlayerListEntry"..line):Show();
		
		if(line == list) then
			--getglobal("EpicMusicPlayerListEntry"..line.."Artist"):SetTextColor(255,0,0)
			button:LockHighlight() 
		else
		    --getglobal("EpicMusicPlayerListEntry"..line.."Artist"):SetTextColor(0,255,0)
			button:UnlockHighlight() 
		end
	
	else
      getglobal("EpicMusicPlayerListEntry"..line):Hide();
    end
    
    button:SetID(lineplusoffset);
    
  end
end


function EpicMusicPlayer_ScrollBar_Search_Update()
      
  
  --[[
  local button;
  local max = table.getn(searchlist[1]);
  
  
  -- 1 through 5 of our window to scroll
  local line; 
  -- an index into our data calculated from the scroll offset
  local lineplusoffset; 
  FauxScrollFrame_Update(EpicMusicPlayerScrollBar,max,11,16);
  for line=1,11 do
    lineplusoffset = line + FauxScrollFrame_GetOffset(EpicMusicPlayerScrollBar);
    
   
    if lineplusoffset <= max then
      getglobal("EpicMusicPlayerEntry"..line.."Index"):SetText(lineplusoffset);
      
	  local artist = searchlist[1][lineplusoffset].Artist
	  if(artist == "")then
			getglobal("EpicMusicPlayerEntry"..line.."Artist"):SetText(searchlist[1][lineplusoffset].Song);
	  else
			getglobal("EpicMusicPlayerEntry"..line.."Artist"):SetText(artist.." - "..searchlist[1][lineplusoffset].Song);
	  end
	  --getglobal("EpicMusicPlayerEntry"..line.."Artist"):SetText((searchlist[1][lineplusoffset].Artist));
      --getglobal("EpicMusicPlayerEntry"..line.."Song"):SetText((searchlist[1][lineplusoffset].Song));
      getglobal("EpicMusicPlayerEntry"..line):Show();
    else
      getglobal("EpicMusicPlayerEntry"..line):Hide();
    end
    
    button = getglobal("EpicMusicPlayerEntry"..line);
		button:SetID(lineplusoffset);
    
  end
  --]]
end

-- klick on mp3file
function EpicMusicPlayer_Playlist_OnClickMp3(Button)
  if (Button == "RightButton") then
	elseif (Button == "LeftButton") then
     EpicMusicPlayer.db.profile.list = selectedlist
	 EpicMusicPlayer.db.profile.song = this:GetID()+1
     EpicMusicPlayer:Play(); 
	end
end

-- klick on list of playlists
function EpicMusicPlayer_Playlist_OnClickList(Button)
  
  if (Button == "RightButton") then
	elseif (Button == "LeftButton") then
		EpicMusicPlayer.IsSearching = false;
		selectedlist = this:GetID()
		EpicMusicPlayer_ScrollBar_Update()
		EpicMusicPlayer_ListsScrollBar_Update()
		
	end
	
end

function EpicMusicPlayer:TogglePlaylist()
	
	if(EpicMusicPlayerPlaylistFrame:IsShown())then 
		EpicMusicPlayerPlaylistFrame:Hide()
	else
		EpicMusicPlayerPlaylistFrame:Show()
	end
end
------------------------------------------------------------
-- play/stop functions
------------------------------------------------------------
function EpicMusicPlayer:Play()
	EpicMusicPlayer:CheckSongToMove()
	local currsong = self.db.profile.song
	local currlist = self.db.profile.list
	local songname = EpicMusicPlayer_PlayList[currlist][currsong].Song
	local artist = EpicMusicPlayer_PlayList[currlist][currsong].Artist
	
	--self:CancelTimer(songtimer,true)
	self:CancelTimer(timer,true)
	
	SetCVar("Sound_EnableMusic", 1);	
	
	self.sec = 0
	self.Playing = true;
	
	-- check is song ingame musik 
	if(EpicMusicPlayer_PlayList[currlist][currsong].Album == "ingame") then
		-- ingame music do not add addon mp3 path
		PlayMusic(EpicMusicPlayer_PlayList[currlist][currsong].Name)
	else
		PlayMusic(musicdir..EpicMusicPlayer_PlayList[currlist][currsong].Name)
		--SetCVar("Sound_EnableSFX", 0);
		--SetCVar("Sound_EnableSFX", 1);		
		--PlaySoundFile(musicdir..EpicMusicPlayer_PlayList[currlist][currsong].Name)
	end
	
	if(self.db.profile.spam) then
		DEFAULT_CHAT_FRAME:AddMessage("|TInterface\\AddOns\\EpicMusicPlayerFu\\icon.tga:18|t |c"
		..self.db.profile.artistcolour.hex..artist.."|r - |c"..self.db.profile.titlecolour.hex..songname)
		--DEFAULT_CHAT_FRAME:AddMessage("<EMP> |c"..self.db.profile.artistcolour.hex..
		--artist.."|r - |c"..self.db.profile.titlecolour.hex..songname)
	end
	
	songlength = EpicMusicPlayer_PlayList[currlist][currsong].Length	
	--songtimer = self:ScheduleTimer(EpicMusicPlayer.PlayNext, songlength, arg)
	
	timer = self:ScheduleRepeatingTimer(
		function()	
			self:SendMessage("EMPUpdateTime", self.sec)
			self.sec = self.sec + 1
			if(self.sec >= songlength)then
				self:PlayNext()
			end
			--DEFAULT_CHAT_FRAME:AddMessage(songlength)
		end
		, 1)
	
	if(self.db.profile.showmessage)then
		self:UpdateMessageFrameText(artist, songname)
	end
	
	self:SendMessage("EMPUpdatePlay", artist, songname, songlength)
end
function EpicMusicPlayer:Stop()
	EpicMusicPlayer:CheckSongToMove()
	self:CancelTimer(songtimer,true)
	self:CancelTimer(timer,true)
	
	if(self.db.profile.disablewowmusic) then 
		SetCVar("Sound_EnableMusic", 0);	
	end
	StopMusic()
	self.Playing = false;
	self:SendMessage("EMPUpdateStop")
	--self:Print("Stopped")
end

function EpicMusicPlayer:PlayNext()
	local self = EpicMusicPlayer;
	--move marked song
	self:CheckSongToMove()
	
	-- check random play
    if(self.db.profile.random and not self.db.profile.loopsong) then
        --todo random over multipe playlist 
		if(table.getn(EpicMusicPlayer_PlayList[self.db.profile.list]) < 2) then
			--list empty
			self:SetNextPlayable(self.db.profile.list, self.db.profile.song)
		else
			self.db.profile.song = math.random(2, table.getn(EpicMusicPlayer_PlayList[self.db.profile.list]))
			--self.db.profile.list = currlist;
        end
    else        
        self.db.profile.song = self.db.profile.song+1  
		self:SetNextPlayable(self.db.profile.list, self.db.profile.song)
    end  
	
    self:Play()	
end

function EpicMusicPlayer:PlayLast()
    EpicMusicPlayer.db.profile.loopsong = false
	EpicMusicPlayer:CheckSongToMove()
	EpicMusicPlayer.db.profile.song = EpicMusicPlayer.db.profile.song-1
    if(EpicMusicPlayer.db.profile.song < 2) then
      EpicMusicPlayer.db.profile.song = 2
    end
  
    EpicMusicPlayer:Play();
end

function EpicMusicPlayer:EMPUpdateTime()
	 
end

-- move song if one is marked
function EpicMusicPlayer:CheckSongToMove()
	if(self.movesong)then
		self:MoveSong(self.moveoldlist, self.movenewlist, self.movesong)
		self.movesong = nil
	end
end
--[[
function EpicMusicPlayer:CheckPlayable(list, song)
	if(list > 0 and list < table.getn(EpicMusicPlayer_PlayList))then
		if(table.getn(EpicMusicPlayer_PlayList[list]))then
		
		end
	end
end
--]]
------------------------------------------------------------------------------------------- 
--  set song and list to next playable song
------------------------------------------------------------------------------------------- 
function EpicMusicPlayer:SetNextPlayable(list,song)
	--new set list could be emty check until a list that is ok is found
	local listnum = 0;
	while (listnum <= table.getn(EpicMusicPlayer_PlayList)) do
		
		if(self.db.profile.loopsong == true)then
			return;
		end
		
		listnum = listnum +1 
		-- check for end of current list
		--self:Print("cheking list: "..list)
		if(song > table.getn(EpicMusicPlayer_PlayList[list]) or song < 2) then
			-- end of list jump to next list
			if(self.db.profile.looplist == true and table.getn(EpicMusicPlayer_PlayList[list]) > 1)then
				--stay on list
			else	
				list = list + 1
			end
			
			-- set current song to first song in list (entry 2)  
			-- entry 1 in list always is the playlist name 
			song = 2
					
			-- check for last list 
			if(list > table.getn(EpicMusicPlayer_PlayList)) then
				  -- last song in last list played set back to list 1.
				  list = 1
			end
			
			--do not play badlist
			if(EpicMusicPlayer_PlayList[list][1].ListName==self.db.profile.badlist)then
				list = list + 1
			end
		else
			--new set list is ok
			self.db.profile.song = song
			self.db.profile.list = list
			return;
		end
	end
	
	--all lists checked still not good oO
	self:Print(L["Playlist error oO Playlist maybe empty."]);	
	
	--backup the list
	backuplist = EpicMusicPlayer_PlayList	
	
	--this will set the buildin playlist 
	EpicMusicPlayer_PlayList = nil;
	self:CheckPlayList() 

	return;	
end

--------------------------------------------------------
-- adjust the music volume
--------------------------------------------------------
function EpicMusicPlayer:SetVolume(vol, voltype)
    self:CancelTimer(voltimer,true)
	
	if(voltype == "music")then
		self.db.profile.volume = vol;
		SetCVar("Sound_MusicVolume", vol);
		self:SendMessage("EMPUpdateVolume", "music", vol)
    else
		SetCVar("Sound_SFXVolume", vol);
		self:SendMessage("EMPUpdateVolume", "sound", vol)
	end
	
	voltimer = self:ScheduleTimer(EpicMusicPlayer.VolumeDone, 3, arg)
end
--------------------------------------------------------

function EpicMusicPlayer:VolumeDone()
	EpicMusicPlayer:SendMessage("EMPUpdateVolume", "done")
end

-- move song after current song
function EpicMusicPlayer:MoveSongAfter(oldList, newList, song)
	local self = EpicMusicPlayer
	
    if(oldList == newList)then
		self:Print(L["Song is already in that list."])
		return false;
	end
	
	--todo localization
	self:Print(L["After current, song will be moved to list"]..": "..EpicMusicPlayer_PlayList[newList][1].ListName)
	
	self.movesong = song
	self.movenewlist = newList
	self.moveoldlist = oldList
end

function EpicMusicPlayer:CopySong(oldList, newList, song)
	local self = EpicMusicPlayer
	
    if(oldList == newList)then
		self:Print(L["Song is already in that list."])
		return false;
	end
	
	table.insert(EpicMusicPlayer_PlayList[newList],
	{
		["Album"] = EpicMusicPlayer_PlayList[oldList][song].Album,
		["Song"] = EpicMusicPlayer_PlayList[oldList][song].Song,
		["Name"] = EpicMusicPlayer_PlayList[oldList][song].Name,
		["Length"] = EpicMusicPlayer_PlayList[oldList][song].Length,
		["Artist"] =  EpicMusicPlayer_PlayList[oldList][song].Artist,
	})
	
	self:Print(L["Copied song"]..": "..EpicMusicPlayer_PlayList[oldList][song].Song..L[" to List: "]
		..EpicMusicPlayer_PlayList[newList][1].ListName)
	return true
end

function EpicMusicPlayer:MoveSong(oldList, newList, song)
	local self = EpicMusicPlayer
	
    if(oldList == newList)then
		self:Print(L["Song is already in that list."])
		return false;
	end
	
	table.insert(EpicMusicPlayer_PlayList[newList],
	{
		["Album"] = EpicMusicPlayer_PlayList[oldList][song].Album,
		["Song"] = EpicMusicPlayer_PlayList[oldList][song].Song,
		["Name"] = EpicMusicPlayer_PlayList[oldList][song].Name,
		["Length"] = EpicMusicPlayer_PlayList[oldList][song].Length,
		["Artist"] =  EpicMusicPlayer_PlayList[oldList][song].Artist,
	})
	
	--self:Print(L["Moved song: "]..EpicMusicPlayer_PlayList[oldList][song].Song..L[" to List: "]
	--	..EpicMusicPlayer_PlayList[newList][1].ListName)
	self:RemoveSong(oldList,song,true)
	return true
end

function EpicMusicPlayer:RemoveCurrendSong()
	self:RemoveSong(self.db.profile.list,self.db.profile.song)
end

function EpicMusicPlayer:RemoveSong(list, song, silent)
	if(not silent)then
		self:Print(L["Removed song"].."\""..EpicMusicPlayer_PlayList[list][song].Song..
			"\" "..L["from list"].." \""..EpicMusicPlayer_PlayList[list][1].ListName.."\".")
	end
	--is song playing?
	if(list == self.db.profile.list and song == self.db.profile.song)then
		--unmark song as to move (could be marked) 
		self.movesong = nil
		self:Stop()
		table.remove(EpicMusicPlayer_PlayList[list],song)
		self.db.profile.song = self.db.profile.song -1
		-- get next song
		self:SetNextPlayable(self.db.profile.list,self.db.profile.song)
		self:Play()
	else
		table.remove(EpicMusicPlayer_PlayList[list],song)
	end
	
	--playlist maybe open update
	EpicMusicPlayer_ListsScrollBar_Update()
end

-- add playlist 
function EpicMusicPlayer:AddPlayList(name)
    local foundindex = EpicMusicPlayer:GetListIndex(name)
	
	if(foundindex) then
		self:Print(L["Playlist"].." \""..name.."\" "..L["already exists."])
		return;
	end
	
	local newlist = { 
        {
            ["ListName"] = name,
        }, -- [1]
	} -- [1]
    
	--lastsearch should be last list
	local lastsearchindex = EpicMusicPlayer:GetListIndex("lastsearch")
	if(lastsearchindex)then
		local searchlist = EpicMusicPlayer_PlayList[lastsearchindex]
		EpicMusicPlayer_PlayList[lastsearchindex] = newlist -- replace searchlist with new list
		EpicMusicPlayer_PlayList[#EpicMusicPlayer_PlayList+1] = searchlist --append searchlist at the end
	else
		table.insert(EpicMusicPlayer_PlayList, newlist)
	end
	
	self:Print(L["Added playlist"].." \""..name.."\".")
	
	--search results maby incorrect now
	if(EpicMusicPlayer.IsSearching) then
	  EpicMusicPlayer_Search()
      return
	end
	
	self:UpdateListnames()
	--playlist maybe open update
    EpicMusicPlayer_ListsScrollBar_Update()
end

-- return the index of the list with the given name or nil if not found
function EpicMusicPlayer:GetListIndex(name)
	for i, list in ipairs(EpicMusicPlayer_PlayList) do
		if(string.lower(list[1].ListName)==string.lower(name))then
			return i
		end
	end
	return nil
end

-- remove playlist 
function EpicMusicPlayer:RemovePlayList(name)
    
    if(table.getn(EpicMusicPlayer_PlayList)== 1)then
		self:Print(L["Last playlist can not be removed."])
		return
	end
	
	local listnum = self:GetListIndex(name)
    if(not listnum)then
		self:Print(L["Playlist"].." \""..name.."\" "..L["not found."])
		return
	end

	if(listnum == self.db.profile.list)then
		self:Stop()
	end
	
	--do not jump back to the removed list (just in case a song has been moved from that list)
	oldlist = 1
	oldsong = 2
	
	table.remove(EpicMusicPlayer_PlayList, listnum)
	
	self:Print(L["Playlist"].." \""..name.."\" "..L["removed."])
	
	if(listnum == self.db.profile.list)then
		self.db.profile.list = 1
		self.db.profile.song = 2
		self:SetNextPlayable(self.db.profile.list,self.db.profile.song)
		self:Play()
	end
	
	if(selectedlist == listnum)then
		selectedlist = 1
	end
	
	--search results maby incorrect now
	if(self.IsSearching) then
		EpicMusicPlayer_Search()
		return
	end

	self:UpdateListnames()
	--playlist maybe open update
	EpicMusicPlayer_ListsScrollBar_Update()
end

function EpicMusicPlayer:ToBestList()
	local self = EpicMusicPlayer
	
	if(not self.Playing)then
		self:Print(L["Not playing."])
		return
	end
	
	for i, list in ipairs(EpicMusicPlayer_PlayList) do
		if(list[1].ListName == self.db.profile.bestlist)then
			--move the song
			self:MoveSongAfter(self:GetCurrentList(), i, self:GetCurrentSong())
			return
		end
	end
	
	self:Print(L["Best list"].." "..L["not found."]..L["Please set a favorites list."])
end

function EpicMusicPlayer:ToBadList()
	local self = EpicMusicPlayer
	
	if(not self.Playing)then
		self:Print(L["Not playing."])
		return
	end
	for i, list in ipairs(EpicMusicPlayer_PlayList) do
		if(list[1].ListName == self.db.profile.badlist)then
			--move the song
			if(self:MoveSong(self:GetCurrentList(), i, self:GetCurrentSong()))then
				self:PlayNext()
			end
			return
		end
	end
	self:Print(L["Bad list"].." "..L["not found."]..L["Please set a bad songs list."])
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

-- this ist the sloooow and crappy search function^^
-- todo: split it up, search only x entrys per frame
function EpicMusicPlayer_Search()

    if (EpicMusicPlayerSearchEditBox:GetNumLetters() == 0) then
        self.IsSearching = false
        EpicMusicPlayer_ScrollBar_Update()
        return
    end
    
    local pattern = string.lower(EpicMusicPlayerSearchEditBox:GetText())
    
    EpicMusicPlayer.IsSearching = true
    
    searchlist = {
       { 
			["ListName"] = "lastsearch",
       } -- [1]
    }

    local listnum = 1
    
    while (listnum <= table.getn(EpicMusicPlayer_PlayList)) do
        local songnum = 2
        if(EpicMusicPlayer_PlayList[listnum][1].ListName ~= "lastsearch")then
			while (songnum <= table.getn(EpicMusicPlayer_PlayList[listnum])) do  
				  if(EpicMusicPlayer:Contains(EpicMusicPlayer_PlayList[listnum][songnum].Song,pattern)) then
	                   EpicMusicPlayer:AddMatch(listnum, songnum)
	              elseif (EpicMusicPlayer:Contains(EpicMusicPlayer_PlayList[listnum][songnum].Artist,pattern)) then
	                   EpicMusicPlayer:AddMatch(listnum, songnum)
	              elseif (EpicMusicPlayer:Contains(EpicMusicPlayer_PlayList[listnum][songnum].Album,pattern)) then
	                   EpicMusicPlayer:AddMatch(listnum, songnum)
	              end
	              if(table.getn(searchlist)>300) then break end 
	              songnum = songnum + 1
	        end
		end
	    if(table.getn(searchlist)>300) then break end 
	    listnum = listnum + 1
    end
    
    if(table.getn(searchlist) < 2) then
        EpicMusicPlayerSearchEditBox:SetText(L["No Match"])
        EpicMusicPlayerSearchEditBox:HighlightText()
		--EpicMusicPlayer_ScrollBar_Search_Update()
		EpicMusicPlayer.IsSearching = false
        return     
    end
    
	--update the lastsearch list
    local lastsearch = EpicMusicPlayer:GetListIndex("lastsearch")
	if(lastsearch)then
		EpicMusicPlayer_PlayList[lastsearch] = searchlist
		selectedlist = lastsearch --set selected list
	else
		table.insert(EpicMusicPlayer_PlayList, searchlist)
		selectedlist = #EpicMusicPlayer_PlayList --set selected list
	end
	
    EpicMusicPlayerSearchEditBox:ClearFocus()
    EpicMusicPlayer_ListsScrollBar_Update()
	EpicMusicPlayer_ScrollBar_Update()
	--EpicMusicPlayer_ScrollBar_Search_Update()
    
end

function EpicMusicPlayer:Contains(source, pattern)
    source = string.lower(source)
    --pattern = string.lower(pattern)
	
    if(string.find(source, pattern) == nil) then
	  return false
    else
	  return true
    end
end

function EpicMusicPlayer:AddMatch(listnum, songnum)
    table.insert(searchlist,
    {
        ["Album"] = EpicMusicPlayer_PlayList[listnum][songnum].Album,
        ["Song"] = EpicMusicPlayer_PlayList[listnum][songnum].Song,
        ["Name"] = EpicMusicPlayer_PlayList[listnum][songnum].Name,
        ["Length"] = EpicMusicPlayer_PlayList[listnum][songnum].Length,
        ["Artist"] =  EpicMusicPlayer_PlayList[listnum][songnum].Artist,
        --["ListNum"] = listnum,
        --["SongNum"] =  songnum,
    })
end

function EpicMusicPlayer_Clear_Search()
    EpicMusicPlayer.IsSearching = false
    EpicMusicPlayer_ScrollBar_Update()
	EpicMusicPlayerSearchEditBox:SetText("")	
end

function EpicMusicPlayer:SpamDefault()
	self:Spam(self.db.profile.defaultchannel)
end

function EpicMusicPlayer:Spam(chat)
	local title = EpicMusicPlayer_PlayList[self.db.profile.list][self.db.profile.song].Song
	local artist = EpicMusicPlayer_PlayList[self.db.profile.list][self.db.profile.song].Artist
	local text = ""
	
	if(artist=="") then 
			text = L["[~mymusic~] "]..title,chat
		else
			text = L["[~mymusic~] "]..artist.." - "..title
	end
	
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
		
	if(self.db.profile.link)then
		local link = title.." "..artist
		link  = string.gsub(link, " ", "+")
		link = "http://www.youtube.com/results?search_query="..link.."&search_type=&aq=f"
		
		SendChatMessage(link,chat,nil,target)
	end
    
end

function EpicMusicPlayer:UpdateMessageFrame()
	if(not messageframe)then
			self:CreateMessageFrame()
	end
	local font = EpicMusicPlayer:GetFont()
	if(font=="default")then
		messageframe:SetFont(GameFontNormal:GetFont(),EpicMusicPlayer.db.profile.fontsize)
	else
		messageframe:SetFont(font, 
								EpicMusicPlayer.db.profile.fontsize)
		EpicMusicPlayer:UpdateMessageFrameText(EpicMusicPlayer:GetCurrentArtistName(), 
												EpicMusicPlayer:GetCurrentSongName())
	end
end

function EpicMusicPlayer:UpdateMessageFrameText(artist,title)
	if(not messageframe)then
			self:CreateMessageFrame()
	end
	messageframe:AddMessage(artist.."\n |c"..self.db.profile.titlecolour.hex..title, 
		self.db.profile.artistcolour.r,self.db.profile.artistcolour.g,self.db.profile.artistcolour.b, 53, 5);
	--messageframe:AddMessage(title, 0.6,0.2,0.8, 53, 5);
end

function EpicMusicPlayer:GetCurrentList()
	return self.db.profile.list;
end

function EpicMusicPlayer:GetListName()
	return EpicMusicPlayer_PlayList[EpicMusicPlayer.db.profile.list][1].ListName
end

function EpicMusicPlayer:GetCurrentSong()
	return self.db.profile.song;
end

function EpicMusicPlayer:GetCurrentSongName()
	if(playing)then
		return EpicMusicPlayer_PlayList[self.db.profile.list][self.db.profile.song].Song
	else
		return L["Stopped"]
	end
end

function EpicMusicPlayer:ShowConfig()
	LibStub("AceConfigDialog-3.0"):Open("EpicMusicPlayer")
end

function EpicMusicPlayer:GetCurrentArtistName()
	return EpicMusicPlayer_PlayList[self.db.profile.list][self.db.profile.song].Artist
end

function EpicMusicPlayer:GetCurrentAlbumName()
	return EpicMusicPlayer_PlayList[self.db.profile.list][self.db.profile.song].Album
end

function EpicMusicPlayer:ToggleList()
	if(EpicMusicPlayerPlaylistFrame:IsShown())then
		EpicMusicPlayerPlaylistFrame:Hide()
	else
		EpicMusicPlayerListsScrollBar:Show()
		EpicMusicPlayerPlaylistFrame:Show()
	end
end



function EpicMusicPlayer:OnDisplayClick(parent)
	if(arg1 == "MiddleButton")then
			self[self.db.profile.controlset.middle](self, parent)
	elseif(arg1 == "RightButton")then
		self[self.db.profile.controlset.right](self, parent)
	elseif(arg1 == "Button4")then
		self[self.db.profile.controlset.button4](self, parent)
	elseif(arg1 == "Button5")then
		self[self.db.profile.controlset.button5](self, parent)
	else
		if(IsAltKeyDown())then
			if(IsControlKeyDown())then
				self[self.db.profile.controlset.leftaltcontrol](self, parent)
			else
				self[self.db.profile.controlset.leftalt](self, parent)
			end
		elseif(IsShiftKeyDown()) then
			self[self.db.profile.controlset.leftshift](self, parent)
		elseif(IsControlKeyDown()) then
			self[self.db.profile.controlset.leftcontrol](self, parent)
		else --no key pressed
			self[self.db.profile.controlset.left](self, parent)
		end
	end
end

-- called on user clicked next song, do not call directly 
--can't call PlayNext()  directly because we need to set loopsong to false
function EpicMusicPlayer:OnNextClick()
	EpicMusicPlayer.db.profile.loopsong = false
	EpicMusicPlayer.PlayNext()
end

--[[
--obsolete
function EpicMusicPlayer:OnDisplayRightClick(parent)
	if(IsAltKeyDown())then
		if(EpicMusicPlayerGui)then
			EpicMusicPlayerGui:Toggle()
		end
	else	
		--self:OpenMenu(parent)
		self[self.db.profile.controlset.right](self, parent)
	end
end
--]]

function EpicMusicPlayer:OpenMenu(frame)
	GameTooltip:Hide();
	
	--local self = EpicMusicPlayer
	local dropdown = self.dropdown
	if not dropdown then
		dropdown = CreateFrame("Frame", "EMPDropDown", nil, "UIDropDownMenuTemplate")
		dropdown.xOffset = 0
		dropdown.yOffset = 0
		dropdown.point = "TOPLEFT"
		dropdown.relativePoint = "BOTTOMLEFT"
		dropdown.displayMode = "MENU"
		self.dropdown = dropdown
	end
	
	dropdown.relativeTo = frame
	
	local currsong = self.db.profile.song
	local currlist = self.db.profile.list
	
	dropdownmove = {}
	dropdowncopy = {}
	if(not dropdownchat)then
		dropdownchat = {
			{
				text = L["Guild"], 
				func = function() self:Spam("GUILD") end, 
			},
			{
				text = L["Party"], 
				func = function() self:Spam("PARTY") end, 
			},
			{
				text = L["Say"], 
				func = function() self:Spam("SAY") end, 
			},
			{
				text = L["Raid"], 
				func = function() self:Spam("RAID") end, 
			},
			{
				text = L["To target"], 
				func = function()
					EpicMusicPlayer:Spam("TARGET")
				end, 
			},
		}
	end
	
	if(self.whisper)then
		dropdownchat[6] = {
				text = L["Whisper to"].." "..self.whisper, 
				func = function()
					EpicMusicPlayer:Spam("WHISPER")
				end, 
			}
	end
	
	dropdownmenu ={ 
		{
			text = L["Playlist"], 
			func = function() self:TogglePlaylist() end, 
		},
		{
			text = L["Config"],
			func = function() self:ShowConfig() end,
		},
		{
			text = L["Play last"],
			func = function() self:PlayLast() end,
		},
		{
			text = L["Show Gui"],
			checked = self:IsPlayerGui(),
			func = function() self:TogglePlayerGui() end,
		},	
	}
	
	if(EpicMusicDancer)then
		dropdownmenu[#dropdownmenu + 1] = {
			text = L["Show Dancer"],
			checked = EMPDancerFrame:IsVisible(),
			func = function() EpicMusicDancer:ToggleShow() end,
			
		}
	end
	
	dropdownmenu[#dropdownmenu + 1] = {
			text = L["Shuffle"],
			checked = self.IsRandom(),
			func = function() self:ToggleRandom() end,
	} 
	dropdownmenu[#dropdownmenu + 1] = {
			text = L["Loop Playlist"],
			checked = self.db.profile.looplist,
			func = function() self.db.profile.looplist = not self.db.profile.looplist end,
	}
	dropdownmenu[#dropdownmenu + 1] = {
			text = L["Loop Song"],
			checked = self.db.profile.loopsong,
			func = function() self.db.profile.loopsong = not self.db.profile.loopsong end,
	}
	
	
	if(self.Playing)then
		dropdownmenu[#dropdownmenu + 1] = {
			text = " ",
			disabled = true
		}
		
		dropdownmenu[#dropdownmenu + 1] = {
			text = L["Move song to"],
			hasArrow = true,
			menuList = dropdownmove
		}
		
		dropdownmenu[#dropdownmenu + 1] = {
			text = L["Copy song to"],
			hasArrow = true,
			menuList = dropdowncopy
		}
		
		for i, list in ipairs(EpicMusicPlayer_PlayList) do
			dropdownmove[#dropdownmove + 1] = {
				text = list[1].ListName,
				func = function()
					EpicMusicPlayer:MoveSongAfter(currlist,i,currsong)
				end,
			}
			dropdowncopy[#dropdowncopy + 1] = {
				text = list[1].ListName,
				func = function()
					EpicMusicPlayer:CopySong(currlist,i,currsong)
				end,
			}
		end
		
		dropdownmenu[#dropdownmenu + 1] = {
			text = L["Spam to"],
			hasArrow = true,
			menuList = dropdownchat,
		}
		
		dropdownmenu[#dropdownmenu + 1] = {
			text = " ",
			disabled = true
		}
		
		dropdownmenu[#dropdownmenu + 1] = {
			text = L["Remove Song"],
			func = function() self:RemoveSong(currlist, currsong) end,
		}
	end
	EasyMenu(dropdownmenu, dropdown)
end

function EpicMusicPlayer:CreateMessageFrame()
	messageframe = CreateFrame("MessageFrame",nil,UIErrorsFrame)
	messageframe:SetFrameStrata("BACKGROUND")
	messageframe:SetWidth(600) -- Set these to whatever height/width is needed 
	messageframe:SetHeight(50) -- for your Texture
	messageframe:SetPoint("CENTER",0,0)
	messageframe:Show()

	local font = self:GetFont()
	if(font=="default")then
		messageframe:SetFont(GameFontNormal:GetFont(),self.db.profile.fontsize)
	else
		messageframe:SetFont(font, self.db.profile.fontsize)
	end
	
	--messageframe:SetFont("Interface\\AddOns\\EpicMusicPlayer\\font1.ttf", fontSize);
	messageframe:SetShadowColor(0, 0, 0,0.8) 
	--messageframe:SetShadowOffset(2, -2) 
	messageframe:SetShadowOffset(1, -1) 
end

function EpicMusicPlayer:AddOptions(name,options)
	empoptions.args[name] = options
	LibStub("AceConfigRegistry-3.0"):NotifyChange("EpicMusicPlayer")
end

local seq = 0

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

-- check playlist - is there a playlist, with content ?
function EpicMusicPlayer:CheckPlayList()
  local ok = true;	
	if (not EpicMusicPlayer_PlayList) then
		ok = false;
	elseif (table.getn(EpicMusicPlayer_PlayList) < 1) then
		ok = false;
	end	
	if (ok == false) then
		--backuplist = {}
		self:Print(L["Playlist not found."])
		-- no playlist found, create dummy playlist
		self.db.profile.list = 1
	    self.db.profile.song = 2
		
		EpicMusicPlayer_PlayList = {
	        { 
	            {
	                ["ListName"] = "Common",
					["PlaylistVersion"] = "1.1",
					["MusicDir"] = "",
	            }, -- [1]
	            {
	                "", "Read the install file in the addon directory","nix",120, "Playlist not found.",
	            }, -- [3]
	        }, -- [1]
			{
				{
					["ListName"] = "Ingame",
				}, -- [1]
				{
	                "ingame",
	                "Power Of The Horde",
	                "Sound\\Music\\ZoneMusic\\DMF_L70ETC01.mp3",
	                280,
	                "Tenth Level Tauren Chieftain"
	            }, -- [2]
				{
					"ingame",
					"Silvermoon2",
					"Sound\\Music\\ZoneMusic\\Sunwell\\SW_MagistersAsylumWalkUni01.mp3",
					97,
					"Russel Brower",
				}, -- [3]
				{
					["Album"] = "ingame",
					["Song"] = "Main Title: Legends Of Azeroth",
					["Name"] = "Sound\\Music\\GlueScreenMusic\\BC_main_theme.mp3",
					["Length"] = 226,
					["Artist"] = "Jason Hayes",
				}, -- [4]
			}, -- [2]
		}
	end
	
	if(EpicMusicPlayer_PlayList[1][1].MusicDir)then
		musicdir = EpicMusicPlayer_PlayList[1][1].MusicDir
	else
		musicdir = "Interface\\AddOns\\EpicMusicPlayer\\music\\"
		self:Print("Musicdir not set. Setting to: Interface\\AddOns\\EpicMusicPlayer\\music\\")
	end
	return ok;
end

function EpicMusicPlayer:GetFont()
	local font
	--EpicMusicPlayer:Debug(media:Fetch("font",EpicMusicPlayer.fonts[value]))
	if(media and self.db.profile.fontindex <= #self.fonts)then
		font = media:Fetch("font",self.fonts[self.db.profile.fontindex])
	else
		font = "default"
	end
	return font
end

function EpicMusicPlayer:GetColorString(r,g,b,a)
	local hexmap = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"}
	local red = hexmap[floor(r*255/16)+1]..hexmap[(mod(floor(r*255),16)+1)]
	local green = hexmap[floor(g*255/16)+1]..hexmap[(mod(floor(g*255),16)+1)]
	local blue = hexmap[floor(b*255/16)+1]..hexmap[(mod(floor(b*255),16)+1)]
	local alpha = hexmap[floor(a*255/16)+1]..hexmap[(mod(floor(a*255),16)+1)]
	return alpha..red..green..blue
end

function EpicMusicPlayer:Debug(...)
	if(EpicMusicPlayer.db.char.debug)then
		local s = "Debug:"
		for i=1,select("#", ...) do
			local x = select(i, ...)

			s = s.." "..x
		end
		DEFAULT_CHAT_FRAME:AddMessage(s)
	end
end