local LibStub = LibStub
local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")

local tooltip, frame
local _G = _G

function EpicMusicPlayer:UpdateTooltip()
	if frame then
		EpicMusicPlayer:ShowTooltip(frame)
	end
end

function EpicMusicPlayer:ShowTooltip(anchor)
	local db = EpicMusicPlayer.db.profile
	local song = EpicMusicPlayer:GetCurrentSong()
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
		GameTooltip:AddLine("|cffffffee"..L["Length"]..": "..EpicMusicPlayer:GetTimeSTring(song.Length))
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
end

function EpicMusicPlayer:HideTooltip(anchor)
	GameTooltip:Hide()
	frame = nil
end