local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")

local playlists

local listnames = {}
local searchlist = {} --serach result
playedhistory = {}
playedhistory[1]= {ListName = "Playedhistory"}
local historymax = 25
local historypointer = 1
local db

-- check playlist - is there a playlist, with content ?
function EpicMusicPlayer:CheckPlayList()
	db = EpicMusicPlayer.db.profile
	playlists = {}
	local ok = true
	local firstlist
	-- put the list that will be saved and lists that will not be saved in one list
	if EpicMusicPlayer_PlayList then
		for i, list in ipairs(EpicMusicPlayer_PlayList) do
			playlists[i] = list
		end
		firstlist = EpicMusicPlayer_PlayList[1]
	else
		ok = false;
	end
	
	if (table.getn(playlists) < 1) then
		ok = false;
	end	
	
	if (ok == false) then
		self:Print(L["Playlist not found."])
		-- no playlist found, create dummy playlist
		db.list = 1
	    db.song = 2
		
		playlists = {
	        { -- list 1
	            {
	                ["ListName"] = "Common",
					["PlaylistVersion"] = "buildin",
					["MusicDir"] = "",
	            }, -- [1]
	            {
	                ["Album"] = "", 
					["Song"] = "See howto.html in the EpicMusicPlayer folder.",
					["Name"] = "nix",
					["Length"] = 10, 
					["Artist"] = "Playlist not found.",
	            }, -- [3]
	        },
		}
	end
	
	if firstlist and firstlist[1] and firstlist[1].MusicDir then
		musicdir = firstlist[1].MusicDir
	else
		musicdir = "MyMusic\\"
		self:Print("Musicdir not set. Setting to: <wowdir>\\MyMusic\\")
	end
	
	EpicMusicPlayer.playlists = playlists
	EpicMusicPlayer:UpdateListnames()
	EpicMusicPlayer.musicdir = musicdir
	return musicdir;
end

local function getCopy(song)
	return {
		["Album"] = song.Album,
		["Song"] = song.Song,
		["Name"] = song.Name,
		["Length"] = song.Length,
		["Artist"] =  song.Artist,
	}
end

function EpicMusicPlayer:AddSongToHistory(song)
	if not song then return end
	historypointer = historypointer + 1
	EpicMusicPlayer:Debug("AddSongToHistory","#playedhistory=",#playedhistory,"pointer",historypointer)
	if historypointer > 1 and historypointer <= historymax then 
		playedhistory[historypointer] = song
	else
		
		historypointer = 2
		playedhistory[2] = getCopy(song)
		EpicMusicPlayer:Debug("AddSongToHistory reset","pointer",historypointer)
	end	
end

function EpicMusicPlayer:GetSongFromHistory()
	if #playedhistory < 2 then return end -- add first
	historypointer = historypointer - 1
	EpicMusicPlayer:Debug("GetSongFromHistory","#playedhistory=",#playedhistory,"pointer",historypointer)
	if historypointer > 1 and historypointer <= historymax then 
		return playedhistory[historypointer] 
	else
		historypointer = #playedhistory
		EpicMusicPlayer:Debug("GetSongFromHistory reset","pointer",historypointer)
		return playedhistory[historymax] 
	end	
end

------------------------------------------------------------------------------------------- 
--  retern the next song from given index
-------------------------------------------------------------------------------------------
function EpicMusicPlayer:GetNextSong(listIndex,songIndex, loopList)
	--EpicMusicPlayer:Debug("GetNext","listIndex=",listIndex,"songIndex=",songIndex,"#playlists=",#playlists)
	--EpicMusicPlayer:Debug("loopList", loopList)
	if not listIndex or listIndex > #playlists or listIndex < 1 then
		listIndex = 1
		songIndex = 2
	end
	if not songIndex or songIndex < 2 then 
		songIndex = 2
	else
		songIndex = songIndex +1 -- we want the next song	
	end
	if loopList then -- try to stay on list
		local list = playlists[listIndex]
		if list and songIndex > #list then 
			songIndex = 2 
		end
	end
	
	--list could be emty check until a list with a valid song is found
	for i = 1, 2 do
		-- loop all lists starting at given listIndex
		for listi = listIndex, #playlists do
			--EpicMusicPlayer:Debug("GetNext loop=",i,"listi=",listi)
			
			if EpicMusicPlayer:GetSong(listi,songIndex) then
				--EpicMusicPlayer:Debug("GetNext: returning","listi=",listi,"songIndex=",songIndex)
				return EpicMusicPlayer:GetSong(listi, songIndex), listi,songIndex
			end
			
			local list = playlists[listi]
			local first = list[1] 
			if first and (first.ListName == db.badlist) then --skip badlist
				listi = listi + 1
				--list = playlists[listi]
			end
			songIndex = 2
		end
		listIndex = 1 -- check remainig lists
	end
	
	--all lists checked still not good oO
	self:Print(L["Playlist error oO Playlist maybe empty."]);	
	
	--this will set the buildin playlist 
	self:CheckPlayList()
	return EpicMusicPlayer:GetSong(1, 2), 1,2	
end

-- newList list or Index
function EpicMusicPlayer:CopySong(newList, song)
	local newListIndex
	if type(newList) == "number" then
		newList, newListIndex = playlists[newList]
	end

	if newList then 
		table.insert(newList,getCopy(song))
		EpicMusicPlayer:Print(L["Copied song"]..": "..song.Song..L[" to List: "]..newList[1].ListName)
		EpicMusicPlayer:PlayListGuiUpdate()
		return true
	else
		EpicMusicPlayer:Print(L["List not found"])
		return false
	end
end

function EpicMusicPlayer:MoveSong(oldListIndex, newListIndex, songIndex)
    if(oldListIndex == newListIndex)then
		self:Print(L["Song is already in that list."])
		return false
	end
	local oldlist = playlists[oldListIndex]
	local newlist = playlists[newListIndex]
	if oldlist and newlist then 
		local song = oldlist[songIndex]
		if song then 
			table.remove(oldlist,songIndex)
			table.insert(newlist,getCopy(song))
			if not silent then
				EpicMusicPlayer:PlayListGuiUpdate()
				self:Print(L["Moved song X from list Y to list Z."]("\""..song.Song.."\"","\""..oldlist[1].ListName.."\"","\""..newlist[1].ListName.."\""))
				return true
			end
		end
	end	
	return true
end

function EpicMusicPlayer:RemoveSong(listIndex, songIndex, silent)
	local list = playlists[listIndex]
	if list then 
		local song = list[songIndex]
		if song then 
			table.remove(list,songIndex)
			if not silent then
			self:Print(L["Removed song"].."\""..song.Song..
				"\" "..L["from list"].." \""..list[1].ListName.."\".")
			
			EpicMusicPlayer:PlayListGuiUpdate()
			return true
			end
		end
	end	
	return false
end

-- add playlist
function EpicMusicPlayer:AddPlayList(name, newlist, save)
    local foundindex = EpicMusicPlayer:GetListIndex(name)
	if(foundindex) then
		self:Print(L["Playlist"].." \""..name.."\" "..L["already exists."])
		return false;
	end
	
	if not newlist then
		newlist = { 
			{
				["ListName"] = name,
			}, -- [1]
		} -- [1]
    end
	--lastsearch should be last list
	local lastsearch, listIndex = EpicMusicPlayer:GetListByName("lastsearch")
	if lastsearch then
		playlists[listIndex] = newlist -- replace searchlist with new list
		playlists[#playlists+1] = lastsearch --append searchlist at the end
	else
		-- add the list to the right table
		if save then
			table.insert(EpicMusicPlayer_PlayList, newlist)
			for i, list in ipairs(EpicMusicPlayer_PlayList) do
				playlists[i] = list
			end
		else
			table.insert(playlists, newlist)
		end
	end
	
	self:Print(L["Added playlist"].." \""..name.."\".")
	self:UpdateListnames()
	EpicMusicPlayer:PlayListGuiUpdate(true)
	return true
end

function EpicMusicPlayer:GetRandomSong(listIndex)
	--todo random over multipe playlist
	songIndex = math.random(2, #playlists[listIndex])
	return EpicMusicPlayer:GetSong(listIndex, songIndex)
end

-- return the index of the list with the given name or nil if not found
function EpicMusicPlayer:GetListIndex(name)
	for i, list in ipairs(playlists) do
		if(string.lower(list[1].ListName)==string.lower(name))then
			return i
		end
	end
	return nil
end

-- remove playlist 
function EpicMusicPlayer:RemovePlayList(name)
    
    if #playlists < 2 then
		self:Print(L["Last playlist can not be removed."])
		return
	end
	
	local list, listIndex = self:GetListByName(name)
    if not list then
		self:Print(L["Playlist"].." \""..name.."\" "..L["not found."])
		return
	end

	if(listIndex == self:GetCurrentListIndex())then
		self:Stop()
	end
	
	table.remove(playlists, listIndex)
	
	-- remove from saved list if present
	for i, list in ipairs(EpicMusicPlayer_PlayList) do
		if(string.lower(list[1].ListName)==string.lower(name))then
			table.remove(EpicMusicPlayer_PlayList, i)
		end
	end
	
	self:Print(L["Playlist"].." \""..name.."\" "..L["removed."])
	self:UpdateListnames()
	EpicMusicPlayer:PlayListGuiUpdate(true)
end

-- update the list with the listnames
function EpicMusicPlayer:UpdateListnames()
	listnames = {};
	for i, list in ipairs(playlists) do
		listnames[list[1].ListName] = list[1].ListName
	end
end

------------------------------------------------------------------------------
-- search functions
-------------------------------------------------------------------------------
local temp = {}
local function contains(source, patterns)
	source = string.lower(source)
	--local found = false
	for k, v in pairs(patterns) do
		if not string.find(source, v) then
			return false
			--found = found and true
		end
	end
	return true
end

function EpicMusicPlayer:Search(pattern)
	if not pattern or pattern == "" then
        --self.IsSearching = false
        return
    end
    
    pattern = strtrim(string.lower(pattern))
	temp = { strsplit(" ", pattern) }

    searchlist = {
       { 
			["ListName"] = "lastsearch",
       } -- [1]
    }

	for x, list in ipairs(playlists) do
		if(list[1].ListName ~= "lastsearch")then
			for i, song in ipairs(list) do
				if i > 1 and (contains(song.Song, temp) or contains(song.Artist, temp) or contains(song.Album, temp)) then
					table.insert(searchlist, song)
				end
				if(#searchlist>500) then break end 
			end
		end
		if(#searchlist>500) then break end 
	end
	
	--update the lastsearch list
    local lastsearch = EpicMusicPlayer:GetListIndex("lastsearch")
	if(lastsearch)then
		playlists[lastsearch] = searchlist
		selectedlist = lastsearch --set selected list
	else
		table.insert(playlists, searchlist)
		selectedlist = #playlists --set selected list
	end
end

------------------------------------------------------------------------------
-- get song/list info functions
-------------------------------------------------------------------------------

--function EpicMusicPlayer:GetCurrentList()
--	return playlists[db.list]
--end

function EpicMusicPlayer:GetListByIndex(index)
	return playlists[index]
end

function EpicMusicPlayer:GetListByIndex(index)
	return playlists[index]
end

function EpicMusicPlayer:GetListByName(name)
	for i, list in ipairs(playlists) do
		if(string.lower(list[1].ListName)==string.lower(name))then
			return list, i
		end
	end
end

function EpicMusicPlayer.GetListnames()
	return listnames
end

function EpicMusicPlayer:GetListName(index)
	local list = playlists[index]
	if list then
		return list[1].ListName
	end
end

function EpicMusicPlayer:GetSong(listIndex, songIndex)
	if not songIndex or notlistIndex or songIndex < 2 then
		EpicMusicPlayer:Debug("listIndex or songIndex not vaild.",listIndex, songIndex)
		return nil
	end
	local list = playlists[listIndex]
	if list then
		local song = list[songIndex]
		if song then 
			return song
		else
			EpicMusicPlayer:Debug("song", songIndex,"not found in list", listIndex)
		end
	else
		EpicMusicPlayer:Debug("list", listIndex ,"not found.")
	end
end
