local LibStub = LibStub
local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")

local tooltip, frame
local _G = _G

local tooltipText = {
	listButton = L["Toggle Playlist"],
	addButton = L["Add Playlist"],
	configButton = L["Open options (Right click to toggle mute.)"],
	randomButton = L["Toggle shuffle"],
	importButton = L["Import a playlist. Right click a list to export that list."],
}

function EpicMusicPlayer:UpdateTooltip()
	if frame then
		EpicMusicPlayer:ShowTooltip(frame)
	end
end

local function GetTipAnchor(frame)
	local x, y = frame:GetCenter()
	if not x or not y then return "TOPLEFT", "BOTTOMLEFT" end
	local hhalf = (x > UIParent:GetWidth() * 2 / 3) and "RIGHT" or (x < UIParent:GetWidth() / 3) and "LEFT" or ""
	local vhalf = (y > UIParent:GetHeight() / 2) and "TOP" or "BOTTOM"
	return vhalf .. hhalf, frame, (vhalf == "TOP" and "BOTTOM" or "TOP") .. hhalf
end

local function getVolumeText(voltype)
		return math.floor((_G.GetCVar(voltype)*100)).."%"
end

local function addVolumeLine(self)
	if self.db.usePlaySoundFile then
		GameTooltip:AddLine("EpicMusicPlayer is using the amiance channel.")
		GameTooltip:AddLine("Ambience Volume: "..getVolumeText("Sound_AmbienceVolume"))
	else
		GameTooltip:AddLine("Music Volume: "..getVolumeText("Sound_MusicVolume").." Scroll to change.")
	end

	GameTooltip:AddLine("Sound Volume: "..getVolumeText("Sound_SFXVolume").." Scroll + control to change.")
	GameTooltip:AddLine("Master Volume: "..getVolumeText("Sound_MasterVolume").." Scroll + shift to change.")
end

function EpicMusicPlayer:ShowTooltip(anchor)
	local db = self.db
	local song = EpicMusicPlayer:GetCurrentSong()
	frame = anchor
	GameTooltip:SetOwner(anchor, "ANCHOR_NONE")
	GameTooltip:SetPoint(GetTipAnchor(frame))
	--GameTooltip:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT")

	if(song)then
		if song.Artist == "" then
			GameTooltip:SetText(EpicMusicPlayer:GetCurrentSongName(), 1,1,1)
		else
			GameTooltip:SetText(song.Artist.." - "..EpicMusicPlayer:GetCurrentSongName(), 1,1,1)
		end

		local album = song.Album;
		if(album=="")then
		else
			GameTooltip:AddLine(L["Album"]..": "..album)
		end

		GameTooltip:AddLine(L["List"]..": "..EpicMusicPlayer:GetCurrentListName())
		GameTooltip:AddLine(" ")
	else
		if self.disablewowmusic then GameTooltip:SetText(L["Stopped"], 1,1,1) else GameTooltip:SetText(L["Game Music"], 1,1,1) end

 end
  GameTooltip:AddLine(" ")
  addVolumeLine(self)
  GameTooltip:AddLine(" ")
	local controlset = self.db.controlset
	local controlslist = self.controlslist
	if controlslist[controlset.LeftButton] then GameTooltip:AddLine(L["Left Click"].." - "..controlslist[controlset.LeftButton]) end
	if controlslist[controlset.MiddleButton] then GameTooltip:AddLine(L["Middle Click"].." - "..controlslist[controlset.MiddleButton]) end
	if controlslist[controlset.RightButton] then GameTooltip:AddLine(L["Right Click"].." - "..controlslist[controlset.RightButton]) end
	GameTooltip:Show()

end

function EpicMusicPlayer:HideTooltip(anchor)
	GameTooltip:Hide()
	frame = nil
end

function EpicMusicPlayer:ShowButtonTooltip(anchor, text)
  if anchor and text and tooltipText[text] then
		GameTooltip:SetOwner(anchor, "ANCHOR_NONE")
		GameTooltip:SetPoint(GetTipAnchor(anchor))
		GameTooltip:AddLine(tooltipText[text])
		GameTooltip:Show()
	end
end
