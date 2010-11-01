local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")

EpicMusicPlayerGui.skins = { 
	classic = {
		-- default values for all controls are: 
		--		type = "button", align = "TOPLEFT", height = 0, width = 0, offx = 0, offy = 0},
		-- you only nedd to specify vaules that differ form the default ones.
		texturepath = "Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\",
		guiframe = { height = 50, width = 150},
		timebar = { align = "CENTER", height = 2, width = 140},
		text = { align = "TOP", height = 20, width = 130, offx = 0, offy = -5},
		artistColor = {r=0.6,g=0.2,b=0.8,a=0.8},
		titleColor = {r=1,g=1,b=1,a=1},
		backColor = {r=0,g=0,b=0,a=1},
		borderColor = {r=1,g=1,b=1,a=0.28},
		buttonColor = {r=0.6,g=0.2,b=0.8,a=0.8},
		last = {
			type = "Button",
			height = 16,
			width = 16,
			offx = 20,
			offy = -24,
			normaltexture = "emp-last.tga",
			pushedtexture = "emp-last-p.tga",
			backgroundtexture = "emp-back.tga",
			onleftclick = EpicMusicPlayer.PlayLast,
			onrightclick = EpicMusicPlayerGui.SetLastModel,
		},
		play = {
			type = "Button",
			height = 16,
			width = 16,
			offx = 36,
			offy = -24,
			normaltexture = "emp-play.tga",
			pushedtexture = "emp-play-p.tga",
			backgroundtexture = "emp-back.tga",
			normaltexture2 = "emp-stop.tga",
			pushedtexture2 = "emp-stop-p.tga",
			onleftclick = EpicMusicPlayerGui.TogglePlay,
			onrightclick = EpicMusicPlayerGui.TogglePlay,
		},
		next = {
			type = "Button",
			height = 16,
			width = 16,
			offx = 52,
			offy = -24,
			normaltexture = "emp-next.tga",
			pushedtexture = "emp-next-p.tga",
			backgroundtexture = "emp-back.tga",
			onleftclick = EpicMusicPlayer.OnNextClick,
			onrightclick = EpicMusicPlayerGui.SetNextModel,
		},
		random = {
			type = "Button",
			height = 16,
			width = 16,
			offx = 82,
			offy = -24,
			normaltexture = "emp-randomon.tga",
			pushedtexture = "emp-randomon-p.tga",
			backgroundtexture = "emp-back.tga",
			normaltexture2 = "emp-randomoff.tga",
			pushedtexture2 = "emp-randomoff-p.tga",
			onleftclick = EpicMusicPlayer.ToggleRandom,
			onrightclick = EpicMusicPlayerGui.ToggleDancer,
		},
		config = {
			type = "Button",
			height = 16,
			width = 16,
			offx = 98,
			offy = -24,
			normaltexture = "emp-conf.tga",
			pushedtexture = "emp-conf-p.tga",
			backgroundtexture = "emp-back.tga",
			onleftclick = EpicMusicPlayer.ShowConfig,
			onrightclick = EpicMusicPlayer.ToggleMute,
		},
		playlist = {
			type = "Button",
			height = 16,
			width = 16,
			offx = 114,
			offy = -24,
			normaltexture = "emp-list.tga",
			pushedtexture = "emp-list-p.tga",
			backgroundtexture = "emp-back.tga",
			onleftclick = EpicMusicPlayer.TogglePlayListGui,
			onrightclick = EpicMusicPlayer.ToggleList,
		},
	},
	-- cataclysm layout -------------------------------------------------------------------------------------
	cataclysm = {
		texturepath = "Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\",
		bgtextrue = {bgFile = "Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\cata-skin.tga", 
			edgeFile = nil, 
			tile = false},
		guiframe = { height = 64, width = 256},
		text = { align = "TOP", height = 20, width = 120, offx = 6, offy = -10},
		timer = { align = "TOP", height = 20, width = 40, offx = -78, offy = -10},
		buttonColor = {r=1, g=1, b=1, a=1},
		backColor = {r=1, g=1, b=1, a=1},
		artistColor = {r=0.83, g=0.22, b=0, a=1},
		titleColor = {r=1, g=0.73, b=0.1, a=1},
		last = {
			type = "Button",
			height = 16,
			width = 16,
			offx = 85,
			offy = -28,
			normaltexture = "cata-last.tga",
			pushedtexture = "cata-last-p.tga",
			backgroundtexture = "cata-back.tga",
			onleftclick = EpicMusicPlayer.PlayLast,
			onrightclick = EpicMusicPlayerGui.SetLastModel,
		},
		play = {
			type = "Button",
			height = 16,
			width = 16,
			offx = 101,
			offy = -28,
			normaltexture = "cata-play.tga",
			pushedtexture = "cata-play-p.tga",
			backgroundtexture = "cata-back.tga",
			normaltexture2 = "cata-stop.tga",
			pushedtexture2 = "cata-stop-p.tga",
			onleftclick = EpicMusicPlayerGui.TogglePlay,
			onrightclick = EpicMusicPlayerGui.TogglePlay,
		},
		next = {
			type = "Button",
			height = 16,
			width = 16,
			offx = 117,
			offy = -28,
			normaltexture = "cata-next.tga",
			pushedtexture = "cata-next-p.tga",
			backgroundtexture = "cata-back.tga",
			onleftclick = EpicMusicPlayer.OnNextClick,
			onrightclick = EpicMusicPlayerGui.SetNextModel,
		},
		random = {
			type = "Button",
			height = 16,
			width = 16,
			offx = 138,
			offy = -28,
			normaltexture = "cata-randomon.tga",
			pushedtexture = "cata-randomon-p.tga",
			backgroundtexture = "cata-back.tga",
			normaltexture2 = "cata-randomoff.tga",
			pushedtexture2 = "cata-randomoff-p.tga",
			onleftclick = EpicMusicPlayer.ToggleRandom,
			onrightclick = EpicMusicPlayerGui.ToggleDancer,
		},
		config = {
			type = "Button",
			height = 16,
			width = 16,
			offx = 154,
			offy = -28,
			normaltexture = "cata-conf.tga",
			pushedtexture = "cata-conf-p.tga",
			backgroundtexture = "cata-back.tga",
			onleftclick = EpicMusicPlayer.ShowConfig,
			onrightclick = EpicMusicPlayer.ToggleMute,
		},
		playlist = {
			type = "Button",
			height = 16,
			width = 16,
			offx = 170,
			offy = -28,
			normaltexture = "cata-list.tga",
			pushedtexture = "cata-list-p.tga",
			backgroundtexture = "cata-back.tga",
			onleftclick = EpicMusicPlayer.TogglePlayListGui,
			onrightclick = EpicMusicPlayer.ToggleList,
		},
	},
	-- compact layout -------------------------------------------------------------------------------------
	compact = {
		guiframe = { height = 50, width = 57},
		timebar = { align = "CENTER", height = 2, width = 50},
		--text = { align = "TOP", height = 20, width = 45, offx = 3, offy = -5},
		texturepath = "Interface\\AddOns\\EpicMusicPlayer\\gui\\pics\\",
		artistColor = {r=0.6,g=0.2,b=0.8,a=0.8},
		titleColor = {r=1,g=1,b=1,a=1},
		backColor = {r=0,g=0,b=0,a=1},
		borderColor = {r=1,g=1,b=1,a=0.28},
		buttonColor = {r=0.6,g=0.2,b=0.8,a=0.8},
		last = {
			type = "Button",
			height = 16,
			width = 16,
			offx = 5,
			offy = -5,
			normaltexture = "emp-last.tga",
			pushedtexture = "emp-last-p.tga",
			backgroundtexture = "emp-back.tga",
			onleftclick = EpicMusicPlayer.PlayLast,
			onrightclick = EpicMusicPlayerGui.SetLastModel,
		},
		play = {
			type = "Button",
			height = 16,
			width = 16,
			offx = 21,
			offy = -5,
			normaltexture = "emp-play.tga",
			pushedtexture = "emp-play-p.tga",
			backgroundtexture = "emp-back.tga",
			normaltexture2 = "emp-stop.tga",
			pushedtexture2 = "emp-stop-p.tga",
			onleftclick = EpicMusicPlayerGui.TogglePlay,
			onrightclick = nil,
		},
		next = {
			type = "Button",
			height = 16,
			width = 16,
			offx = 37,
			offy = -5,
			normaltexture = "emp-next.tga",
			pushedtexture = "emp-next-p.tga",
			backgroundtexture = "emp-back.tga",
			onleftclick = EpicMusicPlayer.OnNextClick,
			onrightclick = EpicMusicPlayerGui.SetNextModel,
		},
		random = {
			type = "Button",
			height = 16,
			width = 16,
			offx = 5,
			offy = -24,
			normaltexture = "emp-randomon.tga",
			pushedtexture = "emp-randomon-p.tga",
			backgroundtexture = "emp-back.tga",
			normaltexture2 = "emp-randomoff.tga",
			pushedtexture2 = "emp-randomoff-p.tga",
			onleftclick = EpicMusicPlayer.ToggleRandom,
			onrightclick = EpicMusicPlayerGui.ToggleDancer,
		},
		config = {
			type = "Button",
			height = 16,
			width = 16,
			offx = 21,
			offy = -24,
			normaltexture = "emp-conf.tga",
			pushedtexture = "emp-conf-p.tga",
			backgroundtexture = "emp-back.tga",
			onleftclick = EpicMusicPlayer.ShowConfig,
			onrightclick = EpicMusicPlayer.ToggleMute,
		},
		playlist = {
			type = "Button",
			height = 16,
			width = 16,
			offx = 37,
			offy = -24,
			normaltexture = "emp-list.tga",
			pushedtexture = "emp-list-p.tga",
			backgroundtexture = "emp-back.tga",
			onleftclick = EpicMusicPlayer.TogglePlayListGui,
			onrightclick = EpicMusicPlayerGui.SetNextModel,
		},
	},
}

	