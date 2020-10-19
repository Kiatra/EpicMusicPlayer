--EpicMusicDancer a litle dancer by yess
--i am using two frames for the models because somehow the setmodelscale
--function does not work if the model file ist not fully loaded. Therefore i have to load the new model in a hidden frame and
--switch frames after an estimated time the model needs to be loaded.
local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local rot = 0
local seqTime = 0
local seqence = 211
local modelscale = 1
local randomcountdown = 10
local TimeSinceLastUpdate = 0
local camera = 1
local test = 1
local frame1 = false
local modelscale = 1
local dancing = true
local nextSeqence = nil
local sticky = true
local seqence
local oldseqence = seqence
local lock = true
local endframe
local _G, math = _G, math
local EMPDancerFrame, tooltip

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
			--{ -- regular play
			--	["seqence"] = 69,
			--	["endframe"] = 3700,
			--},
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
			--{ -- regular play
			--	["seqence"] = 69,
			--	["endframe"] = 4000,
			--},
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
			--{ -- regular play
			--	["seqence"] = 69,
			--	["endframe"] = 3200,
			--},
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
			--{ -- regular play
			--	["seqence"] = 69,
			--	["endframe"] = 2400,
			--},
			{
				["seqence"] = 213,
				["endframe"] = 1200,
			},
			{
				["seqence"] = 214,
				["endframe"] = 9967,
			},
			{
				["seqence"] = 215,
				["endframe"] = 13667,
			},
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
local modelmax = #model

local EpicMusicDancer = LibStub("AceAddon-3.0"):NewAddon("EpicMusicDancer", "AceEvent-3.0", "AceTimer-3.0")

EpicMusicPlayer.EpicMusicDancer = EpicMusicDancer
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")

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
					name = L["Toggle with GUI"],
		            desc = L["Showing/hiding the GUI will show/hide the dancer."],
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
		            set =  function(self,value)
						return EpicMusicDancer:SetScale(value)
					end,
				},
				lock = {
		            type = 'toggle',
					order = 2,
					name = L["Lock"] ,
		            desc = L["Unlock to allow moving the model. Moving will release the model from the GUI. Use reset to reattach."],
					get = function()
						return lock
					end,
		            set =  function(self,value)
						return EpicMusicDancer:Togglelock()
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
						return EpicMusicDancer.db.model.strata
					end,
					set = function(info, value)
						EpicMusicDancer.db.model.strata = value
						EpicMusicDancer.frame:SetFrameStrata(value)
					end,
				},
				reset = {
		            type = 'execute',
					order = -1,
					name = L["Reset Position"],
		            desc = L["This will set the model to the default size and attach it to the GUI."],
					func = function()
						return EpicMusicDancer:ResetPos()
					end,
				},
			}
	}

local function OnUpdate(self, elapsed)
	--Debug(self, elapsed)
	TimeSinceLastUpdate = TimeSinceLastUpdate + elapsed

	if seqence then
		seqTime = seqTime + (elapsed * 1000)
		if dancing then
			EpicMusicDancer:GetModelFrame():SetSequenceTime(seqence, seqTime)
			lasstSeqenceTime = seqTime
		end
		if EpicMusicPlayer.Playing then
			if seqTime > endframe then
					seqence = animdata[nextSeqence].seqence
					endframe = animdata[nextSeqence].endframe
					nextSeqence = 1
					seqTime = 0
					lasstSeqenceTime = -1
			end
		end
	end


	if TimeSinceLastUpdate > 1 then
		TimeSinceLastUpdate = 0
		randomcountdown = randomcountdown -1
		if randomcountdown < 1 then
			 EpicMusicDancer:RandomAnim()
		end
	end
end

function EpicMusicDancer:OnInitialize()
	self.db = EpicMusicPlayer.db
	self:CreateDancerFrame(_G.UIParent)
	self:RegisterMessage("EMPUpdateStop")
	self:RegisterMessage("EMPUpdatePlay")
	self:RegisterMessage("EMPGuiLoaded")

	EpicMusicPlayer:AddOptions("dancer",options)

	_G.UIParent:HookScript("OnShow",
		function(self, ...)
			if EpicMusicDancer.db.model.show then
				EpicMusicDancer:Show()
			end
		end
	)
	EpicMusicDancer:SetScale(self.db.model.scale)
end

function EpicMusicDancer:EMPGuiLoaded(event)

	if(self.frame:IsUserPlaced())then
		self:SetScale(self.db.model.scale)
	end
	modelid = modelmap[self.db.model.defaultmodel]
	self:SetModel(modelid)
	seqence = model[modelid].stand
end

function EpicMusicDancer:GetDefaultModel()
    return EpicMusicDancer.db.model.defaultmodel
end

function EpicMusicDancer:SetDefaultModel(info,value)
    self.db.profile.defaultmodel = value
	modelid = modelmap[value]
    self:SetModel(modelid)
end

function EpicMusicDancer:Togglelock()
	lock = not lock
	if lock then
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
		EpicMusicDancer.frame:SetParent(_G.UIParent)
	end

	if frame1 then
		EpicMusicDancer.Model2:SetModelScale(1)
		EpicMusicDancer.Model2:SetModel(model[modelid].file)
	else
		EpicMusicDancer.Model:SetModelScale(1)
		EpicMusicDancer.Model:SetModel(model[modelid].file)
	end
	EpicMusicDancer.SetModelScale()
end

function EpicMusicDancer:GetScale()
	return self.db.model.scale
	--self.Frame:GetScale();
end

function EpicMusicDancer:SetScale(val)
	self.db.model.scale = val
	self.frame:SetScale(val)
	if frame1 then
		EpicMusicDancer.Model2:SetModelScale(1)
		EpicMusicDancer.Model2:SetModel(model[modelid].file)
	else
		EpicMusicDancer.Model:SetModelScale(1)
		EpicMusicDancer.Model:SetModel(model[modelid].file)
	end
	EpicMusicDancer.SetModelScale()
end

function EpicMusicDancer:IsRandom()
	return EpicMusicDancer.db.model.random
end

function EpicMusicDancer:ToggleRandom()
	EpicMusicDancer.db.model.random = not EpicMusicDancer.db.model.random
end

function EpicMusicDancer:IsPedestal()
	return EpicMusicDancer.db.model.pedestal
end

function EpicMusicDancer:Show()
	EpicMusicDancer.frame:Show()
	EpicMusicDancer:SetModel(modelid)
	self.db.model.show = true
end

function EpicMusicDancer:Hide()
	EpicMusicDancer.frame:Hide()
	EpicMusicDancer.Model:Hide()
	--EpicMusicDancer.Model2:Hide()
	self.db.model.show = false
end

function EpicMusicDancer:IsVisible()
	return EMPDancerFrame:IsVisible()
end

function EpicMusicDancer:ToggleShow()
	if(self.db.model.show)then
		EpicMusicDancer:Hide()
	else
		EpicMusicDancer:Show()
	end
end

function EpicMusicDancer:IsShowTooltip()
	return self.db.model.tooltip
end

function EpicMusicDancer:ToggleShowTooltip()
	self.db.model.tooltip = not self.db.model.tooltip
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
	if(_G.EMPGUI)then
		EpicMusicDancer.frame:SetParent(_G.EMPGUI)
		EpicMusicDancer.frame:ClearAllPoints()
		EpicMusicDancer.frame:SetPoint("BOTTOM", "EMPGUI", "TOP", -25, -22);
		EpicMusicDancer.frame:SetPoint("CENTER", "EMPGUI", "CENTER", -25, -22);
		_G.EMPGUI:Show()
		EpicMusicPlayer:Debug("ResetPos", EpicMusicPlayer.db.showgui)
		EpicMusicPlayer.db.showgui = true;
	else
		EpicMusicDancer.frame:SetParent(_G.UIParent)
		EpicMusicDancer.frame:ClearAllPoints()
		EpicMusicDancer.frame:SetPoint("CENTER");
	end
	EpicMusicDancer.frame:SetWidth(100)
	EpicMusicDancer.frame:SetHeight(100)
	EpicMusicDancer.frame:SetUserPlaced(false)
	EpicMusicDancer.db.model.pedestal = true;
	EpicMusicDancer:SetModel(modelid)
	self.db.sticky = true
end

function EpicMusicDancer:EMPUpdatePlay()
	if(self:IsRandom())then
		modelid = math.random(1,_G.table.getn(model))
	end
	EpicMusicDancer:SetModel(modelid)
	seqence = animdata[nextSeqence].seqence

end

function EpicMusicDancer:EMPUpdateStop()
	seqence = model[modelid].stand
end

function EpicMusicDancer:IsMouse()
	return EpicMusicDancer.db.model.mouse
end

function EpicMusicDancer:ToggleMouse()
	self.db.model.mouse = not self.db.model.mouse
	if(self.db.model.mouse)then
		self.frame:EnableMouse(true)
		self.frame:EnableMouseWheel(true)
	else
		self.frame:EnableMouse(false)
		self.frame:EnableMouseWheel(false)
	end
end

function EpicMusicDancer:IsGuiToggle()
	return self.db.model.guitoggle
end

function EpicMusicDancer:ToggleGuiToggle()
	self.db.guitoggle = not self.db.guitoggle
end

function EpicMusicDancer:GetModelFrame()
	if frame1 then
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
	if frame1 then
	EpicMusicDancer.Model2:SetModelScale(scale)
	else
		EpicMusicDancer.Model:SetModelScale(scale)
	end
	EpicMusicDancer:ToggleModelFrame()
end

function EpicMusicDancer:SetModel(modelid)
	if frame1 then
		EpicMusicDancer.Model2:SetModelScale(1)
		EpicMusicDancer.Model2:SetModel(model[modelid].file)
	else
		EpicMusicDancer.Model:SetModelScale(1)
		EpicMusicDancer.Model:SetModel(model[modelid].file)
	end
	animdata = model[modelid].animdata
	nextSeqence = 1
	endframe = animdata[nextSeqence].endframe

	self:CancelAllTimers()
	self:ScheduleTimer(EpicMusicDancer.SetModelScale, 0.1)
end

function EpicMusicDancer:ToggleDancing()
	if EpicMusicPlayer.Playing then
		dancing = true;
	elseif model[modelid].animdata then
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
	self.frame = _G.CreateFrame("Button","EMPDancerFrame",_G.UIParent, BackdropTemplateMixin and "BackdropTemplate")
	EMPDancerFrame = self.frame
	self.frame:SetWidth(100)
	self.frame:SetHeight(100)

	self.frame:SetParent(parent)
	EpicMusicDancer.frame:SetPoint("BOTTOM", "EMPGUI", "TOP", -25, -22);
	EpicMusicDancer.frame:SetPoint("CENTER", "EMPGUI", "CENTER", -25, -22);
	sticky = true;

  self.frame:SetFrameStrata(self.db.model.strata)

	self.frame:SetMovable(true)
	self.frame:SetClampedToScreen(1)

	if(self.db.model.show)then
		self.frame:Show()
	else
		self.frame:Hide()
	end

	self.frame:SetHitRectInsets(10, 10, 25, 0);

	self.frame:SetScript("OnMouseUp",
		function(self, btn)
			EpicMusicPlayer:OnDisplayClick(self,btn)
			if(tooltip) then
				_G.EpicMusicPlayerGui:ShowTooltip(tooltip)
			end
		end
	)

	if(self.db.model.mouse)then
		self.frame:EnableMouse(true)
		self.frame:EnableMouseWheel(true)
	else
		self.frame:EnableMouse(false)
		self.frame:EnableMouseWheel(false)
	end

	self.hitbox = _G.CreateFrame("Frame","EMPDancerHitbox",EMPDancerFrame, BackdropTemplateMixin and "BackdropTemplate")
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

	self.pedestal = _G.CreateFrame("Frame","EMPDancerPodest",EMPDancerFrame, BackdropTemplateMixin and "BackdropTemplate")
	self.pedestal.texture = self.pedestal:CreateTexture(nil)
	self.pedestal.texture:SetTexture("Interface\\AddOns\\EpicMusicPlayer\\modules\\dancer\\podest.tga")
	self.pedestal.texture:SetAllPoints(self.pedestal)

	self.pedestal:SetWidth(100)
	self.pedestal:SetHeight(32)
	self.pedestal:SetPoint("CENTER",0,-46)


	if(not self:IsPedestal())then
		self.pedestal:Hide()
	end

	local model = _G.CreateFrame("PlayerModel",nil,EMPDancerFrame, BackdropTemplateMixin and "BackdropTemplate")
	model:SetWidth(100)
	model:SetHeight(100)
	model:ClearAllPoints()
	model:SetAllPoints(EpicMusicDancer.frame);
	model:Hide()
	model:SetCamera(1);
	EpicMusicDancer.Model = model


	local model2 = _G.CreateFrame("PlayerModel",nil,EMPDancerFrame, BackdropTemplateMixin and "BackdropTemplate")
	model2:SetWidth(100)
	model2:SetHeight(100)
	model2:ClearAllPoints()
	model2:SetAllPoints(EpicMusicDancer.frame);
	model2:SetCamera(1);
	EpicMusicDancer.Model2 = model2

	EpicMusicDancer.frame:SetScript("OnMouseWheel",
		function(self, value)
			EpicMusicPlayer:DisplyScrollHandler(value)
		end
    )

	self.frame:SetScript("OnDragStart",
	    function(self)
			self:StartMoving()
			self.isMoving = true
		end
	)
	self.frame:SetScript("OnDragStop",
	    function(self)
			self:StopMovingOrSizing()
			self.isMoving = false
		end
	)

	self.frame:SetScript("OnEnter",
	    function(self)

			if EpicMusicDancer.Model then EpicMusicPlayer:Debug("EpicMusicDancer.Model1:IsShown()", EpicMusicDancer.Model:IsShown()) end
			if EpicMusicDancer.Model2 then EpicMusicPlayer:Debug("EpicMusicDancer.Model2:IsShown()", EpicMusicDancer.Model2:IsShown()) end
			if(EpicMusicPlayer.db.tooltip)then
				tooltip = self
				EpicMusicPlayer:ShowTooltip(self)
			end
		end
	)

	self.frame:SetScript("OnLeave",
	    function()
			if(self.db.model.tooltip)then
				tooltip = nil
				_G.GameTooltip:Hide()
			end
		end
	)

	model:SetScript("OnUpdate", OnUpdate)
	model2:SetScript("OnUpdate", OnUpdate)

end

function EpicMusicDancer:RandomAnim()
	oldseqence = seqence
	randomcountdown = math.random(5,10)
	if #animdata > 1 then
		nextSeqence = math.random(1,#animdata-1)
	end
end
