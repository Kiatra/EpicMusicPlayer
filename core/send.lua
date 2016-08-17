local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local _G = _G

function EpicMusicPlayer:ReciveMessage(prefix, message, distribution, sender)
	--EpicMusicPlayer:Debug("ReciveMessage", prefix, message, distribution, sender)
	--EpicMusicPlayer:Debug("Message:", message)
	local a, b, title, artist, album, length, path = _G.strfind(message, "(.+):(.+):(.+):(.+):(.+)");

	_G.DEFAULT_CHAT_FRAME:AddMessage("|TInterface\\AddOns\\EpicMusicPlayer\\media\\icon.tga:18|t |c"
		..self:ToHex(self.db.artistcolour).."\124Hepicmusicplayer:"..message.."\124h["..title.."]\124h\124r|r")
end

function EpicMusicPlayer:SendSearch(message, player)
	--if message and player then
		self:SendCommMessage("EpicMusicPlayer", message, "WHISPER", player)
	--end
end
