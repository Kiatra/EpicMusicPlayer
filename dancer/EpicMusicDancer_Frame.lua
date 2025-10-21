local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local EpicMusicDancer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicDancer")
EpicMusicPlayer.EpicMusicDancer = EpicMusicDancer

local model
local model2

--------------------------------------------------------------------
-- Frame creation
-- ---------------------------------------------------------------------------
function EpicMusicDancer:CreateDancerFrame(parent)
  self.frame = _G.CreateFrame("Button", "EMPDancerFrame", _G.UIParent, BackdropTemplateMixin and "BackdropTemplate")
  EMPDancerFrame = self.frame
  self.frame:SetWidth(100); self.frame:SetHeight(100)
  self.frame:SetParent(parent)

  EpicMusicDancer.frame:SetPoint("BOTTOM", "EMPGUI", "TOP", -25, -22)
  EpicMusicDancer.frame:SetPoint("CENTER", "EMPGUI", "CENTER", -25, -22)
  sticky = true

  self.frame:SetFrameStrata(self.db.model.strata or "MEDIUM")
  self.frame:SetMovable(true)
  self.frame:SetClampedToScreen(true)

  if self.db.model.show then self.frame:Show() else self.frame:Hide() end

  self.frame:SetHitRectInsets(10, 10, 25, 0)

  self.frame:SetScript("OnMouseUp", function(s, btn)
    EpicMusicPlayer:OnDisplayClick(s, btn)
    if tooltip then _G.EpicMusicPlayerGui:ShowTooltip(tooltip) end
  end)

  if self.db.model.mouse then
    self.frame:EnableMouse(true); self.frame:EnableMouseWheel(true)
  else
    self.frame:EnableMouse(false); self.frame:EnableMouseWheel(false)
  end

  self.hitbox = _G.CreateFrame("Frame", "EMPDancerHitbox", EMPDancerFrame, BackdropTemplateMixin and "BackdropTemplate")
  self.hitbox:SetWidth(80); self.hitbox:SetHeight(75)
  self.hitbox:SetPoint("BOTTOMLEFT", EMPDancerFrame, 10, 0)
  self.hitbox:SetBackdrop({
    bgFile = "Interface/Tooltips/UI-Tooltip-Background",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
  })
  self.hitbox:SetBackdropColor(0,0,0,1)
  self.hitbox:SetBackdropBorderColor(1,0,0)
  self.hitbox:Hide()

  self.pedestal = _G.CreateFrame("Frame", "EMPDancerPodest", EMPDancerFrame, BackdropTemplateMixin and "BackdropTemplate")
  self.pedestal.texture = self.pedestal:CreateTexture(nil)
  self.pedestal.texture:SetTexture("Interface\\AddOns\\EpicMusicPlayer\\modules\\dancer\\podest.tga")
  self.pedestal.texture:SetAllPoints(self.pedestal)
  self.pedestal:SetWidth(100); self.pedestal:SetHeight(32)
  self.pedestal:SetPoint("CENTER", 0, -46)
  if not self:IsPedestal() then self.pedestal:Hide() end

  model = _G.CreateFrame("PlayerModel", nil, EMPDancerFrame, BackdropTemplateMixin and "BackdropTemplate")
  model:SetWidth(100); model:SetHeight(100)
  model:ClearAllPoints(); model:SetAllPoints(EpicMusicDancer.frame)
  model:SetCamera(1); model:SetKeepModelOnHide(true)
  model:Hide()
  EpicMusicDancer.Model = model

  model2 = _G.CreateFrame("PlayerModel", nil, EMPDancerFrame, BackdropTemplateMixin and "BackdropTemplate")
  model2:SetWidth(100); model2:SetHeight(100)
  model2:ClearAllPoints(); model2:SetAllPoints(EpicMusicDancer.frame)
  model2:SetCamera(1); model2:SetKeepModelOnHide(true)
  EpicMusicDancer.Model2 = model2

  self.frame:SetScript("OnMouseWheel", function(_, value)
    EpicMusicPlayer:DisplyScrollHandler(value)
  end)

  self.frame:SetScript("OnDragStart", function(s) s:StartMoving(); s.isMoving = true end)
  self.frame:SetScript("OnDragStop",  function(s) s:StopMovingOrSizing(); s.isMoving = false end)

  self.frame:SetScript("OnEnter", function(s)
    if EpicMusicPlayer.db.tooltip then tooltip = s; EpicMusicPlayer:ShowTooltip(s) end
  end)
  self.frame:SetScript("OnLeave", function()
    if self.db.model.tooltip then tooltip = nil; _G.GameTooltip:Hide() end
  end)
end

function EpicMusicDancer:SetOnUpdate(OnUpdate)
    model:SetScript("OnUpdate", OnUpdate)
    model2:SetScript("OnUpdate", OnUpdate)
end



