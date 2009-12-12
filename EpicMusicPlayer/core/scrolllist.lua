local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")

local function ScrollUpdate(self, offset)
	local frame = self:GetParent()
	local numButtons = frame.numButtons
	local line -- 1 through numButtons of our window to scroll
	local lineplusoffset -- an index into our data calculated from the scroll offset
	local max = frame.size
	local colums = frame.colums
	local selectedIndex = frame.selectedIndex
	
	for line=1,numButtons do
		local button = frame.buttons[line]
		lineplusoffset = line + offset
		
		if lineplusoffset <= max then
			--button:SetText(frame.GetData(lineplusoffset))
			for c = 1, #colums do
				button["colum"..c]:SetText(frame.GetData(lineplusoffset,c))
			end
			button:Show()
			button.listindex = lineplusoffset
		else
			button:Hide()
			button.listindex = nil
		end
		
		if selectedIndex == lineplusoffset then
			button:LockHighlight()
		else
			button:UnlockHighlight() 
		end
	end
end

local function UpdateColumSpaces(self, button)
	local colums = self.colums
	if #colums < 2 then return end
	local parent = self:GetParent()
	local relative = nil
	
	relative = nil
	for i = 1, #colums do
		--local button = buttons[x]
		local text = button["colum"..i]
		text:SetWidth(parent:GetWidth() * colums[i])
		text:SetHeight(self.buttonHeight)
		if relative then
			text:SetPoint("TOPLEFT",relative,"TOPRIGHT", 0,0)
		else -- first colum
			text:SetPoint("TOPLEFT",button,3,0)
		end
		relative = text
	end
	
	-- last colum right anchor
	local text = button["colum"..#colums]
	text:SetPoint("BOTTOMRIGHT",button,0,0)
end

local function CreateButton(parent, height, colums ,OnClick, OnEnter, OnLeave, font)
	local button = CreateFrame("Button",nil,parent)
	button:SetHeight(height)
	local numcolums = #colums
	
	local relative = nil
	for i = 1, numcolums do
		local text = button:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
		text:SetFont(font, 12)
		button["colum"..i] = text
		
		if numcolums == 1 then -- only one colum
			text:SetPoint("TOPLEFT",button,3,0)
			text:SetPoint("BOTTOMRIGHT",button,0,0)
		end
		
		text:SetNonSpaceWrap(true)
		text:SetJustifyH("LEFT")
		text:SetText("TEST")
		
	end
	
	parent:UpdateColumSpaces(button)
	
	button:SetHighlightTexture("Interface/QuestFrame/UI-QuestTitleHighlight")
	button:RegisterForClicks("AnyUp")
	button:SetScript("OnClick",OnClick)
	--[[
	button:SetScript("OnClick", function(self) 
		parent.selectedIndex = self.listindex or 0
		OnClick(self) 
	end)
	--]]
	button:SetScript("OnEnter", OnEnter)
	button:SetScript("OnLeave", OnLeave)
	
	return button
end

-- create/show/hide buttons according to list size
local function resize(self)
 	self.numButtons = math.floor((self:GetHeight()-8) / self.buttonHeight)
	local numButtons = self.numButtons
	local buttons = self.buttons
	relative = nil
	for i = 1, numButtons do
		local button = buttons[i]
		if not button then
			button = CreateButton(self,self.buttonHeight,self.colums,self.buttonOnClick,self.buttonOnEnter,self.buttonOnLeave, self.font)
			buttons[i] = button
			button:ClearAllPoints()
			if relative then
				button:SetPoint("TOPLEFT",relative,"BOTTOMLEFT", 0,0)
				button:SetPoint("RIGHT", self ,"RIGHT",-25, 0);
			else
				button:SetPoint("TOPLEFT",6,-5);
				button:SetPoint("RIGHT", self ,"RIGHT",-25, 0);
		end
		end
		button:Show()
		relative = button
		self:UpdateColumSpaces(button)
	end
	
	for i = numButtons, #buttons do
		local button = buttons[i]
		if button then 
			button:Hide() 
		end
	end
	self:SetMax(self.size)
end

local function SetSelected(self, index)
	EpicMusicPlayer:Debug("SetSelected",index)
	self.selectedIndex = index
	ScrollUpdate(self.scrollbar, self.scrollbar:GetValue())
end

local function SetMax(self, size)
	EpicMusicPlayer:Debug("Setmax")
	self.size = size
	local scrollbar = self.scrollbar
	if size-self.numButtons > 1 then
		scrollbar:SetMinMaxValues(0,size-self.numButtons)
		scrollbar:Show()
	else
		scrollbar:SetMinMaxValues(0,0)
		scrollbar:Hide()
	end
	ScrollUpdate(self.scrollbar, self.scrollbar:GetValue())
end

function EpicMusicPlayer:CreateListWidget(name, parent, size, colums,GetData, OnClick, OnEnter, OnLeave, font)

	local frame = CreateFrame("Frame",name,parent)
	frame.update = update
	frame.colums = colums or {1}
	frame.ScrollUpdate = ScrollUpdate
	frame.buttons = {}
	frame.buttonHeight = 17
	frame.numButtons = 0
	frame.buttonOnClick = OnClick
	frame.GetData = GetData
	frame.buttonOnEnter = OnEnter
	frame.buttonOnLeave = OnLeave
	frame.SetMax = SetMax
	frame.size = size
	frame.UpdateColumSpaces = UpdateColumSpaces
	frame.selectedIndex = 0
	frame.SetSelected = SetSelected
	frame.font = font
	
	frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
		edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
		tile = true, tileSize = 16, edgeSize = 16, 
		insets = { left = 4, right = 4, top = 4, bottom = 4 }});
	frame:SetBackdropColor(0.2,0.2,0.2,0.9)
	frame:SetBackdropBorderColor(0.5,0.5,0.5,0)
	
	local scrollbar = CreateFrame("Slider", nil, frame,"UIPanelScrollBarTemplate")
	scrollbar:SetPoint("TOPLEFT",frame,"TOPRIGHT",-20,-20)
	scrollbar:SetPoint("BOTTOMLEFT",frame,"BOTTOMRIGHT",20,20)
	
	scrollbar:SetScript("OnValueChanged", OnScrollValueChanged)
	scrollbar:SetMinMaxValues(0,100)
	scrollbar:SetValueStep(1)
	scrollbar:SetValue(0)
	scrollbar:SetWidth(16)
	frame.scrollbar = scrollbar
	
	local step = 3
	frame:EnableMouseWheel(true)
	frame:SetScript("OnMouseWheel", function(self, val)
		if IsControlKeyDown() then
			local f = frame:GetParent()
			f:SetScale(f:GetScale()+0.1*val)
		else
			scrollbar:SetValue(scrollbar:GetValue() - step*val)
		end
	end)
	
	_G[name.."ScrollUpButton"]:SetScript("OnClick", function(self, ...)
		local parent = self:GetParent()
		parent:SetValue(parent:GetValue() - step)
	end)
	
	_G[name.."ScrollDownButton"]:SetScript("OnClick", function(self, ...)
		local parent = self:GetParent()
		parent:SetValue(parent:GetValue() + step)
	end)
	
	scrollbar:SetScript("OnValueChanged", ScrollUpdate)
	scrollbar:SetScript("OnSizeChanged", function(self) resize(self:GetParent())end)
	
	return frame
end


