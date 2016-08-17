local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")
local messageframe = nil -- song and artst display

------------------------------------------------------------------------------
-- osd display
-------------------------------------------------------------------------------
function EpicMusicPlayer:UpdateMessageFrameText(artist,title)
	if not messageframe then self:CreateMessageFrame() end
	local c = self.db.artistcolour
	messageframe:AddMessage(artist.."\n |c"..self:ToHex(self.db.titlecolour)..title, c.r,c.g,c.b, 53, 0);
end

function EpicMusicPlayer:CreateMessageFrame()
	messageframe = CreateFrame("MessageFrame",nil,UIParent)
	messageframe:SetFrameStrata("BACKGROUND")
	messageframe:SetWidth(600)
	messageframe:SetHeight(50)
	messageframe:SetPoint("CENTER",0,300)
	messageframe:Show()

	local font = self:GetFont()
	if font then
		messageframe:SetFont(font, self.db.fontsize)
	else
		messageframe:SetFont(GameFontNormal:GetFont(),self.db.fontsize)
	end

	messageframe:SetShadowColor(0, 0, 0,0.8)
	messageframe:SetShadowOffset(1, -1)
end

function EpicMusicPlayer:UpdateMessageFrame()
	if(not messageframe)then
			self:CreateMessageFrame()
	end
	local font = EpicMusicPlayer:GetFont()
	if font then
		messageframe:SetFont(font, self.db.fontsize)
		if currentsong and currentsong.Artist then
			EpicMusicPlayer:UpdateMessageFrameText(currentsong.Artist, currentsong.Song)
		end
	else
		messageframe:SetFont(GameFontNormal:GetFont(),self.db.fontsize)
	end
end
