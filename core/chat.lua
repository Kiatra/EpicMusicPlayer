local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")

------------------------------------------------------------------------------
-- send song info
-------------------------------------------------------------------------------
function EpicMusicPlayer:SpamDefault()
	self:Spam(db.defaultchannel)
end

local origSetItemRef = SetItemRef;
SetItemRef = function(...)
	local link, text, button = ...;
	if type(text) == "string" and text.find(text,"epicmusicplayer") and not IsModifiedClick() then
		return ShowSongTip(link);
	end
	return origSetItemRef(...);
end

function ShowSongTip(link)
	local a, b, c, title, artist, album, length, path = strfind(link, "(.+):(.+):(.+):(.+):(.+):(.+)");

	local lastsearch, listIndex = EpicMusicPlayer:GetListByName("lastsearch")
	if lastsearch then
		table.insert(lastsearch,
		{
			["Album"] = album,
			["Song"] = title,
			["Name"] = path,
			["Length"] = tonumber(length),
			["Artist"] =  artist,
		})


		db.song = #lastsearch
		db.list = listIndex
		EpicMusicPlayer:Play()
	end
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
	text = L["[~mymusic~] "]..text

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

	if album == "ingame" and target then
		--local a, b, mptext, title, artist, album, quality, genre = strfind(link, "(.+):(.+):(.+):(.+):(.+):(.+)");
		local songlink = strjoin(":",title,artist,album,song.Length, song.Name)
		EpicMusicPlayer:SendSearch(songlink, target)
	else
		if(db.link) then
			local link = title.." "..artist
			link  = string.gsub(link, " ", "+")
			link = "http://www.youtube.com/results?search_query="..link.."&search_type=&aq=f"

			SendChatMessage(link,chat,nil,target)
		end
    end
end

function EpicMusicPlayer:PrintSongToChat(song)
	if(self.db.spam) then
		DEFAULT_CHAT_FRAME:AddMessage("|TInterface\\AddOns\\EpicMusicPlayer\\media\\icon.tga:18|t |c"
		..self:ToHex(self.db.artistcolour)..song.Artist.."|r - |c"..self:ToHex(self.db.titlecolour)..song.Song)
	end
end
