local dancer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicDancer") ---@class EpicMusicDancer : AceAddon
dancer._dancerModelData = {
	{
		key = "tauren",
		label = "Chief Thunder-Skins",
		file = "Creature/band/bandTaurenMale.M2",
		displayID=21661,
		camDistance = 3.5,
		stand = 2,
		animdata = {
			{ -- regular play
				animation = 69,
				durationInMs = 5200,
			},
			{
				animation = 213,
				durationInMs = 4166,
			},
			{
				animation = 214,
				durationInMs = 1200,
			},
			{
				animation = 215,
				durationInMs = 2100
			},
			{
				animation = 216,
				durationInMs = 1166,
			},
		},
	},
	{
		file = "Creature/band/bandBloodElfMale.M2",
		key = "bloodelf",
		label = "Sid Nicious",
		displayID=21666,
		camDistance = 2.5,
		animdata = {
			{ -- regular play
				animation = 69,
				durationInMs = 3700,
			},
			{
				animation = 213,
				durationInMs = 4166,
			},
			{
				animation = 214,
				durationInMs = 1767,
			},
			{
				animation = 215,
				durationInMs = 4333,
			},
			{
				animation = 216,
				durationInMs = 6766,
			},
		},
	},
	{
		key = "troll",
		label = "Mai'Kyl",
		file = "Creature/band/bandTrollMale.M2",
		displayID=21662,
		animdata = {
			{ -- regular play
				animation = 69,
				durationInMs = 12000
			},
			{
				animation = 213,
				durationInMs = 6633
			},
			{
				animation = 214,
				durationInMs = 3800 --3000,
			},
			{
				animation = 215,
				durationInMs = 3800,
			},
		},
	},
	{
		key = "undead",
		label = "Bergrisst",
		file = "Creature/band/bandUndeadMale.M2",
		displayID=21659,
		animdata = {
			{ -- regular play
				animation = 69,
				durationInMs = 3200,
			},
			{
				animation = 213,
				durationInMs = 9233,
			},
			{
				animation = 214,
				durationInMs = 13200,
			},
			{
				animation = 215,
				durationInMs = 3300,
			},
			{
				animation = 216,
				durationInMs = 3800,
			},
		},
	},
	{
		key = "orc",
		label = "Samuro",
		file = "Creature/band/bandOrcMale.M2",
		displayID=21665,
		animdata = {
			{ -- regular play
				animation = 69,
				durationInMs = 2400,
			},
			{
				animation = 213,
				durationInMs = 1200,
			},
			{
				animation = 214,
				durationInMs = 9967,
			},
			{
				animation = 215,
				durationInMs = 13667,
			},
			{
				animation = 216,
				durationInMs = 3667,
			},
			{
				animation = 217,
				durationInMs = 3334,
			},
			{
				animation = 218,
				durationInMs = 2666,
			},
		},
	},
	{
		key = "guard",
		label = "Bloodelf Guard",
		file = "Creature/BloodElfGuard/BloodElfMale_Guard.M2",
		displayID=47519,
		camDistance = 2.5,
		stand = 2,
		randomstand = {73,80,82},
	},
	{
		key = "murloccostume",
		label = "Murloc Costume",
		file =  "Creature/Murloccostume/murloccostume.m2",
		displayID=21723,
		camDistance = 4,
		stand = 2,
		randomstand = {73,80,82},
	},
}