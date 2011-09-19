local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")

local dropdownmove = {}
local dropdownchat = nil
local dropdownmenu = nil
local db

function EpicMusicPlayer:OpenSongMenu(frame, listIndex, songIndex)
	EpicMusicPlayer:HideTooltip()
	--GameTooltip:Hide();
	local db = EpicMusicPlayer.db.profile
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
	dropdown:Show()
	dropdown.relativeTo = frame
	
	--local listName = self:GetListName(listIndex)
	
	local locked = EpicMusicPlayer:IsListLocked(listIndex)
	dropdownmenu ={}
	dropdownmove = {}
	dropdowncopy = {}
	dropdownmenu[#dropdownmenu + 1] = {
		text = L["Remove Song"],
		notCheckable = true,
		func = function() EpicMusicPlayer:RemoveSong(listIndex,songIndex);dropdown:Hide() end,
		disabled = locked,
	}
	dropdownmenu[#dropdownmenu + 1] = {
		text = L["Move song to"],
		hasArrow = true,
		notCheckable = true,
		menuList = dropdownmove,
		disabled = locked,
	}
	
	dropdownmenu[#dropdownmenu + 1] = {
		text = L["Copy song to"],
		hasArrow = true,
		notCheckable = true,
		menuList = dropdowncopy
	}

	for i, list in ipairs(EpicMusicPlayer.playlists) do
		if not EpicMusicPlayer:IsListLocked(i) and i ~=listIndex then 
			dropdownmove[#dropdownmove + 1] = {
				text = list[1].ListName,
				notCheckable = true,
				func = function()
					EpicMusicPlayer:MoveSong(listIndex,i,songIndex)
					dropdown:Hide()
				end,
			}
			dropdowncopy[#dropdowncopy + 1] = {
				text = list[1].ListName,
				notCheckable = true,
				func = function()
					--local parent = dropdown:GetParent()
					--if parent then parent:Hide() end
					dropdown:Hide()
					EpicMusicPlayer:CopySong(i,EpicMusicPlayer:GetSong(listIndex, songIndex))
				end,
			}
		end
	end
	dropdownmenu[#dropdownmenu + 1] = {
		text = CANCEL,
		notCheckable = true,
		func = function() dropdown:Hide() end,
	
	}
	EasyMenu(dropdownmenu, dropdown, "cursor", -25 , 0, "MENU")
end

function EpicMusicPlayer:OpenListMenu(frame, listIndex)
	EpicMusicPlayer:HideTooltip()
	--GameTooltip:Hide();
	local db = EpicMusicPlayer.db.profile
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
	dropdown:Show()
	dropdown.relativeTo = frame
	
	local listName = self:GetListName(listIndex)
	dropdownmenu ={ 
		{
			text = L["Add Playlist"],
			func = function() 
				local name 
				StaticPopupDialogs["EPICMUSICPLAYER_ADDPLAYLIST"] = {
					text = "Enter playlist name:",
					button1 = ACCEPT,
					button2 = CANCEL,
					timeout = 0,
					whileDead = true,
					hideOnEscape = true,
					OnAccept = function (self, data, data2)
						local text = self.editBox:GetText()
						EpicMusicPlayer:AddPlayList(text, nil, true)
					end,
					hasEditBox = true,
					EditBoxOnTextChanged = function (self, data)   -- careful! 'self' here points to the editbox, not the dialog
						if self:GetText() ~= "" then
							self:GetParent().button1:Enable()          -- self:GetParent() is the dialog
						else
							self:GetParent().button1:Disable()
						end
					end
				}
				StaticPopup_Show("EPICMUSICPLAYER_ADDPLAYLIST")
				
			end,
			notCheckable = true
		},
	}
	if listName then
		dropdownmenu[#dropdownmenu + 1] = {
			text = L["Remove Playlist"],
			func = function() self:RemovePlayList(listName); dropdown:Hide() end,
			notCheckable = true,
			disabled = EpicMusicPlayer:IsListLocked(listIndex) 
		}
	end
	dropdownmenu[#dropdownmenu + 1] = {
		text = CANCEL,
		notCheckable = true,
		func = function() dropdown:Hide() end,
	
	}
	if frame then
		EasyMenu(dropdownmenu, dropdown)
	else
		EasyMenu(dropdownmenu, dropdown, "cursor", -25 , 0, "MENU")
	end
end


function EpicMusicPlayer:OpenMenu(frame)
	EpicMusicPlayer:HideTooltip()
	--GameTooltip:Hide();
	local db = EpicMusicPlayer.db.profile
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
	dropdown:Show()
	dropdown.relativeTo = frame
		
	dropdownmove = {}
	dropdowncopy = {}
	if(not dropdownchat)then
		dropdownchat = {
			{
				text = L["Guild"], 
				notCheckable = true,
				func = function() self:Spam("GUILD") end, 
			},
			{
				text = L["Party"], 
				notCheckable = true,
				func = function() self:Spam("PARTY") end, 
			},
			{
				text = L["Say"], 
				notCheckable = true,
				func = function() self:Spam("SAY") end, 
			},
			{
				text = L["Raid"], 
				notCheckable = true,
				func = function() self:Spam("RAID") end, 
			},
			{
				text = L["To target"], 
				notCheckable = true,
				func = function()
					EpicMusicPlayer:Spam("TARGET")
				end, 
			},
		}
	end
	
	if(self.whisper)then
		dropdownchat[6] = {
				text = L["Whisper to"].." "..self.whisper, 
				notCheckable = true,
				func = function()
					EpicMusicPlayer:Spam("WHISPER")
				end, 
			}
	end
	
	dropdownmenu ={ 
		{
			text = L["Playlist"], 
			func = function() self:TogglePlayListGui() end,
			notCheckable = true,
		},
		{
			text = L["Config"],
			func = function() self:ShowConfig() end,
			notCheckable = true,
		},
		{
			text = L["Play last"],
			func = function() self:PlayLast() end,
			notCheckable = true,
		},
		{
			text = L["Show GUI"],
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
			text = L["Shuffle Cross Playlist"],
			checked = db.shuffleAll,
			func = function() self:ToggleRandom(true) end,
	} 
	dropdownmenu[#dropdownmenu + 1] = {
			text = L["Loop Playlist"],
			checked = db.looplist,
			func = function() db.looplist = not db.looplist end,
	}
	dropdownmenu[#dropdownmenu + 1] = {
			text = L["Loop Song"],
			checked = db.loopsong,
			func = function() db.loopsong = not db.loopsong end,
	}
	
	local locked = EpicMusicPlayer:IsListLocked(db.list)
	if(self.Playing)then
		dropdownmenu[#dropdownmenu + 1] = {
			text = " ",
			notCheckable = true,
			disabled = true
		}
		dropdownmenu[#dropdownmenu + 1] = {
			text = L["Remove Song"],
			notCheckable = true,
			func = function() EpicMusicPlayer:RemoveCurrendSong() end,
			disabled = locked
		}
		dropdownmenu[#dropdownmenu + 1] = {
			text = L["Move song to"],
			hasArrow = true,
			notCheckable = true,
			menuList = dropdownmove,
			disabled = locked
		}
		
		dropdownmenu[#dropdownmenu + 1] = {
			text = L["Copy song to"],
			hasArrow = true,
			notCheckable = true,
			menuList = dropdowncopy
		}
		
		for i, list in ipairs(EpicMusicPlayer.playlists) do
			if not EpicMusicPlayer:IsListLocked(i) and i ~=listIndex then 
				dropdownmove[#dropdownmove + 1] = {
					text = list[1].ListName,
					notCheckable = true,
					func = function()
						EpicMusicPlayer:MoveCurrentSong(i)
					end,
				}
				dropdowncopy[#dropdowncopy + 1] = {
					text = list[1].ListName,
					notCheckable = true,
					func = function()
						EpicMusicPlayer:CopySong(i,EpicMusicPlayer:GetCurrentSong())
					end,
				}
			end
		end
		
		dropdownmenu[#dropdownmenu + 1] = {
			text = L["Spam to"],
			hasArrow = true,
			notCheckable = true,
			menuList = dropdownchat,
		}
		dropdownmenu[#dropdownmenu + 1] = {
			text = " ",
			notCheckable = true,
			disabled = true
		}
	end
	dropdownmenu[#dropdownmenu + 1] = {
		text = CANCEL,
		notCheckable = true,
		func = function() dropdown:Hide() end,
	}
	EasyMenu(dropdownmenu, dropdown)
end