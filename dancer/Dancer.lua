local emp = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer") ---@class EpicMusicPlayer : AceAddon

local EpicMusicDancer = LibStub("AceAddon-3.0"):NewAddon("EpicMusicDancer", "AceEvent-3.0", "AceTimer-3.0") ---@class EpicMusicDancer : AceAddon
emp.EpicMusicDancer = EpicMusicDancer
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")

local currentModelIndex = 1

function EpicMusicDancer:OnInitialize()
	self.db = emp.db
	currentModelIndex = self.db.defaultmodel or 1
	
	self:CreateDancerFrame(EMPGUI)
	self:RegisterMessage("EMPUpdateStop")
	self:RegisterMessage("EMPUpdatePlay")
	

	emp:AddOptions("dancer",self._dancerOptions)

	--@debug@
	--self:RegisterMessage("EMPGuiLoaded")
	--self:SetBackground() --just for testing
	self._modelFrame:SetDisplayInfo(21666)
	self._modelFrame:SetAnimation(132)
	--@end-debug@
end

--------------------------------------------------------------------------
--                      *******  dance or die! ********
--------------------------------------------------------------------------
function EpicMusicDancer:_bandAnimation()
	local animdata = self._dancerModelData[currentModelIndex].animdata
	local nextSeqence = math.random(1,#animdata)
	local animation = animdata[nextSeqence].animation
	local durationInMs = animdata[nextSeqence].durationInMs

	self._modelFrame:SetAnimation(animation)
	self._bandAnimationTimer = self:ScheduleTimer("_bandAnimation", durationInMs / 1000)

	emp:Debug("_bandAnimation", self._dancerModelData[currentModelIndex].label, durationInMs)
end

local function isBandModel(currentModelIndex)
	return EpicMusicDancer._dancerModelData[currentModelIndex].animdata and true or false
end

function EpicMusicDancer:EMPUpdatePlay()
	if self:IsRandom() or not currentModelIndex then
		currentModelIndex = math.random(1,#self._dancerModelData)
	end
	self:_setDisplay(currentModelIndex)

	self:CancelTimer(self._bandAnimationTimer)
	if isBandModel(currentModelIndex) then
    	self._bandAnimationTimer = self:ScheduleTimer("_bandAnimation", 0.1)
	else
		self._modelFrame:SetAnimation(69) --default dance animation
	end
end

function EpicMusicDancer:EMPUpdateStop()
	self:CancelTimer(self._bandAnimationTimer)

	local standAnimation = self._dancerModelData[currentModelIndex].stand

	if standAnimation then 
		self._modelFrame:SetAnimation(standAnimation)
	else
		self._modelFrame:SetAnimation(214) --any animation that is not an endless loop really
		self._modelFrame:SetSequenceTime(214, 80000) --set the seq time to after the end time
	end
end

--------------------------------------------------------------------------
--                      *******  Config Stuff .... ********
--------------------------------------------------------------------------
function EpicMusicDancer:SetDefaultModel(info,value)
    self.db.defaultmodel = value
	self:_setDisplay(value)
	currentModelIndex = value

	self:CancelTimer(self._bandAnimationTimer)
	if emp.playing then 
		self:EMPUpdatePlay()
	end
end

function EpicMusicDancer:Show()
	self.frame:Show()
	self.db.model.show = true
end

function EpicMusicDancer:Hide()
	self.frame:Hide()
	self._modelFrame:Hide()
	self.db.model.show = false
end

function EpicMusicDancer:ToggleShow()
	if(self.db.model.show)then
		EpicMusicDancer:Hide()
	else
		EpicMusicDancer:Show()
	end
end

function EpicMusicDancer:IsVisible()
	return EMPDancerFrame:IsVisible()
end

--------------------------------------------------------------------------
--                      *******  The Frame and such.... ********
--------------------------------------------------------------------------
function EpicMusicDancer:_setDisplay(key)
	for i, entry in ipairs(EpicMusicDancer._dancerModelData) do
		if entry.key == key then
			currentModelIndex = i
			EpicMusicDancer._modelFrame:SetDisplayInfo(entry.displayID)
			return
		end
	end
end

local function OnModelLoaded(self)
	emp:Debug("OnModelLoaded")
	
	local modelData = EpicMusicDancer._dancerModelData
	currentModelIndex = currentModelIndex or 1
	
	--local scale = modelData[currentModelIndex] and modelData[currentModelIndex].modelscale or 1
	--self:SetModelScale(scale)
	local cameDistance = modelData[currentModelIndex] and modelData[currentModelIndex].camDistance or 3
	self:SetCamDistanceScale(cameDistance)
	--modelFrame:SetCamDistanceScale(6)
end

function EpicMusicDancer:CreateDancerFrame(parent)
	emp:Debug("CreateDancerFrame parent:", parent, EMPGUI)
	self.frame = _G.CreateFrame("Button","EMPDancerFrame", parent, BackdropTemplateMixin and "BackdropTemplate")
	EMPDancerFrame = self.frame

	local dim = parent:GetWidth()
	self.frame:SetWidth(dim)
	self.frame:SetHeight(dim)

	--self.frame:SetParent(parent)

	EpicMusicDancer.frame:SetPoint("BOTTOM", parent, "TOP", -20, -80);
	--EpicMusicDancer.frame:SetPoint("CENTER", parent, "CENTER", 0, 0);
	
    self.frame:SetFrameStrata(self.db.model.strata)

	--self.frame:SetMovable(true)
	--self.frame:SetClampedToScreen(true)

	if(self.db.model.show)then
		self.frame:Show()
	else
		self.frame:Hide()
	end

	local modelFrame = _G.CreateFrame("PlayerModel",nil,EMPDancerFrame, BackdropTemplateMixin and "BackdropTemplate")
	EMP_F = modelFrame
	--modelFrame:ClearAllPoints()
	--modelFrame:SetWidth(400)
	--modelFrame:SetHeight(400)
	modelFrame:SetAllPoints(EMPDancerFrame)
	modelFrame:SetCamera(2)
	modelFrame:SetCamDistanceScale(3)
	--EMP_F:SetCamDistanceScale(6)

	modelFrame:SetKeepModelOnHide(true)
	modelFrame:SetScript("OnModelLoaded", OnModelLoaded)

	self._modelFrame = modelFrame

	--for later if we add the dancers as standalone frame
	--self.frame:SetHitRectInsets(10, 10, 25, 0);
end
