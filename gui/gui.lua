--Gui for EpicMusicPlayer  by yess

local guitext
local scrollframe
local scrollchild
local timeframe
local timeframewidth = 1
local timeframestep = 0
local exchangecount = 0
local displaysong = true
local songlength
local currartist 
local currsongname

local scrolltimer = nil
local scrolloffsetx = 0
local scrolllag = 0
local TimeSinceLastUpdate = 0

local volumechanged = false
local tooltip = nil
local hasartist = false;

EpicMusicPlayerGui = LibStub("AceAddon-3.0"):NewAddon("EpicMusicPlayerGui", "AceEvent-3.0","AceTimer-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")

local options={
			name=L["Gui"],
			order = 4,
			type="group",
			args={
				showgui = {
			           type = "toggle",
			           order = 1,
					   name = L["Show Gui"],
			           desc = L["Toggle show gui"],
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
					name = L["Gui Size"],
		            desc = L["Adjust the size of the gui"],
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
				useartiscolour = {
			           type = "toggle",
			           order = 4,
					   name = L["Use artist colour"],
			           desc = L["Use artist colour as button colour"],
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
							order = 5,
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
							set = function(info, r, g, b, a)
								EpicMusicPlayer.db.profile.buttoncolour.r = r
								EpicMusicPlayer.db.profile.buttoncolour.g = g
								EpicMusicPlayer.db.profile.buttoncolour.b = b
								EpicMusicPlayer.db.profile.buttoncolour.a = a
								--update gui
								EpicMusicPlayer.db.profile.useartistcolour = false
								EpicMusicPlayerGui:UpdateFrame(EpicMusicPlayer)
							end
						},
				backcolour = {
							type = "color",
							order = 6,
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
							set = function(info, r, g, b, a)
								EpicMusicPlayer.db.profile.backcolour.r = r
								EpicMusicPlayer.db.profile.backcolour.g = g
								EpicMusicPlayer.db.profile.backcolour.b = b
								EpicMusicPlayer.db.profile.backcolour.a = a
								--update gui
								if(EpicMusicPlayerGui)then
									EpicMusicPlayerGui:UpdateFrame(EpicMusicPlayer)
								end
							end
						},
				bordercolour = {
							type = "color",
							order = 7,
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
							set = function(info, r, g, b, a)
								EpicMusicPlayer.db.profile.bordercolour.r = r
								EpicMusicPlayer.db.profile.bordercolour.g = g
								EpicMusicPlayer.db.profile.bordercolour.b = b
								EpicMusicPlayer.db.profile.bordercolour.a = a
								--update gui
								if(EpicMusicPlayerGui)then
									EpicMusicPlayerGui:UpdateFrame(EpicMusicPlayer)
								end
							end
						},
				strata = {
					type = 'select',
					values = {FULLSCREEN_DIALOG="Fullscreen_Dialog",FULLSCREEN="Fullscreen", 
								DIALOG="Dialog",HIGH="High",MEDIUM="Medium",LOW="Low",BACKGROUND="Background"},
					order = 7,
					name = L["Frame strata"],
					desc = L["Frame strata"],
					get = function() 
						return EpicMusicPlayer.db.profile.guistrata
					end,
					set = function(info, value)
						EpicMusicPlayer.db.profile.guistrata = value
						EpicMusicPlaye.frames.player:SetFrameStrata(value)
					end,
				},
			}
	}

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
function EpicMusicPlayerGui:EMPUpdateTime(event)
	
	if(timeframe)then
		timeframewidth = timeframewidth + timeframestep
		exchangecount = exchangecount +1
		timeframe:SetWidth(timeframewidth)
	end
	
	if(guitext)then
		if(not volumechanged)then
			if(exchangecount > 3) then
				if(not EpicMusicPlayer.db.profile.gui.scroll)then
					if(hasartist)then
						if(displaysong)then
							guitext:SetText(currsongname)
						else
							guitext:SetText(currartist)
						end
						displaysong = not displaysong
						exchangecount = 0
					end
				end
			end
		end
	end
end

function EpicMusicPlayerGui:EMPUpdateVolume(event, voltype, vol)	
	if(voltype == "music")then
		volumechanged = true
		guitext:SetText(L["Music volume: "]..math.floor((vol*100)).."%")
	elseif(voltype == "sound")then
		volumechanged = true
		guitext:SetText(L["Effects vol.: "]..math.floor((vol*100)).."%")
	elseif(voltype == "done")then
		volumechanged = false
		if(playing)then
			self:EMPUpdateTime()
		else
			self:EMPUpdateStop()
		end
	end
end

function EpicMusicPlayerGui:SetNextModel()
	if(EpicMusicDancer)then
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
	currartist = "|c"..EpicMusicPlayer.db.profile.artistcolour.hex.."-"..artist.."-".."|r"
	displaysong = true
	exchangecount = 0
	
	if(scrollchild)then
		if(EpicMusicPlayer.db.profile.gui.scroll)then
			scrolllag = 0
			scrolloffsetx = 0
			guitext:SetText(currartist.." "..songname)
			--only scroll if text does not fit the frame 
			EpicMusicPlayer:Debug(guitext:GetWidth(),self.frames.player:GetWidth())
			if(guitext:GetStringWidth() > (self.frames.player:GetWidth()-20))then
				
				guitext:SetText(currartist.." "..songname.." "..currartist.." "..songname)
				scrollchild:SetWidth(guitext:GetStringWidth())
				scrollframe:SetScript("OnUpdate", self.ScrollText)
			else
				scrollchild:SetWidth(guitext:GetStringWidth())
				scrollframe:SetScript("OnUpdate", nil)
			end
			
		else
			guitext:SetText(songname)
			scrollchild:SetWidth(guitext:GetStringWidth())
		end
		scrollchild:SetPoint("TOPLEFT", scrollframe ,"TOPLEFT", 0, 0)
	end
	
	if(timeframe)then
		timeframewidth = 1
		timeframe:Show()
		timeframe:SetWidth(timeframewidth)
		timeframestep = (self.frames.player:GetWidth()-20) / songlength 
	end
	
	if(self.frames.buttons.play)then
		self.frames.buttons.play:SetNormalTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-stop.tga")
		self.frames.buttons.play:SetPushedTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-stop-p.tga")
	end
	if(tooltip) then
		self:ShowTooltip(tooltip)
	end
end

function EpicMusicPlayerGui:EMPUpdateStop(event)
	if(scrollframe)then
		scrollframe:SetScript("OnUpdate", nil)
		guitext:SetText(L["Stopped"])
		scrolloffsetx = 0
		guitext:SetWidth(self.frames.player:GetWidth()-20)
		scrollchild:SetPoint("TOPLEFT", scrollframe ,"TOPLEFT", -scrolloffsetx, 0)
		guitext:SetJustifyH("LEFT", 0, 0)
	end
	if(timeframe)then
		timeframe:Hide()
		timeframestep = 0
	end
	playing = false;
	
	if(self.frames.buttons.play)then
		self.frames.buttons.play:SetNormalTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-play.tga")
		self.frames.buttons.play:SetPushedTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-play-p.tga")
	end
	
	if(tooltip) then
		self:ShowTooltip(tooltip)
	end
end

function EpicMusicPlayerGui:EMPUpdateRandom(event, val)
	if(self.frames.buttons.random)then
		if(val)then
			self.frames.buttons.random:SetNormalTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-randomon.tga")
			self.frames.buttons.random:SetPushedTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-randomon-p.tga")
		else
			self.frames.buttons.random:SetNormalTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-randomoff.tga")
			self.frames.buttons.random:SetPushedTexture("Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\emp-randomoff-p.tga")
		end
	end
end

function EpicMusicPlayerGui:ScrollText()
	TimeSinceLastUpdate = TimeSinceLastUpdate + arg1
	if(TimeSinceLastUpdate>0.03)then
		TimeSinceLastUpdate = 0
		--postpone scrolling
		scrolllag = scrolllag +1
		if(scrolllag > 50)then
			scrolloffsetx = scrolloffsetx +.5
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



function EpicMusicPlayerGui:UpdateFrame(emp)
	local self = EpicMusicPlayerGui
	for k, v in pairs(self.frames.buttonback) do
		--EpicMusicPlayer:Debug("updating button background:",k)
		v:SetBackdropColor(emp.db.profile.buttoncolour.r,
							emp.db.profile.buttoncolour.g,
							emp.db.profile.buttoncolour.b,
							emp.db.profile.buttoncolour.a)
	end
	
	if(guitext)then
		guitext:SetTextColor(emp.db.profile.titlecolour.r,
								emp.db.profile.titlecolour.g,
								emp.db.profile.titlecolour.b,
								emp.db.profile.titlecolour.a)
		local font = emp:GetFont()
		
		if(font=="default")then
			guitext:SetFont(GameFontNormal:GetFont())
		else
			--emp:Debug("Interface\\AddOns\\EpicMusicPlayer\\fonts\\"..emp.db.profile.font..".ttf")
			guitext:SetFont(font, emp.db.profile.guifontsize)
		end
	end
	currartist = "|c"..EpicMusicPlayer.db.profile.artistcolour.hex..emp:GetCurrentArtistName()
	--guitext:SetText(EpicMusicPlayer:GetCurrentSongName())
	
	if(timeframe.timebar)then
		timeframe.timebar:SetTexture(emp.db.profile.buttoncolour.r,
							emp.db.profile.buttoncolour.g,
							emp.db.profile.buttoncolour.b,
							emp.db.profile.buttoncolour.a)
	end
	
	self.frames.player:SetBackdropColor(EpicMusicPlayer.db.profile.backcolour.r,
							EpicMusicPlayer.db.profile.backcolour.g,
							EpicMusicPlayer.db.profile.backcolour.b,
							EpicMusicPlayer.db.profile.backcolour.a);
	self.frames.player:SetBackdropBorderColor(EpicMusicPlayer.db.profile.bordercolour.r,
							EpicMusicPlayer.db.profile.bordercolour.g,
							EpicMusicPlayer.db.profile.bordercolour.b,
							EpicMusicPlayer.db.profile.bordercolour.a)	
end

function EpicMusicPlayerGui:ShowTooltip(parent)
	local emp = EpicMusicPlayer
	GameTooltip:SetOwner(parent, "ANCHOR_BOTTOMRIGHT");
	
	if(EpicMusicPlayer.Playing)then		
		GameTooltip:SetText("|c"..emp.db.profile.artistcolour.hex..
			EpicMusicPlayer:GetCurrentArtistName().."|r  |c"..emp.db.profile.titlecolour.hex..emp:GetCurrentSongName())
		local album = EpicMusicPlayer:GetCurrentAlbumName();
		if(album=="")then
		else
			GameTooltip:AddLine("|cffffffee"..L["Album: "]..album)
		end
		
		GameTooltip:AddLine("|cffffffee"..L["List: "]..EpicMusicPlayer:GetListName())
		GameTooltip:AddLine("|cffffffee"..L["Length: "]..EpicMusicPlayer:GetTimeSTring(songlength))
		GameTooltip:Show()
	else
		GameTooltip:SetText(L["Stopped"], 1,1,1)
		GameTooltip:AddLine(L["Left Click"].." - "..emp.controlslist[emp.db.profile.controlset.left])	
		GameTooltip:AddLine(L["Middle Click"].." - "..emp.controlslist[emp.db.profile.controlset.middle])
		GameTooltip:AddLine(L["Right Click"].." - "..emp.controlslist[emp.db.profile.controlset.right])
		GameTooltip:Show()
	end
end
local offset=0
------------------------------------------------------------------------------------------------------------------------------
-- Create gui frame
------------------------------------------------------------------------------------------------------------------------------
function EpicMusicPlayerGui:CreateGuiFrame()
	
	--self.cuurskin = self.skins.default
	self.cuurskin = self.skins.wotlk
	
	self.frames = {}
	self.frames.buttonback = {}
	self.frames.buttons = {}
	
	self.frames.player = CreateFrame("Frame","EMPGUI",UIParent)
	self.frames.player:SetWidth(self.cuurskin.playerframe.width)
	self.frames.player:SetHeight(self.cuurskin.playerframe.height)
	--frame background
	--self.frames.player:SetFrameLevel(2)
	self.frames.player:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
	                                        edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
	                                        tile = true, tileSize = 16, edgeSize = 16, 
	                                        insets = { left = 4, right = 4, top = 4, bottom = 4 }});
											--insets = { left = 1, right = 1, top = 1, bottom = 1 }});
	
	self.frames.player:SetPoint("CENTER",0,0)
	self.frames.player:Show()
	self.frames.player:EnableMouse(true)
	self.frames.player:SetMovable(true) 
	self.frames.player:RegisterForDrag("LeftButton");
    
	self.frames.player:SetFrameStrata(EpicMusicPlayer.db.profile.guistrata)
	self.frames.player:SetScript("OnDragStart", 
	    function()
			this:StartMoving()
			this.isMoving = true
		end
	)
	self.frames.player:SetScript("OnDragStop", 
	    function()
			this:StopMovingOrSizing()
			this.isMoving = false
		end
	)
	self.frames.player:EnableMouseWheel(1) 
	self.frames.player:SetScript("OnMouseWheel", 
		function()
			EpicMusicPlayer:DisplyScrollHandler()
		end
    )
	
	--------------------------------
	if(self.cuurskin.timebar)then
		timeframe = CreateFrame("Frame",nil,EMPGUI)
		timeframe.timebar = timeframe:CreateTexture()
		--timeframe:SetAllPoints(self.frames.player)
		timeframe.timebar:SetAllPoints(timeframe)
		--timeframe.timebar:SetTexture(0.6,0.2,0.8,0.8)
		timeframe.timebar:SetTexture(EpicMusicPlayer.db.profile.artistcolour.r,
								EpicMusicPlayer.db.profile.artistcolour.g,
								EpicMusicPlayer.db.profile.artistcolour.b,
								EpicMusicPlayer.db.profile.artistcolour.a)
		timeframe:SetWidth(0)
		timeframe:SetHeight(self.cuurskin.timebar.height)
		timeframe:SetPoint("BOTTOMLEFT",8,6)
	end
	--------------------------
	
	if(self.cuurskin.text)then
		scrollframe = CreateFrame("ScrollFrame","EMPScroll",EMPGUI)
		scrollframe:SetWidth(self.cuurskin.text.width)
		scrollframe:SetHeight(self.cuurskin.text.height)
		--scrollframe:SetPoint("CENTER",0,0)
		scrollframe:SetPoint("TOP",0,-5)
		
		--[[
		scrollframe:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
		                                        edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
		                                        tile = true, tileSize = 16, edgeSize = 16, 
		                                        insets = { left = 4, right = 4, top = 4, bottom = 4 }});
		--]]
		scrollframe:Show()
		
		scrollchild = CreateFrame("Frame","EMPScrollText",EMPScroll)
		
		scrollchild:SetWidth(self.frames.player:GetWidth()-20)
		scrollchild:SetHeight(20)
		scrollchild:SetAllPoints(scrollframe)
		scrollchild:Show()
		guitext = scrollchild:CreateFontString()
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
			function()
				if(arg1==1)then		
					offset=offset+1
					
				else
					offset=offset-1
				end
				scrollchild:SetPoint("TOPLEFT", scrollframe ,"TOPLEFT", -offset, 0)
				--text:SetAllPoints(s)
				--s:SetVerticalScroll(offset)
				EpicMusicPlayer:Debug(offset)				
			end
	    )	
		
		--scrollframe:SetScript("OnUpdate", self.ScrollText)
		
		scrollframe:SetScript("OnVerticalScroll", 
			function()
				EpicMusicPlayer:Debug("scroll")				
			end
	    )
	end
	
	-----------------------------------------------------------------------------------------------------
	--create buttons according to current skin
	for k, v in pairs(self.cuurskin.buttons) do
		--EpicMusicPlayer:Debug("creating button:",k)
		self.frames.buttons[k] = self:CreateButton(nil, EMPGUI, v.height, v.width, v.offx, v.offy,
			v.normaltexture,
			v.pushedtexture)
		self.frames.buttons[k]:SetScript("OnClick", 
		    function()
				if(arg1 == "LeftButton")then
					v.onleftclick()
				else
					v.onrightclick()
				end
			end
		)
		-- create backgroung texture if set
		if(self.cuurskin.buttonbackground)then
			self.frames.buttonback[k] = CreateFrame("Frame",nil,EMPGUI)
			self.frames.buttonback[k]:SetBackdrop({bgFile = self.cuurskin.buttonbackground });
			--self.frames.buttonback[k]:SetAllPoints(self.frames.buttons[k])
			self.frames.buttonback[k]:SetPoint("TOPLEFT", self.frames.buttons[k] , -4, 3)
			self.frames.buttonback[k]:SetWidth(25)
			self.frames.buttonback[k]:SetHeight(25)
		end
	end
	-----------------------------------------------------------------------------------------------------
	self:UpdateFrame(EpicMusicPlayer)
	if(EpicMusicPlayer.db.char.guiscale)then
		EMPGUI:SetScale(EpicMusicPlayer.db.char.guiscale)
	end
end

function EpicMusicPlayerGui:CreateButton(name, parent, width, hight, offx, offy, texn, texp)
	local button = CreateFrame("Button",name,parent)
	button:SetWidth(width)
	button:SetHeight(hight)
	button:SetPoint("TOPLEFT",offx,offy)
	button:SetNormalTexture(texn)
	button:SetPushedTexture(texp)
	button:EnableMouse(true); 
	button:RegisterForClicks("LeftButtonUp","RightButtonUp")
	return button
end

function EpicMusicPlayerGui:CreateMinimapButton()
	
	---------------------------------------
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
	    function()
			--if(arg1 == "RightButton")then
			--	EpicMusicPlayer:OnDisplayRightClick(this)
			--else
				EpicMusicPlayer:OnDisplayClick(this)
			--end
		end
	)
	
	minibutton:Show()
	minibutton:EnableMouse(true)
	minibutton:SetMovable(true) 
	minibutton:RegisterForDrag("RightButton");
	
	minibutton:SetScript("OnDragStart", 
	    function()
			this:StartMoving()
			this.isMoving = true
		end
	)
	minibutton:SetScript("OnDragStop", 
	    function()
			this:StopMovingOrSizing()
			this.isMoving = false
		end
	)
	
	minibutton:SetScript("OnEnter", 
	    function()
			tooltip = this
			EpicMusicPlayerGui:ShowTooltip(this)			
		end
	)
	
	minibutton:SetScript("OnLeave", 
	    function()
			tooltip = nil
			GameTooltip:Hide();
		end
	)
	
	minibutton:EnableMouseWheel(true) 
	minibutton:SetScript("OnMouseWheel", 
		function()
			EpicMusicPlayer:DisplyScrollHandler()
		end
    )
end