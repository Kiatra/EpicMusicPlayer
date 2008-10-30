--local broker = LibStub("LibDataBroker-1.1")

EpicMusicPlayerBroker = LibStub("AceAddon-3.0"):NewAddon("EpicMusicPlayerBroker", "AceEvent-3.0","AceTimer-3.0")

local empbroker = CreateFrame("Frame")
empbroker.obj = LibStub("LibDataBroker-1.1"):NewDataObject("Broker_EpicMusicPlayer", {
	type = "data source",
	icon = "Interface\\AddOns\\EpicMusicPlayerTitan\\icon",
	label = "Time",
	text  = "00:00",
	
	OnClick = function(self, btn)
		--db.seconds = not db.seconds
		--delay = db.seconds and 1 or 60
		--Clock:OnUpdate(FORCE_UPDATE)
		--EpicMusicPlayer:PlayNext()
		EpicMusicPlayer:OnDisplayClick(this)
	end,
	
	OnTooltipShow = function(tooltip)
		if not tooltip or not tooltip.AddLine then return end
		tooltip:AddLine( "EpicMusicPlayer" )
		tooltip:AddDoubleLine( emp:GetCurrentArtistName(), emp:GetCurrentSongName())
		--tooltip:AddDoubleLine( "Game Time", format(whiteFmt, gameTime) )
		tooltip:AddLine( date(fullDate) )
	end,
})

function EpicMusicPlayerBroker:OnEnable(first)	
	--self:RegisterMessage("EMPUpdateStop")
	self:RegisterMessage("EMPUpdatePlay")
	--self:RegisterMessage("EMPUpdateTime")
	--self:RegisterMessage("EMPUpdateRandom")
end

function EpicMusicPlayerBroker:OnDisable()
   self:UnregisterAllEvents("EpicMusicPlayerBroker")
end

function EpicMusicPlayerBroker:EMPUpdatePlay(event, artist, songname, length)
	--self.obj.text = songname
end




--empbroker:EnableMouse(true)
--empbroker:EnableMouseWheel(true) 
--empbroker:SetScript("OnMouseWheel", 
--	function()
--		EpicMusicPlayer:DisplyScrollHandler()
--	end
--)