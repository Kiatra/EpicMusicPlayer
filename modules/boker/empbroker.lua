local _G, mod, math, string = _G, mod, math, string
local ldb = _G.LibStub:GetLibrary("LibDataBroker-1.1",true)
local ldbIcon = ldb and LibStub("LibDBIcon-1.0", true)
if not ldb then return end

local EpicMusicPlayerBroker = LibStub("AceAddon-3.0"):NewAddon("EpicMusicPlayerBroker", "AceEvent-3.0","AceTimer-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")
local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")


local options={
			name="DataBroker",
			order = 7,
			type="group",
			args = {		
			    number = {
					type = 'toggle',
					--width = "half",
					order = 4,
					name = L['Show List/Song Numbers'],
					desc = L['Show playlist and song number'],
					get = function()
						return EpicMusicPlayerBroker.db.profile.shownumber
					end,
					set = function()
					    EpicMusicPlayerBroker.db.profile.shownumber = not EpicMusicPlayerBroker.db.profile.shownumber
						EpicMusicPlayerBroker:UpdateText()
					end,
				},
			    title = {
					type = 'toggle',
					--width = "half",
					order = 5,
					name = L['Show Title'],
					desc = L['Toggle show title'],
					get = function()
						return EpicMusicPlayerBroker.db.profile.showtitle
					end,
					set = function()
					    EpicMusicPlayerBroker.db.profile.showtitle = not EpicMusicPlayerBroker.db.profile.showtitle
					    EpicMusicPlayerBroker:UpdateText()
					end,
				},
				artist = {
					type = 'toggle',
					--width = "half",
					order = 5,
					name = L['Show Artist'],
					desc = L['Toggle show Artist'],
					get = function()
						return EpicMusicPlayerBroker.db.profile.showartist
					end,
					set = function()
					    EpicMusicPlayerBroker.db.profile.showartist = not EpicMusicPlayerBroker.db.profile.showartist
					    EpicMusicPlayerBroker:UpdateText()
					end,
				},
			    showtime = {
		            type = "toggle",
		            order = 6,
				    name = L["Show time"],
		            desc = L["Toggle show time"],
		            get = function()
						return EpicMusicPlayerBroker.db.profile.showtime
					end,
					set = function()
					    EpicMusicPlayerBroker.db.profile.showtime = not EpicMusicPlayerBroker.db.profile.showtime
					    EpicMusicPlayerBroker:UpdateText()
					end,
		        },
				maxtextlength = {
					type = 'range',
					order = 8,
					name = L["Max song text length"],
					desc = L["The maximum text length of the song displayed in the Panel."],
					min = 4,
					max = 40,
					step = 1,
					get = function(name)
						return EpicMusicPlayerBroker.db.profile.MaxTextLength
					end,
					set = function(self,value)
						EpicMusicPlayerBroker:SetMaxTextLength(value)
					end,
				},	
			}
}

local songlength = 0
local songtitle = ""
local artist = ""
local album = ""
local shorttitle = ""
local titleoffset = 0
local volumechanged = nil
local sec = 0
local playing = false;
local empdb

local function GetTimeSTring(seconds)
	local min = seconds / 60
	local sec = mod(seconds, 60)
	if( sec < 10) then
        return string.format("%i:0%i", min, sec)
    else
		return string.format("%i:%i", min, sec)
	end
end

function EpicMusicPlayerBroker:IsMinimap()
	return not self.db.profile.minimapButton.hide
end

function EpicMusicPlayerBroker:ToggleMinimap()
	self.db.profile.minimapButton.hide = not self.db.profile.minimapButton.hide
	if self.db.profile.minimapButton.hide then
		ldbIcon:Hide("EpicMusicPlayer")
	else
		ldbIcon:Show("EpicMusicPlayer")
	end
end

function EpicMusicPlayerBroker:SetMaxTextLength(length)
   
   if length > 40 then
      self.db.profile.MaxTextLength = 40
      return
   end
   if length < 4 then
      self.db.profile.MaxTextLength = 4
      return
   end
   self.db.profile.MaxTextLength = length
   shorttitle = self:SetTextLenght(songtitle)
   self:UpdateText()
   
end

function EpicMusicPlayerBroker:SetTextLenght(text)
	local length = text:len()
	local maxLength = self.db.profile.MaxTextLength
	if length > maxLength then
		text = text:sub(1, maxLength - 3) .. '...'
	end
	
	return text
end


local dataobj = ldb:NewDataObject("EpicMusicPlayer", {
	type = "data source",
	icon = "Interface\\AddOns\\EpicMusicPlayer\\media\\icon",
	label = "EpicMusicPlayer",
	text  = "Stopped",
	
	--OnEnter = EpicMusicPlayerBrokerObj.OnEnter,
	OnClick = function(self, btn)
		EpicMusicPlayer:OnDisplayClick(self, btn)
	end,
})

local function OnScroll(self, vector)
	EpicMusicPlayer:DisplyScrollHandler(vector)			
end

function dataobj:OnEnter()
	self:EnableMouseWheel(1) 
	self:SetScript("OnMouseWheel", OnScroll)
	--EpicMusicPlayerGui:ShowTooltip(self)
	EpicMusicPlayer:ShowTooltip(self)
end

function dataobj:OnLeave()
	EpicMusicPlayer:HideTooltip(self)
end

function EpicMusicPlayerBroker:OnInitialize()
	empdb = EpicMusicPlayer.db.profile
	local defaults = {
		profile = {
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
	}
	self.db = _G.LibStub("AceDB-3.0"):New("EpicMusicPlayerBrokerDB", defaults, "Default")
	
	EpicMusicPlayer:AddOptions("broker",options)
	songtitle = EpicMusicPlayer:GetCurrentSongName()
	shorttitle = self:SetTextLenght(songtitle)
	self:UpdateText()
	
	if ldbIcon then
		ldbIcon:Register("EpicMusicPlayer", dataobj, self.db.profile.minimapButton)
		--empdb.MinimapIcon.hide = true
		--ldbIcon:Show("EpicMusicPlayer")
	end
end

function EpicMusicPlayerBroker:OnEnable(first)
	self:RegisterMessage("EMPUpdateStop")
	self:RegisterMessage("EMPUpdatePlay")
	self:RegisterMessage("EMPUpdateTime")
	self:RegisterMessage("EMPUpdateVolume")
end


function EpicMusicPlayerBroker:OnDisable()
   self:UnregisterAllEvents("EpicMusicPlayerBroker")
end

function EpicMusicPlayerBroker:EMPUpdateTime(event)
	sec = sec +1
	self:UpdateText()
end

function EpicMusicPlayerBroker:EMPUpdateVolume(event, voltype, vol)
	if(voltype == "done")then
		volumechanged = false
	else
		volumechanged = voltype
	end
	self:UpdateText()
end

function EpicMusicPlayerBroker:EMPUpdatePlay(event, artist, songname, length)
	--dataobj.text = songname
	volumechanged = false
	songlength = length
	songtitle = songname
	--artist = artistname
	if self.db.profile.showartist and artist then
		shorttitle = self:SetTextLenght(artist.." - "..songtitle)
	else
		shorttitle = self:SetTextLenght(songtitle)
	end
	playing = true
	titleoffset = 0
	sec = 0
	self:UpdateText()
end

function EpicMusicPlayerBroker:EMPUpdateStop(event, artist, songname, length)
	--dataobj.text = songname
	playing = false
	songtitle = songname
	shorttitle = self:SetTextLenght(songtitle)
	self:UpdateText()
end

function EpicMusicPlayerBroker:UpdateText()
   
    if(volumechanged) then
        if(volumechanged == "music")then
			dataobj.text = L["Music volume: "]..math.floor((empdb.volume*100)).."%"
			return
		else
			dataobj.text = L["Effects volume: "]..math.floor((_G.GetCVar("Sound_SFXVolume")*100)).."%"
			return
		end
    end
	
	local text = ""
	if(self.db.profile.shownumber)then
		text = empdb.list.."/"..(empdb.song-1).." "
	end
	
	if(self.db.profile.showtitle or self.db.profile.showtime)then
		local title
	    if (playing == true) then
			if(self.db.profile.showtitle) then
				text = text..shorttitle
			end
	        if(self.db.profile.showtime) then
				text = text.." "..GetTimeSTring(sec).."/"
					..GetTimeSTring(songlength)
			end      
	    else
			    text = text..shorttitle
		end
	end
	
	dataobj.text = text;
end
