local EpicMusicDancer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicDancer")  ---@class EpicMusicDancer : AceAddon

local L = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")

EpicMusicDancer._dancerOptions = {
			name=L["Music Dancer"],
			order = 5,
			type="group",
			args={
				show = {
		            type = 'toggle',
					order = 1,
					name = L["Show Dancer"],
		            desc = L["Toggle show model."],
		            get = function()
                    return EpicMusicDancer:IsVisible()
                  end,
		            set = function()
						      EpicMusicDancer:ToggleShow()
		            end,
				},
				random = {
		            type = 'toggle',
					order = 3,
					name = L["Random Model"],
		            desc = L["Show a random model when playing a new song."],
		            get = function()
						return EpicMusicDancer:IsRandom()
					end,
		            set = function()
						EpicMusicDancer:ToggleRandom()
		            end,
				},
				setmodel = {
		            type = 'select',
					values = function ()
						local modelOptions = {}
						for i, entry in ipairs(EpicMusicDancer._dancerModelData) do
							if entry.key then
								modelOptions[entry.key] = entry.label..tostring(i) or entry.key
							end
						end
						return modelOptions
					end,
					order = 4,
		            name = L["Set Model"],
		            desc = L["Select a model"],
					get = function()
						return EpicMusicDancer.db.defaultmodel
					end,
		            set = function(info, value)
						EpicMusicDancer:SetDefaultModel(info, value)
		            end,
				},
			}
	}

function EpicMusicDancer:SetBackground()
	EpicMusicDancer.frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
	                                        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
	                                        tile = true, tileSize = 16, edgeSize = 16,
	                                        insets = { left = 0, right = 0, top = 0, bottom = 0 }});
	EpicMusicDancer.frame:SetBackdropColor(0,0,0,1);
end

function EpicMusicDancer:IsRandom()
	return EpicMusicDancer.db.model.random
end

function EpicMusicDancer:ToggleRandom()
	EpicMusicDancer.db.model.random = not EpicMusicDancer.db.model.random
end

function EpicMusicDancer:IsPedestal()
	return EpicMusicDancer.db.model.pedestal
end

function EpicMusicDancer:IsLocked()
	return EpicMusicDancer._isLocked
end
