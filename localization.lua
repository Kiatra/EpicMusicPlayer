--by yess
local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("EpicMusicPlayer", "enUS", true)
if not L then return end

if L then
	L["Copy song %s to"] = true
	L["Toggle GUI"] = true
	L["Remove selected songs"] = true
	L["Removed song"] = true

	L["from list"] = true
	
	L["Battle for Azeroth"] = true
	L["Legion"] = true
	L["Draenor"] = true
	L["Epic"] = true
	L["All"] = true
	
	L["Toggle Playlist"] = true
	L["Replaceing already existing playlist %s with the new one."] = true
	L["Open options (Right click to toggle mute.)"] = true
	L["Enter playlist name:"] = true
	L["Exported playlist:"] = true
	L["Export Playlist"] = true
	L["Import playlist:"] = true
	L["Import a playlist. Right click a list to export that list."] = true
	L["Copy selected songs to"] = true
	L["Copy all songs to"] = true
	L["Clear selection"] = true
	L["New List"] = true
	L["List or song not found"] = true
	L["The option to use PlaySoundFile was auto enabled as the WoW API PlayMusic(file) is broken for non WoW music. See FAQ for details."] = true

	L["Use Ambience Channel"] = true
	L["When this is enabled music will be played using the ambience channel instead of the music channel. Music will no longer stop on a loading screen but you will not hear ambience sound during music play."] = true

	L["Master volume: "]= true
	L["Max Level Song"] = true
	L["Play song when reaching maximum level"] = true
	L["Select a playlist to play in this zone"] = true
	L["Epic Events"] = true
	L["Enable Events"] = true
	L["Play a song from this list."] = true
	L["Delete Zone"] = true
	L["Delete this zone"] = true
	L["Events"] = true
	L["New Zone Event"] = true
	L["Create a new zone event"] = true

	L["Set the click behaviour for the minimap, the title in the GUI and the data broker plugin."] = true
	L["Add Game Music"] = true
	L["Adds playlists with game music (reload required)."] = true
	L["Lock GUI"] = true
	L["Prevent accidentally moving the GUI."] = true

	L["Copied song %s to List %s."] = true
	L["Playlist %s already exists."] = true
	L["Why are some playlists grey?"] = true
	L["Playlist %s not found."] = true
	L["Remove playlist %s?"] = true
	L["Playlist %s removed."] = true
	L["Playlists shipped with the addon or created by the PlaylistCreator are locked for editing."] = true
	L["You can only remove playlists created ingame or with the playlist creator."] = true

	L["Shuffle Cross Playlist"] = true
	L["Hide Artist in Playlist"] = true
	L["Show Update Info"]= true
	L["Layout & Skin"] = true
	L["Select a question from the left."] = true
	L["EpicMusicPlayer Update Info"] = true

	L["Reset GUI Position"] = true
	L["Reset the GUI window position"] = true
	L["Test"] = true
	L["Plays a test song."] = true
	L["Playlist Scale"] = true
	L["Adjust the scale of the playlist"] = true
	L["Frame strata"] = true
	L["MusicDancer"] = true
	L["Show Dancer"] = true
	L["Toggle show model."] = true
	L["Random Model"] = true
	L["Show a random model when playing a new song."] = true
	L["Set Model"] = true
	L["Select a model"] = true
	L["Model Size"] = true
	L["Adjust the size of the model frame"] = true
	L["Lock"] = true
	L["Unlock to allow moving the model. Moving will release the model from the GUI. Use reset to reattach."] = true
	L["Show Background"] = true
	L["Enable Mouse"] = true
	L["Click me or scroll me. I won\'t bite. 8==8"] = true
	L["Show Pedestal"] = true
	L["Show Tooltip"] = true
	L["Reset Position"] = true
	L["This will set the model to the default size and attach it to the GUI."] = true
	L["Toggle with GUI"] = true
	L["Showing/hiding the GUI will show/hide the dancer."] = true
	L['Show Artist'] = true
	L['Toggle show Artist'] = true
	L["Left click"] = true
	L["Middle click"] = true
	L["Right click"] = true
	L["Alt click"] = true
	L["Shift click"] = true
	L["Ctrl click"] = true

	L["List"] = true
	L['Show List/Song Numbers'] = true
	L['Show playlist and song number'] = true

	L['Show Title'] = true
	L['Toggle show title'] = true

	L["Show time"] = true
	L["Toggle show time"] = true

	L["Max song text length"] = true
	L["The maximum text length of the song displayed in the Panel."] = true

	L["Music volume: "] = true
	L["Effects volume: "] = true
	L["Stopped"] = true

	L["Artist"] = true
	L["Song"] = true
	L["Album"] = true
	L["Length"] = true

	L["Use scroll wheel - adjust music volume"] = true
	L["Ctrl + use scroll wheel - adjust effects volume"] = true
	L["Alt + use scroll wheel - fine adjust volume"] = true

	L["Help - FAQ"] = true

	L["Playing song from history."] = true

	L["Font"] = true
	L["Font & Colors"] = true
	L["Music off"] = true
	L["Game Music"] = true
	L["Scroll GUI Text"] = true

	L["How do I add music to the player?"] = true
	L["FAQ-Text1.1"] = [[
1. Install the EpicMusicPlayer_MP3 add-on from curse.

2. Create a folder named "MyMusic" in your World of Warcraft folder e.g: C:/Program Files/World of Warcraft/ or C:/Program Files (x86)/World of Warcraft.

3. After it is created, copy the songs you want into the folder (Reminder: They must be mp3 format to be used).

4. In the EpicMusicPlayer_MP3 folder double-click the "PlaylistCreator.vbs" file.

5. Start the game and enjoy your music.
]]

	L["Why is the song playing from the beginning after a loading screen?"] = true
	L["Music played on the music channel will stop after a loading screen. Enable the option to use the ambient sound channel to avoid this."] = true

	L["Why is there no pause button?"] = true
	L["Not possible with wow. As is playing a song at a specific position. An addon can only tell wow to play and stop a song that's it."] = true

	L["Playing song from history."] = true

	L["Font"] = true
	L["Font & Colours"] = true
	L["Music off"] = true
	L["Game Music"] = true
	L["Scroll GUI Text"] = true

	L["Colours"] = true
	L["Artist color"] = true
	L["Title color"] = true
	L["Background color"] = true
	L["Border color"] = true
	L["Button color"] = true
	L["Use artist color"] = true
	L["Use artist color as button color"] = true
	L["Frame strata"] = true

	L["Copied song"] = true
	L["Console Controls"] = true
	L["Play Next Song"] = true
	L["Play Last Song"] = true
	L["Play/Stop"] = true

	L["Drop Down Menu"] = true
	L["Send song name to default channel"] = true

	L["Mouse Setup"] = true
	L["Left Click"] = true
	L["Right Click"] = true
	L["Middle Click"] = true
	L["Button4"] = true
	L["Button5"] = true
	L["Alt+Click"] = true
	L["Shift+Click"] = true
	L["Control+Click"] = true
	L["Alt+Control+Click"] = true

	L["Controls"] = true
	L["Next"] = true
	L["Plays the next song."] = true
	L["Last"] = true
	L["Plays the last song."] = true
	L["Play"] = true
	L["Play the Music"] = true
	L["Stop"] = true
	L["Stop playing."] = true
	L["Playlist"] = true
	L["Show the Music."] = true

	L["Shuffle"] = true
	L["Toggle shuffle"] = true

	L["Console"] = true
	L["Show console commands"] = true

	L["Mute"] = true
	L["Mute / unmute music sound."] = true

	L["Show Info"] = true
	L["Show song and artist on new song"] = true

	L["Autoplay"] = true
	L["Toggles auto play on load."] = true

	L["Show Song In Chat"] = true
	L["Show message in your chat when playing a new song."] = true

	L["Disable WoW Music"] = true
	L["Disable WoW Music when not Playing."] = true

	L["Show GUI"] = true
	L["Toggle show GUI"] = true

	L["Minimap Button"] = true
	L["Toggle show minimap button"] = true

	L["Loop Playlist"] = true
	L["Playing the last song of a list will not switch to the next list."] = true

	L["Remove Song"] = true
	L["Remove the playing song from list"] = true

	L["Add Playlist"] = true
	L["Add Playlist"] = true
	L["Remove Playlist"] = true


	L["Default Channel"] = true
	L["Select the default channel to send the song name on ctrl+click"] = true

	L["Loop Song"] = true
	L["Play the current song again and again and again...until your head will explode. A click on next song will disable this."] = true

	L["General"] = true

	L["GUI Size"] = true
	L["Adjust the size of the GUI"] = true

	L["Playlist not found."] = true
	L["Read the install file in the addon directory"] = true
	L["GUI not found"] = true
	L["Playlist error oO Playlist maybe empty."] = true
	L["No Target"] = true
	L["Last playlist can not be removed."] = true

	L["Song is already in that list."] = true
	L["Added playlist %s."] = true
	L["Right click and drag to move this button"] = true

	L["Search..."] = true
	L["No Match"] = true
	L["Artist"] = true
	L["Playlists"] = true
	L["Close"] = true
	L["Clear"] = true

	L["GUI"] = true
	L["Guild"] = true
	L["Party"] = true
	L["Say"] = true
	L["To target"] = true
	L["Whisper to"] = true
	L["Raid"] = true

	L["Config"] = true
	L["Play last"] = true
	L["Show Dancer"] = true
	L["Send song name to"] = true

	L["Music volume: "] = true
	L["Effects vol.: "] = true
	L["Stopped"] = true

	L["Play/Stop"] = true
	L["Play Next Song"] = true
	L["Play Last Song"] = true
	L["Show/Hide Playlist"] = true
	L["Toggle Mute"] = true
	L["Remove Song"] = true
	L["Show Controls and Options"] = true
end


local L = AceLocale:NewLocale("EpicMusicPlayer", "deDE")
if L then
	--@localization(locale="deDE", format="lua_additive_table", handle-subnamespaces="concat", handle-unlocalized="ignore")@
	return
end

local L = AceLocale:NewLocale("EpicMusicPlayer", "frFR")
if L then
	--@localization(locale="frFR", format="lua_additive_table", handle-subnamespaces="concat", handle-unlocalized="ignore")@
	return
end

local L = AceLocale:NewLocale("EpicMusicPlayer", "koKR")
if L then
	--@localization(locale="koKR", format="lua_additive_table", handle-subnamespaces="concat", handle-unlocalized="ignore")@
	return
end

local L = AceLocale:NewLocale("EpicMusicPlayer", "zhTW")
if L then
	--@localization(locale="zhTW", format="lua_additive_table", handle-subnamespaces="concat", handle-unlocalized="ignore")@
	return
end

local L = AceLocale:NewLocale("EpicMusicPlayer", "zhCN")
if L then
	--@localization(locale="zhCN", format="lua_additive_table", handle-subnamespaces="concat", handle-unlocalized="ignore")@
	return
end

local L = AceLocale:NewLocale("EpicMusicPlayer", "ruRU")
if L then
	--@localization(locale="ruRU", format="lua_additive_table", handle-subnamespaces="concat", handle-unlocalized="ignore")@
	return
end

local L = AceLocale:NewLocale("EpicMusicPlayer", "esES")
if L then
	--@localization(locale="esES", format="lua_additive_table", handle-subnamespaces="concat", handle-unlocalized="ignore")@
	return
end

local L = AceLocale:NewLocale("EpicMusicPlayer", "esMX")
if L then
	--@localization(locale="esMX", format="lua_additive_table", handle-subnamespaces="concat", handle-unlocalized="ignore")@
	return
end

local L = AceLocale:NewLocale("EpicMusicPlayer", "ptBR")
if L then
	--@localization(locale="ptBR", format="lua_additive_table", handle-subnamespaces="concat", handle-unlocalized="ignore")@
	return
end

local L = AceLocale:NewLocale("EpicMusicPlayer", "itIT")
if L then
	--@localization(locale="itIT", format="lua_additive_table", handle-subnamespaces="concat", handle-unlocalized="ignore")@
	return
end
