--Gui for EpicMusicPlayer  by yess

local guitext
local scrollframe
local scrollchild
local timeBarFrame
local timerframe
local timeBarFramewidth = 1
local timeBarFramestep = 0
local exchangecount = 0
local displaysong = true
local songlength
local currartist 
local currsongname
local textwidth = 0

local scrolltimer = nil
local scrolloffsetx = 0

local scrolllag = 0
local TimeSinceLastUpdate = 0

local volumechanged = false
local tooltip = nil
local hasartist = false;
local volumetextframe = nil;

local path
local list = nil

EpicMusicPlayerGui = LibStub("AceAddon-3.0"):NewAddon("EpicMusicPlayerGui", "AceEvent-3.0","AceTimer-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")
local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")


local function GetSkinsList()
--{FULLSCREEN_DIALOG="Fullscreen_Dialog",FULLSCREEN="Fullscreen", 
--								DIALOG="Dialog",HIGH="High",MEDIUM="Medium",LOW="Low",BACKGROUND="Background"},
	list = {}
	for k, v in pairs(EpicMusicPlayerGui.skins) do
		list[k] = v.name
	end
	return list
end

local function setButtonColor(info, r, g, b, a)
	EpicMusicPlayer.db.profile.buttoncolour.r = r
	EpicMusicPlayer.db.profile.buttoncolour.g = g
	EpicMusicPlayer.db.profile.buttoncolour.b = b
	EpicMusicPlayer.db.profile.buttoncolour.a = a
	--update gui
	EpicMusicPlayer.db.profile.useartistcolour = false
	EpicMusicPlayerGui:UpdateFrame(EpicMusicPlayer)
end

local function setBackColor(info, r, g, b, a)
	local c = EpicMusicPlayer.db.profile.backcolour
	c.r = r
	c.g = g
	c.b = b
	c.a = a
	--update gui
	if(EpicMusicPlayerGui)then
		EpicMusicPlayerGui:UpdateFrame(EpicMusicPlayer)
	end
end

local function setBorderColor(info, r, g, b, a)
	EpicMusicPlayer.db.profile.bordercolour.r = r
	EpicMusicPlayer.db.profile.bordercolour.g = g
	EpicMusicPlayer.db.profile.bordercolour.b = b
	EpicMusicPlayer.db.profile.bordercolour.a = a
	--update gui
	if(EpicMusicPlayerGui)then
		EpicMusicPlayerGui:UpdateFrame(EpicMusicPlayer)
	end
end

function EpicMusicPlayerGui:ChangeSettingsToSkin()
	self.cuurskin = self.skins[EpicMusicPlayer.db.profile.skin] or self.skins["default"]
	if(self.cuurskin.buttonColor)then
		local color = self.cuurskin.buttonColor
		setButtonColor(nil,color.r,color.g,color.b,color.a)
	end
	if(self.cuurskin.backColor)then
		local color = self.cuurskin.backColor
		setBackColor(nil,color.r,color.g,color.b,color.a)
	end
	if(self.cuurskin.borderColor)then
		local color = self.cuurskin.borderColor
		setBorderColor(nil,color.r,color.g,color.b,color.a)
	end
	
	if(self.cuurskin.artistColor)then
		local color = self.cuurskin.artistColor
		local c = EpicMusicPlayer.db.profile.artistcolour
		c.r, c.g ,c.b ,c.a = color.r,color.g,color.b,color.a
	end
	if(self.cuurskin.titleColor)then
		local color = self.cuurskin.titleColor
		local c = EpicMusicPlayer.db.profile.titlecolour
		c.r, c.g ,c.b ,c.a = color.r,color.g,color.b,color.a
	end
	self:UpdateFrame(EpicMusicPlayer)
end

local options={
	name=L["GUI"],
	order = 4,
	type="group",
	args={
		showgui = {
			type = "toggle",
			order = 1,
			name = L["Show GUI"],
			desc = L["Toggle show GUI"],
			get = function(name)
				return EpicMusicPlayer:IsPlayerGui()
			end,
				set = function(name)
				EpicMusicPlayer:TogglePlayerGui()
			end,
		},
		minimap = {
			type = "toggle",
			order = 2,
			name = L["Minimap Button"],
			desc = L["Toggle show minimap button"],
			get = function(name)
				return EpicMusicPlayer:IsMinimap()
			end,
			set = function(name)
				EpicMusicPlayer:ToggleMinimap()
			end,
		},
		scale = {
			type = 'range',
			order = 3,
			name = L["GUI Size"],
			desc = L["Adjust the size of the GUI"],
			step = 0.1,
			min = 0.1,
			max = 2,
			get = function() 
				return EMPGUI:GetScale()
			end,
			set =  function(info,val) 
				EpicMusicPlayer.db.char.guiscale = val
				EMPGUI:SetScale(val)
			end,
		},
		scrolltext = {
			type = "toggle",
			order = 4,
			name = L["Scroll GUI Text"],
			desc = L["Scroll GUI Text"],
			get = function(name)
				return EpicMusicPlayer:IsScrollGuiText()
			end,
			set = function(name)
				EpicMusicPlayer:ToggleScrollGuiText()
			end,
		},
		useartiscolour = {
			type = "toggle",
			order = 5,
			name = L["Use artist color"],
			desc = L["Use artist color as button color"],
			get = function(name)
				return EpicMusicPlayer.db.profile.useartistcolour
			end,
			set = function(name)
				EpicMusicPlayer.db.profile.useartistcolour = not EpicMusicPlayer.db.profile.useartistcolour
				if(EpicMusicPlayer.db.profile.useartistcolour)then
					EpicMusicPlayer.db.profile.buttoncolour.r = EpicMusicPlayer.db.profile.artistcolour.r
					EpicMusicPlayer.db.profile.buttoncolour.g = EpicMusicPlayer.db.profile.artistcolour.g
					EpicMusicPlayer.db.profile.buttoncolour.b = EpicMusicPlayer.db.profile.artistcolour.b
					EpicMusicPlayer.db.profile.buttoncolour.a = EpicMusicPlayer.db.profile.artistcolour.a
					EpicMusicPlayerGui:UpdateFrame(EpicMusicPlayer)
				end
			end,
		},
		buttoncolour = {
			type = "color",
			order = 6,
			name = L["Button color"],
			desc = L["Button color"],
			hasAlpha = true,
			get = function(info)
				local r = EpicMusicPlayer.db.profile.buttoncolour.r
				local g = EpicMusicPlayer.db.profile.buttoncolour.g
				local b = EpicMusicPlayer.db.profile.buttoncolour.b
				local a = EpicMusicPlayer.db.profile.buttoncolour.a
				return r, g, b, a
			end,
			set = setButtonColor,
		},
		backcolour = {
			type = "color",
			order = 7,
			name = L["Background color"],
			desc = L["Background color"],
			hasAlpha = true,
			get = function(info)
				local r = EpicMusicPlayer.db.profile.backcolour.r
				local g = EpicMusicPlayer.db.profile.backcolour.g
				local b = EpicMusicPlayer.db.profile.backcolour.b
				local a = EpicMusicPlayer.db.profile.backcolour.a
				return r, g, b, a
			end,
			set = setBackColor,
		},
		bordercolour = {
			type = "color",
			order = 8,
			name = L["Border color"],
			desc = L["Border color"],
			hasAlpha = true,
			get = function(info)
				local r = EpicMusicPlayer.db.profile.bordercolour.r
				local g = EpicMusicPlayer.db.profile.bordercolour.g
				local b = EpicMusicPlayer.db.profile.bordercolour.b
				local a = EpicMusicPlayer.db.profile.bordercolour.a
				return r, g, b, a
			end,
			set = setBorderColor,
		},
		strata = {
			type = 'select',
			values = {FULLSCREEN_DIALOG="Fullscreen_Dialog",FULLSCREEN="Fullscreen", 
						DIALOG="Dialog",HIGH="High",MEDIUM="Medium",LOW="Low",BACKGROUND="Background"},
			order = 9,
			name = L["Frame strata"],
			desc = L["Frame strata"],
			get = function() 
				return EpicMusicPlayer.db.profile.guistrata
			end,
			set = function(info, value)
				EpicMusicPlayer.db.profile.guistrata = value
				EpicMusicPlayerGui.frames.player:SetFrameStrata(value)
			end,
		},
		resetgui = {
			type = 'execute',
			order = 10,
			name = L["Reset GUI Position"],
			desc = L["Reset the GUI window position"],
			func = function() EMPGUI:ClearAllPoints();EMPGUI:SetPoint("CENTER")  end,
		},
		layout = {
			type = 'select',
			values = GetSkinsList,
			order = 9,
			name = L["Layout & Skin"],
			desc = L["Layout & Skin"],
			get = function() 
				return EpicMusicPlayer.db.profile.skin
			end,
			set = function(info, value)
				for k, v in pairs(EpicMusicPlayerGui.frames) do
					v:Hide()
				end
				EpicMusicPlayer.Debug("select",value)
				EpicMusicPlayer.db.profile.skin = value
				EpicMusicPlayerGui.frames.player:Hide()
				EpicMusicPlayerGui:ChangeSettingsToSkin()
				EpicMusicPlayerGui:CreateGuiFrame()
			end,
		},
	}
}
	
local function ScrollText(self, elapsed)
	TimeSinceLastUpdate = TimeSinceLastUpdate + elapsed
	if(TimeSinceLastUpdate>0.02)then
		TimeSinceLastUpdate = 0
		--postpone scrolling
		scrolllag = scrolllag +1
		if(scrolllag > 50)then
			if(not volumechanged)then	
				scrolloffsetx = scrolloffsetx +0.5
				--EpicMusicPlayer:Debug(self.frames.player:GetWidth())
				--self.frames.player:GetWidth()-10
				if(scrolloffsetx > guitext:GetStringWidth()/2)then
					--scrolloffsetx = -self.frames.player:GetWidth()-10
					scrolloffsetx = 0
				end
				scrollchild:SetPoint("TOPLEFT", scrollframe ,"TOPLEFT", -scrolloffsetx, 0)
			end
		end
	end
end

local function SetScrollText(text)
	if(scrollchild)then
		--if(EpicMusicPlayer.db.profile.gui.scroll)then
			scrolllag = 0
			scrolloffsetx = 0
			guitext:SetText(text)
			--only scroll if text does not fit the frame 
			if guitext:GetStringWidth() > textwidth then	
				guitext:SetText(text.." "..text)
				scrollchild:SetWidth(guitext:GetStringWidth())
				scrollframe:SetScript("OnUpdate", ScrollText)
			else
				scrollchild:SetWidth(guitext:GetStringWidth())
				scrollframe:SetScript("OnUpdate", nil)
			end
		--else
			--guitext:SetText(songname)
			--scrollchild:SetWidth(guitext:GetStringWidth())
		--end
		scrollchild:ClearAllPoints()
		scrollchild:SetPoint("TOPLEFT", scrollframe ,"TOPLEFT", 0, 0)
	end
end

local function exchangeText(self, elapsed)
	TimeSinceLastUpdate = TimeSinceLastUpdate + elapsed
	if(TimeSinceLastUpdate>3)then
		TimeSinceLastUpdate = 0
		if(not volumechanged)then
			if(hasartist)then
				if(displaysong)then
					guitext:SetText(currsongname)
				else
					guitext:SetText(currartist)
				end
				displaysong = not displaysong	
			end
		end
	end
end

function EpicMusicPlayerGui:OnInitialize()
	if(EMPGUI == nil)then
		self:CreateGuiFrame()
	end
	
	if(EpicMusicPlayer.db.profile.minimapbutton)then
		EpicMusicPlayerGui:CreateMinimapButton()
	end

	self:RegisterMessage("EMPUpdateStop")
	self:RegisterMessage("EMPUpdatePlay")
	self:RegisterMessage("EMPUpdateTime")
	self:RegisterMessage("EMPUpdateVolume")
	self:RegisterMessage("EMPUpdateRandom")
	EpicMusicPlayer:AddOptions("gui",options)
end

function EpicMusicPlayerGui:OnEnable(first)	
	if(EMPGUI == nil)then
		self:CreateGuiFrame()
	end
	self:RegisterMessage("EMPUpdateStop")
	self:RegisterMessage("EMPUpdatePlay")
	self:RegisterMessage("EMPUpdateTime")
	self:RegisterMessage("EMPUpdateRandom")
	
	self:SendMessage("EMPGuiLoaded")
	
end

function EpicMusicPlayerGui:OnDisable()
    self.frames.player:Hide();
	EMPGUI = nil
	self:UnregisterAllEvents("EpicMusicPlayerGui")
end

function EpicMusicPlayerGui:ToggleMinimap()
	if(EpicMusicPlayerMiniButton)then
		if(EpicMusicPlayerMiniButton:IsVisible())then
			EpicMusicPlayerMiniButton:Hide()
		else
			EpicMusicPlayerMiniButton:Show()
		end
	else
		self:CreateMinimapButton()
	end
end

-----------------------------------------------------------------------------------------------------------------------------
-- Update functions 
------------------------------------------------------------------------------------------------------------------------------
function EpicMusicPlayerGui:EMPUpdateTime(event, seconds)
	if(timeBarFrame)then
		timeBarFramewidth = timeBarFramewidth + timeBarFramestep
		exchangecount = exchangecount +1
		timeBarFrame:SetWidth(timeBarFramewidth)
	end
	if timerframe and seconds then
		timerframe.text:SetText(EpicMusicPlayer:GetTimeSTring(songlength-seconds))
	end
end

function EpicMusicPlayerGui:EMPUpdateVolume(event, voltype, vol)	
	if(voltype == "music")then
		volumechanged = true
		SetScrollText(L["Music volume: "]..math.floor((vol*100)).."%")
	elseif(voltype == "sound")then
		volumechanged = true
		SetScrollText(L["Effects vol.: "]..math.floor((vol*100)).."%")
	elseif(voltype == "done")then
		volumechanged = false
		if scrollchild then
			scrollchild:SetPoint("TOPLEFT", scrollframe ,"TOPLEFT", -scrolloffsetx, 0)
			if(playing)then
				--SetScrollText(currsongname..currartist)
				if(EpicMusicPlayer.db.profile.gui.scroll)then
					SetScrollText(currsongname..currartist)
				else
					if(guitext)then
						--scrollchild:ClearAllPoints()
						scrollchild:SetAllPoints(scrollframe)
						guitext:SetText(currsongname)
						scrollframe:SetScript("OnUpdate", exchangeText)
					end
				end
				self:EMPUpdateTime()
			else
				self:EMPUpdateStop(nil, "", currsongname, 0)
				--guitext:SetText(songname)
				--SetScrollText(currsongname..currartist)
			end
		end
	end
end

function EpicMusicPlayerGui:SetNextModel()
	if(EpicMusicDancer)then
		--for i=1,63  do PlaySoundFile("Sound\\interface\\levelup2.wav") end
		EpicMusicDancer:SetNextModel()
    end
end

function EpicMusicPlayerGui:ToggleDancer()
	if(EpicMusicDancer)then
		EpicMusicDancer:ToggleShow()
	end
end

function EpicMusicPlayerGui:SetLastModel()
	if(EpicMusicDancer)then
		EpicMusicDancer:SetNextModel()
    end
end

function EpicMusicPlayerGui:TogglePlay()
	EpicMusicPlayer:TogglePlay(EpicMusicPlayer)
end
	
function EpicMusicPlayerGui:EMPUpdatePlay(event, artist, songname, length)
	playing = true;
	 
	-- update textframe
	songlength = length
	currsongname = songname
	if(artist=="")then
		hasartist = false
	else
		hasartist = true
	end
	currartist = "|c"..EpicMusicPlayer:ToHex(EpicMusicPlayer.db.profile.artistcolour).." -"..artist.."-".."|r"
	displaysong = false
	exchangecount = 4
	
	if(EpicMusicPlayer.db.profile.gui.scroll)then
		SetScrollText(currsongname..currartist)
	else
		if(guitext)then
			--scrollchild:ClearAllPoints()
			scrollchild:SetAllPoints(scrollframe)
			guitext:SetText(currsongname)
			scrollframe:SetScript("OnUpdate", exchangeText)
		end
	end
	
	
	if(timeBarFrame and self.cuurskin.timebar)then
		timeBarFramewidth = 1
		timeBarFrame:Show()
		timeBarFrame:SetWidth(timeBarFramewidth)
		timeBarFramestep = (self.frames.player:GetWidth()-20) / songlength 
	end
	if timerframe then
		timerframe.text:SetText(EpicMusicPlayer:GetTimeSTring(songlength))
	end
	
	if(self.frames.play)then
		local settings = self.cuurskin.play
		self.frames.play:SetNormalTexture(path..settings.normaltexture2)
		self.frames.play:SetPushedTexture(path..settings.pushedtexture2)
	end
	if(tooltip) then
		self:ShowTooltip(tooltip)
	end
end

function EpicMusicPlayerGui:EMPUpdateStop(event, artist, songname, length)
	currsongname = songname
	if(scrollframe)then
		scrollframe:SetScript("OnUpdate", nil)
		guitext:SetText(songname)
		scrolloffsetx = 0
		--guitext:SetWidth(self.frames.player:GetWidth()-20)
		--scrollchild:SetWidth(guitext:GetStringWidth())
		scrollchild:SetAllPoints(scrollframe)
		--scrollchild:SetPoint("TOPLEFT", scrollframe ,"TOPRIGHT", 0, 0)
		--scrollchild:SetPoint("TOPLEFT", scrollframe ,"TOPLEFT", 0, 0)
		--guitext:SetJustifyH("CENTER", 0, 0)
	end
	if(timeBarFrame)then
		timeBarFrame:Hide()
		timeBarFramestep = 0
	end
	playing = false;
	
	if(self.frames.play)then
		local settings = self.cuurskin.play
		self.frames.play:SetNormalTexture(path..settings.normaltexture)
		self.frames.play:SetPushedTexture(path..settings.pushedtexture)
	end
	if timerframe then
		timerframe.text:SetText("")
	end
	
	if(tooltip) then
		self:ShowTooltip(tooltip)
	end
end

function EpicMusicPlayerGui:EMPUpdateRandom(event, val)
	local button = self.frames.random
	local settings = self.cuurskin.random
	if button then
		if val then	
			button:SetNormalTexture(path..settings.normaltexture)
			button:SetPushedTexture(path..settings.pushedtexture)
		elseif settings.normaltexture2 and settings.pushedtexture2 then
			--EpicMusicPlayer:Debug("toggle random off")
			button:SetNormalTexture(path..settings.normaltexture2)
			button:SetPushedTexture(path..settings.pushedtexture2)
		end
	end
end

function EpicMusicPlayerGui:Toggle()
	if(EMPGUI)then
		if(EMPGUI:IsShown()) then
			EMPGUI:Hide()
			if(EpicMusicDancer)then
				if(EpicMusicDancer:IsGuiToggle())then
					EpicMusicDancer:Hide()
				end
			end
	    else
	        EMPGUI:Show()
			if(EpicMusicDancer)then
				if(EpicMusicDancer:IsGuiToggle())then
					EpicMusicDancer:Show()
				end
			end
	    end
	end
end


-- called only on settings changes
function EpicMusicPlayerGui:UpdateFrame(emp)
	local self = EpicMusicPlayerGui
	local profile = emp.db.profile
	local c = profile.buttoncolour
	
	for k, v in pairs(self.frames) do
		if v:IsObjectType("Button") then
			v:SetBackdropColor(c.r,c.g,c.b,c.a)
		end
	end
	
	currartist = "|c"..EpicMusicPlayer:ToHex(EpicMusicPlayer.db.profile.artistcolour).." -"..EpicMusicPlayer:GetCurrentArtstName().."-".."|r"
	if(guitext)then
		c = profile.titlecolour
		guitext:SetTextColor(c.r,c.g,c.b,c.a)
		local font = emp:GetFont()
		guitext:SetFont(font, emp.db.profile.guifontsize)
		guitext:SetText(text)
	end

	if(EpicMusicPlayer.db.profile.gui.scroll and currsongname)then
		SetScrollText(currsongname..currartist)
	else
		if(guitext)then
			guitext:SetText(currsongname)
		end
	end
	
	--currartist = "|c"..EpicMusicPlayer:ToHex(profile.artistcolour)  --..emp:GetCurrentArtistName()
	
	if(timeBarFrame)then
		c = profile.buttoncolour
		timeBarFrame.timebar:SetTexture(c.r,c.g,c.b,c.a)
	end
	
	c = profile.backcolour
	self.frames.player:SetBackdropColor(c.r,c.g,c.b,c.a)
	c = profile.bordercolour
	self.frames.player:SetBackdropBorderColor(c.r,c.g,c.b,c.a)
	
	if timerframe then
		c = profile.titlecolour
		timerframe.text:SetTextColor(c.r,c.g,c.b,c.a)
	end
end


local offset=0
------------------------------------------------------------------------------------------------------------------------------
-- Create gui frame
------------------------------------------------------------------------------------------------------------------------------

local function newControl(settings, frame)
	
	local frametype = settings.type or "Frame" 
	local align = settings.align or "TOPLEFT"
	local width = settings.width or 0
	local height = settings.height or 0
	local offx = settings.offx or 0
	local offy = settings.offy or 0
	local backgroundtexture = settings.backgroundtexture
	
	local frame = frame or CreateFrame(frametype,nil,EMPGUI)
	frame:SetWidth(width)
	frame:SetHeight(height)
	frame:SetPoint(align,offx,offy)
	frame:Show()
	
	if settings.onleftclick then
		frame:EnableMouse(true); 
		frame:SetScript("OnMouseUp", 
				function(self, button)
					if(button == "LeftButton")then
						settings.onleftclick()
					else
						if settings.onrightclick then
							settings.onrightclick()
						end
					end
				end
		)
	end
	
	if frametype == "Button" then
		frame:SetNormalTexture(path..settings.normaltexture)
		frame:SetPushedTexture(path..settings.pushedtexture)
	end
	--frame:SetPushedTexture(settings.pushedtexture)
	if backgroundtexture then
		frame:SetBackdrop({bgFile = path..backgroundtexture})
	end
	
	return frame
end

local skin = {}
function EpicMusicPlayerGui:CreateGuiFrame()
		
	self.cuurskin = self.skins[EpicMusicPlayer.db.profile.skin] or self.skins["cataclysm"]
	
	--[[
	-- needs fix
	if self.cuurskin.inherit then
		local childskin = self.cuurskin
		self.cuurskin = self.skins[self.cuurskin.inherit] --set the current skin to the parent skin
		
		-- overwrite the parent with the child values
		for key, value in pairs(childskin) do
			--EpicMusicPlayer.Debug(type(value))
			if type(value) == "table" then
				for k, v in pairs(value) do
					EpicMusicPlayer.Debug(self.cuurskin[key][k],"=", v,"key=",key,"k=",k)
					self.cuurskin[key][k] = v
				end
			else
				self.cuurskin[key] = value
			end
		end
	end
	--]]
	
	path = self.cuurskin.texturepath
	
	self.frames = self.frames or {}
	--self.frames.buttonback = {}
	--self.frames.buttons = {}

	----- create gui frame --------------------------------------------------------------
	self.frames.player = self.frames.player or CreateFrame("Frame","EMPGUI",UIParent)
	self.frames.player:SetWidth(self.cuurskin.guiframe.width)
	self.frames.player:SetHeight(self.cuurskin.guiframe.height)
	--/run EMPGUI:ClearAllPoints();EMPGUI:SetPoint("CENTER")

	--frame background
	--self.frames.player:SetFrameLevel(2)
	local bgtextrue =  self.cuurskin.bgtextrue or {bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
		edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
		tile = false, tileSize = 16, edgeSize = 16, 
		insets = { left = 4, right = 4, top = 4, bottom = 4 }}
		--insets = { left = 1, right = 1, top = 1, bottom = 1 }});
	
	self.frames.player:SetBackdrop(bgtextrue)
	self.frames.player:SetPoint("CENTER",0,0)
	self.frames.player:Show()
	self.frames.player:EnableMouse(true)
	self.frames.player:SetMovable(true) 
	self.frames.player:RegisterForDrag("LeftButton");
    
	self.frames.player:SetFrameStrata(EpicMusicPlayer.db.profile.guistrata)
	self.frames.player:SetScript("OnDragStart", 
	    function(self)
			self:StartMoving()
			self.isMoving = true
		end
	)
	self.frames.player:SetScript("OnDragStop", 
	    function(self)
			self:StopMovingOrSizing()
			self.isMoving = false
		end
	)
	self.frames.player:EnableMouseWheel(1) 
	self.frames.player:SetScript("OnMouseWheel", 
		function(self,vector)
			EpicMusicPlayer:DisplyScrollHandler(vector)
		end
    )
	
	
	------------------- create frames according to current skin ---------------------------
	for k, v in pairs(self.cuurskin) do
		if k ~= "guiframe" then
			--EpicMusicPlayer:Debug("creating frame:",k)
			self.frames[k] = newControl(v, self.frames[k])
		end
	end
	
	------------------- adjust known frames if present -----------------------------------
	if(self.cuurskin.timebar) then
		if not timeBarFrame then
			timeBarFrame = CreateFrame("Frame",nil,EMPGUI)
			timeBarFrame.timebar = timeBarFrame:CreateTexture()
		end
		
		--timeBarFrame:SetAllPoints(self.frames.player)
		timeBarFrame.timebar:SetAllPoints(timeBarFrame)
		--timeBarFrame.timebar:SetTexture(0.6,0.2,0.8,0.8)
		timeBarFrame.timebar:SetTexture(EpicMusicPlayer.db.profile.artistcolour.r,
								EpicMusicPlayer.db.profile.artistcolour.g,
								EpicMusicPlayer.db.profile.artistcolour.b,
								EpicMusicPlayer.db.profile.artistcolour.a)
		timeBarFrame:SetWidth(0)
		timeBarFrame:SetHeight(self.cuurskin.timebar.height)
		timeBarFrame:SetPoint("BOTTOMLEFT",8,6)
	elseif timeBarFrame then
		timeBarFrame:Hide()
	end
	
	
	if(self.cuurskin.timer)then
		local settings = self.cuurskin.timer
		if not timerframe then
			timerframe = CreateFrame("Frame",nil,EMPGUI)
			timerframe:SetWidth(settings.width)
			timerframe:SetHeight(settings.height)
			timerframe.text = timerframe:CreateFontString()
		end
		timerframe.text:SetFont(GameFontNormal:GetFont())
		timerframe.text:SetShadowColor(0, 0, 0,1)
		timerframe.text:SetShadowOffset(1, -1) 
		timerframe:SetPoint(settings.align or "TOPLEFT",settings.offx or 0,settings.offy or 0)
		timerframe.text:SetAllPoints(timerframe)
		timerframe.text:SetText("00:00")
		timerframe:EnableMouseWheel(1)
		timerframe:Show()
		timerframe.text:Show()
	else
		if timerframe then
			timerframe:Hide()
		end
	end
	
	--------------------------
	
	if(self.cuurskin.text)then
		local settings = self.cuurskin.text
		local textframe = self.frames.text
		
		scrollframe = scrollframe or CreateFrame("ScrollFrame","EMPScroll",EMPGUI)
		scrollframe:SetWidth(settings.width)
		textwidth = settings.width
		scrollframe:SetHeight(settings.height)
		--scrollframe:SetPoint("CENTER",0,0)
		scrollframe:SetPoint(settings.align or "TOPLEFT",settings.offx or 0,settings.offy or 0)
		--scrollframe:SetAllPoints(self.frames.text)
		--scrollframe:SetPoint(text.align,text.offx,text.offy)
		scrollframe:Show()
		
		--scrollchild = CreateFrame("Frame","EMPScrollText",EMPScroll)
		scrollchild = textframe
		--[[
		scrollchild:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
		                                        edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
		                                        tile = true, tileSize = 16, edgeSize = 16, 
		                                        insets = { left = 4, right = 4, top = 4, bottom = 4 }});
		--]]
		
		--scrollchild:SetWidth(self.frames.player:GetWidth()-20)
		scrollchild:SetWidth(settings.width)
		scrollchild:SetHeight(settings.height)
		scrollchild:SetAllPoints(scrollframe)
		scrollchild:Show()
		
		
		guitext = guitext or scrollchild:CreateFontString()
		--local fontSize = 12
		guitext:SetFont(GameFontNormal:GetFont())
		guitext:SetAllPoints(scrollchild)
		guitext:SetShadowColor(0, 0, 0,0.8)
		guitext:SetShadowOffset(1, -1) 
		--text:SetPoint("TOPLEFT", s ,"TOPLEFT", -10, 0)
		--s:SetJustifyH("LEFT");
		--guitext:SetText("                              ")
		--guitext:SetHeight(20)
		--guitext:SetWidth(self.frames.player:GetWidth()-20)
		scrollchild:SetWidth(guitext:GetStringWidth())
		scrollframe:SetScrollChild(scrollchild)
		
		scrollframe:EnableMouseWheel(1) 
		scrollframe:SetScript("OnMouseWheel", 
			function(self,vector)
				EpicMusicPlayer:DisplyScrollHandler(vector)
			end
	    )
		scrollframe:EnableMouse(1) 
		scrollframe:SetScript("OnMouseUp", 
			function(self,btn)
				EpicMusicPlayer:OnDisplayClick(self, btn)
			end
	    )
		
		scrollframe:EnableMouse(true)
		scrollframe:SetMovable(true) 
		scrollframe:RegisterForDrag("LeftButton");
		scrollframe:SetScript("OnDragStart", 
	    function()
			self.frames.player:StartMoving()
			self.frames.player.isMoving = true
		end
		)
		scrollframe:SetScript("OnDragStop", 
			function()
				self.frames.player:StopMovingOrSizing()
				self.frames.player.isMoving = false
			end
		)
		
		
		volumetextframe = volumetextframe or CreateFrame("ScrollFrame","EMPVolumeText",EMPGUI)
		volumetextframe:SetAllPoints(scrollframe)
		volumetextframe:Hide()
		volumetextframe.text = volumetextframe:CreateFontString()
		volumetextframe.text:SetFont(GameFontNormal:GetFont())
		volumetextframe.text:SetShadowColor(0, 0, 0,0.8)
		volumetextframe.text:SetShadowOffset(1, -1) 
		
		volumetextframe:EnableMouseWheel(1) 
		volumetextframe:SetScript("OnMouseWheel", 
			function()
				EpicMusicPlayer:DisplyScrollHandler()			
			end
	    )
	end
	
			
	----------------------------------------------------------------------------------------------------
	self:UpdateFrame(EpicMusicPlayer)
	
	EpicMusicPlayerGui:EMPUpdateRandom(nil, EpicMusicPlayer.db.profile.random)
	if(EpicMusicPlayer.db.char.guiscale)then
		EMPGUI:SetScale(EpicMusicPlayer.db.char.guiscale)
	end
end

function EpicMusicPlayerGui:CreateMinimapButton()
	minibutton = CreateFrame("Button","EpicMusicPlayerMiniButton",Minimap)
	minibutton:SetWidth(32)
	minibutton:SetHeight(32)
	minibutton:SetFrameStrata("LOW")
	minibutton:SetPoint("TOP", "Minimap", "LEFT", -8, 0);
	
	minibutton:SetNormalTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-minimap.tga")
	minibutton:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
	minibutton:SetPushedTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\emp-minimap-p.tga")
	
	--minibutton:RegisterForClicks("LeftButtonUp","RightButtonUp","MiddleButtonUp")
	minibutton:RegisterForClicks("AnyUp")
	
	minibutton:SetScript("OnClick", 
	    function(self, btn)
			EpicMusicPlayer:OnDisplayClick(self, btn)
		end
	)
	
	minibutton:Show()
	minibutton:EnableMouse(true)
	minibutton:SetMovable(true) 
	minibutton:RegisterForDrag("RightButton");
	
	minibutton:SetScript("OnDragStart", 
	    function(self)
			self:StartMoving()
			self.isMoving = true
		end
	)
	minibutton:SetScript("OnDragStop", 
	    function(self)
			self:StopMovingOrSizing()
			self.isMoving = false
		end
	)
	
	minibutton:SetScript("OnEnter", 
	    function(self)
			EpicMusicPlayer:ShowTooltip(self)		
		end
	)
	
	minibutton:SetScript("OnLeave", 
	    function()
			EpicMusicPlayer:HideTooltip();
		end
	)
	
	minibutton:EnableMouseWheel(true) 
	minibutton:SetScript("OnMouseWheel", 
		function(self, vector)
			EpicMusicPlayer:DisplyScrollHandler(vector)
		end
    )
end