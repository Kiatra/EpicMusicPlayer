local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")
local aceevent = LibStub("AceEvent-3.0")

local _G, CreateFrame = _G, CreateFrame
local delay, counter = 0.3, 0
local frame, mainframe, listslist, songlist, playbutton, randombutton, title, seperator
local selectedlist, selectedlistIndex

local function SetResizeBounds(self, x, y)
		self:SetMaxResize(x,y)
end

-- show/hide the left list with the playlists
local function ToggleLists()
	if EpicMusicPlayer.db.hideListsList then
		listslist:Hide()
		songlist:SetPoint("TOPLEFT", frame ,5, -25)
		songlist:SetPoint("BOTTOMRIGHT", frame ,-5, 27)
		frame:SetResizeBounds(150,50)
	else
		listslist:Show()
		songlist:SetPoint("TOPLEFT", frame ,150, -25)
		songlist:SetPoint("BOTTOMRIGHT", frame ,-5, 27)
		frame:SetResizeBounds(300,200)
	end
end

local function SelectList(listindex)
	--listslist.selectedIndex = listindex
	selectedlist = EpicMusicPlayer:GetListByIndex(listindex)
	selectedlistIndex = listindex
  EpicMusicPlayer.selectedlistIndex = selectedlistIndex

	listslist:SetSelected(listindex)
	songlist:SetMax(#selectedlist)
end

local function OnListClick(self, btn)
	if btn == "RightButton" then
		EpicMusicPlayer:OpenListMenu(self, self.listindex)
	else
		SelectList(self.listindex)
	end
end

local function OnSongClick(self,button)
	if (button == "LeftButton") then
		EpicMusicPlayer:PlaySong(listslist.selectedIndex, self.listindex)
	else
		EpicMusicPlayer:OpenSongMenu(self, listslist.selectedIndex, self.listindex)
	end
end

local function OnSongLeave(self)
	_G.GameTooltip:Hide()
end

local function UpdatePlayButon(playing)
	if(playing)then
			playbutton:SetNormalTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\stopButton.tga")
			playbutton:SetPushedTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\stopButton-p.tga")
		else
			playbutton:SetNormalTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\playButton.tga")
			playbutton:SetPushedTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\playButton-p.tga")
	end
end

local function UpdateRandomButon(event,val)
	if(val)then
			randombutton:SetNormalTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\randomButton.tga")
			randombutton:SetPushedTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\randomButton-p.tga")
		else
			randombutton:SetNormalTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\randomButtonOff.tga")
			randombutton:SetPushedTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\randomButtonOff-p.tga")
	end
end

local function round(num, idp)
	local mult = 10^(idp or 0)
	return _G.math.floor(num * mult + 0.5) / mult
end

local function OnDragUpdate(self, elapsed)
	counter = counter + elapsed
	if counter >= delay then
		local x, y = _G.GetCursorPosition();
			x = seperator.x - x
			local posx = round(seperator.posx-x, 0)
			seperator:SetPoint("TOPLEFT", frame ,posx, -25)
			seperator:SetPoint("BOTTOM", frame ,"BOTTOM",posx, 27)
	end
end

local function UpdatePlayStop(event, artist, songname, length)
	if(EpicMusicPlayer.Playing)then
		if listslist then
			listslist:Update()
			songlist:Update()
		end

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

local function addButton(parent, lastButton, func, name, point)
	local button = CreateFrame("Button", nil, parent)
	button:SetNormalTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\"..name..".tga")
	button:SetPushedTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\"..name.."-p.tga")
	button:SetHighlightTexture("Interface/QuestFrame/UI-QuestTitleHighlight")
	button:SetWidth(16)
	button:SetHeight(16)
	button:SetPoint("TOPLEFT", lastButton, "TOPRIGHT", 0,0)
	button:EnableMouse(true);
	button:SetScript("OnMouseUp", func)
	button:SetScript("OnEnter", function() EpicMusicPlayer:ShowButtonTooltip(button, name) end)
	button:SetScript("OnLeave", function() GameTooltip:Hide() end)
	return button
end

local function CreateHeader(parent)
	local db = EpicMusicPlayer.db
	local header = CreateFrame("Frame",nil,parent, BackdropTemplateMixin and "BackdropTemplate")
	header:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background"});
	header:SetBackdropColor(0.2,0.2,0.2,0.9)

	local lastbutton = addButton(header, header, function() EpicMusicPlayer:PlayLast() end, "lastButton")
	lastbutton:SetPoint("TOPLEFT", header, 0,0)
	playbutton = addButton(header, lastbutton, function(self)
		if EpicMusicPlayer.Playing then
			EpicMusicPlayer:Stop()
		else
			EpicMusicPlayer:Play()
		end
	end, "lastButton")

  local nextbutton = addButton(header, playbutton, function() EpicMusicPlayer:PlayNext() end, "nextButton")
	randombutton = addButton(header, nextbutton, function() EpicMusicPlayer:ToggleRandom() end, "randomButton")

	UpdatePlayButon(EpicMusicPlayer.Playing)
	UpdateRandomButon(nil, db.random)

	local mutebutton = addButton(header, randombutton, function(self, button) if button == "RightButton" then EpicMusicPlayer:ToggleMute() else EpicMusicPlayer:ShowConfig() end; end, "configButton")
  local listbutton = addButton(header, mutebutton, function() db.hideListsList = not db.hideListsList; ToggleLists() end, "listButton")
	local addButton1 = addButton(header, listbutton, function() EpicMusicPlayer:CreatePlayListDialog() end, "addButton")
	local importButton = addButton(header, addButton1, function() EpicMusicPlayer:ImportDialog() end, "importButton")

	local x = CreateFrame("Button",nil,parent,"UIPanelCloseButton")
	x:SetWidth(29)
	x:SetHeight(29)
	x:SetPoint("TOPRIGHT",header,7,6)

	title = header:CreateFontString()
	title:SetFont(EpicMusicPlayer:GetFont(db.playlistfont), 12)
	title:SetPoint("TOPLEFT", listbutton,"TOPRIGHT", 5,1)
	title:SetPoint("BOTTOMRIGHT", header, -25,0)
	title:SetShadowColor(0, 0, 0,0.8)
	title:SetShadowOffset(1, -1)
	parent.title = title
	local song = EpicMusicPlayer:GetCurrentSong()
	if song then
		UpdatePlayStop(nil, song.Artist, EpicMusicPlayer:GetCurrentSongName(),0)
	else
		UpdatePlayStop(nil, "", EpicMusicPlayer:GetCurrentSongName(), 0)
	end
	return header
end

function EpicMusicPlayer:ClearSearchFocus()
  mainframe.editbox:ClearFocus()
end

local function CreateFooter(parent)
	local footer = CreateFrame("Frame",nil,parent, BackdropTemplateMixin and "BackdropTemplate")
	footer:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background"});
	footer:SetBackdropColor(0.2,0.2,0.2,0.9)

	local editbox = CreateFrame("EditBox",nil,footer)
	--editbox:SetAllPoints(footer)
	editbox:SetPoint("TOPLEFT", footer, 3,0)
	editbox:SetPoint("BOTTOMRIGHT", footer, -3,0)

	editbox:SetAutoFocus(false)
	editbox:SetScript("OnEscapePressed",function(self)
		--parent:Hide()
		self:ClearFocus()
	end)
	editbox:SetFont(parent.font, 12, "")
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
  footer.editbox = editbox
	return footer
end

local function ToggleCheck(self, ...)
	local song = EpicMusicPlayer:GetSong(listslist.selectedIndex, self.listindex)
	if song then
		if song.isChecked then
			song.isChecked = false
			self.check:Hide()
		else
			song.isChecked = true
			self.check:Show()
		end
	end
end

local function CreatePlaylistGui(width, height)
	local db = EpicMusicPlayer.db
	aceevent:RegisterMessage("EMPUpdatePlay",UpdatePlayStop)
	aceevent:RegisterMessage("EMPUpdateStop",UpdatePlayStop)
	aceevent:RegisterMessage("EMPUpdateRandom",UpdateRandomButon)


	selectedlist = EpicMusicPlayer:GetListByIndex(1)--EpicMusicPlayer:GetCurrentList()
	frame = CreateFrame("Frame","EpicMusicPlayer_PlaylistMain",_G.UIParent, BackdropTemplateMixin and "BackdropTemplate")
	frame:SetFrameStrata(EpicMusicPlayer.db.liststrata)
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
	frame:SetPoint(db.playlistPoint,_G.UIParent,db.playlistOffx,db.playlistOffy)
	--frame:SetPoint("Center")
	frame:EnableMouse(1)


	frame:SetMovable(true)
	frame:SetResizable(true)
	frame:RegisterForDrag("LeftButton");
  
  if not frame.SetResizeBounds then --wow classic
  	frame.SetResizeBounds = SetResizeBounds
  end
  frame:SetResizeBounds(1000,800)
	
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
	_G.tinsert(_G.UISpecialFrames,frame:GetName());

	local sizer = CreateFrame("Frame","EmpDragsizer",frame, BackdropTemplateMixin and "BackdropTemplate")
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

	seperator = CreateFrame("Frame","EmpDragSeperator",frame, BackdropTemplateMixin and "BackdropTemplate")
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
		self:SetScript("OnUpdate", OnDragUpdate)
		local x, y = GetCursorPosition();
		self.x = x
		self.moving = true
	end)
	seperator:SetScript("OnMouseUp", function(self)
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

	songlist = EpicMusicPlayer:CreateListWidget("EpicMusicPlayer_Songlist",frame, #selectedlist, {0.6,0.3,0.09},
		function(row, colum)
			local song = EpicMusicPlayer:GetSong(listslist.selectedIndex, row)
				if song then
					local seperator = " - "
					if song.Artist and song.Artist == "" then seperator = "" end
					if db.list == selectedlistIndex and row == db.song then
						if colum == 1 then
							--return self.db.playlistHideArtist and "|cffd33800"..row.." "..song.Song or "|cffd33800"..row.." "..song.Artist..seperator..song.Song
							return db.playlistHideArtist and "|cffffd200"..row.." "..song.Song or "|cffffd200"..row.." "..song.Artist..seperator..song.Song
						elseif colum == 2 then
							return "|cffffd200"..song.Album
						else
							return "|cffffd200"..EpicMusicPlayer:GetTimeString(song.Length)
						end
					else
						if colum == 1 then
							return db.playlistHideArtist and row.." "..song.Song or row.." "..song.Artist..seperator..song.Song
						elseif colum == 2 then
							return song.Album
						elseif colum == 3 then
							return EpicMusicPlayer:GetTimeString(song.Length)
						end
					end
				end
			end,
		OnSongClick,nil,
		OnSongLeave, frame.font, ToggleCheck)
	--songlist:SetPoint("TOPLEFT", frame ,120, -25)
	--songlist:SetPoint("BOTTOMRIGHT", frame ,-5, 27)
	--songlist:SetPoint("TOPLEFT", seperator ,0, 0)
	--songlist:SetPoint("BOTTOMRIGHT", frame ,-5, 27)

	listslist = EpicMusicPlayer:CreateListWidget("EpicMusicPlayer_Playlists",frame,#EpicMusicPlayer.playlists,nil,
		function(row, colum)
			local db = EpicMusicPlayer.db
			listname = ""
			if db.list == row then
				listname = listname.."|cffffd200"..EpicMusicPlayer:GetListName(row)
			else
				if EpicMusicPlayer:IsListLocked(row) then
					listname =  listname.."|cffA9A9A9"..EpicMusicPlayer:GetListName(row)
				else
					listname =  listname..EpicMusicPlayer:GetListName(row)
				end
			end
			return listname
		end,
		OnListClick, nil, nil, frame.font)

	listslist:SetPoint("TOPLEFT", frame ,5, -25)
	listslist:SetPoint("BOTTOMRIGHT", songlist, "BOTTOMLEFT" ,3, 0)
	listslist:SetSelected(db.list)

	listslist:EnableMouse(1)
	listslist:SetScript("OnMouseUp",function(self,button)
		if button == "RightButton" then
			EpicMusicPlayer:OpenListMenu()
		end
	end)
	ToggleLists()

	local footer = CreateFooter(frame)
	footer:SetPoint("TOPLEFT", listslist ,"BOTTOMLEFT",4, 0)
	footer:SetPoint("BOTTOMRIGHT", frame,-9, 9);
  frame.editbox = footer.editbox

	mainframe = frame
end

-- data changed
function EpicMusicPlayer:PlayListGuiUpdate(list)
	if list and listslist then --lists have changed
		listslist:SetMax(#EpicMusicPlayer.playlists)
		SelectList(1)
	elseif songlist then
		songlist:SetMax(#selectedlist)
	end
end

function EpicMusicPlayer:PlayListGuiListUpdate()
	if listslist then
		listslist:Update()
	end
end

function EpicMusicPlayer:TogglePlayListGui()
	if not frame then
		db = EpicMusicPlayer.db
		CreatePlaylistGui(db.playlistWidth,db.playlistHeight)
		SelectList(db.list)
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
