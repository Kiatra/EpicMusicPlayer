--EpicMusicDancer a litle dancer by yess
--i am using two frames for the models because somehow the setmodelscale 
--function does not work if the model file ist not fully loaded. Therefore i have to load the new model in a hidden frame and 
--switch frames after an estimated time the model needs to be loaded.
local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local rot = 0
local seqtime = 0
local seqence = 211
local modelscale = 1
local randomcountdown = 10
local TimeSinceLastUpdate = 0
local camera = 1
local test = 1
local frame1 = false
local modelscale = 1
local dancing = true
local nextseqence = nil
local sticky = true
local seqence
local oldseqence = seqence
local lock = true
local endframe

local model = {
	{
		file = "Creature/band/bandTaurenMale.M2",
		modelscale = 0.4,
		stand = 132,
		animdata = {
			{ -- regular play
				["seqence"] = 69,
				["endframe"] = 2000,
			},
			{
				["seqence"] = 213,
				["endframe"] = 4166,
			},
			{
				["seqence"] = 214,
				["endframe"] = 1200,
			},
			{
				["seqence"] = 215,
				["endframe"] = 2100
			},
			{
				["seqence"] = 216,
				["endframe"] = 1166,
			},
		},			
	},
	{
		file = "Creature/band/bandBloodElfMale.M2",
		modelscale = 0.7,
		stand = 132,
		animdata = {
			{ -- regular play
				["seqence"] = 69,
				["endframe"] = 3700,
			},
			{
				["seqence"] = 213,
				["endframe"] = 4166,
			},
			{
				["seqence"] = 214,
				["endframe"] = 1767,
			},
			{
				["seqence"] = 215,
				["endframe"] = 4333,
			},
			{
				["seqence"] = 216,
				["endframe"] = 6766,
			},
		},			
	},
	{
		file = "Creature/band/bandTrollMale.M2",
		modelscale = 0.6,
		stand = 132,
		animdata = {
			{ -- regular play
				["seqence"] = 69,
				["endframe"] = 4000,
			},
			{
				["seqence"] = 213,
				["endframe"] = 6633,
			},
			{
				["seqence"] = 214,
				["endframe"] = 4000,
			},
			{
				["seqence"] = 215,
				["endframe"] = 3833,
			},
			{
				["seqence"] = 215,
				["endframe"] = 3833,
			},
		},			
	},
	{
		file = "Creature/band/bandUndeadMale.M2",
		modelscale = 0.6,
		stand = 132,
		animdata = {
			{ -- regular play
				["seqence"] = 69,
				["endframe"] = 3200,
			},
			{
				["seqence"] = 213,
				["endframe"] = 9233,
			},
			{
				["seqence"] = 214,
				["endframe"] = 13200,
			},
			{
				["seqence"] = 215,
				["endframe"] = 3300,
			},
			{
				["seqence"] = 216,
				["endframe"] = 3800,
			},
		},			
	},
	{
		file = "Creature/band/bandOrcMale.M2",
		modelscale = 0.6,
		animdata = {
			{ -- regular play
				["seqence"] = 69,
				["endframe"] = 2400,
			},
			{
				["seqence"] = 213,
				["endframe"] = 1200,
			},
			--[[
			{
				["seqence"] = 214,
				["endframe"] = 9967,
			},
			{
				["seqence"] = 215,
				["endframe"] = 13667,
			},
			--]]
			{
				["seqence"] = 216,
				["endframe"] = 3667,
			},
			{
				["seqence"] = 217,
				["endframe"] = 3334,
			},
			{
				["seqence"] = 218,
				["endframe"] = 2666,
			},
		},			
	},
	{
		file = "Creature/BloodElfGuard/BloodElfMale_Guard.M2",
		modelscale = 0.7,
		stand = 115,
		animdata = {
			{
				["seqence"] = 69,
				["endframe"] = 8333,
			},
		}
	},
	{
		file =  "Creature/Murloccostume/murloccostume.m2",
		modelscale = 0.7,
		stand = 115,
		randomstand = {73,80,82},
		animdata = {
			{
				["seqence"] = 69,
				["endframe"] = 2333,
			},
		}
	},
}


	
local modelid = 1
local animdata = model[modelid].animdata

local modelmap = {guard=6,orc=5,bloodelf=2,undead=4,troll=3,tauren=1,murloccostume=7}

local modelmax = table.getn(model)

EpicMusicDancer = LibStub("AceAddon-3.0"):NewAddon("EpicMusicDancer", "AceEvent-3.0", "AceTimer-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicDancer")

local options={
			name=L["MusicDancer"],
			order = 5,
			type="group",
			args={
				show = {
		            type = 'toggle',
		            --width = "half",
					order = 1,
					name = L["Show Dancer"],
		            desc = L["Toggle show model."],
		            get = function() 
						return EpicMusicDancer:IsVisible()
					end,
		            set = function()
						EpicMusicDancer:ToggleShow()
		            end,
				},
				guihide = {
		            type = 'toggle',
		            --width = "half",
					order = 2,
					name = L["Toggle with Gui"],
		            desc = L["Showing/hiding the Gui will show/hide the dancer."],
		            get = function() 
						return EpicMusicDancer:IsGuiToggle()
					end,
		            set = function()
						EpicMusicDancer:ToggleGuiToggle()
		            end,
				},
				random = {
		            type = 'toggle',
		            --width = "half",
					order = 3,
					name = L["Random Model"],
		            desc = L["Show a random model when playing a new song."],
		            get = function() 
						return EpicMusicDancer:IsRandom()
					end,
		            set = function()
						EpicMusicDancer:ToggleRandom()
		            end,
				},
				setmodel = {
		            type = 'select',
					values = {bloodelf="Sid Nicious",
							  undead="Bergrisst",troll="Mai'Kyl",tauren="Chief Thunder-Skins",orc="Samuro",guard="Bloodelf Guard",murloccostume="Murloccostume"},
					order = 4,
		            name = L["Set Model"],
		            desc = L["Select a model"],
					get = function() 
						return EpicMusicDancer:GetDefaultModel()
					end,
		            set = function(info, value)
						EpicMusicDancer:SetDefaultModel(info, value)
		            end,
				},
				scale = {
		            type = 'range',
					order = 8,
					name = L["Model Size"],
		            desc = L["Adjust the size of the model frame"],
		            step = 0.1,
					min = 0.1,
					max = 5,
					get = function() 
						return EpicMusicDancer:GetScale()
					end,
		            set =  function(arg1,arg2) 
						return EpicMusicDancer:SetScale(arg2)
					end,
				},
				lock = {
		            type = 'toggle',
					order = 2,
					name = L["Lock"] ,
		            desc = L["Unlock to allow moving the model. Moving will relese the model from the gui. Use reset to reattatch."],
					get = function() 
						return lock
					end,
		            set =  function(arg1,arg2) 
						return EpicMusicDancer:Togglelock()
					end,
				},
				background = {
		            type = 'toggle',
					order = 9,
					name = L["Show Background"] ,
		            desc = L["Show Background"],
					get = function() 
						return EpicMusicDancer:HasBackground()
					end,
		            set =  function() 
						EpicMusicDancer:ToggleBackground()
					end,
				},
				mouse = {
		            type = 'toggle',
					order = 11,
					name = L["Enable Mouse"],
		            desc = L["Click me or scroll me. I won\'t bite. 8==8"],
					get = function() 
						return EpicMusicDancer:IsMouse()
					end,
		            set =  function() 
						EpicMusicDancer:ToggleMouse()
					end,
				},
				podest = {
		            type = 'toggle',
					order = 10,
					name = L["Show Pedestal"] ,
		            desc = L["Show Pedestal"],
					get = function() 
						return EpicMusicDancer:IsPedestal()
					end,
		            set =  function() 
						EpicMusicDancer:TogglePedestal()
					end,
				},
				tooltip = {
		            type = 'toggle',
					order = 12,
					name = L["Show Tooltip"] ,
		            desc = L["Show Tooltip"] ,
					get = function() 
						return EpicMusicDancer:IsShowTooltip()
					end,
		            set =  function() 
						EpicMusicDancer:ToggleShowTooltip()
					end,
				},
				strata = {
					type = 'select',
					values = {FULLSCREEN_DIALOG="Fullscreen_Dialog",FULLSCREEN="Fullscreen", 
								DIALOG="Dialog",HIGH="High",MEDIUM="Medium",LOW="Low",BACKGROUND="Background"},
					order = 13,
					name = L["Frame strata"],
					desc = L["Frame strata"],
					get = function() 
						return EpicMusicDancer.db.char.strata
					end,
					set = function(info, value)
						EpicMusicDancer.db.char.strata = value
						EpicMusicDancer.frame:SetFrameStrata(value)
					end,
				},
				reset = {
		            type = 'execute',
					order = -1,
					name = L["Reset Position"] ,
		            desc = L["This will set the model to the default size and attatch it to the gui."],
					func = function() 
						return EpicMusicDancer:ResetPos()
					end,
				},
			}
	}

function EpicMusicDancer:Test()
		EpicMusicDancer.testframe:SetModelScale(1) 
		--self.testframe:SetModel("Creature/band/bandTaurenMale.M2")
		EpicMusicDancer.testframe:SetModelScale(0.5)
		DEFAULT_CHAT_FRAME:AddMessage("TestFrameScale")
		--EpicMusicDancer.testframe:Hide()
end

local function OnUpdate(self)
	TimeSinceLastUpdate = TimeSinceLastUpdate + arg1

	if seqence then 
		seqtime = seqtime + (arg1 * 1000)
		if(dancing)then
			EpicMusicDancer:GetModelFrame():SetSequenceTime(seqence, seqtime)
		end
		--this.model:SetSequenceTime(this.animNum,this.frameTime);
		if(EpicMusicPlayer.Playing)then
		if seqtime > endframe then
			--if nextseqence then    
				seqence = animdata[nextseqence].seqence
				endframe = animdata[nextseqence].endframe
				nextseqence = 1
				seqtime = 0
			--else	
			--	seqtime = 0
			--	seqence = 69
			--	endframe = 2000
			--end
		end
		end
	end
	
	if(TimeSinceLastUpdate > 1)then
		TimeSinceLastUpdate = 0
		randomcountdown = randomcountdown -1
		if(randomcountdown < 1)then
			 EpicMusicDancer:RandomAnim()
		end
	end
end

--[[
local orig_UIParent_Show = UIParent.Show

local function My_UIParent_Show(...)m
	if EpicMusicDancer.db.char.show then
		EpicMusicDancer:Show()
	end
	return orig_UIParent_Show(...)
end

UIParent.Show = My_UIParent_Show
--]]

function EpicMusicDancer:OnInitialize()
	
	
	self.db = LibStub("AceDB-3.0"):New("EpicMusicDancerDB", defaults, "Default")
	self.db:RegisterDefaults({
		profile = {
			random = true,
			defaultmodel = "bloodelf",
		},
		char  = {
			background = false,
			pedestal = false,
			mouse = false,
			tooltip = false,
			scale = 1,
			show = true,
			guitoggle = true;
			strata = "MEDIUM"
		}
	})
	
	self:CreateDancerFrame(UIParent)
	self:RegisterMessage("EMPUpdateStop")
	self:RegisterMessage("EMPUpdatePlay")
	self:RegisterMessage("EMPGuiLoaded")
	self:RegisterEvent("WORLD_MAP_UPDATE", EpicMusicDancer.OnWorldMapUpdate, "WORLD_MAP_UPDATE")
	
	EpicMusicPlayer:AddOptions("dancer",options)
	
	UIParent:HookScript("OnShow", 
		function(self, ...)
			if EpicMusicDancer.db.char.show then
				EpicMusicDancer:Show()
			end
		end
	)
	
end

function EpicMusicDancer:EMPGuiLoaded(event)
	
	if(self.frame:IsUserPlaced())then
		self:SetScale(self.db.char.scale)
	end
	modelid = modelmap[self.db.profile.defaultmodel]
    self:SetModel(modelid)
	seqence = model[modelid].stand
end

function EpicMusicDancer:OnWorldMapUpdate(event)
	--EpicMusicPlayer:Debug(event)
    if EpicMusicDancer.db.char.show and WorldMapFrame:IsVisible() then
		EpicMusicDancer:Show()
	end
end

function EpicMusicDancer:GetDefaultModel()
    return EpicMusicDancer.db.profile.defaultmodel
end

function EpicMusicDancer:SetDefaultModel(info,value)
    self.db.profile.defaultmodel = value
	modelid = modelmap[value]
    self:SetModel(modelid)
end

function EpicMusicDancer:Togglelock()
	lock = not lock
	if(lock)then
		EpicMusicDancer.frame:RegisterForDrag();
		self.hitbox:Hide()
		if(not self:IsMouse())then
			self.frame:EnableMouse(false)
		end
		
	else
		
		EpicMusicDancer.frame:SetMovable(true) 
		EpicMusicDancer.frame:RegisterForDrag("LeftButton");
		self.hitbox:Show()
		self.frame:EnableMouse(true)
		EpicMusicDancer.frame:SetParent(UIParent)
	end
	
	if(frame1)then
			EpicMusicDancer.Model2:SetModelScale(1) 
			EpicMusicDancer.Model2:SetModel(model[modelid].file)
		else
			EpicMusicDancer.Model:SetModelScale(1)
			EpicMusicDancer.Model:SetModel(model[modelid].file)
		end
		EpicMusicDancer.SetModelScale()
end

function EpicMusicDancer:GetScale()
	return self.db.char.scale
	--self.Frame:GetScale();
end

function EpicMusicDancer:SetScale(val)
	self.db.char.scale = val
	self.frame:SetScale(val)
	if(frame1)then
		EpicMusicDancer.Model2:SetModelScale(1) 
		EpicMusicDancer.Model2:SetModel(model[modelid].file)
	else
		EpicMusicDancer.Model:SetModelScale(1)
		EpicMusicDancer.Model:SetModel(model[modelid].file)
	end
	EpicMusicDancer.SetModelScale()
end

function EpicMusicDancer:IsRandom()
	return EpicMusicDancer.db.profile.random
end

function EpicMusicDancer:ToggleRandom()
	EpicMusicDancer.db.profile.random = not EpicMusicDancer.db.profile.random
end

function EpicMusicDancer:IsPedestal()
	return EpicMusicDancer.db.char.pedestal
end

function EpicMusicDancer:TogglePedestal()
	EpicMusicDancer.db.char.pedestal = not EpicMusicDancer.db.char.pedestal
	if(EpicMusicDancer.db.char.pedestal)then
		self.pedestal:Show()
	else
		self.pedestal:Hide()
	end
end

function EpicMusicDancer:Show()
	EpicMusicDancer.frame:Show()
	EpicMusicDancer:SetModel(modelid)
	self.db.char.show = true
end

function EpicMusicDancer:Hide()
	EpicMusicDancer.frame:Hide()
	EpicMusicDancer.Model:Hide()
	EpicMusicDancer.Model2:Hide()
	self.db.char.show = false
end

function EpicMusicDancer:IsVisible()
	return EMPDancerFrame:IsVisible()
end

function EpicMusicDancer:ToggleShow()
	if(self.db.char.show)then
		EpicMusicDancer:Hide()
	else
		EpicMusicDancer:Show()
	end
end


function EpicMusicDancer:HasBackground()
	return self.db.char.background
end

function EpicMusicDancer:ToggleBackground()
	self.db.char.background = not self.db.char.background
	if(self.db.char.background)then
		EpicMusicDancer:SetBackground()
	else
		EpicMusicDancer.frame:SetBackdrop(nil)
	end
	
end


function EpicMusicDancer:IsShowTooltip()
	return self.db.char.tooltip
end

function EpicMusicDancer:ToggleShowTooltip()
	self.db.char.tooltip = not self.db.char.tooltip
end

function EpicMusicDancer:SetBackground()
	EpicMusicDancer.frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
	                                        edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
	                                        tile = true, tileSize = 16, edgeSize = 16, 
	                                        insets = { left = 4, right = 4, top = 4, bottom = 4 }});
	EpicMusicDancer.frame:SetBackdropColor(0,0,0,1);
end

function EpicMusicDancer:ResetPos()
	self:SetScale(1)
	if(EMPGUI)then
		EpicMusicDancer.frame:SetParent(EMPGUI)
		EpicMusicDancer.frame:ClearAllPoints() 
		EpicMusicDancer.frame:SetPoint("BOTTOMRIGHT", "EMPGUI", "TOPRIGHT", -5, -18);
		EMPGUI:Show()
		EpicMusicPlayer.db.profile.showgui = true;
	else
		EpicMusicDancer.frame:SetParent(UIParent)
		EpicMusicDancer.frame:ClearAllPoints() 
		EpicMusicDancer.frame:SetPoint("CENTER");
	end
	EpicMusicDancer.frame:SetWidth(100) 
	EpicMusicDancer.frame:SetHeight(100)
	EpicMusicDancer.frame:SetUserPlaced(false)
	EpicMusicDancer.db.char.pedestal = true;
	EpicMusicDancer:TogglePedestal()
	EpicMusicDancer:SetModel(modelid)
	self.db.profile.sticky = true
end

function EpicMusicDancer:EMPUpdatePlay()
	if(self:IsRandom())then
		modelid = math.random(1,table.getn(model))
	end
	EpicMusicDancer:SetModel(modelid)
	seqence = animdata[nextseqence].seqence
end

function EpicMusicDancer:EMPUpdateStop()
	seqence = model[modelid].stand
end

function EpicMusicDancer:IsMouse()
	return EpicMusicDancer.db.char.mouse
end

function EpicMusicDancer:ToggleMouse()
	self.db.char.mouse = not self.db.char.mouse
	if(self.db.char.mouse)then
		self.frame:EnableMouse(true)
		self.frame:EnableMouseWheel(true)
	else
		self.frame:EnableMouse(false)
		self.frame:EnableMouseWheel(false)
	end
end

function EpicMusicDancer:IsGuiToggle()
	return self.db.char.guitoggle
end

function EpicMusicDancer:ToggleGuiToggle()
	self.db.char.guitoggle = not self.db.char.guitoggle
end

function EpicMusicDancer:GetModelFrame()
	if(frame1)then
		return EpicMusicDancer.Model
	else
		return EpicMusicDancer.Model2
	end
end

function EpicMusicDancer:ToggleModelFrame()
		self:GetModelFrame():Hide()
		frame1 = not frame1
		self:GetModelFrame():Show()
end

function EpicMusicDancer:SetModelScale()
	local scale = model[modelid].modelscale
	if(frame1)then
		EpicMusicDancer.Model2:SetModelScale(scale)
	else
		EpicMusicDancer.Model:SetModelScale(scale)
	end
	EpicMusicDancer:ToggleModelFrame()
end

function EpicMusicDancer:SetModel(modelid)
	if(frame1)then
		EpicMusicDancer.Model2:SetModelScale(1) 
		EpicMusicDancer.Model2:SetModel(model[modelid].file)
	else
		EpicMusicDancer.Model:SetModelScale(1)
		EpicMusicDancer.Model:SetModel(model[modelid].file)
	end
	animdata = model[modelid].animdata
	nextseqence = 1
	endframe = animdata[nextseqence].endframe
	
	self:CancelAllTimers()
	self:ScheduleTimer(EpicMusicDancer.SetModelScale, 0.3)
end

function EpicMusicDancer:ToggleDancing()
	
	if(playing)then
		dancing = true;
	elseif(model[modelid].animdata)then
		dancing = true;
		seqence = 69
	else
		dancing = false;
	end
	
end

function EpicMusicDancer:SetLastModel()
	modelid = modelid -1
	if(modelid < 1)then
		modelid = #model
	end
	EpicMusicDancer:SetModel(modelid)
end

function EpicMusicDancer:SetNextModel()
	modelid = modelid +1
	if(modelid > #model)then
		modelid = 1
	end
	EpicMusicDancer:SetModel(modelid)
end

function EpicMusicDancer:CreateDancerFrame(parent)
	--EpicMusicDancer:CreateTestFrame(parent)
	self.frame = CreateFrame("Button","EMPDancerFrame",UIParent)
	self.frame:SetWidth(100) 
	self.frame:SetHeight(100)
	
	self.frame:SetParent(parent)
	--EpicMusicPlayer:Debug(EMPGUI:GetWidth(),-EMPGUI:GetWidth()/3)
	self.frame:SetPoint("BOTTOMRIGHT", "EMPGUI", "TOPRIGHT", -5, -18);
	--self.frame:SetPoint("BOTTOMRIGHT", "EMPGUI", "TOPRIGHT", 22, -15);
	sticky = true;
		
    self.frame:SetFrameStrata(self.db.char.strata)
	
	self.frame:SetMovable(true) 
	self.frame:SetClampedToScreen(1)
	
	if(self.db.char.show)then
		self.frame:Show()
	else
		self.frame:Hide()
	end
	
	-- set background
	if(self.db.char.background)then
		self.db.char.background = false;
		self:ToggleBackground()
	end
	
	self.frame:SetHitRectInsets(10, 10, 25, 0); 
	
	if(self.db.char.mouse)then
		self.frame:EnableMouse(true)
		self.frame:EnableMouseWheel(true)
	else
		self.frame:EnableMouse(false)
		self.frame:EnableMouseWheel(false)
	end
	
	self.hitbox = CreateFrame("Frame","EMPDancerHitbox",EMPDancerFrame)
	self.hitbox:SetWidth(80) 
	self.hitbox:SetHeight(75)
	self.hitbox:SetPoint("BOTTOMLEFT",EMPDancerFrame,10,0)
	
	--hitbox.SetAllPoints(EMPDancerFrame)
    self.hitbox:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
	                                        edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
	                                        tile = true, tileSize = 16, edgeSize = 16, 
	                                        insets = { left = 4, right = 4, top = 4, bottom = 4 }});
	self.hitbox:SetBackdropColor(0,0,0,1);
	self.hitbox:SetBackdropBorderColor(1, 0, 0)
	self.hitbox:Hide()
	--pedestal
	
	self.pedestal = CreateFrame("Frame","EMPDancerPodest",EMPDancerFrame)
	self.pedestal.texture = self.pedestal:CreateTexture(nil)
	self.pedestal.texture:SetTexture("Interface\\AddOns\\EpicMusicPlayer_Dancer\\podest.tga")
	self.pedestal.texture:SetAllPoints(EMPDancerPodest)
	
	self.pedestal:SetWidth(100)
	self.pedestal:SetHeight(32)
	self.pedestal:SetPoint("CENTER",0,-46)
	

	if(not self:IsPedestal())then
		self.pedestal:Hide()
	end

	
	EpicMusicDancer.Model = CreateFrame("PlayerModel",nil,EMPDancerFrame)
	EpicMusicDancer.Model:SetWidth(100) 
	EpicMusicDancer.Model:SetHeight(100)
	EpicMusicDancer.Model:ClearAllPoints() 
	--EpicMusicDancer.Model:SetPoint("CENTER")
	EpicMusicDancer.Model:SetAllPoints(EpicMusicDancer.frame);	
	EpicMusicDancer.Model:Show()
	--EpicMusicDancer.Model:EnableMouseWheel(true)
	
	EpicMusicDancer.Model:SetCamera(1);
	
	EpicMusicDancer.Model2 = CreateFrame("PlayerModel",nil,EMPDancerFrame)
	EpicMusicDancer.Model2:SetWidth(100) 
	EpicMusicDancer.Model2:SetHeight(100) 
	EpicMusicDancer.Model2:ClearAllPoints() 
	EpicMusicDancer.Model2:SetAllPoints(EpicMusicDancer.frame);
	--EpicMusicDancer.Model2:SetPoint("CENTER")
	
	--EpicMusicDancer.frame:EnableMouse(true)
	--EpicMusicDancer.frame:EnableMouseWheel(true)
	
	EpicMusicDancer.frame:SetScript("OnMouseWheel", 
		function()
				if EpicMusicPlayer.db.char.debug then
					if arg1 < 1 then
						seqence = seqence +1
					else
						seqence = seqence -1
					end
					DEFAULT_CHAT_FRAME:AddMessage(seqence)
				else
					EpicMusicPlayer:DisplyScrollHandler()
				end
		end
    )
	--EpicMusicDancer.frame:SetMovable(true) 
	--EpicMusicDancer.frame:RegisterForDrag("LeftButton");
	
	self.frame:SetScript("OnDragStart", 
	    function()
			this:StartMoving()
			this.isMoving = true
		end
	)
	self.frame:SetScript("OnDragStop", 
	    function()
			this:StopMovingOrSizing()
			this.isMoving = false
		end
	)
	
	self.frame:SetScript("OnEnter", 
	    function()
			if(self.db.char.tooltip)then
				tooltip = this
				EpicMusicPlayer:ShowTooltip(this)
			end
		end
	)
	
	self.frame:SetScript("OnLeave", 
	    function()
			if(self.db.char.tooltip)then
				tooltip = nil
				GameTooltip:Hide()
			end
		end
	)
	
	------------------------------------------------------------
	-- this is the timer function
	-- called every frame oO
	------------------------------------------------------------
	EpicMusicDancer.Model:SetScript("OnUpdate", OnUpdate)
	EpicMusicDancer.Model2:SetScript("OnUpdate", OnUpdate)

end

function EpicMusicDancer:RandomAnim()
	oldseqence = seqence
	randomcountdown = math.random(5,10)
	if #animdata > 1 then
		nextseqence = math.random(2,#animdata)	
	end
end
