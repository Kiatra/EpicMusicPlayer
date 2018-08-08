local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")

------------------------------------------------------------------------------
-- send song info
-------------------------------------------------------------------------------
function EpicMusicPlayer:SpamDefault()
	self:Spam(db.defaultchannel)
end

function EpicMusicPlayer:Spam(chat)
	local song = EpicMusicPlayer:GetCurrentSong()
	local title = song.Song
	local artist = song.Artist
	local album = song.Album
	local text = ""

	text = title
	if(artist~="") then
		text = artist.." - "..text
	end
	if(artist~="") then
		text = text.." ("..album..")"
	end
	text = "EpicMusicPlayer: "..text

	if(chat == "WHISPER") then
		if(self.whisper)then
			target = self.whisper
		else
			return
		end
	end

	if(chat == "TARGET") then
		target = UnitName("target")
		chat = "WHISPER"
		if(not target) then
			EpicMusicPlayer:Print(L["No Target"])
			return
		end
	end

	SendChatMessage(text,chat,nil,target)
end

function EpicMusicPlayer:PrintSongToChat(song)
	if(self.db.spam) then
		DEFAULT_CHAT_FRAME:AddMessage("|TInterface\\AddOns\\EpicMusicPlayer\\media\\icon:18|t |c"
		..self:ToHex(self.db.artistcolour)..song.Artist.."|r - |c"..self:ToHex(self.db.titlecolour)..song.Song)
	end
end
