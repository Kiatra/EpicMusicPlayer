local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")
local debug = EpicMusicPlayer.Debug
local playlists = {}

local listnames = {}
local searchlist = {} --serach result
local playedhistory = {}
playedhistory[1]= {ListName = "Playedhistory"}
local historymax = 10
local historypointer = 2
local currentPlaylistVersion = "4.0"
local _G, ipairs, pairs, string, table, type, math = _G, ipairs, pairs, string, table, type, math

local function getCopy(song)
	return {
		["Album"] = song.Album,
		["Song"] = song.Song,
		["Name"] = song.Name,
		["Length"] = song.Length,
		["Artist"] = song.Artist,
		["Id"] = song.Id,
	}
end

function EpicMusicPlayer:AddSavedPlayList()
	-- put the list that will be saved and lists that will not be saved in one list
	if _G.EpicMusicPlayer_PlayList then
		for i, list in ipairs(_G.EpicMusicPlayer_PlayList) do
			playlists[#playlists +1] = list
		end
	end
end

-- check playlist - is there a playlist, with content ?
function EpicMusicPlayer:CheckPlayList()
	db = self.db

	EpicMusicPlayer:AddSavedPlayList()
	if (table.getn(playlists) < 1) then
		self:Print(L["Playlist not found."])
		--no playlist found, create dummy playlist
		playlists = {
	        ["ListName"] = "Common",
					["PlaylistVersion"] = "buildin",
	    		{
	        			["Album"] = "",
								["Song"] = "See howto.html in the EpicMusicPlayer folder.",
								["Name"] = "nix",
								["Length"] = 10,
								["Artist"] = "Playlist not found.",
	        }
	    }
	end

	if db.list > #playlists then db.list = 1 end
	if db.song > #playlists[db.list] then db.song = 1 end
	EpicMusicPlayer.playlists = playlists
	EpicMusicPlayer:UpdateListnames()
end

function EpicMusicPlayer:AddSongToHistory(song, listIndex,songIndex)
	if not song then return end
	song.listIndex = listIndex
	song.songIndex = songIndex
	table.insert(playedhistory,song)
	if #playedhistory > historymax+1 then
		table.remove(playedhistory,2)
	end
	historypointer = #playedhistory
end

-- queue currently supports only one song
local queue = nil

function EpicMusicPlayer:ClearQueue()
	queue = nil
end

function EpicMusicPlayer:RemoveSongFromQueue()
	-- queue currently supports only one song
	queue = nil
end

function EpicMusicPlayer:GetSongFromQueue()
	if queue then
		local listIndex , songIndex = queue.listIndex, queue.songIndex
		queue = nil
	  return listIndex, songIndex
  end
	return nil
end


function EpicMusicPlayer:AddToQueue(listIndex, songIndex, songName)
	-- queue currently supports only one song
	queue = {}
	queue.listIndex = listIndex
	queue.songIndex = songIndex
end

function EpicMusicPlayer:GetNextSongFromHistory()
	if historypointer < #playedhistory then
		historypointer = historypointer + 1
		local song = playedhistory[historypointer]
		if song then
			return song, song.listIndex, song.songIndex
		end
	end
	return nil
end

function EpicMusicPlayer:GetLastSongFromHistory()
	historypointer = historypointer - 1
	if historypointer < 2 then historypointer = 2 end
	local song = playedhistory[historypointer]
	if song then
		return song, song.listIndex, song.songIndex
	end
	return nil
end

function EpicMusicPlayer:GetLastSong(listIndex,songIndex, loopList)
	songIndex = songIndex -1
	if songIndex < 1 then songIndex = 1 end
	local song = EpicMusicPlayer:GetSong(listIndex,songIndex)
	if song then
		return song, listIndex,songIndex
	else
		return EpicMusicPlayer:GetSong(1, 1), 1,1
	end
end

-------------------------------------------------------------------------------------------
--  retern the next song from given index
-------------------------------------------------------------------------------------------
function EpicMusicPlayer:GetNextSong(listIndex, songIndex, loopList)

	--queuelistIndex, queuesongIndex = EpicMusicPlayer:GetNextFromQueue()
	--if queuelistIndex and queuesongIndex then
	--	listIndex, songIndex = queuelistIndex, queuesongIndex
	--end

	if not listIndex or listIndex > #playlists or listIndex < 1 then
		listIndex = 1
		songIndex = 1
	end
	if not songIndex or songIndex < 1 then
		songIndex = 1
	else
		songIndex = songIndex + 1 -- we want the next song
	end
	if loopList then -- try to stay on list
		local list = playlists[listIndex]
		if list and songIndex > #list then
			songIndex = 1
		end
	end

	--list could be emty check until a list with a valid song is found
	for i = 1, 2 do
		-- loop all lists starting at given listIndex
		for listi = listIndex, #playlists do
			if EpicMusicPlayer:GetSong(listi,songIndex) then
				return EpicMusicPlayer:GetSong(listi, songIndex), listi,songIndex
			end

			local list = playlists[listi]
			local first = list[1]
			songIndex = 1
		end
		listIndex = 1 -- check remainig lists
	end

	--all lists checked still not good oO
	self:Print(L["Playlist error oO Playlist maybe empty."]);

	--this will set the buildin playlist
	self:CheckPlayList()
	return EpicMusicPlayer:GetSong(1, 1), 1,1
end

-- newList list or Index
function EpicMusicPlayer:CopySong(song, dstList)
	if type(dstList) == "number" then
		dstList, _ = playlists[newList]
	end

	if dstList and song then
		table.insert(dstList,getCopy(song))
		EpicMusicPlayer:Print(string.format(L["Copied song %s to List %s."],song.Song,dstList.listName))
		EpicMusicPlayer:PlayListGuiUpdate()
		return true
	else
		EpicMusicPlayer:Print(L["List or song not found"])
		return false
	end
end

function EpicMusicPlayer:CopyAllSelectedSongs(srcList, dstList)
	if type(srcList) == "number" then srcList, _ = playlists[srcList] end
	if type(dstList) == "number" then dstList, _ = playlists[dstList] end
	for i, song in ipairs(srcList) do
		if song.isChecked then
			self:CopySong(song, dstList)
		end
	end
end

function EpicMusicPlayer:CopyAllSongs(srcList, dstList)
	if type(srcList) == "number" then srcList, _ = playlists[srcList] end
	if type(dstList) == "number" then dstList, _ = playlists[dstList] end
	for i, song in ipairs(srcList) do
		self:CopySong(song, dstList)
	end
end


function EpicMusicPlayer:ClearListSelection(listIndex)
	for i, song in ipairs(self:GetListByIndex(listIndex)) do
		if song.isChecked then song.isChecked = false end
	end
	self:PlayListGuiUpdate()
end

function EpicMusicPlayer:GetNumberOfSelectedSongs(listIndex)
  local numSeleced = 0
	for i, song in ipairs(self:GetListByIndex(listIndex)) do
		if song.isChecked then numSeleced = numSeleced + 1 end
	end
	return numSeleced
end

function EpicMusicPlayer:RemoveSong(listIndex, songIndex, silent)
	local list = playlists[listIndex]
	if list then
		local song = list[songIndex]
		if song then
			table.remove(list,songIndex)
		end
		if not silent and song.Song then
			self:Print(L["Removed song"].."\""..song.Song..
			"\" "..L["from list"].." \""..list.listName.."\".")
			return true
		end
		EpicMusicPlayer:PlayListGuiUpdate()
	end
	return false
end

function EpicMusicPlayer:CreatePlayListDialog(acceptfunction)
	_G.StaticPopupDialogs["EPICMUSICPLAYER_ADDPLAYLIST"] = {
		text = L["Enter playlist name:"],
		button1 = _G.ACCEPT,
		button2 = _G.CANCEL,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
		OnAccept = acceptfunction or function (self, data, data2)
			local text = self.editBox:GetText()
			EpicMusicPlayer.tempListName = text
      EpicMusicPlayer:Debug("EpicMusicPlayer.tempListName: ", EpicMusicPlayer.tempListName)
			EpicMusicPlayer:AddPlayList(text, nil, true)
		end,
		hasEditBox = true,
		OnShow = function (self, data)
			 EpicMusicPlayer:ClearSearchFocus()
       self.editBox:SetText(L["New List"])
			 self.editBox:HighlightText(0, self.editBox:GetNumLetters())
		end,
		EditBoxOnTextChanged = function (self, data)   -- careful! 'self' here points to the editbox, not the dialog
			if self:GetText() ~= "" then
				self:GetParent().button1:Enable()          -- self:GetParent() is the dialog
			else
				self:GetParent().button1:Disable()
			end
			self:SetAutoFocus(true)
		end
	}
	_G.StaticPopup_Show("EPICMUSICPLAYER_ADDPLAYLIST")
end

function EpicMusicPlayer:ExportPlayListDialog(listname)
	_G.StaticPopupDialogs["EPICMUSICPLAYER_EXPORTPLAYLIST"] = {
		text = L["Exported playlist:"],
		button1 = _G.ACCEPT,
		--button2 = _G.CANCEL,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
		OnShow = function (self, data)
			EpicMusicPlayer:ClearSearchFocus()
      self.editBox:SetText(EpicMusicPlayer:GetExport(listname))
		end,
		hasEditBox = true,
		EditBoxOnTextChanged = function (self, data)   -- careful! 'self' here points to the editbox, not the dialog
				self:GetParent().button1:Enable()          -- self:GetParent() is the dialog
				self:SetAutoFocus(true)
				self:HighlightText(0, self:GetNumLetters())
		end
	}
	_G.StaticPopup_Show("EPICMUSICPLAYER_EXPORTPLAYLIST")
end

function EpicMusicPlayer:ImportDialog(listname)
	_G.StaticPopupDialogs["EPICMUSICPLAYER_IMPORTPLAYLIST"] = {
		text = L["Import playlist:"],
		button1 = _G.ACCEPT,
		button2 = _G.CANCEL,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
		OnShow = function (self, data)
    self.editBox:SetText(EpicMusicPlayer:GetExport(listname))
		end,
		OnAccept = function (self, data, data2)
			local text = self.editBox:GetText()
			EpicMusicPlayer:ImportPlayList(text)
		end,
		hasEditBox = true,
		EditBoxOnTextChanged = function (self, data)   -- careful! 'self' here points to the editbox, not the dialog
			if self:GetText() ~= "" then
				self:GetParent().button1:Enable()          -- self:GetParent() is the dialog
			else
				self:GetParent().button1:Disable()
			end
		end
	}
	_G.StaticPopup_Show("EPICMUSICPLAYER_IMPORTPLAYLIST")
end

function EpicMusicPlayer:ImportPlayList(text)
	func, errorMessage = loadstring(text)
	self:Debug("func:", func, errorMessage)
	if func then
		self:AddPlayList(nil, func(), true)
	else
		print(errorMessage)
	end
end

function serializeTable(val, name, skipnewlines, depth)
    skipnewlines = skipnewlines or false
    depth = depth or 0

    local tmp = string.rep(" ", depth)

    if name then tmp = tmp .. name .. " = " end

    if type(val) == "table" then
        tmp = tmp .. "{" .. (not skipnewlines and "\n" or "")

        for k, v in pairs(val) do
					  if type(k) == "number" then k = nil end
            tmp =  tmp .. serializeTable(v, k, skipnewlines, depth + 1) .. "," .. (not skipnewlines and "\n" or "")
        end

        tmp = tmp .. string.rep(" ", depth) .. "}"
    elseif type(val) == "number" then
        tmp = tmp .. tostring(val)
    elseif type(val) == "string" then
        tmp = tmp .. string.format("%q", val)
    elseif type(val) == "boolean" then
        tmp = tmp .. (val and "true" or "false")
    else
        tmp = tmp .. "\"[inserializeable datatype:" .. type(val) .. "]\""
    end

    return tmp
end

function EpicMusicPlayer:GetExport(listIndex)
  list = self:GetListByIndex(listIndex)
  local export = ""
	if list then
		export = serializeTable(list, nil, false, 0)
		export = strjoin(" ","return",export)
	end
	return export
end

function EpicMusicPlayer:ExportPlayList(listname)
  list = self:GetListByName(listname)
	self:Debug("ExportPlayList", list)
end

function EpicMusicPlayer:AddPlayList(name, newlist, save)
	EpicMusicPlayer:AddPlayList(name, newlist, save, false)
end

-- add playlist
function EpicMusicPlayer:AddPlayList(name, newlist, save, replace)
  if not name and newlist.listName then name = newlist.listName end

	local foundindex = EpicMusicPlayer:GetListIndex(name)
	if(foundindex) then
		if (replace) then
			table.remove(playlists, foundindex)
			self:Print(string.format(L["Replaceing already existing playlist %s with the new one."],name))
		else
			self:Print(string.format(L["Playlist %s already exists."],name))
		    return false;
		end
	end

	if not newlist then
		newlist = {
			["listName"] = name,
			["playlistVersion"] = currentPlaylistVersion,
		} -- [1]
	end

	if save then
		if not _G.EpicMusicPlayer_PlayList then
			_G.EpicMusicPlayer_PlayList = {}
		end
		table.insert(_G.EpicMusicPlayer_PlayList, newlist)
	end
	--lastsearch should be last list
	local lastsearch, listIndex = EpicMusicPlayer:GetListByName("lastsearch")
	if lastsearch then
		playlists[listIndex] = newlist -- replace searchlist with new list
		playlists[#playlists+1] = lastsearch --append searchlist at the end
	else
		table.insert(playlists, newlist)
	end

	--self:Print(string.format(L["Added playlist %s."],name))
	self:UpdateListnames()
	EpicMusicPlayer:PlayListGuiUpdate(true)
	return true
end

function EpicMusicPlayer:GetRandomSong(listIndex)
	local listnumber = listIndex
	if listnumber == nil then return EpicMusicPlayer:GetSong(0, 0), 0, 0 end
	local songnumber = 0
	--shuffle over multipe playlist's
	if self.db.shuffleAll then
		--count number of songs in each list
		local totalsongs = 0
		for i, list in ipairs(playlists) do
			totalsongs = totalsongs + #list
		end
		--get a random song out of all songs
		songnumber = math.random(1, totalsongs)
		--find the list with the just selected song

		for i, list in ipairs(playlists) do
			if songnumber > #list then
				songnumber = songnumber - #list
			else
				listnumber = i
				break
			end
		end
		if songnumber < 1 then songnumber = 1 end
	else
		songnumber = math.random(1, #playlists[listnumber])
	end

	return EpicMusicPlayer:GetSong(listnumber, songnumber), listnumber, songnumber
end

-- return the index of the list with the given name or nil if not found
function EpicMusicPlayer:GetListIndex(value)
  if type(value) == "string" then
		for i, list in ipairs(playlists) do
			if string.lower(list.listName) == string.lower(value) then
				return i
			end
		end
	elseif type(value) == "table" then
		for i, list in ipairs(playlists) do
			if list == value then
				return i
			end
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
		self:Print(string.format(L["Playlist %s not found."],name))
		return
	end

	_G.StaticPopupDialogs["EPICMUSICPLAYER_REMOVEPLAYLIST"] = {
		text = string.format(L["Remove playlist %s?"],name),
		button1 = _G.ACCEPT,
		button2 = _G.CANCEL,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
		OnAccept = function()
			if(listIndex == self:GetCurrentListIndex())then
				self:Stop()
			end

			table.remove(playlists, listIndex)

			-- remove from saved list if present
			if _G.EpicMusicPlayer_PlayList then
				for i, list in ipairs(_G.EpicMusicPlayer_PlayList) do
					if(string.lower(list.listName)==string.lower(name))then
						table.remove(_G.EpicMusicPlayer_PlayList, i)
					end
				end
			end

			self:Print(string.format(L["Playlist %s removed."],name))
			self:UpdateListnames()
			EpicMusicPlayer:PlayListGuiUpdate(true)

		end,
	}
	_G.StaticPopup_Show("EPICMUSICPLAYER_REMOVEPLAYLIST")
end

function EpicMusicPlayer:RemoveGameMusicLists()
	for i=#playlists,1,-1 do
		list = playlists[i]
		if list and list[1] and list[1].Id == true then
			table.remove(playlists, i)
		end
	end

	self:UpdateListnames()
end

-- update the list with the listnames
function EpicMusicPlayer:UpdateListnames()
	listnames = {};
	for i, list in ipairs(playlists) do
		listnames[list.listName] = list.listName
	end
end


------------------------------------------------------------------------------
-- search functions
-------------------------------------------------------------------------------
local temp = {}
local function contains(source, patterns)
	if source then
		source = string.lower(source)
		--local found = false
		for k, v in pairs(patterns) do
			if not string.find(source, v) then
				return false
				--found = found and true
			end
		end
	end
	return true
end

function EpicMusicPlayer:Search(pattern)
	if not pattern or pattern == "" then
        --self.IsSearching = false
        return
    end

    pattern = _G.strtrim(string.lower(pattern))
		temp = { _G.strsplit(" ", pattern) }

    searchlist = {
			listName = "lastsearch",
			locked =  "true",
    }

	for x, list in ipairs(playlists) do
		if(list.listName  ~= "lastsearch")then
			for i, song in ipairs(list) do
				if contains(song.Song, temp) or contains(song.Artist, temp) or contains(song.Album, temp) or contains(song.Name, temp) then
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
		EpicMusicPlayer.selectedlist = lastsearch --set selected list
	else
		table.insert(playlists, searchlist)
		EpicMusicPlayer.selectedlist = #playlists --set selected list
	end
	self:UpdateListnames()
	EpicMusicPlayer:PlayListGuiUpdate(true)
end

------------------------------------------------------------------------------
-- get song/list info functions
-------------------------------------------------------------------------------

function EpicMusicPlayer:GetListByIndex(index)
	return playlists[index]
end

function EpicMusicPlayer:GetListByName(name)
  if name then
		for i, list in ipairs(playlists) do
			if(string.lower(list.listName )==string.lower(name))then
				return list, i
			end
		end
	end
end

function EpicMusicPlayer.GetListnames()
	return listnames
end

function EpicMusicPlayer:GetListName(index)
	local list = playlists[index]
	if list then
		return list.listName
	end
end

function EpicMusicPlayer:IsListLocked(index)
	local list = playlists[index]
	if list and list.locked then
		return true
	end
	return false
end

function EpicMusicPlayer:GetSong(listIndex, songIndex)
 if not songIndex or not listIndex then
		EpicMusicPlayer:Error("listIndex or songIndex not vaild.",listIndex, songIndex)
		return nil
	end

	if type(listIndex) ~= "number" then listIndex = self:GetListIndex(listIndex) end

	local list = playlists[listIndex]
	if list then
		local song = list[songIndex]
		if song and song.Name then
			return song
		else
			EpicMusicPlayer:Error("song", songIndex,"not found in list", listIndex)
		end
	else
		EpicMusicPlayer:Error("list", listIndex ,"not found.")
	end
end

local function findSongByName(name)
	if playlists then
		for i, list in ipairs(playlists) do
			for i, song in ipairs(list) do
				if song.Name == name then
					return song.Id
				end
			end
		end
	end
end

function EpicMusicPlayer:AddSogIdToOldSavedSongs()
	if _G.EpicMusicPlayer_PlayList then
		for i, list in ipairs(_G.EpicMusicPlayer_PlayList) do
			debug("updating list:"..list.listName)
			for i, song in ipairs(list) do
				if song.WoW and not song.Id then
					local id = findSongByName(song.Name)
					debug("song ID for song ", song.Name, id)
					if id then song.Id = id end
				end
			end
		end
	end
end

