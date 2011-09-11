local LibStub = LibStub
--local QTC = LibStub('LibQTipClick-1.0')
local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")

local tooltip
local frame

local function myHandlerFunc(cell, arg, event)
        local text = arg()
        DEFAULT_CHAT_FRAME:AddMessage(text)
end

local function HideTooltip()
	if MouseIsOver(tooltip) then return end
	tooltip:SetScript("OnLeave", nil)
	tooltip:Hide()
	QTC:Release(tooltip)
	tooltip = nil
end

function EpicMusicPlayer:UpdateTooltip()
	if frame then
		EpicMusicPlayer:ShowTooltip(frame)
	end
	--[[
	if tooltip then
		self:ShowTooltip(tooltip.anchor)
	end
	--]]
end

function EpicMusicPlayer:ShowTooltip(anchor)
	local db = EpicMusicPlayer.db.profile
	--EpicMusicPlayer:Debug("ShowTooltip")
	local song = EpicMusicPlayer:GetCurrentSong()
	-- old tooltip
	frame = anchor
	GameTooltip:SetOwner(anchor, "ANCHOR_NONE")
	GameTooltip:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT")
	if(song)then		
		GameTooltip:SetText("|c"..self:ToHex(db.artistcolour)..
			song.Artist.."|r  |c"..self:ToHex(db.titlecolour)..EpicMusicPlayer:GetCurrentSongName())
		local album = song.Album;
		if(album=="")then
		else
			GameTooltip:AddLine("|cffffffee"..L["Album"]..": "..album)
		end
		
		GameTooltip:AddLine("|cffffffee"..L["List"]..": "..EpicMusicPlayer:GetCurrentListName())
		GameTooltip:AddLine("|cffffffee"..L["Length"]..": "..EpicMusicPlayer:GetTimeSTring(songlength))
		GameTooltip:Show()
	else
		GameTooltip:SetText(L["Stopped"], 1,1,1)
		local controlset = db.controlset
		local controlslist = EpicMusicPlayer.controlslist
		if controlslist[controlset.left] then GameTooltip:AddLine(L["Left Click"].." - "..controlslist[controlset.left]) end	
		if controlslist[controlset.middle] then GameTooltip:AddLine(L["Middle Click"].." - "..controlslist[controlset.middle]) end
		if controlslist[controlset.right] then GameTooltip:AddLine(L["Right Click"].." - "..controlslist[controlset.right]) end
		GameTooltip:Show()
	end
	
	--[[
	-- new tooltip not done yet
	local artist = "|c"..db.artistcolour.hex..EpicMusicPlayer:GetCurrentArtistName().."|r" 
	local song = "|c"..db.titlecolour.hex..EpicMusicPlayer:GetCurrentSongName()
	
	-- Acquire a tooltip with 3 columns, respectively aligned to left, center and right
	tooltip = QTC:Acquire("EMPTooltip", 2, "LEFT", "RIGHT")
	tooltip:Clear()
	--anchor.tooltip = tooltip 
	tooltip:SetCallback("OnMouseDown", myHandlerFunc)
	local y, x = tooltip:AddHeader()
	y, x = tooltip:SetCell(y, 1, artist.." - "..song, EpicMusicPlayer.TogglePlaylist)
	--y, x = tooltip:SetCell(y, 2, song, EpicMusicPlayer.TogglePlaylist2)

	tooltip:AddNormalLine("|cffffffee"..L["List: "]..EpicMusicPlayer:GetListName())
	--tooltip:AddNormalLine("|cffffffee"..L["List: "], EpicMusicPlayer:GetListName())
	
	tooltip:SmartAnchorTo(anchor)
	tooltip:SetScript("OnLeave", EpicMusicPlayer.HideTooltip)
	tooltip.anchor = anchor
	tooltip:Show()
	--tooltip:SetScript("OnLeave", HideTooltip)
	--]]
end

function EpicMusicPlayer:HideTooltip(anchor)
	GameTooltip:Hide()
	frame = nil
	--if not tooltip or MouseIsOver(tooltip) then return end
	--tooltip:SetScript("OnLeave", nil)
	--tooltip:Hide()
	--QTC:Release(tooltip)
	--tooltip = nil
end