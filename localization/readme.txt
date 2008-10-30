To create a new localization, create a file named after the locale
for example, if you want to create a chinese localization, name the file zhCN.lua 
Then, copy the contents of enUS.lua into your new file, and replace each = true with the proper localization.

Be sure to change the "enUS" registration at the top of your file to your locale, as well. 
Example: if (GetLocale() == "zhCN") 

If you dou't know your locale run this command ingame: /run DEFAULT_CHAT_FRAME:AddMessage(GetLocale())
Please note that the individual addons like EpicMusicPlayerFu have localization files as well.

Please send me your localisation to yessica@fantasymail.de

