local emp = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer") ---@type any
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")
local playlists = {}

local listnames = {}
local searchlist = {} --serach result
local playedhistory = {}
playedhistory[1]= {ListName = "Playedhistory"}
local historymax = 10
local historypointer = 2
local currentPlaylistVersion = "5.0"
local _G, ipairs, pairs, string, table, type, math = _G, ipairs, pairs, string, table, type, math

local function getCopy(song)
	return {
		[ "album" ] = song.album,
		[ "title" ] = song.title,
		[ "path" ] = song.path,
		[ "duration" ] = song.duration,
		[ "artist"] = song.artist,
		[ "id" ] = song.id,
	}
end

function emp:AddSavedPlayList()
	-- put the list that will be saved and lists that will not be saved in one list
	if EpicMusicPlayer_PlayList then
		for i, list in ipairs(EpicMusicPlayer_PlayList) do
			list.saved = true --lets flag lists that will be persisted
			playlists[#playlists +1] = list
		end
	end
end

-- check playlist - is there a playlist, with content ?
function emp:CheckPlayList()
	db = self.db

	emp:AddSavedPlayList()
	if #playlists < 1 then
		self:Print(L["Playlist not found."])
		--no playlist found, create dummy playlist
		playlists = {
	        listName = "Common",
			playlistVersion = "5.0",
	    	{
	        	album = "",
				title = "Error.",
				path = "nix",
				duration = 10,
				artist = "Playlist not found.",
	        }
	    }
	end

	if db.list > #playlists then db.list = 1 end
	if db.song > #playlists[db.list] then db.song = 1 end
	emp.playlists = playlists
	emp:UpdateListnames()
end

function emp:AddSongToHistory(song, listIndex,songIndex)
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

function emp:ClearQueue()
	queue = nil
end

function emp:RemoveSongFromQueue()
	-- queue currently supports only one song
	queue = nil
end

function emp:GetSongFromQueue()
	if queue then
		local listIndex , songIndex = queue.listIndex, queue.songIndex
		queue = nil
	  return listIndex, songIndex
  end
	return nil
end


function emp:AddToQueue(listIndex, songIndex, songName)
	-- queue currently supports only one song
	queue = {}
	queue.listIndex = listIndex
	queue.songIndex = songIndex
end

function emp:GetNextSongFromHistory()
	if historypointer < #playedhistory then
		historypointer = historypointer + 1
		local song = playedhistory[historypointer]
		if song then
			return song, song.listIndex, song.songIndex
		end
	end
	return nil
end

function emp:GetLastSongFromHistory()
	historypointer = historypointer - 1
	if historypointer < 2 then historypointer = 2 end
	local song = playedhistory[historypointer]
	if song then
		return song, song.listIndex, song.songIndex
	end
	return nil
end

function emp:GetLastSong(listIndex,songIndex, loopList)
	songIndex = songIndex -1
	if songIndex < 1 then songIndex = 1 end
	local song = emp:GetSong(listIndex,songIndex)
	if song then
		return song, listIndex,songIndex
	else
		return emp:GetSong(1, 1), 1,1
	end
end

-------------------------------------------------------------------------------------------
--  retern the next song from given index
-------------------------------------------------------------------------------------------
function emp:GetNextSong(listIndex, songIndex, loopList)

	--queuelistIndex, queuesongIndex = emp:GetNextFromQueue()
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
			if emp:GetSong(listi,songIndex) then
				return emp:GetSong(listi, songIndex), listi,songIndex
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
	return emp:GetSong(1, 1), 1,1
end

-- newList list or Index
function emp:CopySong(song, dstList)
	if type(dstList) == "number" then
		dstList, _ = playlists[dstList]
	end

	if dstList and song then
		table.insert(dstList,getCopy(song))
		emp:Print(string.format(L["Copied song %s to List %s."],song.title,dstList.listName))
		emp:PlayListGuiUpdate()
		return true
	else
		emp:Print(L["List or song not found"])
		return false
	end
end

function emp:RemoveAllSelectedSong(srcList)
	if type(srcList) == "number" then srcList, _ = playlists[srcList] end
	
	local songIndex = 1
	while songIndex <= #srcList do
		song = srcList[songIndex]
		if song.isChecked then
			self:RemoveSong(srcList, songIndex, false)
		else
			songIndex = songIndex + 1
		end
	end
	
end

function emp:CopyAllSelectedSongs(srcList, dstList)
	if type(srcList) == "number" then srcList, _ = playlists[srcList] end
	if type(dstList) == "number" then dstList, _ = playlists[dstList] end
	for i, song in ipairs(srcList) do
		if song.isChecked then
			self:CopySong(song, dstList)
		end
	end
end

function emp:CopyAllSongs(srcList, dstList)
	if type(srcList) == "number" then srcList, _ = playlists[srcList] end
	if type(dstList) == "number" then dstList, _ = playlists[dstList] end
	for i, song in ipairs(srcList) do
		self:CopySong(song, dstList)
	end
end


function emp:ClearListSelection(listIndex)
	for i, song in ipairs(self:GetListByIndex(listIndex)) do
		if song.isChecked then song.isChecked = false end
	end
	self:PlayListGuiUpdate()
end

function emp:GetNumberOfSelectedSongs(listIndex)
  local numSeleced = 0
	for i, song in ipairs(self:GetListByIndex(listIndex)) do
		if song.isChecked then numSeleced = numSeleced + 1 end
	end
	return numSeleced
end

function emp:RemoveSong(srcList, songIndex, silent)
	local song = srcList[songIndex]
	if song then
		table.remove(srcList,songIndex)
	end
	if not silent and song.title then
		self:Print(L["Removed song"].."\""..song.title..
		"\" "..L["from list"].." \""..srcList.listName.."\".")
		return true
	end
	emp:PlayListGuiUpdate()
	
	return false
end


function emp:CreatePlayListDialog(acceptfunction)
	StaticPopupDialogs["EPICMUSICPLAYER_ADDPLAYLIST"] = {
		text = L["Enter playlist name:"],
		button1 = ACCEPT,
		button2 = CANCEL,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
		OnAccept = acceptfunction or function (self, data, data2)
			local editBox = _G[self:GetName().."EditBox"]
			local text = editBox:GetText()
			emp.tempListName = text
      		--ebug("EpicMusicPlayer.tempListName: ", EpicMusicPlayer.tempListName)
			emp:AddPlayList(text, nil, true)
		end,
		hasEditBox = true,
		OnShow = function (self, data)
			emp:ClearSearchFocus()
			local editBox = _G[self:GetName().."EditBox"]
            editBox:SetText(L["New List"])
			editBox:HighlightText(0, editBox:GetNumLetters())
			EditBoxSelf = self
		end,
		EditBoxOnTextChanged = function (self, data)   -- careful! 'self' here points to the editbox, not the dialog
			if self:GetText() ~= "" then
				self:GetParent().visibleButtons[1]:Enable()          -- self:GetParent() is the dialog
			else
				self:GetParent().visibleButtons[1]:Disable()
			end
			self:SetAutoFocus(true)
		end
	}
	StaticPopup_Show("EPICMUSICPLAYER_ADDPLAYLIST")
end

function emp:ExportPlayListDialog(listname)
	StaticPopupDialogs["EPICMUSICPLAYER_EXPORTPLAYLIST"] = {
		text = L["Exported playlist:"],
		button1 = ACCEPT,
		--button2 = CANCEL,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
		OnShow = function (self, data)
			emp:ClearSearchFocus()
            local editBox = _G[self:GetName().."EditBox"]
			editBox:SetText(emp:GetExport(listname))
		end,
		hasEditBox = true,
		EditBoxOnTextChanged = function (self, data)   -- careful! 'self' here points to the editbox, not the dialog
				self:GetParent().button1:Enable()          -- self:GetParent() is the dialog
				self:SetAutoFocus(true)
				self:HighlightText(0, self:GetNumLetters())
		end
	}
	StaticPopup_Show("EPICMUSICPLAYER_EXPORTPLAYLIST")
end

function emp:ImportDialog(listname)
	StaticPopupDialogs["EPICMUSICPLAYER_IMPORTPLAYLIST"] = {
		text = L["Import playlist:"],
		button1 = ACCEPT,
		button2 = CANCEL,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
		OnShow = function (self, data)
			local editBox = _G[self:GetName().."EditBox"]
    		editBox:SetText(emp:GetExport(listname))
		end,
		OnAccept = function (self, data, data2)
			local editBox = _G[self:GetName().."EditBox"]
			local text = editBox:GetText()
			emp:ImportPlayList(text)
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
	StaticPopup_Show("EPICMUSICPLAYER_IMPORTPLAYLIST")
end

function emp:ImportPlayList(text)
	func, errorMessage = loadstring(text)
	--self:ebug("func:", func, errorMessage)
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

function emp:GetExport(listIndex)
  list = self:GetListByIndex(listIndex)
  local export = ""
	if list then
		export = serializeTable(list, nil, false, 0)
		export = strjoin(" ","return",export)
	end
	return export
end

function emp:ExportPlayList(listname)
  list = self:_GetListByName(listname)
	--self:Debug("ExportPlayList", list)
end

-- add playlist
-- name as string and newlist as a table are required
-- if name is a table then we geht the name from its listname
function emp:AddPlayList(name, newlist, save, replace)
	--self:Debug("type name:", type(name), " type listName=", type(newlist))

	if type(name) == "table" and name.listName then
		newlist = name 
		name = newlist.listName
	end

	if not name and newlist.listName then name = newlist.listName end

	local foundindex = emp:GetListIndex(name)
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

	--quick fix for now
	for i, song in ipairs(newlist) do
		if song.Name then
			--debug("setting title", song.Name)
			song.title = song.Song
			--song.Name = nil

			song.album = song.Album
			--song.album = nil

			song.path = song.Name
			--song.Name = nil

			song.artist = song.Artist
			--song.Artist = nil

			song.duration = song.Length
			--song.Length = nil

			song.id = song.Id
		end
	end

	if save then
		newlist.saved = true
		if not EpicMusicPlayer_PlayList then
			EpicMusicPlayer_PlayList = {}
		end
		table.insert(EpicMusicPlayer_PlayList, newlist)
	end
	--lastsearch should be last list
	local lastsearch, listIndex = emp:_GetListByName("lastsearch")
	if lastsearch then
		playlists[listIndex] = newlist -- replace searchlist with new list
		playlists[#playlists+1] = lastsearch --append searchlist at the end
	else
		table.insert(playlists, newlist)
	end

	--self:Print(string.format(L["Added playlist %s."],name))
	self:UpdateListnames()
	emp:PlayListGuiUpdate(true)
	return true
end

function emp:GetRandomSong(listIndex)
	local listnumber = listIndex
	if listnumber == nil then return emp:GetSong(0, 0), 0, 0 end
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

	return emp:GetSong(listnumber, songnumber), listnumber, songnumber
end

-- return the index of the list with the given name or nil if not found
function emp:GetListIndex(value)
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
function emp:RemovePlayList(name)

	if #playlists < 2 then
		self:Print(L["Last playlist can not be removed."])
		return
	end

	local list, listIndex = self:_GetListByName(name)
	if not list then
		self:Print(string.format(L["Playlist %s not found."],name))
		return
	end

	StaticPopupDialogs["EPICMUSICPLAYER_REMOVEPLAYLIST"] = {
		text = string.format(L["Remove playlist %s?"],name),
		button1 = ACCEPT,
		button2 = CANCEL,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
		OnAccept = function()
			if(listIndex == self:GetCurrentListIndex())then
				self:Stop()
			end

			table.remove(playlists, listIndex)

			-- remove from saved list if present
			if EpicMusicPlayer_PlayList then
				for i, list in ipairs(EpicMusicPlayer_PlayList) do
					if(string.lower(list.listName)==string.lower(name))then
						table.remove(EpicMusicPlayer_PlayList, i)
					end
				end
			end

			self:Print(string.format(L["Playlist %s removed."],name))
			self:UpdateListnames()
			emp:PlayListGuiUpdate(true)

		end,
	}
	StaticPopup_Show("EPICMUSICPLAYER_REMOVEPLAYLIST")
end

function emp:RemoveGameMusicLists()
	for i=#playlists,1,-1 do
		list = playlists[i]
		if list and list[1] and list[1].Id == true then
			table.remove(playlists, i)
		end
	end

	self:UpdateListnames()
end

-- update the list with the listnames
function emp:UpdateListnames()
	listnames = {};
	for i, list in ipairs(playlists) do
		name = list.listName or "Missing List Name"
		listnames[name] = list.listName
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

function emp:Search(pattern)
	if not pattern or pattern == "" then
        --self.IsSearching = false
        return
    end

    pattern = strtrim(string.lower(pattern))
		temp = { strsplit(" ", pattern) }

    searchlist = {
			listName = "lastsearch",
    }

	for x, list in ipairs(playlists) do
		if(list.listName  ~= "lastsearch")then
			for i, song in ipairs(list) do
				if contains(song.title, temp) or contains(song.artist, temp) or contains(song.album, temp) or contains(song.path, temp) then
					table.insert(searchlist, song)
				end
				if(#searchlist>500) then break end
			end
		end
		if(#searchlist>500) then break end
	end

	--update the lastsearch list
  local lastsearch = emp:GetListIndex("lastsearch")
	if(lastsearch)then
		playlists[lastsearch] = searchlist
		emp.selectedlist = lastsearch --set selected list
	else
		table.insert(playlists, searchlist)
		emp.selectedlist = #playlists --set selected list
	end
	self:UpdateListnames()
	emp:PlayListGuiUpdate(true)
end

------------------------------------------------------------------------------
-- get song/list info functions
-------------------------------------------------------------------------------

function emp:GetListByIndex(index)
	return playlists[index]
end

function emp:_GetListByName(name)
  if name then
		for i, list in ipairs(playlists) do
			if(string.lower(list.listName )==string.lower(name))then
				return list, i
			end
		end
	end
end

function emp.GetListnames()
	return listnames
end

function emp:GetListName(index)
	local list = playlists[index]
	if list then
		return list.listName
	end
end

-- return the lift that matches the given key. 
-- key can be the listindex in the all the playlits
-- or a listname
-- or the list table itself
function emp:GetList(key)
	local list = nil
	if type(key) == "number" then
		list = playlists[key]
	elseif type(key) == "string" then
		list = emp:_GetListByName()
	end
	return list
end

-- returns ture if a given list has the saved flag (is in savedvariables)
-- (we only want the user to modify lists that will be saved)
function emp:_IsListSaved(key)
	local list = self:GetList(key)
	return list and list.saved or false
end

function emp:GetSong(listIndex, songIndex)
 if not songIndex or not listIndex then
		emp:Error("listIndex or songIndex not vaild.",listIndex, songIndex)
		return nil
	end

	if type(listIndex) ~= "number" then listIndex = self:GetListIndex(listIndex) end

	local list = playlists[listIndex]
	if list then
		local song = list[songIndex]
		if song and (song.path or song.files) then
			return song
		else
			emp:Error("song", songIndex,"not found in list", listIndex)
		end
	else
		emp:Error("list", listIndex ,"not found.")
	end
end

local function findSongByName(name)
	if playlists then
		for i, list in ipairs(playlists) do
			for i, song in ipairs(list) do
				if song.path == name then
					return song.Id
				end
			end
		end
	end
end

function emp:UpdateOldSavedSongs()
	if EpicMusicPlayer_PlayList then
		for i, list in ipairs(EpicMusicPlayer_PlayList) do
			--ebug("updating list:"..list.listName)

			if not list.playlistVersion or list.playlistVersion < "5.0" then
				for i, song in ipairs(list) do
					if song.WoW and not song.Id then
						local id = findSongByName(song.path)
						if id then song.id = id end
						song.WoW = nil
					end

					if song.Name then
						song.title = song.Song
						song.Song = nil

						song.album = song.Album
						song.Album = nil

						song.path = song.Name
						song.Name = nil

						song.artist = song.Artist
						song.Artist = nil

						song.duration = song.Length
						song.Length = nil

						song.id = song.Id
						song.Id = nil
					end
				end
				list.playlistVersion = "5.0"
			end
		end
	end
end

-- Map lowercase stripped names to expansion levels
local EXPANSION_MAP = {
  ["classic"]             = 0,
  ["theburningcrusade"]   = 1,
  ["wrathofthelichking"]  = 2,
  ["cataclysm"]           = 3,
  ["mistsofpandaria"]     = 4,
  ["warlordsofdraenor"]   = 5,
  ["legion"]              = 6,
  ["battleforazeroth"]    = 7,
  ["shadowlands"]         = 8,
  ["dragonflight"]        = 9,
  ["thewarwithin"]        = 10,
  ["midnight"]            = 11,
  ["thelasttitan"]        = 12,
}

local function normalizeExpansionName(name)
  return name:lower():gsub("%s+", "")
end

-- Build Playlist from ealier added callbacks 
function emp:_BuildPlaylistsFromCallbacks()
	local callbacks = self._registeredPlaylistCallbacks
	if not callbacks then return end
	for i, builder in ipairs(callbacks) do
		local ok, list = pcall(builder)
		if ok and type(list) == "table" then
			self:AddPlayList(list)
		end
	end
	self._registeredPlaylistCallbacks = nil
end

-- Playlist files call this anytime:
function emp:RegisterPlaylist(requiredExpansion, addListCallback)
	local requiredExpLevel
	if type(requiredExpansion) == "string" then
		requiredExpLevel = EXPANSION_MAP[normalizeExpansionName(requiredExpansion)]
	else
		requiredExpLevel = requiredExpansion
	end

	if not requiredExpLevel then
		print("|cffff8080[EpicMusicPlayer]|r Unknown expansion:", tostring(requiredExpansion))
		return
	end

	if LE_EXPANSION_LEVEL_CURRENT < requiredExpLevel then
		return
	end

	-- see on Enable for builder callbacks
	self._registeredPlaylistCallbacks = self._registeredPlaylistCallbacks or {}
	self._registeredPlaylistCallbacks[#self._registeredPlaylistCallbacks+1] = addListCallback
end