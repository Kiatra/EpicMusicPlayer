local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")

local dropdownmove = {}
local dropdownchat = nil
local dropdownmenu = nil
local db

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
	
	dropdown.relativeTo = frame
	
	local currsong = db.song
	local currlist = db.list
	
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
			func = function() self:TogglePlayListGui() end, 
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
			text = L["Loop Playlist"],
			checked = db.looplist,
			func = function() db.looplist = not db.looplist end,
	}
	dropdownmenu[#dropdownmenu + 1] = {
			text = L["Loop Song"],
			checked = db.loopsong,
			func = function() db.loopsong = not db.loopsong end,
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
		
		for i, list in ipairs(EpicMusicPlayer.playlists) do
			dropdownmove[#dropdownmove + 1] = {
				text = list[1].ListName,
				func = function()
					EpicMusicPlayer:MoveCurrentSong(i)
				end,
			}
			dropdowncopy[#dropdowncopy + 1] = {
				text = list[1].ListName,
				func = function()
					EpicMusicPlayer:CopySong(i,EpicMusicPlayer:GetCurrentSong())
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
			func = function() EpicMusicPlayer:RemoveCurrendSong() end,
		}
	end
	EasyMenu(dropdownmenu, dropdown)
end