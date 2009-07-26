local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")

function EpicMusicPlayer:ReciveMessage(prefix, message, distribution, sender)
	--EpicMusicPlayer:Debug("ReciveMessage", prefix, message, distribution, sender)
	EpicMusicPlayer:Debug("Message:", message)
	local a, b, title, artist, album, length, path = strfind(message, "(.+):(.+):(.+):(.+):(.+)");
	
	DEFAULT_CHAT_FRAME:AddMessage("|TInterface\\AddOns\\EpicMusicPlayer\\icon.tga:18|t |c"
		..self:ToHex(EpicMusicPlayer.db.profile.artistcolour).."\124Hepicmusicplayer:"..message.."\124h["..title.."]\124h\124r|r")
end

function EpicMusicPlayer:SendSearch(message, player)
	--if message and player then
		self:SendCommMessage("EpicMusicPlayer", message, "WHISPER", player)
	--end
end