local _G = _G
local LibStub, ipairs = _G.LibStub, ipairs
local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")

local dropdownchat = nil
local dropdownmenu = nil
local dropdowncopy = nil

function EpicMusicPlayer:OpenSongMenu(frame, listIndex, songIndex)
  local countSelectedSongs = EpicMusicPlayer:GetNumberOfSelectedSongs(listIndex)
	EpicMusicPlayer:HideTooltip()
	--GameTooltip:Hide();
	local db = EpicMusicPlayer.db
	--local self = EpicMusicPlayer
	local dropdown = self.dropdown
	if not dropdown then
		dropdown = _G.CreateFrame("Frame", "EMPDropDown", nil, "UIDropDownMenuTemplate")
		dropdown.xOffset = 0
		dropdown.yOffset = 0
		dropdown.point = "TOPLEFT"
		dropdown.relativePoint = "BOTTOMLEFT"
		dropdown.displayMode = "MENU"
		self.dropdown = dropdown
	end
	dropdown:Show()
	dropdown.relativeTo = frame

	local locked = EpicMusicPlayer:IsListLocked(db.list)
	dropdownmenu = {}
	dropdowncopy = {}
	dropdownCopyMulti = {}
	dropdownCopyAll = {}
	dropdownmenu[#dropdownmenu + 1] = {
		text = L["Remove Song"],
		notCheckable = true,
		func = function() EpicMusicPlayer:RemoveSong(listIndex,songIndex);dropdown:Hide() end,
		disabled = locked,
	}

	for i, dstList in ipairs(EpicMusicPlayer.playlists) do
		if not EpicMusicPlayer:IsListLocked(i) and i ~=listIndex then
			dropdowncopy[#dropdowncopy + 1] = {
				text = dstList.listName,
				notCheckable = true,
				func = function()
					--local parent = dropdown:GetParent()
					--if parent then parent:Hide() end
					dropdown:Hide()
					EpicMusicPlayer:CopySong(EpicMusicPlayer:GetSong(listIndex, songIndex), dstList)
				end,
			}
			if countSelectedSongs > 1 then
				dropdownCopyMulti[#dropdownCopyMulti + 1] = {
					text = dstList.listName,
					notCheckable = true,
					func = function()
						dropdown:Hide()
						EpicMusicPlayer:CopyAllSelectedSongs(listIndex, dstList)
					end,
				}
		 end
		 dropdownCopyAll[#dropdownCopyAll + 1] = {
			 text = dstList.listName,
			 notCheckable = true,
			 func = function()
				 dropdown:Hide()
				 EpicMusicPlayer:CopyAllSongs(listIndex, dstList)
			 end,
		 }
		end
	end

	dropdowncopy[#dropdowncopy + 1] = {
		text = L["New List"],
		notCheckable = true,
		func = function()
			--local parent = dropdown:GetParent()
			--if parent then parent:Hide() end
			dropdown:Hide()
			EpicMusicPlayer:CreatePlayListDialog( function(self)
        local srcList = EpicMusicPlayer:GetListByIndex(listIndex)
				local text = self.editBox:GetText()
				EpicMusicPlayer:AddPlayList(text, nil, true)

				local dstList, _ = EpicMusicPlayer:GetListByName(text)
				EpicMusicPlayer:Debug("srcList, dstList, listIndex", srcList, dstList, listIndex)
				EpicMusicPlayer:CopySong(EpicMusicPlayer:GetSong(srcList, songIndex), dstList)
			end )
		end,
	}
	if countSelectedSongs > 1 then
		dropdownCopyMulti[#dropdownCopyMulti + 1] = {
			text = L["New List"],
			notCheckable = true,
			func = function()
				dropdown:Hide()
				EpicMusicPlayer:CreatePlayListDialog( function(self)
          local srcList = EpicMusicPlayer:GetListByIndex(listIndex)
					local text = self.editBox:GetText()
					EpicMusicPlayer:AddPlayList(text, nil, true)

					local list, _ = EpicMusicPlayer:GetListByName(text)
					EpicMusicPlayer:CopyAllSelectedSongs(srcList, dstList)
				end )
			end,
		}
 end
 dropdownCopyAll[#dropdownCopyAll + 1] = {
	 text = L["New List"],
	 notCheckable = true,
	 func = function()
		 dropdown:Hide()
		 EpicMusicPlayer:CreatePlayListDialog( function(self)
			 local srcList = EpicMusicPlayer:GetListByIndex(listIndex)
			 local text = self.editBox:GetText()
			 EpicMusicPlayer:AddPlayList(text, nil, true)

			 local dstList, _ = EpicMusicPlayer:GetListByName(text)
			 EpicMusicPlayer:CopyAllSongs(srcList, dstList)
		 end )
	 end,
 }

 local song = EpicMusicPlayer:GetSong(listIndex, songIndex)
 local songName = song and song.Song or ""

	dropdownmenu[#dropdownmenu + 1] = {
		text = string.format(L["Copy song %s to"], "\""..songName.."\""),
		hasArrow = true,
		notCheckable = true,
		menuList = dropdowncopy
	}

	dropdownmenu[#dropdownmenu + 1] = {
		text = L["Copy selected songs to"],
		hasArrow = true,
		notCheckable = true,
		menuList = dropdownCopyMulti,
		disabled = countSelectedSongs < 1,
	}

	dropdownmenu[#dropdownmenu + 1] = {
		text = L["Copy all songs to"],
		hasArrow = true,
		notCheckable = true,
		menuList = dropdownCopyAll
	}

	dropdownmenu[#dropdownmenu + 1] = {
		text = L["Clear selection"],
		func = function() EpicMusicPlayer:ClearListSelection(listIndex) end,
		notCheckable = true,
	}

	dropdownmenu[#dropdownmenu + 1] = {
		text = _G.CANCEL,
		notCheckable = true,
		func = function() dropdown:Hide() end,
	}
	_G.EasyMenu(dropdownmenu, dropdown, "cursor", -25 , 0, "MENU")
end

function EpicMusicPlayer:OpenListMenu(frame, listIndex)
	EpicMusicPlayer:HideTooltip()
	--GameTooltip:Hide();
	local db = EpicMusicPlayer.db
	--local self = EpicMusicPlayer
	local dropdown = self.dropdown
	if not dropdown then
		dropdown = _G.CreateFrame("Frame", "EMPDropDown", nil, "UIDropDownMenuTemplate")
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
			func = function() EpicMusicPlayer:CreatePlayListDialog() end,
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
		dropdownmenu[#dropdownmenu + 1] = {
			text = L["Export Playlist"],
			func = function() self:ExportPlayListDialog(listIndex); dropdown:Hide() end,
			notCheckable = true,
			disabled = EpicMusicPlayer:IsListLocked(listIndex)
		}
	end
	dropdownmenu[#dropdownmenu + 1] = {
		text = _G.CANCEL,
		notCheckable = true,
		func = function() dropdown:Hide() end,

	}
	if frame then
		_G.EasyMenu(dropdownmenu, dropdown)
	else
		_G.EasyMenu(dropdownmenu, dropdown, "cursor", -25 , 0, "MENU")
	end
end


function EpicMusicPlayer:OpenMenu(frame, listIndex)
	EpicMusicPlayer:HideTooltip()
	--GameTooltip:Hide();
	local db = EpicMusicPlayer.db
	--local self = EpicMusicPlayer
	local dropdown = self.dropdown
	if not dropdown then
		dropdown = _G.CreateFrame("Frame", "EMPDropDown", nil, "UIDropDownMenuTemplate")
		dropdown.xOffset = 0
		dropdown.yOffset = 0
		dropdown.point = "TOPLEFT"
		dropdown.relativePoint = "BOTTOMLEFT"
		dropdown.displayMode = "MENU"
		self.dropdown = dropdown
	end
	dropdown:Show()
	dropdown.relativeTo = frame

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
			--icon = "Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\lastButton.tga"
		},
		{
			text = L["Show GUI"],
			checked = EpicMusicPlayer.db.showgui,
			func = function() self:TogglePlayerGui() end,
		},
	}
	local EpicMusicDancer = EpicMusicPlayer.EpicMusicDancer
	if(EpicMusicDancer)then
		dropdownmenu[#dropdownmenu + 1] = {
			text = L["Show Dancer"],
			checked = EpicMusicDancer:IsVisible(),
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
	dropdownmenu[#dropdownmenu + 1] = {
			text = L["Enable Events"],
			checked = db.enableEvents,
			func = function() db.enableEvents = not db.enableEvents end,
	}

	local locked = EpicMusicPlayer:IsListLocked(db.list)

	if(self.Playing)then
		dropdownmenu[#dropdownmenu + 1] = {
			text = " ",
			notCheckable = true,
			disabled = true
		}
		dropdownmenu[#dropdownmenu + 1] = {
			text = L["Send song name to"],
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
		text = _G.CANCEL,
		notCheckable = true,
		func = function() dropdown:Hide() end,
	}
	_G.EasyMenu(dropdownmenu, dropdown)
end
