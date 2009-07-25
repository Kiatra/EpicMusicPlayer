local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")
local aceevent = LibStub("AceEvent-3.0")

local delay = 0.1
local counter = 0
local frame
local selectedlist
local listslist, songlist, playbutton, randombutton,title
local db

-- show/hide the left list with the playlists
local function ToggleLists()
	if listslist:IsShown() then
		listslist:Hide()
		songlist:SetPoint("TOPLEFT", frame ,5, -25)
		songlist:SetPoint("BOTTOMRIGHT", frame ,-5, 27)
		frame:SetMinResize(150,50)
	else
		listslist:Show()
		songlist:SetPoint("TOPLEFT", frame ,110, -25)
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
	title:SetFont(GameFontNormal:GetFont())
	title:SetPoint("TOPLEFT", listbutton,"TOPRIGHT", 5,1)
	title:SetPoint("BOTTOMRIGHT", header, -25,0)
	title:SetShadowColor(0, 0, 0,0.8)
	title:SetShadowOffset(1, -1) 
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
	editbox:SetFont(EpicMusicPlayer:GetFont(),12)
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

local function GetUIParentAnchor(frame)
	local w, h, x, y = UIParent:GetWidth(), UIParent:GetHeight(), frame:GetCenter()
	local hhalf, vhalf = (x > w/2) and "RIGHT" or "LEFT", (y > h/2) and "TOP" or "BOTTOM"
	local dx = hhalf == "RIGHT" and math.floor(frame:GetRight() + 0.5) - w or math.floor(frame:GetLeft() + 0.5)
	local dy = vhalf == "TOP" and math.floor(frame:GetTop() + 0.5) - h or math.floor(frame:GetBottom() + 0.5)

	return vhalf..hhalf, dx, dy
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
	
	frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
		edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
		tile = true, tileSize = 16, edgeSize = 16, 
		insets = { left = 4, right = 4, top = 4, bottom = 4 }});
	frame:SetBackdropColor(0,0,0,1)
	frame:SetBackdropBorderColor(0.5,0.5,0.5,0.5)
	
	frame:SetPoint(db.playlistPoint,UIParent,db.playlistOffx,db.playlistOffy )
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
			EpicMusicPlayer:Debug(GetUIParentAnchor(self))
			db.playlistPoint,db.playlistOffx,db.playlistOffy = GetUIParentAnchor(self)
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
			self:SetScript("OnUpdate", OnDragUpdate)
			frame:StartSizing()
			frame.isSizing = true
	end)
	sizer:SetScript("OnDragStop", function(self)
			self:SetScript("OnUpdate", nil)
			frame:StopMovingOrSizing()
			frame.isSizing = false
			db.playlistWidth = frame:GetWidth()
			db.playlistHeight = frame:GetHeight() 
	end)
	
	local sizertx = sizer:CreateTexture(nil, "BACKGROUND")
	sizertx:SetWidth(12)
	sizertx:SetHeight(12)
	sizertx:SetPoint("BOTTOMRIGHT", -5, 5)
	sizertx:SetTexture("Interface\\AddOns\\EpicMusicPlayer\\sizer")

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
		OnSongLeave)
	songlist:SetPoint("TOPLEFT", frame ,110, -25)
	songlist:SetPoint("BOTTOMRIGHT", frame ,-5, 27)
	
	listslist = EpicMusicPlayer:CreateListWidget("EpicMusicPlayer_Playlists",frame,#EpicMusicPlayer.playlists,nil,
		function(row, colum) return EpicMusicPlayer:GetListName(row) end,
		OnListClick)
		
	listslist:SetPoint("TOPLEFT", frame ,5, -25)
	listslist:SetPoint("BOTTOMRIGHT", songlist, "BOTTOMLEFT" ,3, 0)
	listslist:SetSelected(1)
	
	local footer = CreateFooter(frame)
	footer:SetPoint("TOPLEFT", listslist ,"BOTTOMLEFT",4, 0)
	footer:SetPoint("BOTTOMRIGHT", frame,-9, 9);
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

