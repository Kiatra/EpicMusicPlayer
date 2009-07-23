--Chinese local by Yeachan @CWDG
--Email:  yeachan@live.com
local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("EpicMusicDancer", "zhCN")
if not L then return end

---- added v1.5
L["Frame strata"] = "层"
--

--options
L["MusicDancer"] = "舞者" 

L["Show Dancer"] = "显示舞者"
L["Toggle show model."] = "是否显示舞者模型."

L["Random Model"] = "随机模型"
L["Show a random model when playing a new song."] = "播放一首新的歌曲时随机模型."

L["Set Model"] = "设置模型"
L["Select a model"] = "选择模型"

L["Model Size"] = "模型大小"
L["Adjust the size of the model frame"] = "控制模型的大小"

L["Lock"] = "锁定"
L["Unlock to allow moving the model. Moving will relese the model from the gui. Use reset to reattatch."] = "锁定/解锁模型位置，可以重置位置."

L["Show Background"] = "显示背景"

L["Enable Mouse"] = "启用鼠标"
L["Click me or scroll me. I won\'t bite. 8==8"] = "点击我或者滑动我. . 8==8"

L["Show Pedestal"] = "显示台座"

L["Show Tooltip"] = "显示tip"

L["Reset Position"] = "重置位置"
L["This will set the model to the default size and attatch it to the gui."] = "这会重置模型的大小和位置."

L["Toggle with Gui"] = "与GUI共存"
L["Showing/hiding the Gui will show/hide the dancer."] = "显示/隐藏GUI会显示/隐藏舞者."