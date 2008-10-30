--de localisation by yess
local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("EpicMusicPlayer", "deDE")
if not L then return end

--- added v1.6
L["Font"] = "Schrift"
L["Font & Colours"] = "Schrift & Farben" 

--- added v1.5
L["Colours"] = "Farben"
L["Artist color"] = "Interpretfarbe"
L["Title color"] = "Titelfarbe"
L["Background color"] = "Hintergrundfarbe"
L["Border color"] = "Rahmenfarbe"
L["Button color"] = "Tastenfarbe"
L["Use artist colour"] = "Interpretfarbe als Tastenfarbe"
L["Use artist colour as button colour"] = "Interpretfarbe für Tastenfarbe benutzen."
L["Frame strata"] = true

---- added v1.4
L["Copy song to"] = "Kopieren nach"
L["Copied song"] = "Titel"
L["Console Controls"] = "Consolen Steuerung"
L["Play Next Song"] = "Nächsten Titel spielen"
L["Play Last Song"] = "Vorherigen Titel spielen"
L["Play/Stop"] = "Wiedergabe/Stopp"

L["Drop Down Menu"] = "DropDown-Menü"
L["Spam to default channel"] =  "An standart Channel spammen"
L["Move to bad songs list"] = "Titel zu schlechte songs verschieben."
L["Move song to favorite list"] = "Titel zu Favoriten verschieben."

L["Mouse Setup"] = "Maus Einstellungen"
L["Left Click"] = "Linksklick"
L["Right Click"] = "Rechtsklick"
L["Middle Click"] = "Mittelklick"
L["Button4"] = "Taste4"
L["Button5"] = "Taste5"
L["Alt+Click"] = "Alt+Klick"
L["Shift+Click"] = "Umschalt+Klick"
L["Control+Click"] = "Strg+Klick"
L["Alt+Control+Click"] = "Alt+Strg+Klick"
------

-- controls
L["Controls"] = "Steuerung"
L["Next"] = "Weiter"
L["Play Next Song"] = "Nächsten Titel spielen"
L["Last"] = "Zurück"
L["Plays the last song."] = "Vorherigen Titel spielen"
L["Play"] = "Wiedergabe"
L["Play the Music"] = "Musikwiedergabe starten."
L["Stop"] = "Stopp"
L["Stop playing."] = "Musik anhalten"
L["Playlist"] = "Liste"
L["Show the Music."] = "Musikliste anzeigen."

--options
L["Spam Link"] = true
L["Add a youtube link to chat spam."] = "Youtube Link zu Chat spam anhängen."

L["Shuffle"] = "Zufällig"
L["Toggles shuffle."] = "Zufallswiedergabe an/aus"

L["Console"] = true
L["Show console commands"] = "Befehle der console anzeigen"
					
L["Mute"] = "Stumm"
L["Mute / unmute music sound."] = "Stummschalten an/aus"

L["Show Info"] = "Info Fenster"
L["Show song and artist on new song"] = "Bei neuem Lied Titel und Interpret anzeigen"
					
L["Autoplay"] = "Autowiedergabe"
L["Toggles auto play on load."] = "Beim einloggen wiedergabe starten"

L["Show Song In Chat"] = "Titel im Chat anzeigen."
L["Show message in your chat when playing a new song."] = "Bei neuem Lied Titel und Interpret im eigenen chat anzeigen"
					
L["Disable WoW Music"] = "WoW Music ausschalten"
L["Disable WoW Music when not Playing."] = "Musik abschalten bei Wiedergabe stopp"
					
L["Show Gui"] = "Gui anzeigen"
L["Toggle show gui"] = "Gui anzeigen an/aus"

L["Minimap Button"] = "Minimap Button"
L["Toggle show minimap button"] = "Minimap Button an/aus"
					   
L["Loop Playlist"] = "Liste wiederholen"
L["Playing the last song of a list will not switch to the next list."] = "Am ende einer Liste diese von vorn beginnen."
					
L["Remove Song"] = "Lied löschen"
L["Remove the playing song from list"] = "Das aktuell Lied as der Liste löschen"
					   
L["Add Playlist"] = "Liste hinzüfügen"
L["Remove Playlist"] = "Liste löschen"

L["Default Channel"] = "Standart Channel"
L["Select the default channel to spam on ctrl+click"] = "Spam-Channel für strg+click auswählen"

L["Loop Song"] = "Titel wiederholen"
L["Play the current song again and again and again...until your head will explode. A click on next song will disable this."]  = "Den aktuellen titel immer wieder und wieder spielen bis es im kopf weh tut. Autsch! Ein click auf nächstes leid deaktiviert diese einstellung."

L["General"] = "Allgemein"

L["Bad list"] = "Schlechte Songs Liste"
L["This list will not be played. Unless you select it."] = "Diese liste wird nicht gespielt auser du wählst sie aus."

L["Set a key in the key bindings menu to move a song to the selected list by that key."] = "Du kannst ein tastenkürzel um songs in deise liste zu verschieben in der tastaurbelegung setzen."

L["Favorites List"] = "Favoriten-Liste"


L["Gui Size"] = "Gui größe." 
L["Adjust the size of the gui"] = "Gui größe." 

--info messages
L["Playlist not found."] = "Wiedergabeliste nicht gefunden."
L["Read the install file in the addon directory"] = "Bitte die install-de.txt im addon verz. lesen."
L["Gui not found"] = "Gui nicht gefunden."
L["Playlist error oO Playlist maybe empty."] = "Fehler in der Wiedergabeliste oO Liste viell leer."
L["No Target"] = "Kein Ziel"
L["Last playlist can not be removed."] = "Die letze Liste kann nicht gelöscht werden."
L["[~mymusic~] "] = "[~meinemusik~] "
L["Moved song: "] = "Titel: "
L[" to List: "] = " verschoben in liste: "
L["Not playing."] = "Widergabe gestoppt."

L["Song is already in that list."] = "Das Lied ist bereits in dieser liste."
-- removed song xxx from list xxx
L["Removed song"] = "Lied gelöscht."
L["from list"] = "gelöscht aus Liste"
-- Playlist xxx  already exists.
L["already exists."] = "existiert bereits."
L["Added playlist"] = "Liste hinzugefügt."
-- Playlist xxx  removed.
L["removed."] = "gelöscht."
-- Playlist xxx  not found
L["not found."] = "nicht gefunden."

L["Please set a bad songs list."] = "Schlechte songs liste bitte neu setzen"
L["Please set a favorites list."] = "Favoriten-liste bitte neu setzen."

L["After current, song will be moved to list"] = "Der titel wird in folgende liste verschoben" 

--playlist
L["Search..."] = "Suchen..."
L["No Match"] = "Keine Treffer"
L[" - Title"] = " - Titel"
L["Artist"] = "Interpret"
L["Playlists"] = "Wiedergabelisten"
L["Close"] = "Schließen"
L["Clear"] = "Löschen"

--gui
L["Gui"] = true
L["List: "] = "Liste: "
L["Length: "] = "Länge: "
L["Album: "] = true

L["Guild"] = "Gilde"
L["Party"] = "Gruppe"
L["Say"] = "Sagen"
L["To target"] = "Zu Ziel"
L["Whisper to"] = "Flüstern zu"
L["Raid"] = "Schlachtzug"

L["Config"] = "Einstellungen"
L["Play last"] = "Vorheriger Titel"
L["Show Dancer"] = "Tänzer zeigen"
L["Move song to"] = "Lied verschieben nach"
L["Spam to"] = "Spam nach"

L["Music volume: "] = "Musik Lautst.: "
L["Effects vol.: "] = "Sound Lautst.: "
L["Stopped"] = "Gestoppt"


L["Right click and drag to move this button"] = "Rechts Klick und ziehen um den Knopf zu verschieben."


-- key binding variables
BINDING_HEADER_EPICMUSICPLAYER = "EpicMusicPlayer";
BINDING_NAME_PLAYSTOP = "Wiedergabe/Stopp";
BINDING_NAME_NEXT = "Nächsten Titel spielen";
BINDING_NAME_LAST = "Vorherigen Titel spielen";
BINDING_NAME_TOGGLELIST = "Musikliste anzeigen/verstecken";
BINDING_NAME_MUTE = "Stummschalten an/aus";
BINDING_NAME_REMOVESONG = "Song löschen";
BINDING_NAME_GUI = "Optionen anzeigen";
BINDING_NAME_BADLIST = "Song zur schlechte songs liste verschieben.";
BINDING_NAME_BESTLIST = "Song zur beste songs liste verschieben.";
