local _G = _G
local LibStub = _G.LibStub
local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")
-------------------------------------------------------------------------------
-- ace options table
-------------------------------------------------------------------------------
local db
local version = GetAddOnMetadata("EpicMusicPlayer","Version") or ""
local empoptions = { 
    name = "EMP "..version,
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
								local c = EpicMusicPlayer.db.profile.artistcolour
								return c.r, c.g, c.b, c.a
							end,
							set = function(info, r, g, b, a)						
								local c = EpicMusicPlayer.db.profile.artistcolour
								c.r, c.g ,c.b ,c.a = r, g, b, a
								if(EpicMusicPlayer.db.profile.useartistcolour)then
									local c = EpicMusicPlayer.db.profile.buttoncolour
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
								local c = EpicMusicPlayer.db.profile.titlecolour
								return c.r, c.g, c.b, c.a
							end,
							set = function(info, r, g, b, a)
								local c = EpicMusicPlayer.db.profile.titlecolour
								c.r, c.g ,c.b ,c.a = r, g, b, a
								--update gui
								if(_G.EpicMusicPlayerGui)then
									_G.EpicMusicPlayerGui:UpdateFrame(EpicMusicPlayer)
								end
							end
						},
						font = {
							type = 'select',
							dialogControl = 'LSM30_Font', --Select your widget here
							values = EpicMusicPlayer.GetFonts,
							order = 1,
							name = L["Font"],
							desc = L["Font"],
							get = function() 
								return EpicMusicPlayer.db.profile.font
							end,
							set = function(info, value)
								--EpicMusicPlayer:Debug(EpicMusicPlayer.media:Fetch("font",value))
								EpicMusicPlayer.db.profile.font = value
								--update gui
								if(_G.EpicMusicPlayerGui)then
									_G.EpicMusicPlayerGui:UpdateFrame(EpicMusicPlayer)
								end
								EpicMusicPlayer:UpdateMessageFrame()
							end,
						},
						playlistfont = {
							type = 'select',
							dialogControl = 'LSM30_Font', --Select your widget here
							values = EpicMusicPlayer.GetFonts,
							order = 1,
							name = L["Playlist font"],
							desc = L["Change the playlist font. Requires relog to take effect."],
							get = function() 
								return EpicMusicPlayer.db.profile.playlistfont
							end,
							set = function(info, value)
								--EpicMusicPlayer:Debug(EpicMusicPlayer.media:Fetch("font",value))
								EpicMusicPlayer.db.profile.playlistfont = value
								--update gui
								--if(_G.EpicMusicPlayerGui)then
								--	_G.EpicMusicPlayerGui:UpdateFrame(EpicMusicPlayer)
								--end
								--EpicMusicPlayer:UpdateMessageFrame()
							end,
						},
					},
				},
				controls={
					name=L["Mouse Setup"],
					order = -1,
					type="group",
					args={
						text = {
							order = 0,
							type = "description",
							name = L["Set the click behavior for the minimap, the title in the GUI and the data broker plugin."] --L["FAQ-Text"],
							--image = "Interface\\AddOns\\EpicMusicPlayer\\media\\icon.tga",
						},
						left = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 1,
							name = L["Left Click"],
							desc = L["Left Click"],
							get = function() 
								return EpicMusicPlayer.db.profile.controlset.LeftButton
							end,
							set = function(info, value)
								EpicMusicPlayer.db.profile.controlset.LeftButton = value
							end,
						},
						right = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 2,
							name = L["Right Click"],
							desc = L["Right Click"],
							get = function() 
								return EpicMusicPlayer.db.profile.controlset.RightButton
							end,
							set = function(info, value)
								EpicMusicPlayer.db.profile.controlset.RightButton = value
							end,
						},
						middle = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 3,
							name = L["Middle Click"],
							desc = L["Middle Click"],
							get = function() 
								return EpicMusicPlayer.db.profile.controlset.MiddleButton
							end,
							set = function(info, value)
								EpicMusicPlayer.db.profile.controlset.MiddleButton = value
							end,
						},
						button4 = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 4,
							name = L["Button4"],
							desc = L["Button4"],
							get = function() 
								return EpicMusicPlayer.db.profile.controlset.Button4
							end,
							set = function(info, value)
								EpicMusicPlayer.db.profile.controlset.Button4 = value
							end,
						},
						button5 = {
							type = 'select',
							values = EpicMusicPlayer.controlslist,
							order = 5,
							name = L["Button5"],
							desc = L["Button5"],
							get = function() 
								return EpicMusicPlayer.db.profile.controlset.Button5
							end,
							set = function(info, value)
								EpicMusicPlayer.db.profile.controlset.Button5 = value
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
					--width = "half",
					order = 2,
					name = L["Mute"],
		            desc = L["Mute / unmute music sound."],
		            get = "IsMute",
		            set = "ToggleMute"
		        },
				wowmusic = {
		            type = 'toggle',
					--width = "half",
					order = 3,
		            name = L["Disable WoW Music"],
		            desc = L["Disable WoW Music when not Playing."],
		            get = "IsDisWoWMusic",
		            set = "ToggleDisWoWMusic"
				},
				auto = {
		            type = 'toggle',
					--width = "half",
					order = 4,
					name = L["Autoplay"],
		            desc = L["Toggles auto play on load."],
		            get = "IsAuto",
		            set = "ToggleAuto"
		        },
				info = {
		            type = 'toggle',
					--width = "half",
					order = 5,
					name = L["Show Info"],
		            desc = L["Show song and artist on new song"],
		            get = "IsShowMessage",
		            set = "ToggleShowMessage",
		        },
				updateinfo = {
		            type = 'toggle',
					--width = "half",
					order = 6,
					name = L["Show Update Info"],
		            desc = L["Show Update Info"],
		            get = function()
							return EpicMusicPlayer.db.profile.showUpdateInfo
						end,
		            set = function(info, value)
							EpicMusicPlayer.db.profile.showUpdateInfo = value
						end,
		        },
		        spam = {
		            type = 'toggle',
					--width = "half",
					order = 7,
		            name = L["Show Song In Chat"],
		            desc = L["Show message in your chat when playing a new song."],
		            get = "IsSpam",
		            set = "ToggleSpam"
				},
				--[[
				badlist = {
		            type = 'select',
					values = function() 
							local list = EpicMusicPlayer:GetListnames()
							list.none = " "
							return list 
						end,
					order = 6,
					name = L["Bad list"],
		            desc = L["This list will not be played. Unless you select it."].." "..L["Set a key in the key bindings menu to move a song to the selected list by that key."],
					get = function() 
						return EpicMusicPlayer.db.profile.badlist
					end,
		            set = function(info, value)
						if value == "none" then
							EpicMusicPlayer.db.profile.badlist = nil
						else
							EpicMusicPlayer.db.profile.badlist = value
						end
					end,
				},
				bestlist = {
		            type = 'select',
					values = function() 
							local list = EpicMusicPlayer:GetListnames()
							list.none = " "
							return list 
						end,
					order = 7,
					name = L["Favorites List"],
		            desc = L["Set a key in the key bindings menu to move a song to the selected list by that key."],
					get = function() 
						return EpicMusicPlayer.db.profile.bestlist
					end,
		            set = function(info, value)
						if value == "none" then
							EpicMusicPlayer.db.profile.bestlist = nil
						else
							EpicMusicPlayer.db.profile.bestlist = value
						end
		            end,
				},
				--]]
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
				test = {
		            type = 'execute',
		            --width = "half",
					order = 10,
					name = L["Test"],
		            desc = L["Plays a test song."],
		            func = function(info, value)
						EpicMusicPlayer:Stop()
						_G.SetCVar("Sound_EnableMusic", 1)
						_G.PlayMusic("Sound\\Music\\ZoneMusic\\DMF_L70ETC01.mp3") 
						EpicMusicPlayer:Print("Playing Test Song, do you hear the song: \"Power Of The Horde\"?")
						EpicMusicPlayer:Print("Music folder is set to: <wowfolder>\\"..EpicMusicPlayer.musicdir)
		            end,
				},
				--@debug@
				debug = {
		            type = 'toggle',
					--width = "half",
					order = 11,
		            name = "Debug",
		            desc = "Debug",
		            get = function(info, value)
						return EpicMusicPlayer.db.char.debug
		            end,
		            set = function(info, value)
						EpicMusicPlayer.db.char.debug = value
		            end,
				},
				--@end-debug@
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
		            set = function() EpicMusicPlayer:ToggleRandom() end,
		        },
				shuffleALL = {
		            type = 'toggle',
					--width = "half",
					order = 2,
		            name = L["Shuffle Cross Playlist"],
		            desc = L["Shuffle Cross Playlist"],
		            get = function() return EpicMusicPlayer.db.profile.shuffleAll end,
		            set = function() EpicMusicPlayer:ToggleRandom(true) end,
		        },
				looplist = {
		            type = 'toggle',
					--width = "half",
					order = 3,
		            name = L["Loop Playlist"],
		            desc = L["Playing the last song of a list will not switch to the next list."],
		            get = "IsLoopList",
		            set = "ToggleLoopList"
				},
				loopsong = {
		            type = 'toggle',
					--width = "half",
					order = 4,
		            name = L["Loop Song"],
		            desc = L["Play the current song again and again and again...until your head will explode. A click on next song will disable this."],
		            get = function()
					  return EpicMusicPlayer.db.profile.loopsong
					end,
					set = function(info, v)
					  EpicMusicPlayer.db.profile.loopsong = not EpicMusicPlayer.db.profile.loopsong
					end,
				},
				shuffleALL = {
		            type = 'toggle',
					--width = "half",
					order = 2,
		            name = L["Hide Artist in Playlist"],
		            desc = L["Hide Artist in Playlist"],
		            get = function()
						return EpicMusicPlayer.db.profile.playlistHideArtist
		            end,
					set = function() EpicMusicPlayer.db.profile.playlistHideArtist = not EpicMusicPlayer.db.profile.playlistHideArtist
						EpicMusicPlayer:PlayListGuiUpdate()
					end,
		        },
				shuffleALL = {
		            type = 'toggle',
					--width = "half",
					order = 2,
		            name = L["Add Game Music"],
		            desc = L["Adds playlists with game music (reload required)."],
		            get = function()
						return EpicMusicPlayer.db.profile.addGameMusic
		            end,
					set = function() EpicMusicPlayer.db.profile.addGameMusic = not EpicMusicPlayer.db.profile.addGameMusic
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
						return EpicMusicPlayer.db.profile.liststrata
					end,
					set = function(info, value)
						EpicMusicPlayer.db.profile.liststrata = value
						EpicMusicPlayerGui.frames.player:SetFrameStrata(value)
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
						return EpicMusicPlayer.db.profile.playlistScale
					end,
		            set =  function(info,val) 
						EpicMusicPlayer.db.profile.playlistScale = val
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
		            --width = "half",
					order = 0,
					name = L["New Zone Event"],
		            desc = L["Create a new zone event"],
		            get = GetZoneText,
					set = function(info, value)
						local name = value
						if not db.eventZones.name then
							db.eventZones[name] = {}  
						end
						--EpicMusicPlayer.eventZones.name = 
						EpicMusicPlayer:AddEventOptions(name)
					end,
				},
				enableEvents = {
			        type = 'toggle',
					--width = "half",
					order = 2,
			        name = L["Enable Events"],
			        desc = L["Enable Events"],
			        get = function()
						return db.enableEvents
			        end,
					set = function() 
						db.enableEvents = not db.enableEvents
						EpicMusicPlayer:OnZoneChanged()
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
					name = L["This is a wow bug since patch 2.4.3. I only could fix this so far that the song starts from start instead playing the game music. I have reported this in the eu forums but unless someone with an us account finally reports this in the us ui-forum blizzard developers will never fix this."],
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
					name = L["Why are some playlists grey?"],
					order = 11,
				},
				text6 = {
					order = 12,
					type = "description",
					name = L["Playlists created with the playlist generator or addedy by the game music module are locked for editing."],
				},
				header7 = {
					type = "header",
					name = L["Do I have to copy all of my music files to the wow folder?"],
					order = 13,
				},
				text7 = {
					order = 14,
					type = "description",
					name = L["FAQ-Text2.1"],
				},
			},
		},
	}
}

LibStub("AceConfig-3.0"):RegisterOptionsTable("EpicMusicPlayer", empoptions)

-------------------------------------------------------------------------------
-- option functions
-------------------------------------------------------------------------------
function EpicMusicPlayer:AddOptions(name,options)
	empoptions.args[name] = options
	LibStub("AceConfigRegistry-3.0"):NotifyChange("EpicMusicPlayer")
end

function EpicMusicPlayer:IsPlayerGui()
    if(_G.EMPGUI)then
		if(_G.EMPGUI:IsVisible())then
			return true
		end
	end
	
	return false
end

function EpicMusicPlayer:TogglePlayerGui()
    if(_G.EpicMusicPlayerGui)then
		_G.EpicMusicPlayerGui:Toggle()
	else
		EpicMusicPlayer:Print(L["GUI not found"])
	end
	EpicMusicPlayer.db.char.showgui = not EpicMusicPlayer.db.char.showgui
	
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

local lastvol = 0
function EpicMusicPlayer:ToggleMute()
	self = EpicMusicPlayer
	if(self.db.profile.volume == 0) then --unmute
		if(lastvol == 0) then
			EpicMusicPlayer:SetVolume(1,"music")
		else
			EpicMusicPlayer:SetVolume(lastvol,"music")
		end
    else --mute
		lastvol = self.db.profile.volume
		EpicMusicPlayer:SetVolume(0,"music")
	end
end

function EpicMusicPlayer:IsSpam()
	return self.db.profile.spam
end

function EpicMusicPlayer:IsScrollGuiText()
	return EpicMusicPlayer.db.profile.gui.scroll
end

function EpicMusicPlayer:ToggleScrollGuiText()
	EpicMusicPlayer.db.profile.gui.scroll = not EpicMusicPlayer.db.profile.gui.scroll
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
	if(not self.Playing)then
		if(self.db.profile.disablewowmusic) then 
			_G.SetCVar("Sound_EnableMusic", 1);	
		else
			_G.SetCVar("Sound_EnableMusic", 0);	
		end
	end
	self.db.profile.disablewowmusic = not self.db.profile.disablewowmusic
	self:Stop()
end

function EpicMusicPlayer:IsRandom()
    return EpicMusicPlayer.db.profile.random
end

function EpicMusicPlayer:ToggleRandom(all)
    if all then
		EpicMusicPlayer.db.profile.shuffleAll = not EpicMusicPlayer.db.profile.shuffleAll
		if EpicMusicPlayer.db.profile.shuffleAll then
			EpicMusicPlayer.db.profile.random = true
		end
	else
		EpicMusicPlayer.db.profile.random = not EpicMusicPlayer.db.profile.random
	end
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
		local AceCfgDlg = LibStub("AceConfigDialog-3.0")
		AceCfgDlg:SelectGroup("EpicMusicPlayer", "general")
		AceCfgDlg:SelectGroup("EpicMusicPlayer", "help")
		
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
	EpicMusicPlayer:Debug("GetZoneList: ", name)
	return db.eventZones[name];
end

local function setZoneList(info, value)
	local name = info[#info-2]
	EpicMusicPlayer:Debug("setZoneList: ", name, value)
	db.eventZones[name] = value;
	return name
end

local function deleteZone(info, value)
	local name = info[#info-2]
	EpicMusicPlayer:Debug("deleteZone: ", name)
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