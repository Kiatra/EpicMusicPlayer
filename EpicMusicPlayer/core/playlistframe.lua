local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")
local aceevent = LibStub("AceEvent-3.0")

local delay = 0.1
local counter = 0
local frame
local mainframe
local selectedlist
local listslist, songlist, playbutton, randombutton,title
local db
local seperator

-- show/hide the left list with the playlists
local function ToggleLists()
	if listslist:IsShown() then
		listslist:Hide()
		songlist:SetPoint("TOPLEFT", frame ,5, -25)
		songlist:SetPoint("BOTTOMRIGHT", frame ,-5, 27)
		frame:SetMinResize(150,50)
	else
		listslist:Show()
		songlist:SetPoint("TOPLEFT", frame ,120, -25)
		songlist:SetPoint("BOTTOMRIGHT", frame ,-5, 27)
		frame:SetMinResize(300,200)
	end
end

local function SelectList(listindex)
	--listslist.selectedIndex = listindex
	selectedlist = EpicMusicPlayer:GetListByIndex(listindex)
	listslist:SetSelected(listindex)
	songlist:SetMax(#selectedlist-1)
	
end

local function OnListClick(self)
	SelectList(self.listindex)
end

local function OnSongClick(self,button)
	if (button == "LeftButton") then
			EpicMusicPlayer:PlaySong(listslist.selectedIndex, self.listindex+1)
	else
		local song = EpicMusicPlayer:GetSong(listslist.selectedIndex, self.listindex)
		GameTooltip:SetOwner(self, "ANCHOR_NONE")
		GameTooltip:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT")
		GameTooltip:AddLine(song.Name)
		GameTooltip:Show()
	end
end

local function OnSongLeave(self)
	GameTooltip:Hide()
end

local function UpdatePlayButon(playing)
	if(playing)then
			playbutton:SetNormalTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-stop.tga")
			playbutton:SetPushedTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-stop-p.tga")
		else
			playbutton:SetNormalTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-play.tga")
			playbutton:SetPushedTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-play-p.tga")
	end
end

local function UpdateRandomButon(event,val)
	if(val)then
			randombutton:SetNormalTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-randomon.tga")
			randombutton:SetPushedTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-randomon-p.tga")
		else
			randombutton:SetNormalTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-randomoff.tga")
			randombutton:SetPushedTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-randomoff-p.tga")
	end
end

local function round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

local counter = 0
local delay = 0.3
local function OnDragUpdate(self, elapsed)
	counter = counter + elapsed
	if counter >= delay then
		--EpicMusicPlayer:Debug(x,round(seperator.posx-x, 0))
		local x, y = GetCursorPosition();
		EpicMusicPlayer:Debug(songlist:GetWidth(), seperator.x - x)
		
		--if songlist:GetWidth() > 110 then
			---songlist:SetWidth(111)
			x = seperator.x - x
			
			local posx = round(seperator.posx-x, 0)
			
			seperator:SetPoint("TOPLEFT", frame ,posx, -25)
			seperator:SetPoint("BOTTOM", frame ,"BOTTOM",posx, 27)
		--end
	end
end

local function UpdatePlayStop(event, artist, songname, length)
	if(EpicMusicPlayer.Playing)then
			UpdatePlayButon(true)
			if artist ~= "" then
				title:SetText("|cffffd200"..artist.."|r - "..songname)
			else
				title:SetText(songname)
			end
		else
			UpdatePlayButon(false)
			title:SetText(songname)
	end
end

local function CreateHeader(parent)
	local header = CreateFrame("Frame",nil,parent)
	header:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background"});
	header:SetBackdropColor(0.2,0.2,0.2,0.9)
	
	local lastbutton = CreateFrame("Button",nil,header)
	lastbutton:SetWidth(16)
	lastbutton:SetHeight(16)
	lastbutton:SetPoint("TOPLEFT", header, 0,0)
	lastbutton:EnableMouse(true); 
	lastbutton:SetScript("OnMouseUp", EpicMusicPlayer.PlayNext)
	lastbutton:SetNormalTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-last.tga")
	lastbutton:SetPushedTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-last-p.tga")

	playbutton = CreateFrame("Button",nil,header)
	playbutton:SetWidth(16)
	playbutton:SetHeight(16)
	playbutton:SetPoint("TOPLEFT", lastbutton,"TOPRIGHT", 0,0)
	playbutton:EnableMouse(true); 
	playbutton:SetScript("OnMouseUp", function(self)
		if(EpicMusicPlayer.Playing)then
			EpicMusicPlayer:Stop()
		else
			EpicMusicPlayer:Play()
		end
	end)
	UpdatePlayButon(EpicMusicPlayer.Playing)

	local nextbutton = CreateFrame("Button",nil,header)
	nextbutton:SetNormalTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-next.tga")
	nextbutton:SetPushedTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-next-p.tga")
	nextbutton:SetWidth(16)
	nextbutton:SetHeight(16)
	nextbutton:SetPoint("TOPLEFT", playbutton,"TOPRIGHT", 0,0)
	nextbutton:EnableMouse(true); 
	nextbutton:SetScript("OnMouseUp", EpicMusicPlayer.PlayLast)
	
	randombutton = CreateFrame("Button",nil,header)
	randombutton:SetWidth(16)
	randombutton:SetHeight(16)
	randombutton:SetPoint("TOPLEFT", nextbutton,"TOPRIGHT", 0,0)
	randombutton:EnableMouse(true); 
	randombutton:SetScript("OnMouseUp", EpicMusicPlayer.ToggleRandom)
	UpdateRandomButon(nil, EpicMusicPlayer.db.profile.random)
	
	local mutebutton = CreateFrame("Button",nil,header)
	mutebutton:SetNormalTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-conf.tga")
	mutebutton:SetPushedTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-conf-p.tga")
	mutebutton:SetWidth(16)
	mutebutton:SetHeight(16)
	mutebutton:SetPoint("TOPLEFT", randombutton,"TOPRIGHT", 0,0)
	mutebutton:EnableMouse(true); 
	mutebutton:SetScript("OnMouseUp", EpicMusicPlayer.ToggleMute)
	
	local listbutton = CreateFrame("Button",nil,header)
	listbutton:SetNormalTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-list.tga")
	listbutton:SetPushedTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-list-p.tga")
	listbutton:SetWidth(16)
	listbutton:SetHeight(16)
	listbutton:SetPoint("TOPLEFT", mutebutton,"TOPRIGHT", 0,-1)
	listbutton:EnableMouse(true); 
	listbutton:SetScript("OnMouseUp", ToggleLists)
	
	local x = CreateFrame("Button",nil,parent,"UIPanelCloseButton")
	x:SetWidth(29)
	x:SetHeight(29)
	x:SetPoint("TOPRIGHT",header,7,6)
	
	title = header:CreateFontString()
	--db.playlistfont^GameFontNormal:GetFont()
	--EpicMusicPlayer:Debug("db.playlistfont",db.playlistfont,GameFontNormal:GetFont())
	title:SetFont(EpicMusicPlayer:GetFont(db.playlistfont), 12)
	title:SetPoint("TOPLEFT", listbutton,"TOPRIGHT", 5,1)
	title:SetPoint("BOTTOMRIGHT", header, -25,0)
	title:SetShadowColor(0, 0, 0,0.8)
	title:SetShadowOffset(1, -1) 
	parent.title = title
	local song = EpicMusicPlayer:GetCurrentSong()
	if song then 
		UpdatePlayStop(event, song.Artist, EpicMusicPlayer:GetCurrentSongName(),0)
	else
		UpdatePlayStop(event, "", EpicMusicPlayer:GetCurrentSongName(), 0)
	end
	return header
end

local function CreateFooter(parent)
	local footer = CreateFrame("Frame",nil,parent)
	footer:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background"});
	footer:SetBackdropColor(0.2,0.2,0.2,0.9)
	
	editbox = CreateFrame("EditBox",nil,footer)
	--editbox:SetAllPoints(footer)
	editbox:SetPoint("TOPLEFT", footer, 3,0)
	editbox:SetPoint("BOTTOMRIGHT", footer, -3,0)
	
	editbox:SetAutoFocus(false)
	editbox:SetScript("OnEscapePressed",function(self) 
		--parent:Hide() 
		self:ClearFocus()
	end)
	editbox:SetFont(parent.font, 12)
	editbox:SetText(L["Search..."])
	
	--OnTextChanged OnEnterPressed
	
	editbox:SetScript("OnTextChanged",function(self) 
		if self:GetText() ~= L["Search..."] then
			EpicMusicPlayer:Search(self:GetText())
			SelectList(EpicMusicPlayer:GetListIndex("lastsearch"))
		end
	end)
	editbox:SetScript("OnEditFocusGained",function(self) self:HighlightText(0, self:GetNumLetters()) end)
	editbox:SetScript("OnEditFocusLost",function(self) self:SetText(L["Search..."]) end)
	return footer
end

local function CreatePlaylistGui(width, height)
	aceevent:RegisterMessage("EMPUpdatePlay",UpdatePlayStop)
	aceevent:RegisterMessage("EMPUpdateStop",UpdatePlayStop)
	aceevent:RegisterMessage("EMPUpdateRandom",UpdateRandomButon)
	
	
	selectedlist = EpicMusicPlayer:GetListByIndex(1)--EpicMusicPlayer:GetCurrentList()
	frame = CreateFrame("Frame","EpicMusicPlayer_PlaylistMain",UIParent)
	--frame.Update = Update
	
	frame:SetWidth(width)
	frame:SetHeight(height)
	frame.font = EpicMusicPlayer:GetFont(db.playlistfont)
	frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
		edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
		tile = true, tileSize = 16, edgeSize = 16, 
		insets = { left = 4, right = 4, top = 4, bottom = 4 }});
	frame:SetBackdropColor(0,0,0,1)
	frame:SetBackdropBorderColor(0.5,0.5,0.5,0.5)
	frame:SetScale(db.playlistScale)
	frame:SetPoint(db.playlistPoint,UIParent,db.playlistOffx,db.playlistOffy)
	--frame:SetPoint("Center")
	frame:EnableMouse(1)
	
	
	frame:SetMovable(true)
	frame:SetResizable(true)
	frame:RegisterForDrag("LeftButton");
    frame:SetMinResize(300,200)
	--frame:SetMaxResize(1000,800)
	
	frame:SetScript("OnDragStart", 
	    function(self)
			self:StartMoving()
			self.isMoving = true
		end
	)
	frame:SetScript("OnDragStop", 
	    function(self)
			local relative, relativePoint
			db.playlistPoint ,relative ,relativePoint,db.playlistOffx ,db.playlistOffy = self:GetPoint()
			self:StopMovingOrSizing()
			self.isMoving = false
		end
	)
	frame:SetClampedToScreen(1)
	tinsert(UISpecialFrames,frame:GetName());
	
	local sizer = CreateFrame("Frame","EmpDragsizer",frame)
	sizer:SetWidth(25)
	sizer:SetHeight(25)
	sizer:SetPoint("BOTTOMRIGHT",frame,"BOTTOMRIGHT",0,0)
	sizer:EnableMouse(1)
	
	sizer:SetMovable(true) 
	sizer:RegisterForDrag("LeftButton");
    
	sizer:SetScript("OnDragStart", function(self)
			frame:StartSizing()
			frame.isSizing = true
	end)
	sizer:SetScript("OnDragStop", function(self)
			frame:StopMovingOrSizing()
			frame.isSizing = false
			db.playlistWidth = frame:GetWidth()
			db.playlistHeight = frame:GetHeight() 
	end)
	
	local sizertx = sizer:CreateTexture(nil, "BACKGROUND")
	sizertx:SetWidth(12)
	sizertx:SetHeight(12)
	sizertx:SetPoint("BOTTOMRIGHT", -5, 5)
	sizertx:SetTexture("Interface\\AddOns\\EpicMusicPlayer\\media\\sizer.tga")

	seperator = CreateFrame("Frame","EmpDragSeperator",frame)
	seperator:SetWidth(4)
	seperator.posx = 120
	seperator:SetPoint("TOPLEFT", frame ,seperator.posx, -25)
	seperator:SetPoint("BOTTOM", frame ,"BOTTOM",seperator.posx, 27)
	
	--seperator:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background"});
	seperator:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
		edgeFile = nil, 
		tile = true, tileSize = 16, edgeSize = 16, 
		insets = { left = 1, right = 1, top = 4, bottom = 4 }});
	seperator:SetBackdropColor(1,1,1,0)
	--seperator:SetBackdropColor(0,1,0,0)
	--[[
	seperator:SetScript("OnEnter", function(self)
		self:SetBackdropColor(1,1,1,1)
	end)
	seperator:SetScript("OnLeave", function(self)
		if not self.moving then 
			self:SetBackdropColor(1,1,1,0)
		end
	end)
	
	--seperator:EnableMouse(1)
	--seperator:SetMovable(true) 
	seperator:SetScript("OnMouseDown", function(self)
		EpicMusicPlayer:Debug("OnMouseDown")
		self:SetScript("OnUpdate", OnDragUpdate)
		local x, y = GetCursorPosition();
		self.x = x
		self.moving = true
	end)
	seperator:SetScript("OnMouseUp", function(self)
		EpicMusicPlayer:Debug("OnMouseUp")
		self:SetScript("OnUpdate", nil)
		self.moving = false
		seperator:SetBackdropColor(1,1,1,0)
		local x, y = GetCursorPosition();
		x = seperator.x - x
		seperator.posx = seperator.posx-x
	end)
	--]]
	local header = CreateHeader(frame)
	header:SetHeight(16)
	header:SetPoint("TOPLEFT", frame ,9, -9)
	header:SetPoint("RIGHT", frame ,"RIGHT",-9, 9);
	
	songlist = EpicMusicPlayer:CreateListWidget("EpicMusicPlayer_Songlist",frame, #selectedlist-1, {0.08,0.9},
		function(row, colum) 
			local song = EpicMusicPlayer:GetSong(listslist.selectedIndex, row+1)
				if colum == 1 then
					return row
				else
					if song then 
						return "|cffffd200"..song.Artist.."|r - "..song.Song
					end
				end
			end,
		OnSongClick,nil, 
		OnSongLeave, frame.font)
	--songlist:SetPoint("TOPLEFT", frame ,120, -25)
	--songlist:SetPoint("BOTTOMRIGHT", frame ,-5, 27)
	songlist:SetPoint("TOPLEFT", seperator ,0, 0)
	songlist:SetPoint("BOTTOMRIGHT", frame ,-5, 27)
	
	listslist = EpicMusicPlayer:CreateListWidget("EpicMusicPlayer_Playlists",frame,#EpicMusicPlayer.playlists,nil,
		function(row, colum) return EpicMusicPlayer:GetListName(row) end,
		OnListClick, nil, nil, frame.font)
		
	listslist:SetPoint("TOPLEFT", frame ,5, -25)
	listslist:SetPoint("BOTTOMRIGHT", songlist, "BOTTOMLEFT" ,3, 0)
	listslist:SetSelected(1)
	
	local footer = CreateFooter(frame)
	footer:SetPoint("TOPLEFT", listslist ,"BOTTOMLEFT",4, 0)
	footer:SetPoint("BOTTOMRIGHT", frame,-9, 9);
	mainframe = frame
end

-- data changed
function EpicMusicPlayer:PlayListGuiUpdate(list)
	if list and listslist then --lists have changed
		listslist:SetMax(#EpicMusicPlayer.playlists)
		SelectList(1)
	elseif songlist then
		songlist:SetMax(#selectedlist-1)
	end
end

function EpicMusicPlayer:TogglePlayListGui()
	if not frame then 
		db = EpicMusicPlayer.db.profile
		CreatePlaylistGui(db.playlistWidth,db.playlistHeight)
	else
		if frame:IsShown() then
			frame:Hide()
		else
			frame:Show()
		end
	end
end

function EpicMusicPlayer:SetPlaylistScale(val)
	if frame then
		frame:SetScale(val)
	end
end
