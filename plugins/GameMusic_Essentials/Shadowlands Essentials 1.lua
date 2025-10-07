local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer", true)
if not EpicMusicPlayer then return end

local list  -- forward declare once

-- playlist metadata
local listName         = "SL Essentials 1"
local expansion        = 8
local playlistVersion  = "4.0"

if _G.LE_EXPANSION_LEVEL_CURRENT >= expansion then
    -- defer loading until the player is in the world:
    local f = CreateFrame("Frame")
    f:RegisterEvent("PLAYER_ENTERING_WORLD")
    f:SetScript("OnEvent", function(self, event)
        if list then
            EpicMusicPlayer:AddPlayList(list)
        end
        self:UnregisterEvent(event)
        self:SetScript("OnEvent", nil)
    end)
end

list = {
	["listName"] = listName,
	["playlistVersion"] = playlistVersion,
	["locked"] =  "true",
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Through The Roof of the World",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_throughtheroofoftheworld_maintitle.mp3",
        ["Id"] = 3850553,
        ["Length"] = 684,
        ["Artist"] = "Main Title",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Choice Oblivion A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_a.mp3",
        ["Id"] = 3853182,
        ["Length"] = 155,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Choice Oblivion H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_h.mp3",
        ["Id"] = 3853232,
        ["Length"] = 215,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Choice Rebirth F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_f.mp3",
        ["Id"] = 3853244,
        ["Length"] = 159,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Choice Rebirth H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_h.mp3",
        ["Id"] = 3853246,
        ["Length"] = 159,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Choice Oblivion Dark Domination",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_dark_domination.mp3",
        ["Id"] = 3857085,
        ["Length"] = 140,
        ["Artist"] = "David Arkenstone, Neal Acree, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Loa Maintheme Aw A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_maintheme_aw_a.mp3",
        ["Id"] = 3885808,
        ["Length"] = 114,
        ["Artist"] = "Sam Cardon, Glenn Stafford, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Loa Maintheme Aw C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_maintheme_aw_c.mp3",
        ["Id"] = 3885812,
        ["Length"] = 105,
        ["Artist"] = "Sam Cardon, Glenn Stafford, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Loa Muehzala A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_muehzala_a.mp3",
        ["Id"] = 3853270,
        ["Length"] = 144,
        ["Artist"] = "Sam Cardon",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Loa Shadra Mg Combat A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_shadra_mg_combat_a.mp3",
        ["Id"] = 3885794,
        ["Length"] = 107,
        ["Artist"] = "Sam Cardon, Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Loa Bwonsamdi Zg Combat B",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_loa_bwonsamdi_zg_combat_b.mp3",
        ["Id"] = 3885806,
        ["Length"] = 108,
        ["Artist"] = "Sam Cardon, Derek Duke",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Nightfae A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nightfae_a.mp3",
        ["Id"] = 3853282,
        ["Length"] = 114,
        ["Artist"] = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Nightfae C",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nightfae_c.mp3",
        ["Id"] = 3853286,
        ["Length"] = 130,
        ["Artist"] = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Nightfae H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nightfae_h.mp3",
        ["Id"] = 3853294,
        ["Length"] = 171,
        ["Artist"] = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Nightfae K",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nightfae_k.mp3",
        ["Id"] = 3853306,
        ["Length"] = 145,
        ["Artist"] = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Nocturne Celestial A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_celestial_a.mp3",
        ["Id"] = 3853312,
        ["Length"] = 122,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Nocturne Celestial D",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_celestial_d.mp3",
        ["Id"] = 3853318,
        ["Length"] = 132,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Nocturne Hollow A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hollow_a.mp3",
        ["Id"] = 3853354,
        ["Length"] = 160,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Nocturne Hollow E",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hollow_e.mp3",
        ["Id"] = 3853362,
        ["Length"] = 156,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Nocturne Hunger H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hunger_h.mp3",
        ["Id"] = 3853376,
        ["Length"] = 137,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Nocturne Hunger Domination",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hunger_domination.mp3",
        ["Id"] = 3857089,
        ["Length"] = 96,
        ["Artist"] = "David Arkenstone, Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Nocturne Melancholy Dream A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_melancholy_dream_a.mp3",
        ["Id"] = 3853378,
        ["Length"] = 143,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Nocturne Melancholy Dream F",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_melancholy_dream_f.mp3",
        ["Id"] = 3853388,
        ["Length"] = 133,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Nocturne Devious Domination",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_devious_domination.mp3",
        ["Id"] = 3857087,
        ["Length"] = 94,
        ["Artist"] = "David Arkenstone, Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Nocturne Devious H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_devious_h.mp3",
        ["Id"] = 3853348,
        ["Length"] = 123,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Nocturne Mischief H",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_mischief_h.mp3",
        ["Id"] = 3853406,
        ["Length"] = 117,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Nocturne Mischief Mushroomring",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_nocturne_mischief_mushroomring.mp3",
        ["Id"] = 3857091,
        ["Length"] = 94,
        ["Artist"] = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Soulsofdarnassus",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_soulsofdarnassus.mp3",
        ["Id"] = 3930256,
        ["Length"] = 127,
        ["Artist"] = "Jake Lefkowitz, Jason Hayes",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Thedreamer Procession A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_aw_thedreamer_procession_a.mp3",
        ["Id"] = 3930258,
        ["Length"] = 179,
        ["Artist"] = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        ["Album"] = "WoW 9.0.0 Shadowlands",
        ["Song"] = "Aspirantsjourney A",
        ["Name"] = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_a.mp3",
        ["Id"] = 3853412,
        ["Length"] = 169,
        ["Artist"] = "Glenn Stafford",
        ["Wow"] = "true"
    }
}
