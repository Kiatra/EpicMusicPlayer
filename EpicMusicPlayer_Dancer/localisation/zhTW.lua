--Chinese local by Yeachan @CWDG
--Email:  yeachan@live.com
local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("EpicMusicDancer", "zhTW")
if not L then return end

---- added v1.5
L["Frame strata"] = "層"
--

--options
L["MusicDancer"] = "舞者" 

L["Show Dancer"] = "顯示舞者"
L["Toggle show model."] = "是否顯示舞者模型."

L["Random Model"] = "隨機模型"
L["Show a random model when playing a new song."] = "播放一首新的歌曲時隨機模型."

L["Set Model"] = "設置模型"
L["Select a model"] = "選擇模型"

L["Model Size"] = "模型大小"
L["Adjust the size of the model frame"] = "控制模型的大小"

L["Lock"] = "鎖定"
L["Unlock to allow moving the model. Moving will relese the model from the gui. Use reset to reattatch."] = "鎖定/解鎖模型位置，可以重置位置."

L["Show Background"] = "顯示背景"

L["Enable Mouse"] = "啟用鼠標"
L["Click me or scroll me. I won\'t bite. 8==8"] = "點擊我或者滑動我. . 8==8"

L["Show Pedestal"] = "顯示台座"

L["Show Tooltip"] = "顯示tip"

L["Reset Position"] = "重置位置"
L["This will set the model to the default size and attatch it to the gui."] = "這會重置模型的大小和位置."

L["Toggle with Gui"] = "與GUI共存"
L["Showing/hiding the Gui will show/hide the dancer."] = "顯示/隱藏GUI會顯示/隱藏舞者."