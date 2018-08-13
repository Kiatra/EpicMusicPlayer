local _G, mod, math, string = _G, mod, math, string
local ldb = _G.LibStub:GetLibrary("LibDataBroker-1.1",true)
--@debug@
local loaded, reason = LoadAddOn("LibDBIcon-1.0")
--@end-debug@
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
						return EpicMusicPlayer.db.broker.shownumber
					end,
					set = function()
					    EpicMusicPlayer.db.broker.shownumber = not EpicMusicPlayer.db.broker.shownumber
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
						return EpicMusicPlayer.db.broker.showtitle
					end,
					set = function()
					    EpicMusicPlayer.db.broker.showtitle = not EpicMusicPlayer.db.broker.showtitle
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
						return EpicMusicPlayer.db.broker.showartist
					end,
					set = function()
					    EpicMusicPlayer.db.broker.showartist = not EpicMusicPlayer.db.broker.showartist
					    EpicMusicPlayerBroker:UpdateText()
					end,
				},
			    showtime = {
		            type = "toggle",
		            order = 6,
				    name = L["Show time"],
		            desc = L["Toggle show time"],
		            get = function()
						return EpicMusicPlayer.db.broker.showtime
					end,
					set = function()
					    EpicMusicPlayer.db.broker.showtime = not EpicMusicPlayer.db.broker.showtime
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
						return EpicMusicPlayer.db.broker.MaxTextLength
					end,
					set = function(self,value)
						EpicMusicPlayerBroker:SetMaxTextLength(value)
					end,
				},
			}
}

local songlength, titleoffset, sec = 0, 0, 0
local songtitle, artist, album, shorttitle = "", "", "", ""
local playing = false;

local function GetTimeString(seconds)
	local min = seconds / 60
	local sec = mod(seconds, 60)
	if( sec < 10) then
        return string.format("%i:0%i", min, sec)
    else
		return string.format("%i:%i", min, sec)
	end
end

function EpicMusicPlayerBroker:IsMinimap()
	return not EpicMusicPlayer.db.broker.minimapButton.hide
end

function EpicMusicPlayerBroker:ToggleMinimap()
	EpicMusicPlayer.db.broker.minimapButton.hide = not EpicMusicPlayer.db.broker.minimapButton.hide
	if EpicMusicPlayer.db.broker.minimapButton.hide then
		ldbIcon:Hide("EpicMusicPlayer")
	else
		ldbIcon:Show("EpicMusicPlayer")
	end
end

function EpicMusicPlayerBroker:SetMaxTextLength(length)

   if length > 40 then
      EpicMusicPlayer.db.broker.MaxTextLength = 40
      return
   end
   if length < 4 then
      EpicMusicPlayer.db.broker.MaxTextLength = 4
      return
   end
   EpicMusicPlayer.db.broker.MaxTextLength = length
   shorttitle = self:SetTextLenght(songtitle)
   self:UpdateText()

end

function EpicMusicPlayerBroker:SetTextLenght(text)
	local length = text:len()
	local maxLength = EpicMusicPlayer.db.broker.MaxTextLength
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

function dataobj:OnMouseWheel(vector)
	EpicMusicPlayer:Debug(self, vector);
	OnScroll(self, vector)
end


function EpicMusicPlayerBroker:OnInitialize()
	self.db = EpicMusicPlayer.db

	EpicMusicPlayer:AddOptions("broker",options)
	songtitle = EpicMusicPlayer:GetCurrentSongName()
	shorttitle = self:SetTextLenght(songtitle)
	self:UpdateText()

	if ldbIcon then
		ldbIcon:Register("EpicMusicPlayer", dataobj, self.db.broker.minimapButton)
	end

	self:RegisterMessage("EMPUpdateStop")
	self:RegisterMessage("EMPUpdatePlay")
	self:RegisterMessage("EMPUpdateTime")
	self:RegisterMessage("EMPUpdateVolume")
	self:RegisterMessage("EMPUpdateVolumeTimerUp")
end

function EpicMusicPlayerBroker:OnDisable()
   self:UnregisterAllEvents("EpicMusicPlayerBroker")
end

function EpicMusicPlayerBroker:EMPUpdateTime(event, seconds)
	--sec = sec +1
	sec = seconds
	self:UpdateText()
end

function EpicMusicPlayerBroker:EMPUpdateVolumeTimerUp(event)
	self:UpdateText()
end

function EpicMusicPlayerBroker:EMPUpdateVolume(event, voltype, vol)
  local volumeText = EpicMusicPlayer:GetVolumeText(voltype)
	dataobj.text = volumeText..math.floor((_G.GetCVar(voltype)*100)).."%"
end

function EpicMusicPlayerBroker:EMPUpdatePlay(event, artist, songname, length)
	songlength = length
	songtitle = songname
	--artist = artistname
	if self.db.broker.showartist and artist then
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
	local text = ""
	if(self.db.broker.shownumber)then
		text = self.db.list.."/"..(self.db.song-1).." "
	end

	if(self.db.broker.showtitle or self.db.broker.showtime)then
		local title
	    if (playing == true) then
			if(self.db.broker.showtitle) then
				text = text..shorttitle
			end
	        if(self.db.broker.showtime) then
				text = text.." "..GetTimeString(sec).."/"
					..GetTimeString(songlength)
			end
	    else
			    text = text..shorttitle
		end
	end
	dataobj.text = text;
end
