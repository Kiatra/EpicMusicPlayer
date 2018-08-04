local LibStub = LibStub
local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")
EpicMusicPlayer.MusicEvents = {}
local MusicEvents = EpicMusicPlayer.MusicEvents
local db
local newName = "test"
local newType = "boss"
local eventsList
local Debug = EpicMusicPlayer.Debug
local typesList = {fight="Fight",boss="Boss Fight",zone="Zone"}

local function GetTypeName(info)
	local name = info[#info]
	return typesList[name]
end

local options={
	name="Events",
	order = 7,
	type="group",
	args = {
		enabled = {
			type = 'toggle',
			--width = "half",
			order = 1,
			name = 'Enabled',
			desc = 'Enable events',
			get = function()
				return db.enabled
			end,
			set = function()
				db.enabled = not db.enabled
			end,
		},
		--[[
		name = {
			type = 'input',
			order = 6,
			name = "Name",
			desc = "Name",
			usage = "<name>",
			get = function()
			  return newName
			end,
			set = function(info, name)
				newName = name
			end,
		},
		]]
		type = {
			type = 'select',
			values = typesList,
			order = 2,
			name = "Type",
			desc = "Type",
			get = function(info)
				return newType
			end,
			set = function(info, value)
				newType = value
			end,
		},
		new = {
			type = 'execute',
			--width = "half",
			order = 12,
			name = "Create Event",
			desc = "Create Event",
			func = function()
				eventsList[newType] = eventsList[newType] or {}
				MusicEvents:AddEventOptions(newType)
			end,
		},
	},
}
local eventOptions = options.args

function MusicEvents:AddEventOptions(name)
	eventOptions[name] = {
		name = GetTypeName,
		desc = GetTypeName,
		type = "group",
		order = 0,
		args={
			general = {
				inline = true,
				name=typesList[name],
				type="group",
				order = 0,
				args={
					enabled = {
						type = 'toggle',
						--width = "half",
						order = 1,
						name = 'Enabled',
						desc = 'Enable events',
						get = function()
							return db.enabled
						end,
						set = function()
							db.enabled = not db.enabled
						end,
					},
					list = {
						type = 'select',
						values = EpicMusicPlayer.GetListnames,
						order = 5,
						name = "Select Playlist",
						desc = "Select Playlist",
						get = function(info)
							local name = info[#info-2]
							return eventsList[name].list
						end,
						set = function(info, value)
							local name = info[#info-2]
							eventsList[name].list = value
						end,
					},
					delete = {
						type = 'execute',
						--width = "half",
						order = 12,
						name = "Delete",
						desc = "Delete",
						func = function(info, value)
							local name = info[#info-2]
							eventOptions[name] = nil
							eventsList.newName = nil
						end,
					},
				},
			},
		},
	}
end

local function OnEnterCombat()
	if db.enabled and eventsList.boss and eventsList.boss.list then
		Debug(eventsList.boss.list)
		_, EpicMusicPlayer.db.profile.list = EpicMusicPlayer:GetListByName(eventsList.boss.list)
		EpicMusicPlayer:Play()
	end
end

local function OnLeaveCombat()
	if eventsList.boss then
		EpicMusicPlayer:Stop()
	end
end

local frame = CreateFrame("Frame")
local function OnEvent(self, event, arg1)
	EpicMusicPlayer:AddOptions("events",options)
	db = EpicMusicPlayer.db.profile
	db.events = db.events or {}
	db = db.events
	db.eventsList = db.eventsList or {}
	eventsList = db.eventsList
	for name, event in pairs(eventsList) do
		MusicEvents:AddEventOptions(name)
	end
	EpicMusicPlayer:RegisterEvent("PLAYER_REGEN_DISABLED",OnEnterCombat)
	EpicMusicPlayer:RegisterEvent("PLAYER_REGEN_ENABLED",OnLeaveCombat)
	frame:UnregisterEvent("PLAYER_ENTERING_WORLD")
end

frame:SetScript("OnEvent", OnEvent)
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
