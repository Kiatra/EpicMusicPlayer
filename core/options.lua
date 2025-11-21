local _G = _G
local LibStub = _G.LibStub
local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")
-------------------------------------------------------------------------------
-- ace options table
-------------------------------------------------------------------------------
local version = C_AddOns.GetAddOnMetadata("EpicMusicPlayer","Version") or ""
local empoptions = {
	name = "EMP "..version,
	handler = EpicMusicPlayer,
	type='group',
	desc = 'Play the Music',
	args = {
		console = {
			name = L["Console Controls"],
			type = "group",
			order = -1,
			guiHidden = true,
			args = {
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
			},
		},
		general = {
			name = L["General"],
			order = 0,
			type = "group",
			args = {
				colours = {
					name = L["Font & Colours"],
					order = 0,
					type = "group",
					args = {
						artistcolour = {
							type = "color",
							name = L["Artist color"],
							desc = L["Artist color"],
							hasAlpha = false,
							get = function(info)
								local c = EpicMusicPlayer.db.artistcolour
								return c.r, c.g, c.b, c.a
							end,
							set = function(info, r, g, b, a)
								local c = EpicMusicPlayer.db.artistcolour
								c.r, c.g ,c.b ,c.a = r, g, b, a
								if(EpicMusicPlayer.db.useartistcolour)then
									local c = EpicMusicPlayer.db.buttoncolour
									c.r, c.g ,c.b ,c.a = r, g, b, a
								end
								--update gui
								if(_G.EpicMusicPlayerGui)then
									_G.EpicMusicPlayerGui:UpdateFrame(EpicMusicPlayer)
								end
							end
						},
						titlecolour = {
							type = "color",
							name = L["Title color"],
							desc = L["Title color"],
							hasAlpha = false,
							get = function(info)
								local c = EpicMusicPlayer.db.titlecolour
								return c.r, c.g, c.b, c.a
							end,
							set = function(info, r, g, b, a)
								local c = EpicMusicPlayer.db.titlecolour
								c.r, c.g ,c.b ,c.a = r, g, b, a
								if(_G.EpicMusicPlayerGui)then
									_G.EpicMusicPlayerGui:UpdateFrame(EpicMusicPlayer)
								end
							end
						},
						--[[
						font = {
							type = 'select',
							dialogControl = 'LSM30_Font',
							values = EpicMusicPlayer.GetFonts,
							order = 1,
							name = L["Font"],
							desc = L["Font"],
							get = function()
								return EpicMusicPlayer.db.font
							end,
							set = function(info, value)
								EpicMusicPlayer.db.font = value
								if(_G.EpicMusicPlayerGui)then
									_G.EpicMusicPlayerGui:UpdateFrame(EpicMusicPlayer)
								end
								EpicMusicPlayer:UpdateMessageFrame()
							end,
						},
						playlistfont = {
							type = 'select',
							dialogControl = 'LSM30_Font',
							values = EpicMusicPlayer.GetFonts,
							order = 1,
							name = L["Playlist font"],
							desc = L["Change the playlist font. Requires relog to take effect."],
							get = function()
								return EpicMusicPlayer.db.playlistfont
							end,
							set = function(info, value)
								EpicMusicPlayer.db.playlistfont = value
							end,
						},
						--]]
					},
				},
				controls = {
					name=L["Mouse Setup"],
					order = -1,
					type="group",
					args = {
						text = {
							order = 0,
							type = "description",
							name = L["Set the click behaviour for the minimap, the title in the GUI and the data broker plugin."],
						},
						left = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 1,
							name = L["Left Click"],
							desc = L["Left Click"],
							get = function()
								return EpicMusicPlayer.db.controlset.LeftButton
							end,
							set = function(info, value)
								EpicMusicPlayer.db.controlset.LeftButton = value
							end,
						},
						right = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 2,
							name = L["Right Click"],
							desc = L["Right Click"],
							get = function()
								return EpicMusicPlayer.db.controlset.RightButton
							end,
							set = function(info, value)
								EpicMusicPlayer.db.controlset.RightButton = value
							end,
						},
						middle = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 3,
							name = L["Middle Click"],
							desc = L["Middle Click"],
							get = function()
								return EpicMusicPlayer.db.controlset.MiddleButton
							end,
							set = function(info, value)
								EpicMusicPlayer.db.controlset.MiddleButton = value
							end,
						},
						button4 = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 4,
							name = L["Button4"],
							desc = L["Button4"],
							get = function()
								return EpicMusicPlayer.db.controlset.Button4
							end,
							set = function(info, value)
								EpicMusicPlayer.db.controlset.Button4 = value
							end,
						},
						button5 = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 5,
							name = L["Button5"],
							desc = L["Button5"],
							get = function()
								return EpicMusicPlayer.db.controlset.Button5
							end,
							set = function(info, value)
								EpicMusicPlayer.db.controlset.Button5 = value
							end,
						},
						leftalt = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 6,
							name = L["Alt+Click"],
							desc = "",
							get = function()
								return EpicMusicPlayer.db.controlset.leftalt
							end,
							set = function(info, value)
								EpicMusicPlayer.db.controlset.leftalt = value
							end,
						},
						leftshift = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 7,
							name = L["Shift+Click"],
							desc = "",
							get = function()
								return EpicMusicPlayer.db.controlset.leftshift
							end,
							set = function(info, value)
								EpicMusicPlayer.db.controlset.leftshift = value
							end,
						},
						leftcontrol = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 8,
							name = L["Control+Click"],
							desc = "",
							get = function()
								return EpicMusicPlayer.db.controlset.leftcontrol
							end,
							set = function(info, value)
								EpicMusicPlayer.db.controlset.leftcontrol = value
							end,
						},
						leftaltcontrol = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 9,
							name = L["Alt+Control+Click"],
							desc = "",
							get = function()
								return EpicMusicPlayer.db.controlset.leftaltcontrol
							end,
							set = function(info, value)
								EpicMusicPlayer.db.controlset.leftaltcontrol = value
							end,
						},
					},
				},
				list = {
					type = 'execute',
					order = -1,
					name = L["Console"],
					desc = L["Show console commands"],
					func = "List"
				},
				minimap = {
					type = "toggle",
					order = 1,
					name = L["Minimap Button"],
					desc = L["Toggle show minimap button"],
					get = function(name)
						local EpicMusicPlayerBroker = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayerBroker")
						return EpicMusicPlayerBroker:IsMinimap()
					end,
					set = function(name)
						local EpicMusicPlayerBroker = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayerBroker")
						EpicMusicPlayerBroker:ToggleMinimap()
					end,
				},
				mute = {
					type = 'toggle',
					order = 2,
					name = L["Mute"],
					desc = L["Mute / unmute music sound."],
					get = "IsMute",
					set = "ToggleMute"
				},
				wowmusic = {
					type = 'toggle',
					order = 3,
					name = L["Disable WoW Music"],
					desc = L["Disable WoW Music when not Playing."],
					get = "IsDisWoWMusic",
					set = "ToggleDisWoWMusic"
				},
				auto = {
					type = 'toggle',
					order = 4,
					name = L["Autoplay"],
					desc = L["Toggles auto play on load."],
					get = "IsAuto",
					set = "ToggleAuto"
				},
				info = {
					type = 'toggle',
					order = 5,
					name = L["Show Info"],
					desc = L["Show song and artist on new song"],
					get = "IsShowMessage",
					set = "ToggleShowMessage",
				},
				maxLevelSong = {
					type = 'toggle',
						order = 5,
						name = L["Max Level Song"],
					desc = L["Play song when reaching maximum level"],
					get = function()
						return EpicMusicPlayer.db.maxLevelSong
					end,
					set = function(info, value)
						EpicMusicPlayer.db.maxLevelSong = value
					end,
				},
				spam = {
					type = 'toggle',
						order = 7,
					name = L["Show Song In Chat"],
					desc = L["Show message in your chat when playing a new song."],
					get = "IsSpam",
					set = "ToggleSpam"
				},
				defaultchat = {
					type = 'select',
					values = {GUILD=L["Guild"],
								PARTY=L["Party"],SAY=L["Say"],TARGET=L["To target"],RAID=L["Raid"]},
					order = 8,
					name = L["Default Channel"],
					desc = L["Select the default channel to send the song name on ctrl+click"],
					get = "GetDefaultChannel",
					set = "SetDefaultChannel"
				},
				usePlaySoundFile = {
					type = 'toggle',
					order = 7,
					name = L["Use Ambience Channel"],
					desc = L["When this is enabled music will be played using the ambience channel instead of the music channel. Music will no longer stop on a loading screen but you will not hear ambience sound during music play."],
					get = function(info, value)
						return EpicMusicPlayer.db.usePlaySoundFile
					end,
					set = function(info, value)
						EpicMusicPlayer.db.usePlaySoundFile = value
					end,
				},
				test = {
					type = 'execute',
							order = 10,
							name = L["Test"],
					desc = L["Plays a test song."],
					func = function(info, value)
								EpicMusicPlayer:Stop()
								_G.SetCVar("Sound_EnableMusic", 1)
								_G.PlayMusic(53224)
								EpicMusicPlayer:Print("Playing Test Song")
					end,
				},
				--@debug@
				debugging = {
					type = 'toggle',
					--width = "half",
					order = 11,
					name = "Debbuging",
					desc = "Show debbuging messages.",
					get = function(info, value)
								return EpicMusicPlayer.dataBase.char.debug
					end,
					set = function(info, value)
								EpicMusicPlayer.dataBase.char.debug = value
					end,
				},
				--@end-debug@
			},
		},
		list = {
			name = "Playlist",
			order = 1,
			type="group",
			args = {
				shuffle = {
				type = 'toggle',
						order = 1,
				name = L["Shuffle"],
				desc = L["Toggle shuffle"],
				get = "IsRandom",
				set = function() EpicMusicPlayer:ToggleRandom() end,
				},
				shuffleALL = {
					type = 'toggle',
					order = 2,
					name = L["Shuffle Cross Playlist"],
					desc = L["Shuffle Cross Playlist"],
					get = function() return EpicMusicPlayer.db.shuffleAll end,
					set = function() EpicMusicPlayer:ToggleRandom(true) end,
				},
				looplist = {
					type = 'toggle',
					order = 3,
					name = L["Loop Playlist"],
					desc = L["Playing the last song of a list will not switch to the next list."],
					get = "IsLoopList",
					set = "ToggleLoopList"
				},
				loopsong = {
					type = 'toggle',
					order = 4,
					name = L["Loop Song"],
					desc = L["Play the current song again and again and again...until your head will explode. A click on next song will disable this."],
						get = function()
							return EpicMusicPlayer.db.loopsong
						end,
						set = function(info, v)
						EpicMusicPlayer.db.loopsong = not EpicMusicPlayer.db.loopsong
						end,
				},
				addGameMusic = {
					type = 'toggle',
					order = 2,
					name = L["Add Game Music"],
					desc = L["Adds playlists with game music (reload required)."],
					get = function()
						return EpicMusicPlayer.db.addGameMusic
					end,
					set = function() EpicMusicPlayer.db.addGameMusic = not EpicMusicPlayer.db.addGameMusic
						EpicMusicPlayer:PlayListGuiUpdate()
					end,
				},
				strata = {
					type = 'select',
					values = {FULLSCREEN_DIALOG="Fullscreen_Dialog",FULLSCREEN="Fullscreen",
						DIALOG="Dialog",HIGH="High",MEDIUM="Medium",LOW="Low",BACKGROUND="Background"},
					order = 9,
					name = L["Frame strata"],
					desc = L["Frame strata"],
					get = function()
						return EpicMusicPlayer.db.liststrata
					end,
					set = function(info, value)
						EpicMusicPlayer.db.liststrata = value
						_G.EpicMusicPlayerGui.frames.player:SetFrameStrata(value)
					end,
				},
				scale = {
					type = 'range',
					order = 5,
					name = L["Playlist Scale"],
					desc = L["Adjust the scale of the playlist"],
					step = 0.1,
					min = 0.1,
					max = 2,
					get = function()
						return EpicMusicPlayer.db.playlistScale
					end,
					set =  function(info,val)
						EpicMusicPlayer.db.playlistScale = val
						EpicMusicPlayer:SetPlaylistScale(val)
					end,
				},
			},
		},
		events={
			name = L["Events"],
			type ="group",
			order = 10,
			args ={
				new = {
					type = 'input',
					order = 0,
					name = L["New Zone Event"],
					desc = L["Create a new zone event"],
					get = GetZoneText,
					set = function(info, value)
						local name = value
						if not EpicMusicPlayer.db.eventZones.name then
							EpicMusicPlayer.db.eventZones[name] = {}
						end
						--EpicMusicPlayer.eventZones.name =
						EpicMusicPlayer:AddEventOptions(name)
					end,
				},
				enableEvents = {
					type = 'toggle',
						order = 2,
					name = L["Enable Events"],
					desc = L["Enable Events"],
					get = function()
							return EpicMusicPlayer.db.enableEvents
					end,
					set = function()
						db.enableEvents = not EpicMusicPlayer.db.enableEvents
					end,
				},
			},
		},
		help = {
			type = "group",
			order = 15,
			name = L["Help - FAQ"],
			args = {
				header1 = {
					type = "header",
					name = L["How do I add music to the player?"],
					order = 0,
				},
				text1 = {
					order = 1,
					type = "description",
					name = L["FAQ-Text1.1"]
				},
				header4 = {
					type = "header",
					name = L["Why is the song playing from the beginning after a loading screen?"],
					order = 7,
				},
				text4 = {
					order = 8,
					type = "description",
					name = 	L["Music played on the music channel will stop after a loading screen. Enable the option to use the ambient sound channel to avoid this."] ,
				},
				header5 = {
					type = "header",
					name = L["Why is there no pause button?"],
					order = 9,
				},
					text5 = {
					order = 10,
					type = "description",
					name = L["Not possible with wow. As is playing a song at a specific position. An addon can only tell wow to play and stop a song that's it."],
				},
				header6 = {
					type = "header",
					name = L["Why do playlists I add with the addon have a different color?"],
					order = 11,
				},
				text6 = {
					order = 12,
					type = "description",
					name = L["Playlists shipped with the addon or created by the PlaylistCreator are locked for editing."].." "..L["You can right click user created playlist and delete or export them."],
				}
			}
		}
	},
}


LibStub("AceConfig-3.0"):RegisterOptionsTable("EpicMusicPlayer", empoptions)

-------------------------------------------------------------------------------
-- option functions
-------------------------------------------------------------------------------
function EpicMusicPlayer:AddProfile(baseDB)
  empoptions.args.profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(baseDB)
  baseDB.RegisterCallback(self, "OnProfileChanged", "OnProfileChanged")
	baseDB.RegisterCallback(self, "OnProfileCopied", "OnProfileChanged")
	baseDB.RegisterCallback(self, "OnProfileReset", "OnProfileChanged")
end

function EpicMusicPlayer:OnProfileChanged(event, database, newProfileKey)
  local db = database.profile
  self.db = db

  local EpicMusicPlayerBroker = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayerBroker")
  EpicMusicPlayerBroker.db = self.db

  self:Stop()
  _G.EpicMusicPlayerGui:UpdateFrame(self)
  self:TogglePlayerGui()
  _G.EpicMusicPlayerGui.frames.player:SetFrameStrata(self.db.liststrata)
  EpicMusicPlayerBroker:ToggleMinimap()

end

function EpicMusicPlayer:AddOptions(name,options)
	empoptions.args[name] = options
	LibStub("AceConfigRegistry-3.0"):NotifyChange("EpicMusicPlayer")
end

function EpicMusicPlayer:TogglePlayerGui()
    if(_G.EpicMusicPlayerGui)then
		_G.EpicMusicPlayerGui:Toggle()
	else
		EpicMusicPlayer:Print(L["GUI not found"])
	end
  --self:Debug("TogglePlayerGui showgui", self.db.showgui)
  self.db.showgui = not self.db.showgui
end

function EpicMusicPlayer:IsMinimap()
    if(_G.EpicMusicPlayerMiniButton)then
		if(_G.EpicMusicPlayerMiniButton:IsVisible())then
			return true
		end
	end
	return false
end

function EpicMusicPlayer:ToggleMinimap()
    if(_G.EpicMusicPlayerGui)then
		_G.EpicMusicPlayerGui:ToggleMinimap()
	else
		EpicMusicPlayer:Print(L["GUI not found"])
	end
	EpicMusicPlayer.db.minimapbutton = not EpicMusicPlayer.db.minimapbutton
end

function EpicMusicPlayer:GetDefaultChannel()
    return EpicMusicPlayer.db.defaultchannel
end

function EpicMusicPlayer:SetDefaultChannel(info,value)
    EpicMusicPlayer.db.defaultchannel = value
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
    return EpicMusicPlayer.db.showmessage
end

function EpicMusicPlayer:ToggleShowMessage()
    EpicMusicPlayer.db.showmessage = not EpicMusicPlayer.db.showmessage
end

function EpicMusicPlayer:IsMute()
    return self.mute
end

function EpicMusicPlayer:IsSpam()
	return self.db.spam
end

function EpicMusicPlayer:IsScrollGuiText()
	return EpicMusicPlayer.db.gui.scroll
end

function EpicMusicPlayer:ToggleScrollGuiText()
	EpicMusicPlayer.db.gui.scroll = not EpicMusicPlayer.db.gui.scroll
end

function EpicMusicPlayer:ToggleSpam()
    EpicMusicPlayer.db.spam = not self.db.spam
end

function EpicMusicPlayer:IsLink()
	return self.db.link
end

function EpicMusicPlayer:ToggleLink()
    EpicMusicPlayer.db.link = not self.db.link
end


function EpicMusicPlayer:IsLoopList()
	return self.db.looplist
end

function EpicMusicPlayer:ToggleLoopList()
    EpicMusicPlayer.db.looplist = not self.db.looplist
end

function EpicMusicPlayer:IsDisWoWMusic()
	return EpicMusicPlayer.db.disablewowmusic
end

function EpicMusicPlayer:ToggleDisWoWMusic()
	if(not self.Playing)then
		if(self.db.disablewowmusic) then
			_G.SetCVar("Sound_EnableMusic", 1);
		else
			_G.SetCVar("Sound_EnableMusic", 0);
		end
	end
	self.db.disablewowmusic = not self.db.disablewowmusic
	self:Stop()
end

function EpicMusicPlayer:ShowAnimTestFrame()
	return self.dataBase and self.dataBase.char.showAnimTester or false
end

function EpicMusicPlayer:ToggleAnimTestFrame()
	self.dataBase.char.showAnimTester = not self.dataBase.char.showAnimTester
end

function EpicMusicPlayer:IsDebug()
	return self.dataBase and self.dataBase.char.debug
end

function EpicMusicPlayer:ToggleDebug()
	self.dataBase.char.debug = not self.dataBase.char.debug
end

function EpicMusicPlayer:ShowTestPlaylist()
	return self.dataBase and self.dataBase.char.showATestPlaylist
	
end

function EpicMusicPlayer:ToggleTestPlaylist()
	self.dataBase.char.showATestPlaylist = not self.dataBase.char.showATestPlaylist
end


function EpicMusicPlayer:IsRandom()
    return self.db.random
end

function EpicMusicPlayer:ToggleRandom(all)
    if all then
		EpicMusicPlayer.db.shuffleAll = not EpicMusicPlayer.db.shuffleAll
		if EpicMusicPlayer.db.shuffleAll then
			EpicMusicPlayer.db.random = true
		end
	else
		EpicMusicPlayer.db.random = not EpicMusicPlayer.db.random
	end
	EpicMusicPlayer:SendMessage("EMPUpdateRandom",EpicMusicPlayer.db.random)
end


function EpicMusicPlayer:IsAuto()
    return self.db.auto
end

function EpicMusicPlayer:ToggleAuto()
    self.db.auto = not self.db.auto
end

function EpicMusicPlayer:ShowPlaylist()
    LibStub("AceConfigDialog-3.0"):Close("EpicMusicPlayer")
end


function EpicMusicPlayer:ChatCommand(input)
    if not input or input:trim() == "" then
		local AceCfgDlg = LibStub("AceConfigDialog-3.0")
		--AceCfgDlg:SelectGroup("EpicMusicPlayer", "general")
		--AceCfgDlg:SelectGroup("EpicMusicPlayer", "help")

        AceCfgDlg:Open("EpicMusicPlayer")
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

local eventOptions = empoptions.args.events.args

local function GetEventName(info)
	local name = info[#info]
	return name
end

local function GetEventIndex(info)
	local name = info[#info]
	return 1
end

local function getZoneList(info)
	local name = info[#info-2]
	return db.eventZones[name];
end

local function setZoneList(info, value)
	local name = info[#info-2]
	db.eventZones[name] = value;
	return name
end

local function deleteZone(info, value)
	local name = info[#info-2]
	db.eventZones[name] = nil;
	eventOptions[name] = nil;
end

function EpicMusicPlayer:SetOptionDB(dataBase)
	db = dataBase
end


function EpicMusicPlayer:AddEventOptions(name)
	eventOptions[name] = {
		name = name,
		desc = name,
		type = "group",
		order = 1,
		args={
			general = {
				inline = true,
				name="Zone: "..name,
				type="group",
				order = 0,
				args={
					header = {
						order = 0,
						type = "header",
						name = L["Select a playlist to play in this zone"],
					},
					zone = {
						type = 'select',
						values = function()
							local list = EpicMusicPlayer:GetListnames()
							list.none = " "
							return list
						end,
						width = "double",
						order = 1,
						name = L["Playlist"],
						desc = L["Play a song from this list."],
						get = getZoneList,
						set = setZoneList,
					},
					delete = {
						type = 'execute',
						--width = "half",
						name = L["Delete Zone"],
					    desc = L["Delete this zone"],
					    func = deleteZone,
					},
				},
			},
		}
	}
end
