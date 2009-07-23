--de localisation by yess
local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("EpicMusicDancer", "deDE")
if not L then return end

--added in 1.5
L["Frame strata"] = true
---

--options
L["MusicDancer"] = true 

L["Show Dancer"] = "Tänzer Anzeigen"
L["Toggle show model."] = "Tänzer Anzeigen an/aus"

L["Random Model"] = "Zufälliges Model"
L["Show a random model when playing a new song."] = "Bei jedem neuen Titel zuffäliges Model anzeigen."

L["Set Model"] = "Figur wählen"
L["Select a model"] = "Figur wählen"

L["Model Size"] = "Aufblasen."
L["Adjust the size of the model frame"] = "Aufblasen Pfffffffff"

L["Lock"] = "Sperren"
L["Unlock to allow moving the model. Moving will relese the model from the gui. Use reset to reattatch."] = "Zum verschieben entsperren. Dabei wird die Verankerung mit dem GUI gelöst."

L["Show Background"] = "Hintergrund anzeigen"

L["Enable Mouse"] = "Klickbar"
L["Click me or scroll me. I won\'t bite. 8==8"] = true

L["Show Pedestal"] = "Kiste zeigen"

L["Show Tooltip"] = "ToolTip an/aus"

L["Reset Position"] = "Zurück nach hause:)"
L["This will set the model to the default size and attatch it to the gui."] = "Ab zurück nach hause. Hop."

L["Toggle with Gui"] = "Mit Gui umschalten"
L["Showing/hiding the Gui will show/hide the dancer."] = "Model an/aus wenn das Gui an/aus geschalten wird."