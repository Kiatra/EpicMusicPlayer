-----------------------------
-- albumview.lua
-----------------------------
-- Usage:
--   EpicMusicPlayer:ToggleAlbumView()  -- shows current list as an "album" page
--   (uses first song's album/artist/artwork if available)

local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L               = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")

local _G, CreateFrame, math, min, max = _G, CreateFrame, math, math.min, math.max

local AV = {}
AV.__index = AV

-- Layout constants
local PAD            = 12
local HEADER_H       = 320         -- total header stack height (art + texts + buttons)
local ART_SIZE       = 256         -- square album art
local BTN_H          = 36
local ROW_H          = 22
local TITLE_FS       = 22
local ARTIST_FS      = 15

local function NineBg(frame)
  frame:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                      edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
                      tile = true, tileSize = 16, edgeSize = 16,
                      insets = { left = 4, right = 4, top = 4, bottom = 4 } })
  frame:SetBackdropColor(0,0,0,0.9)
  frame:SetBackdropBorderColor(0.2,0.2,0.2,0.7)
end

local function WoWButton(parent, label, click)
  local b = CreateFrame("Button", nil, parent, BackdropTemplateMixin and "BackdropTemplate")
  NineBg(b)
  b:SetHeight(BTN_H)
  b:SetScript("OnClick", click)
  local fs = b:CreateFontString(nil, "ARTWORK", "GameFontNormal")
  fs:SetPoint("CENTER")
  fs:SetText(label)
  b.text = fs
  return b
end

function AV:new()
  local db = EpicMusicPlayer.db
  local o = setmetatable({
    db = db,
    frame = nil,
    scroll = nil,
    content = nil,
    header = nil,
    art = nil,
    playBtn = nil,
    shuffleBtn = nil,
    titleFS = nil,
    artistFS = nil,
    listFrame = nil,
  }, self)
  return o
end

local function currentAlbumMeta()
  local song = EpicMusicPlayer:GetCurrentSong() or EpicMusicPlayer:GetSong(EpicMusicPlayer.selectedlistIndex, 1)
  local title = song and (song.album or song.title) or L["Unknown Album"] or "Album"
  local artist = song and song.artist or L["Unknown Artist"] or "Artist"
  return title, artist, song
end

-- header builds the visual stack (art, title, artist, buttons)
function AV:buildHeader(parent)
  local header = CreateFrame("Frame", nil, parent)
  header:SetSize(parent:GetWidth(), HEADER_H)

  -- album art (square)
  local art = header:CreateTexture(nil, "ARTWORK")
  art:SetSize(ART_SIZE, ART_SIZE)
  art:SetPoint("TOP", header, "TOP", 0, -PAD)
  art:SetTexCoord(0,1,0,1) -- full square
  art:SetTexture("Interface\\ICONS\\INV_Misc_QuestionMark") -- fallback; replace with your album art path

  -- title / artist
  local titleFS = header:CreateFontString(nil, "ARTWORK", "GameFontHighlightLarge")
  titleFS:SetFont(EpicMusicPlayer:GetFont(self.db.playlistfont), TITLE_FS)
  titleFS:SetPoint("TOP", art, "BOTTOM", 0, -PAD)
  titleFS:SetTextColor(1,1,1,1)

  local artistFS = header:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
  artistFS:SetFont(EpicMusicPlayer:GetFont(self.db.playlistfont), ARTIST_FS)
  artistFS:SetPoint("TOP", titleFS, "BOTTOM", 0, -4)
  artistFS:SetTextColor(0.85,0.85,0.85,1)

  -- buttons
  local playBtn = WoWButton(header, (L["Play"] or "Play"), function()
    if EpicMusicPlayer.Playing then EpicMusicPlayer:Stop() else EpicMusicPlayer:Play() end
  end)
  playBtn:SetPoint("TOPRIGHT", header, "BOTTOM", -PAD/2, HEADER_H * -1 + ART_SIZE + PAD*3 + 44)
  playBtn:SetPoint("LEFT", header, PAD, 0)

  local shuffleBtn = WoWButton(header, (L["Shuffle"] or "Shuffle"), function()
    EpicMusicPlayer:ToggleRandom()
  end)
  shuffleBtn:SetPoint("TOPLEFT", header, "BOTTOM", PAD/2, HEADER_H * -1 + ART_SIZE + PAD*3 + 44)
  shuffleBtn:SetPoint("RIGHT", header, -PAD, 0)

  -- fill in metadata
  local title, artist = currentAlbumMeta()
  titleFS:SetText(title)
  artistFS:SetText(artist)

  -- store
  self.header, self.art, self.playBtn, self.shuffleBtn = header, art, playBtn, shuffleBtn
  self.titleFS, self.artistFS = titleFS, artistFS

  return header
end

-- simple one-column track list (Title on first line, artist small on second)
function AV:buildList(parent)
  local tracks = EpicMusicPlayer:GetListByIndex(EpicMusicPlayer.selectedlistIndex) or {}
  local list = EpicMusicPlayer:CreateListWidget{
    name     = "EMP_AlbumList",
    parent   = parent,
    size     = #tracks,
    columns  = {1},
    font     = parent:GetParent().font,
    getCell  = function(row)
      local s = EpicMusicPlayer:GetSong(EpicMusicPlayer.selectedlistIndex, row)
      if not s then return "" end
      local title  = s.title or ""
      local artist = s.artist or ""
      -- two-line cell (FontString supports it)
      return title .. "\n|cffbbbbbb" .. artist .. "|r"
    end,
    onClick  = function(btn, which)
      if which == "LeftButton" then
        EpicMusicPlayer:PlaySong(EpicMusicPlayer.selectedlistIndex, btn.listindex)
      else
        EpicMusicPlayer:OpenSongMenu(btn, EpicMusicPlayer.selectedlistIndex, btn.listindex)
      end
    end,
  }
  list:SetPoint("TOPLEFT", parent, PAD, -HEADER_H - PAD)
  list:SetPoint("BOTTOMRIGHT", parent, -PAD, PAD)
  self.listFrame = list
  return list
end

function AV:onScroll()
  local offset = self.scroll:GetVerticalScroll() or 0
  -- Move header upwards as we scroll; clamp at its full height
  local y = -min(offset, HEADER_H)
  self.header:ClearAllPoints()
  self.header:SetPoint("TOPLEFT", self.content, PAD, y)
  self.header:SetPoint("TOPRIGHT", self.content, -PAD, y)

  -- fade buttons + art subtly as they move out
  local fade = max(0, 1 - (offset / (HEADER_H * 0.8)))
  self.art:SetAlpha(fade)
  self.playBtn:SetAlpha(fade)
  self.shuffleBtn:SetAlpha(fade)
end

function AV:build()
  if self.frame then return self.frame end
  local db = self.db

  local f = CreateFrame("Frame", "EMP_AlbumView", _G.UIParent, BackdropTemplateMixin and "BackdropTemplate")
  NineBg(f)
  f:SetFrameStrata(db.liststrata)
  f:SetSize(db.playlistWidth, db.playlistHeight)
  f.font = EpicMusicPlayer:GetFont(db.playlistfont)
  f:SetPoint(db.playlistPoint, _G.UIParent, db.playlistOffx, db.playlistOffy)
  f:EnableMouse(true)
  f:SetMovable(true)
  f:SetResizable(true)
  f:RegisterForDrag("LeftButton")
  f:SetScript("OnDragStart", function(self) self:StartMoving() end)
  f:SetScript("OnDragStop",  function(self) self:StopMovingOrSizing() end)
  table.insert(_G.UISpecialFrames, f:GetName())

  -- Scroll container
  local scroll = CreateFrame("ScrollFrame", nil, f, "UIPanelScrollFrameTemplate")
  scroll:SetPoint("TOPLEFT", f, PAD, -PAD)
  scroll:SetPoint("BOTTOMRIGHT", f, -PAD, PAD)

  local content = CreateFrame("Frame", nil, scroll)
  content:SetSize(1, 1) -- will expand as children anchor
  scroll:SetScrollChild(content)

  -- Build header and list inside content
  self.content = content
  self.header  = self:buildHeader(content)
  self.header:SetPoint("TOPLEFT", content, PAD, 0)
  self.header:SetPoint("TOPRIGHT", content, -PAD, 0)

  self:buildList(content)

  -- Make content tall enough for scrolling
  content:SetHeight(HEADER_H + PAD + max((#(EpicMusicPlayer:GetListByIndex(EpicMusicPlayer.selectedlistIndex) or {})) * ROW_H, 200) + PAD)

  -- react to scroll
  self.scroll = scroll
  scroll:SetScript("OnVerticalScroll", function(_, delta)
    ScrollFrameTemplate_OnMouseWheel(scroll, delta)
    self:onScroll()
  end)

  self.frame = f
  return f
end

function AV:toggle()
  if not self.frame then self:build() end
  if self.frame:IsShown() then self.frame:Hide() else self.frame:Show(); self:onScroll() end
end

-- Public entry
function EpicMusicPlayer:ToggleAlbumView()
  if not self.albumView then self.albumView = AV:new() end
  self.albumView:toggle()
end

