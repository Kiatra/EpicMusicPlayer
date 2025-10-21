--[[
EpicMusicPlayer – Playlist UI (Story-Style, Clean Architecture)

What you get:
- A tiny controller object (`PlaylistUI`) that owns state & wires view ↔ logic.
- Option-table API for the scroll list widget (clear & extensible).
- Sortable column header (Title / Time) with ▲▼, stable sort, row→model mapping.
- Named layout constants, helpers, and localized labels.
- Minimal global leakage; everything hangs off `EpicMusicPlayer` or the controller.

Files in this canvas:
1) playlistframe.lua
2) scrolllist.lua
]]

-----------------------------
-- playlistframe.lua
-----------------------------
local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local L               = LibStub("AceLocale-3.0"):GetLocale("EpicMusicPlayer")
local aceevent        = LibStub("AceEvent-3.0")

local _G, CreateFrame, math, GameTooltip = _G, CreateFrame, math, GameTooltip
local BackdropTemplateMixin = BackdropTemplateMixin
local UIParent = UIParent
local UISpecialFrames = UISpecialFrames

-------------------------------------------------------------
-- Layout & style constants
-------------------------------------------------------------
local PADDING      = 9
local HEADER_H     = 16
local COLHEADER_H  = 18
local FOOTER_H     = 18
local BTN_SIZE     = 16
local LIST_MIN_W   = 150
local LIST_MIN_H   = 50
local BOTH_MIN_W   = 300
local BOTH_MIN_H   = 200

local ICON = {
  play        = {"Interface/AddOns/EpicMusicPlayer/gui/pics/playButton.tga",      "Interface/AddOns/EpicMusicPlayer/gui/pics\playButton-p.tga"},
  stop        = {"Interface/AddOns/EpicMusicPlayer/gui/pics/stopButton.tga",      "Interface/AddOns/EpicMusicPlayer/gui/pics\stopButton-p.tga"},
  next        = {"Interface/AddOns/EpicMusicPlayer/gui/pics/nextButton.tga",      "Interface/AddOns/EpicMusicPlayer/gui/pics\nextButton-p.tga"},
  last        = {"Interface/AddOns/EpicMusicPlayer/gui/pics/lastButton.tga",      "Interface/AddOns/EpicMusicPlayer/gui/pics\lastButton-p.tga"},
  randomOn    = {"Interface/AddOns/EpicMusicPlayer/gui/pics/randomButton.tga",    "Interface/AddOns/EpicMusicPlayer/gui/pics\randomButton-p.tga"},
  randomOff   = {"Interface/AddOns/EpicMusicPlayer/gui/pics/randomButtonOff.tga", "Interface/AddOns/EpicMusicPlayer/gui/pics\randomButtonOff-p.tga"},
  config      = {"Interface/AddOns/EpicMusicPlayer/gui/pics/configButton.tga",    "Interface/AddOns/EpicMusicPlayer/gui/pics\configButton-p.tga"},
  list        = {"Interface/AddOns/EpicMusicPlayer/gui/pics/listButton.tga",      "Interface/AddOns/EpicMusicPlayer/gui/pics\listButton-p.tga"},
  add         = {"Interface/AddOns/EpicMusicPlayer/gui/pics/addButton.tga",       "Interface/AddOns/EpicMusicPlayer/gui/pics\addButton-p.tga"},
  import      = {"Interface/AddOns/EpicMusicPlayer/gui/pics/importButton.tga",    "Interface/AddOns/EpicMusicPlayer/gui/pics\importButton-p.tga"},
}

-------------------------------------------------------------
-- Helpers
-------------------------------------------------------------
local function anchorTRBL(frame, parent, tlx, tly, brx, bry)
  frame:ClearAllPoints()
  frame:SetPoint("TOPLEFT",  parent, tlx, tly)
  frame:SetPoint("BOTTOMRIGHT", parent, brx, bry)
end

local function IconButton(parent, iconKey, onclick)
  local files = ICON[iconKey]
  local b = CreateFrame("Button", nil, parent)
  b:SetSize(BTN_SIZE, BTN_SIZE)
  b:SetNormalTexture(files[1])
  b:SetPushedTexture(files[2])
  b:SetHighlightTexture("Interface/QuestFrame/UI-QuestTitleHighlight")
  b:EnableMouse(true)
  if onclick then b:SetScript("OnMouseUp", onclick) end
  return b
end

-- Classic compat shim
local function SetResizeBoundsShim(self, minW, minH)
  if self.SetResizeBounds then self:SetResizeBounds(minW, minH) else self.SetMaxResize(minW, minH) end
end

-------------------------------------------------------------
-- Controller: one small object that owns state and behavior
-------------------------------------------------------------
local PlaylistUI = {}
PlaylistUI.__index = PlaylistUI

function PlaylistUI:new()
  local db = EpicMusicPlayer.db
  local o = setmetatable({
    db               = db,
    frame            = nil,
    header           = nil,
    colHeader        = nil,
    listsList        = nil,
    songList         = nil,
    titleFS          = nil,
    playBtn          = nil,
    randomBtn        = nil,

    selectedListIdx  = db.list or 1,
    selectedList     = nil,

    sort             = { key = (db.playlistSort and db.playlistSort.key) or "title",
                         asc = (db.playlistSort and db.playlistSort.asc) ~= false },
    rowToModel       = nil, -- visible row -> actual song index
  }, self)
  return o
end

-------------------------------------------------------------
-- Sorting
-------------------------------------------------------------
function PlaylistUI:rebuildSort()
  local list = self.selectedList
  if not list then self.rowToModel = nil; return end

  local key = self.sort.key
  local asc = self.sort.asc and 1 or -1
  local idx = {}
  for i = 1, #list do idx[i] = i end

  table.sort(idx, function(a,b)
    local A, B = list[a], list[b]
    if not A or not B then return a < b end

    if key == "time" then
      local da = tonumber(A.duration) or 0
      local db = tonumber(B.duration) or 0
      if da == db then
        local ta = (A.title or "")
        local tb = (B.title or "")
        if ta == tb then return a < b end
        return asc * (ta < tb and 1 or -1) == 1
      end
      return asc * (da < db and 1 or -1) == 1
    else
      local aa, ta = (A.artist or ""), (A.title or "")
      local ab, tb = (B.artist or ""), (B.title or "")
      local la = (aa ~= "" and (aa .. "­" .. ta) or ta)
      local lb = (ab ~= "" and (ab .. "­" .. tb) or tb)
      if la == lb then return a < b end
      return asc * (la < lb and 1 or -1) == 1
    end
  end)

  self.rowToModel = idx
  if self.colHeader and self.colHeader.refreshSortMarkers then
    self.colHeader:refreshSortMarkers()
  end
end

function PlaylistUI:resolveIndex(row)
  return (self.rowToModel and self.rowToModel[row]) or row
end

-- === Cell rendering helpers to keep column logic tidy ===
function PlaylistUI:wrapHighlight(text, isOn)
  if not isOn or text == "" then return text end
  return "|cffffd200" .. text .. "|r"
end

function PlaylistUI:titleCell(row, song)
  local artist = song.artist or ""
  local title  = song.title  or ""
  if self.db.playlistHideArtist or artist == "" then
    return row .. " " .. title
  end
  return row .. " " .. artist .. " - " .. title
end

function PlaylistUI:albumCell(song)
  return song.album or ""
end

function PlaylistUI:timeCell(song)
  return EpicMusicPlayer:GetTimeString(song.duration)
end

-------------------------------------------------------------
-- View building
-------------------------------------------------------------
function PlaylistUI:buildHeader(parent)
  local db = self.db
  local header = CreateFrame("Frame", nil, parent, BackdropTemplateMixin and "BackdropTemplate")
  header:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background" })
  header:SetBackdropColor(0.2, 0.2, 0.2, 0.9)
  header:SetHeight(HEADER_H)

  local lastBtn = IconButton(header, "last", function() EpicMusicPlayer:PlayLast() end)
  lastBtn:SetPoint("TOPLEFT", header, 0, 0)

  self.playBtn = IconButton(header, EpicMusicPlayer.Playing and "stop" or "play", function()
    if EpicMusicPlayer.Playing then EpicMusicPlayer:Stop() else EpicMusicPlayer:Play() end
  end)
  self.playBtn:SetPoint("TOPLEFT", lastBtn, "TOPRIGHT", 0, 0)

  local nextBtn = IconButton(header, "next", function() EpicMusicPlayer:PlayNext() end)
  nextBtn:SetPoint("TOPLEFT", self.playBtn, "TOPRIGHT", 0, 0)

  self.randomBtn = IconButton(header, self.db.random and "randomOn" or "randomOff", function()
    EpicMusicPlayer:ToggleRandom()
  end)
  self.randomBtn:SetPoint("TOPLEFT", nextBtn, "TOPRIGHT", 0, 0)

  local configBtn = IconButton(header, "config", function(_, mouseBtn)
    if mouseBtn == "RightButton" then EpicMusicPlayer:ToggleMute() else EpicMusicPlayer:ShowConfig() end
  end)
  configBtn:SetPoint("TOPLEFT", self.randomBtn, "TOPRIGHT", 0, 0)

  local listBtn = IconButton(header, "list", function()
    self.db.hideListsList = not self.db.hideListsList
    self:layout()
  end)
  listBtn:SetPoint("TOPLEFT", configBtn, "TOPRIGHT", 0, 0)

  local addBtn = IconButton(header, "add", function() EpicMusicPlayer:CreatePlayListDialog() end)
  addBtn:SetPoint("TOPLEFT", listBtn, "TOPRIGHT", 0, 0)

  local importBtn = IconButton(header, "import", function() EpicMusicPlayer:ImportDialog() end)
  importBtn:SetPoint("TOPLEFT", addBtn, "TOPRIGHT", 0, 0)

  local closeBtn = CreateFrame("Button", nil, parent, "UIPanelCloseButton")
  closeBtn:SetSize(29, 29)
  closeBtn:SetPoint("TOPRIGHT", header, 7, 6)

  local titleFS = header:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
  titleFS:SetFont(EpicMusicPlayer:GetFont(db.playlistfont), 12)
  titleFS:SetPoint("TOPLEFT", listBtn, "TOPRIGHT", 5, 1)
  titleFS:SetPoint("BOTTOMRIGHT", header, -25, 0)
  titleFS:SetShadowColor(0, 0, 0, 0.8)
  titleFS:SetShadowOffset(1, -1)
  self.titleFS = titleFS

  return header
end

function PlaylistUI:buildColumnHeader(parent)
  local db = self.db
  local header = CreateFrame("Frame", nil, parent, BackdropTemplateMixin and "BackdropTemplate")
  header:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background" })
  header:SetBackdropColor(0.10, 0.10, 0.10, 0.9)
  header:SetHeight(COLHEADER_H)

  local function makeLabel(text, justify, onClick)
    local btn = CreateFrame("Button", nil, header)
    btn:SetHeight(COLHEADER_H)
    local fs = btn:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    fs:SetFont(EpicMusicPlayer:GetFont(db.playlistfont), 12)
    fs:SetJustifyH(justify)
    fs:SetPoint("TOPLEFT", btn, 3, 0)
    fs:SetPoint("BOTTOMRIGHT", btn, -3, 0)
    btn:SetFontString(fs)
    btn:SetScript("OnClick", onClick)
    return btn
  end

  local titleBtn = makeLabel(L[ "Title" ] or "Title", "LEFT", function()
    if self.sort.key == "title" then self.sort.asc = not self.sort.asc else self.sort.key = "title"; self.sort.asc = true end
    self.db.playlistSort = { key = self.sort.key, asc = self.sort.asc }
    self:rebuildSort(); self.songList:Update(); header:refreshSortMarkers()
  end)

  local timeBtn = makeLabel(L["Time"] or "Time", "RIGHT", function()
    if self.sort.key == "time"  then self.sort.asc = not self.sort.asc  else self.sort.key = "time";  self.sort.asc = true end
    self.db.playlistSort = { key = self.sort.key, asc = self.sort.asc }
    self:rebuildSort(); self.songList:Update(); header:refreshSortMarkers()
  end)

  header:SetScript("OnSizeChanged", function(self)
    local w = self:GetWidth()
    titleBtn:ClearAllPoints(); timeBtn:ClearAllPoints()
    titleBtn:SetPoint("TOPLEFT", self, 5, 0)
    titleBtn:SetWidth((w - 10) * 0.75)
    timeBtn:SetPoint("TOPLEFT", titleBtn, "TOPRIGHT", 0, 0)
    timeBtn:SetPoint("RIGHT", self, -5, 0)
  end)

  function header:refreshSortMarkers()
    local up = (self:GetParent().ui.sort.asc and "▲" or "▼")
    if self:GetParent().ui.sort.key == "time" then
      timeBtn:SetText((L[ "Time" ] or "Time") .. " " .. up)
      titleBtn:SetText(L[ "Title" ] or "Title")
    else
      titleBtn:SetText((L[ "Title" ] or "Title") .. " " .. up)
      timeBtn:SetText(L[ "Time" ] or "Time")
    end
  end

  -- stash back-ref for refresh
  header.ui = self
  self.colHeader = header
  return header
end

function PlaylistUI:buildFooter(parent)
  local footer = CreateFrame("Frame", nil, parent, BackdropTemplateMixin and "BackdropTemplate")
  footer:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background" })
  footer:SetBackdropColor(0.2, 0.2, 0.2, 0.9)
  footer:SetHeight(FOOTER_H)

  local editbox = CreateFrame("EditBox", nil, footer)
  anchorTRBL(editbox, footer, 3, 0, -3, 0)
  editbox:SetAutoFocus(false)
  editbox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
  editbox:SetFont(self.frame.font, 12, "")
  editbox:SetText(L["Search..."])
  editbox:SetScript("OnTextChanged", function(self)
    if self:GetText() ~= L["Search..."] then
      EpicMusicPlayer:Search(self:GetText())
      self:GetParent().ui:setList(EpicMusicPlayer:GetListIndex("lastsearch"))
    end
  end)
  editbox:SetScript("OnEditFocusGained", function(self) self:HighlightText(0, self:GetNumLetters()) end)
  editbox:SetScript("OnEditFocusLost",   function(self) self:SetText(L["Search..."]) end)

  footer.editbox = editbox
  footer.ui = self
  return footer
end

function PlaylistUI:buildFrame()
  local db = self.db
  local f = CreateFrame("Frame", "EpicMusicPlayer_PlaylistMain", UIParent, BackdropTemplateMixin and "BackdropTemplate")
  f:SetFrameStrata(db.liststrata)
  f:SetSize(db.playlistWidth, db.playlistHeight)
  f.font = EpicMusicPlayer:GetFont(db.playlistfont)
  f:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background", edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 } })
  f:SetBackdropColor(0,0,0,1)
  f:SetBackdropBorderColor(0.5,0.5,0.5,0.5)
  f:SetScale(db.playlistScale)
  f:SetPoint(db.playlistPoint, UIParent, db.playlistOffx, db.playlistOffy)
  f:EnableMouse(true)
  f:SetMovable(true)
  f:SetResizable(true)
  f:RegisterForDrag("LeftButton")
  SetResizeBoundsShim(f, 1000, 800)

  f:SetScript("OnDragStart", function(self) self:StartMoving(); self.isMoving = true end)
  f:SetScript("OnDragStop",  function(self)
    local relative, relativePoint
    db.playlistPoint, relative, relativePoint, db.playlistOffx, db.playlistOffy = self:GetPoint()
    self:StopMovingOrSizing(); self.isMoving = false
  end)
  f:SetClampedToScreen(true)
  table.insert(UISpecialFrames, f:GetName())

  -- sizer
  local sizer = CreateFrame("Frame", "EmpDragsizer", f, BackdropTemplateMixin and "BackdropTemplate")
  sizer:SetSize(25, 25)
  sizer:SetPoint("BOTTOMRIGHT")
  sizer:EnableMouse(true)
  sizer:SetMovable(true)
  sizer:RegisterForDrag("LeftButton")
  sizer:SetScript("OnDragStart", function() f:StartSizing(); f.isSizing = true end)
  sizer:SetScript("OnDragStop",  function()
    f:StopMovingOrSizing(); f.isSizing = false
    db.playlistWidth, db.playlistHeight = f:GetWidth(), f:GetHeight()
  end)
  local sizertx = sizer:CreateTexture(nil, "BACKGROUND")
  sizertx:SetSize(12, 12)
  sizertx:SetPoint("BOTTOMRIGHT", -5, 5)
  sizertx:SetTexture("Interface/AddOns/EpicMusicPlayer/media/sizer.tga")

  -- build chrome
  local header = self:buildHeader(f)
  header:SetPoint("TOPLEFT", f, PADDING, -PADDING)
  header:SetPoint("RIGHT",   f, "RIGHT", -PADDING, PADDING)

  local colHeader = self:buildColumnHeader(f)
  colHeader:SetPoint("TOPLEFT", f, PADDING, -PADDING - HEADER_H)
  colHeader:SetPoint("RIGHT",   f, "RIGHT", -PADDING, 0)

  -- song list (3 columns: title+artist, album, time)
  self.songList = EpicMusicPlayer:CreateListWidget{
    name         = "EpicMusicPlayer_Songlist",
    parent       = f,
    size         = 0, -- set after we know list
    columns      = {0.6, 0.3, 0.09},
    font         = f.font,
    resolveIndex = function(row) return self:resolveIndex(row) end,
    getCell      = function(row, col)
      local realIndex = self:resolveIndex(row)
      local song = EpicMusicPlayer:GetSong(self.selectedListIdx, realIndex)
      if not song then return "" end

      local highlight = (self.db.list == self.selectedListIdx and realIndex == self.db.song)
      local text
      if col == 1 then
        text = self:titleCell(row, song)
      elseif col == 2 then
        text = self:albumCell(song)
      elseif col == 3 then
        text = self:timeCell(song)
      else
        text = ""
      end
      return self:wrapHighlight(text, highlight)
    end,
    onClick      = function(btn, which)
      if which == "LeftButton" then
        return EpicMusicPlayer:PlaySong(self.listsList.selectedIndex, btn.listindex)
      end
      EpicMusicPlayer:OpenSongMenu(btn, self.listsList.selectedIndex, btn.listindex)
    end,
    onLeave      = function() GameTooltip:Hide() end,
    checkToggle  = function(cb)
      local song = EpicMusicPlayer:GetSong(self.listsList.selectedIndex, cb.listindex)
      if not song then return end
      song.isChecked = not song.isChecked
      (song.isChecked and cb.check.Show or cb.check.Hide)(cb.check)
    end,
  }

  -- playlists (left)
  self.listsList = EpicMusicPlayer:CreateListWidget{
    name     = "EpicMusicPlayer_Playlists",
    parent   = f,
    size     = #EpicMusicPlayer.playlists,
    columns  = {1},
    font     = f.font,
    getCell  = function(row)
      local name = EpicMusicPlayer:GetListName(row)
      if self.db.list == row then
        return "|cffffd200"..name
      elseif not EpicMusicPlayer:IsListSaved(row) then
        return "|cffA9A9A9"..name
      else
        return name
      end
    end,
    onClick  = function(button, mouseBtn)
      if mouseBtn == "RightButton" then
        EpicMusicPlayer:OpenListMenu(button, button.listindex)
      else
        self:setList(button.listindex)
      end
    end,
  }

  -- search footer
  local footer = self:buildFooter(f)

  -- save refs
  self.frame = f
  self.header = header

  -- initial data wiring
  self:setList(self.selectedListIdx)

  -- final layout after widgets exist
  self:layout()

  -- title now that we know current song
  local song = EpicMusicPlayer:GetCurrentSong()
  if song then
    self:updateTitle(song.artist, EpicMusicPlayer:GetCurrentSongName())
  else
    self:updateTitle("", EpicMusicPlayer:GetCurrentSongName())
  end

  return f
end

-------------------------------------------------------------
-- Layout & updates
-------------------------------------------------------------
function PlaylistUI:layout()
  local f = self.frame
  local showLeft = not self.db.hideListsList

  -- Lists panel bounds
  if showLeft then
    anchorTRBL(self.listsList, f, 5, -PADDING - HEADER_H - COLHEADER_H, - (f:GetWidth() - 150), 27) -- left width ~145
  else
    self.listsList:Hide()
  end

  -- Song list bounds (account for column header)
  local leftX = showLeft and 150 or 5
  anchorTRBL(self.songList, f, leftX, -PADDING - HEADER_H - COLHEADER_H, -5, 27)

  -- Column header spans above song list
  self.colHeader:ClearAllPoints()
  self.colHeader:SetPoint("TOPLEFT", f, leftX, -PADDING - HEADER_H)
  self.colHeader:SetPoint("RIGHT",   f, -5, 0)
  self.colHeader:Show()
  self.colHeader:refreshSortMarkers()

  -- Resize bounds depend on left pane visibility
  if showLeft then
    SetResizeBoundsShim(f, BOTH_MIN_W, BOTH_MIN_H)
    self.listsList:Show()
  else
    SetResizeBoundsShim(f, LIST_MIN_W, LIST_MIN_H)
  end

  -- let widgets recompute internal button counts
  if self.songList.scrollbar and self.songList.scrollbar:GetScript("OnSizeChanged") then
    self.songList.scrollbar:GetScript("OnSizeChanged")(self.songList.scrollbar)
  end
  if self.listsList.scrollbar and self.listsList.scrollbar:GetScript("OnSizeChanged") then
    self.listsList.scrollbar:GetScript("OnSizeChanged")(self.listsList.scrollbar)
  end
end

function PlaylistUI:updateTitle(artist, songname)
  if EpicMusicPlayer.Playing then
    if artist ~= "" then
      self.titleFS:SetText("|cffffd200"..artist.."|r - "..(songname or ""))
    else
      self.titleFS:SetText(songname or "")
    end
  else
    self.titleFS:SetText(songname or "")
  end
end

function PlaylistUI:setList(index)
  self.selectedListIdx = index
  self.selectedList = EpicMusicPlayer:GetListByIndex(index)
  self.listsList:SetSelected(index)
  self.songList:SetMax(#self.selectedList)
  self:rebuildSort()
  self.songList:Update()
end

-------------------------------------------------------------
-- Public addon API glue
-------------------------------------------------------------
function EpicMusicPlayer:ClearSearchFocus()
  if self.playlistUI and self.playlistUI.frame then
    self.playlistUI.frame.editbox:ClearFocus()
  end
end

function EpicMusicPlayer:PlayListGuiUpdate(listChanged)
  local ui = self.playlistUI
  if not ui then return end
  if listChanged then
    ui.listsList:SetMax(#EpicMusicPlayer.playlists)
    ui:setList(1)
  else
    ui.songList:SetMax(#ui.selectedList)
    ui:rebuildSort(); ui.songList:Update()
  end
end

function EpicMusicPlayer:PlayListGuiListUpdate()
  local ui = self.playlistUI
  if ui then ui.listsList:Update() end
end

function EpicMusicPlayer:TogglePlayListGui()
  if not self.playlistUI then
    self.playlistUI = PlaylistUI:new()

    -- subscribe to updates
    aceevent:RegisterMessage("EMPUpdatePlay", function(_, artist, song, len)
      if self.playlistUI then
        self.playlistUI:updateTitle(artist or "", song or "")
        self.playlistUI.playBtn:SetNormalTexture(ICON.stop[1])
        self.playlistUI.playBtn:SetPushedTexture(ICON.stop[2])
        self.playlistUI.listsList:Update(); self.playlistUI.songList:Update()
      end
    end)

    aceevent:RegisterMessage("EMPUpdateStop", function(_, artist, song)
      if self.playlistUI then
        self.playlistUI:updateTitle(artist or "", song or "")
        self.playlistUI.playBtn:SetNormalTexture(ICON.play[1])
        self.playlistUI.playBtn:SetPushedTexture(ICON.play[2])
      end
    end)

    aceevent:RegisterMessage("EMPUpdateRandom", function(_, val)
      local ui = self.playlistUI; if not ui then return end
      local files = val and ICON.randomOn or ICON.randomOff
      ui.randomBtn:SetNormalTexture(files[1])
      ui.randomBtn:SetPushedTexture(files[2])
    end)
  end

  if not self.playlistUI.frame then
    local f = self.playlistUI:buildFrame()
    self.playlistUI.frame = f
  end

  local f = self.playlistUI.frame
  if f:IsShown() then f:Hide() else f:Show() end
end

function EpicMusicPlayer:SetPlaylistScale(val)
  if self.playlistUI and self.playlistUI.frame then
    self.playlistUI.frame:SetScale(val)
  end
end

-------------------------------------------------------------
-- Title update on login if a song already active
-------------------------------------------------------------
local function initTitleOnce()
  local ui = EpicMusicPlayer.playlistUI
  if not ui or not ui.titleFS then return end
  local s = EpicMusicPlayer:GetCurrentSong()
  if s then ui:updateTitle(s.artist, EpicMusicPlayer:GetCurrentSongName()) end
end


-----------------------------
-- scrolllist.lua (option-table API)
-----------------------------
local EpicMusicPlayer = LibStub("AceAddon-3.0"):GetAddon("EpicMusicPlayer")
local _G, math = _G, math

local function updateCheckButton(checkButton, resolvedIndex)
  if not checkButton then return end
  if resolvedIndex then
    local song = EpicMusicPlayer:GetSong(EpicMusicPlayer.selectedlistIndex, resolvedIndex)
    if song and song.isChecked then checkButton.check:Show() else checkButton.check:Hide() end
    checkButton:Show(); checkButton.listindex = resolvedIndex
  else
    checkButton:Hide(); checkButton.listindex = nil
  end
end

local function ScrollUpdate(self, offset)
  local frame = self:GetParent()
  local numButtons   = frame.numButtons
  local size         = frame.size
  local columns      = frame.columns
  local selected     = frame.selectedIndex

  for line = 1, numButtons do
    local button = frame.buttons[line]
    local check  = frame.checkFunc and frame.checkButtons[line] or nil
    local row    = line + offset

    if row <= size then
      row = math.floor(row)
      local resolved = frame.resolveIndex and frame.resolveIndex(row) or row
      for c = 1, #columns do
        button["col"..c]:SetText(frame.getCell(row, c))
      end
      updateCheckButton(check, resolved)
      button:Show()
      button.listindex = resolved
    else
      updateCheckButton(check, nil)
      button:Hide()
      button.listindex = nil
    end

    if selected == row then button:LockHighlight() else button:UnlockHighlight() end
  end
end

local function UpdateColumnLayout(self, button)
  local columns = self.columns
  if #columns < 2 then return end
  local relative = nil
  for i = 1, #columns do
    local text = button["col"..i]
    text:SetWidth(button:GetWidth() * columns[i])
    text:SetHeight(self.buttonHeight)
    if button:GetWidth() < 450 then
      if i == 1 then
        text:SetPoint("TOPLEFT", button, 3, 0)
        text:SetPoint("RIGHT",   button, "RIGHT", 0, 0)
      else
        text:Hide()
      end
    else
      text:Show()
      if i == #columns then
        text:SetPoint("TOPRIGHT", button, "TOPRIGHT", 0, 0)
      elseif i == #columns - 1 then
        text:SetPoint("TOPLEFT", relative, "TOPRIGHT", 0, 0)
        text:SetPoint("RIGHT",   button["col"..#columns], "LEFT", 0, 0)
      else
        if relative then text:SetPoint("TOPLEFT", relative, "TOPRIGHT", 0, 0)
        else text:ClearAllPoints(); text:SetPoint("TOPLEFT", button, 3, 0) end
      end
    end
    relative = text
  end
  button["col"..#columns]:SetPoint("BOTTOMRIGHT", button, 0, 0)
end

local function CreateRowButton(parent, height, columns, onClick, onEnter, onLeave, font)
  local btn = CreateFrame("Button", nil, parent)
  btn:SetHeight(height)
  local n = #columns
  for i = 1, n do
    local fs = btn:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    fs:SetFont(font, 12)
    fs:SetNonSpaceWrap(true)
    fs:SetJustifyH(i == n and n > 1 and "RIGHT" or "LEFT")
    btn["col"..i] = fs
    if n == 1 then
      fs:SetPoint("TOPLEFT", btn, 3, 0)
      fs:SetPoint("BOTTOMRIGHT", btn, 0, 0)
    end
  end
  parent:UpdateColumnLayout(btn)
  btn:SetHighlightTexture("Interface/QuestFrame/UI-QuestTitleHighlight")
  btn:RegisterForClicks("AnyUp")
  btn:SetScript("OnClick", onClick)
  btn:SetScript("OnEnter", onEnter)
  btn:SetScript("OnLeave", onLeave)
  return btn
end

local function resize(self)
  self.numButtons = math.floor((self:GetHeight() - 8) / self.buttonHeight)
  local n           = self.numButtons
  local buttons     = self.buttons
  local checkBtns   = self.checkButtons
  local relative    = nil
  local checkRel    = nil

  for i = 1, n do
    local rowBtn = buttons[i]
    local cb     = checkBtns[i]

    if not cb and self.checkFunc then
      if checkRel then
        cb = CreateFrame("CheckButton", nil, checkRel)
        cb:SetSize(self.buttonHeight, self.buttonHeight)
        cb:SetPoint("TOPLEFT", checkRel, "BOTTOMLEFT", 0, 0)
      else
        cb = CreateFrame("CheckButton", nil, self)
        cb:SetSize(self.buttonHeight, self.buttonHeight)
        cb:SetPoint("TOPLEFT", self, 5, -7)
      end
      local bg = cb:CreateTexture(nil, "ARTWORK")
      bg:SetSize(self.buttonHeight - 5, self.buttonHeight - 5)
      bg:SetPoint("TOPLEFT")
      bg:SetTexture("Interface/Buttons/UI-RadioButton"); bg:SetTexCoord(0, 0.25, 0, 1)
      local check = cb:CreateTexture(nil, "OVERLAY")
      check:SetTexture("Interface/Buttons/UI-RadioButton"); check:SetTexCoord(0.25, 0.5, 0, 1)
      check:SetBlendMode("ADD"); check:SetAllPoints(bg)
      cb.check = check
      local hl = cb:CreateTexture(nil, "HIGHLIGHT")
      hl:SetTexture("Interface/Buttons/UI-CheckBox-Highlight"); hl:SetBlendMode("ADD"); hl:SetAllPoints(bg)
      cb:Show(); cb:SetScript("OnClick", self.checkFunc)
      checkBtns[i] = cb
    end

    if not rowBtn then
      rowBtn = CreateRowButton(self, self.buttonHeight, self.columns, self.onClick, self.onEnter, self.onLeave, self.font)
      buttons[i] = rowBtn
      rowBtn:ClearAllPoints()
      if relative then
        rowBtn:SetPoint("TOPLEFT", relative, "BOTTOMLEFT", 0, 0)
        rowBtn:SetPoint("RIGHT",   self, "RIGHT", -28, 0)
      else
        rowBtn:SetPoint("TOPLEFT", self.xOffset, -5)
        rowBtn:SetPoint("RIGHT",   self, "RIGHT", -28, 0)
      end
    end

    rowBtn:Show()
    relative  = rowBtn
    checkRel  = cb
    self:UpdateColumnLayout(rowBtn)
  end

  for i = n + 1, #buttons do if buttons[i] then buttons[i]:Hide() end end
  for i = n + 1, #checkBtns do if checkBtns[i] then checkBtns[i]:Hide() end end

  self:SetMax(self.size)
end

local function SetSelected(self, index)
  self.selectedIndex = index
  ScrollUpdate(self.scrollbar, self.scrollbar:GetValue())
end

local function Update(self) ScrollUpdate(self.scrollbar, self.scrollbar:GetValue()) end

local function SetMax(self, size)
  self.size = size or 0
  local sb = self.scrollbar
  if size - self.numButtons > 1 then
    sb:SetMinMaxValues(0, size - self.numButtons)
    sb:Show()
  else
    sb:SetMinMaxValues(0, 0)
    sb:Hide()
  end
  ScrollUpdate(sb, sb:GetValue())
end

-- Option-table API for clarity & extensibility
function EpicMusicPlayer:CreateListWidget(opts)
  local frame = CreateFrame("Frame", opts.name, opts.parent, BackdropTemplateMixin and "BackdropTemplate")
  frame.Update             = Update
  frame.ScrollUpdate       = ScrollUpdate
  frame.buttons            = {}
  frame.checkButtons       = {}
  frame.buttonHeight       = 17
  frame.numButtons         = 0
  frame.columns            = opts.columns or {1}
  frame.getCell            = opts.getCell
  frame.resolveIndex       = opts.resolveIndex
  frame.onClick            = opts.onClick
  frame.onEnter            = opts.onEnter
  frame.onLeave            = opts.onLeave
  frame.SetMax             = SetMax
  frame.size               = opts.size or 0
  frame.UpdateColumnLayout = UpdateColumnLayout
  frame.selectedIndex      = 0
  frame.SetSelected        = SetSelected
  frame.font               = opts.font
  frame.checkFunc          = opts.checkToggle
  frame.xOffset            = opts.checkToggle and 16 or 6

  frame:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background", edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 } })
  frame:SetBackdropColor(0.2, 0.2, 0.2, 0.9)
  frame:SetBackdropBorderColor(0.5, 0.5, 0.5, 0)

  local scrollbar = CreateFrame("Slider", nil, frame, "UIPanelScrollBarTemplate")
  scrollbar:SetPoint("TOPLEFT", frame, "TOPRIGHT", -20, -20)
  scrollbar:SetPoint("BOTTOMLEFT", frame, "BOTTOMRIGHT", 20, 20)
  scrollbar:SetScript("OnValueChanged", _G.OnScrollValueChanged)
  scrollbar:SetMinMaxValues(0, 100)
  scrollbar:SetValueStep(1)
  scrollbar:SetValue(0)
  scrollbar:SetWidth(16)
  frame.scrollbar = scrollbar

  local step = 3
  frame:EnableMouseWheel(true)
  frame:SetScript("OnMouseWheel", function(self, val)
    if _G.IsControlKeyDown() then
      local p = frame:GetParent(); p:SetScale(p:GetScale() + 0.1 * val)
    else
      scrollbar:SetValue(scrollbar:GetValue() - step * val)
    end
  end)

  _G[opts.name.."ScrollUpButton"]:SetScript("OnClick",   function(btn) local p = btn:GetParent(); p:SetValue(p:GetValue() - step) end)
  _G[opts.name.."ScrollDownButton"]:SetScript("OnClick", function(btn) local p = btn:GetParent(); p:SetValue(p:GetValue() + step) end)

  scrollbar:SetScript("OnValueChanged", ScrollUpdate)
  scrollbar:SetScript("OnSizeChanged",  function(self) resize(self:GetParent()) end)

  return frame
end
