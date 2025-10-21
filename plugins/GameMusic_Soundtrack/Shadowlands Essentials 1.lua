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
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Through The Roof of the World",
        path = "sound\\music\\shadowlands\\mus_90_throughtheroofoftheworld_maintitle.mp3",
        id = 3850553,
        duration = 684,
        artist = "Main Title",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Choice Oblivion A",
        path = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_a.mp3",
        id = 3853182,
        duration = 155,
        artist = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Choice Oblivion H",
        path = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_h.mp3",
        id = 3853232,
        duration = 215,
        artist = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Choice Rebirth F",
        path = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_f.mp3",
        id = 3853244,
        duration = 159,
        artist = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Choice Rebirth H",
        path = "sound\\music\\shadowlands\\mus_90_aw_choice_rebirth_h.mp3",
        id = 3853246,
        duration = 159,
        artist = "Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Choice Oblivion Dark Domination",
        path = "sound\\music\\shadowlands\\mus_90_aw_choice_oblivion_dark_domination.mp3",
        id = 3857085,
        duration = 140,
        artist = "David Arkenstone, Neal Acree, Glenn Stafford",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Loa Maintheme Aw A",
        path = "sound\\music\\shadowlands\\mus_90_aw_loa_maintheme_aw_a.mp3",
        id = 3885808,
        duration = 114,
        artist = "Sam Cardon, Glenn Stafford, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Loa Maintheme Aw C",
        path = "sound\\music\\shadowlands\\mus_90_aw_loa_maintheme_aw_c.mp3",
        id = 3885812,
        duration = 105,
        artist = "Sam Cardon, Glenn Stafford, David Arkenstone",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Loa Muehzala A",
        path = "sound\\music\\shadowlands\\mus_90_aw_loa_muehzala_a.mp3",
        id = 3853270,
        duration = 144,
        artist = "Sam Cardon",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Loa Shadra Mg Combat A",
        path = "sound\\music\\shadowlands\\mus_90_aw_loa_shadra_mg_combat_a.mp3",
        id = 3885794,
        duration = 107,
        artist = "Sam Cardon, Leo Kaliski",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Loa Bwonsamdi Zg Combat B",
        path = "sound\\music\\shadowlands\\mus_90_aw_loa_bwonsamdi_zg_combat_b.mp3",
        id = 3885806,
        duration = 108,
        artist = "Sam Cardon, Derek Duke",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Nightfae A",
        path = "sound\\music\\shadowlands\\mus_90_aw_nightfae_a.mp3",
        id = 3853282,
        duration = 114,
        artist = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Nightfae C",
        path = "sound\\music\\shadowlands\\mus_90_aw_nightfae_c.mp3",
        id = 3853286,
        duration = 130,
        artist = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Nightfae H",
        path = "sound\\music\\shadowlands\\mus_90_aw_nightfae_h.mp3",
        id = 3853294,
        duration = 171,
        artist = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Nightfae K",
        path = "sound\\music\\shadowlands\\mus_90_aw_nightfae_k.mp3",
        id = 3853306,
        duration = 145,
        artist = "David Arkenstone, Glenn Stafford, Jake Lefkowitz",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Nocturne Celestial A",
        path = "sound\\music\\shadowlands\\mus_90_aw_nocturne_celestial_a.mp3",
        id = 3853312,
        duration = 122,
        artist = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Nocturne Celestial D",
        path = "sound\\music\\shadowlands\\mus_90_aw_nocturne_celestial_d.mp3",
        id = 3853318,
        duration = 132,
        artist = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Nocturne Hollow A",
        path = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hollow_a.mp3",
        id = 3853354,
        duration = 160,
        artist = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Nocturne Hollow E",
        path = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hollow_e.mp3",
        id = 3853362,
        duration = 156,
        artist = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Nocturne Hunger H",
        path = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hunger_h.mp3",
        id = 3853376,
        duration = 137,
        artist = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Nocturne Hunger Domination",
        path = "sound\\music\\shadowlands\\mus_90_aw_nocturne_hunger_domination.mp3",
        id = 3857089,
        duration = 96,
        artist = "David Arkenstone, Neal Acree",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Nocturne Melancholy Dream A",
        path = "sound\\music\\shadowlands\\mus_90_aw_nocturne_melancholy_dream_a.mp3",
        id = 3853378,
        duration = 143,
        artist = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Nocturne Melancholy Dream F",
        path = "sound\\music\\shadowlands\\mus_90_aw_nocturne_melancholy_dream_f.mp3",
        id = 3853388,
        duration = 133,
        artist = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Nocturne Devious Domination",
        path = "sound\\music\\shadowlands\\mus_90_aw_nocturne_devious_domination.mp3",
        id = 3857087,
        duration = 94,
        artist = "David Arkenstone, Neal Acree",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Nocturne Devious H",
        path = "sound\\music\\shadowlands\\mus_90_aw_nocturne_devious_h.mp3",
        id = 3853348,
        duration = 123,
        artist = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Nocturne Mischief H",
        path = "sound\\music\\shadowlands\\mus_90_aw_nocturne_mischief_h.mp3",
        id = 3853406,
        duration = 117,
        artist = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Nocturne Mischief Mushroomring",
        path = "sound\\music\\shadowlands\\mus_90_aw_nocturne_mischief_mushroomring.mp3",
        id = 3857091,
        duration = 94,
        artist = "David Arkenstone",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Soulsofdarnassus",
        path = "sound\\music\\shadowlands\\mus_90_aw_soulsofdarnassus.mp3",
        id = 3930256,
        duration = 127,
        artist = "Jake Lefkowitz, Jason Hayes",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Thedreamer Procession A",
        path = "sound\\music\\shadowlands\\mus_90_aw_thedreamer_procession_a.mp3",
        id = 3930258,
        duration = 179,
        artist = "Neal Acree",
        ["Wow"] = "true"
    },
    {
        album = "WoW 9.0.0 Shadowlands",
        title = "Aspirantsjourney A",
        path = "sound\\music\\shadowlands\\mus_90_ba_aspirantsjourney_a.mp3",
        id = 3853412,
        duration = 169,
        artist = "Glenn Stafford",
        ["Wow"] = "true"
    }
}
