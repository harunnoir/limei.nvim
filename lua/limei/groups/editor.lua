local M = {}

function M.get(c, options)
  local bg = options.transparent and "NONE" or c.bg
  local deep = options.transparent and "NONE" or c.bg_deep

  return {
    -- Active and inactive windows
    Normal = { fg = c.fg, bg = bg },
    NormalNC = { link = "Normal" },
    EndOfBuffer = { fg = bg, bg = bg },
    Conceal = { fg = c.fg_dim },
    Directory = { fg = c.navigation },
    Title = { fg = c.fg_bright, bold = true },

    WinBar = { fg = c.fg, bg = bg },
    WinBarNC = { fg = c.fg_muted, bg = bg },

    -- Split separators
    WinSeparator = { fg = "#000000" },
    VertSplit = { link = "WinSeparator" },

    -- Cursor and current line
    Cursor = { fg = c.bg, bg = c.fg_bright },
    lCursor = { link = "Cursor" },
    CursorIM = { link = "Cursor" },
    TermCursor = { link = "Cursor" },
    TermCursorNC = { fg = c.bg, bg = c.fg_dim },
    CursorLine = { bg = c.bg_alt },
    CursorColumn = { bg = c.bg_alt },
    ColorColumn = { bg = c.bg_alt },
    LineNr = { fg = c.fg_hidden },
    LineNrAbove = { link = "LineNr" },
    LineNrBelow = { link = "LineNr" },
    CursorLineNr = { fg = c.fg_dim, bold = true },
    CursorLineSign = { fg = c.fg_dim, bg = c.bg_alt },
    CursorLineFold = { fg = c.fg_dim, bg = c.bg_alt },
    SignColumn = { fg = c.fg_muted, bg = bg },
    FoldColumn = { fg = c.fg_muted, bg = bg },
    Folded = { fg = c.fg_dim, bg = c.bg_alt },

    -- Selection and search
    Visual = { bg = c.bg_selection },
    VisualNOS = { link = "Visual" },
    Search = { fg = c.type, bg = c.bg_selection },
    CurSearch = { fg = c.bg, bg = c.warning, bold = true },
    IncSearch = { fg = c.bg, bg = c.warning, bold = true },
    Substitute = { fg = c.bg, bg = c.transform, bold = true },
    MatchParen = { bold = true },

    -- Tabs and statusline
    StatusLine = { fg = c.fg, bg = c.bg_surface },
    StatusLineNC = { fg = c.fg_muted, bg = c.bg_surface },
    TabLine = { fg = c.fg_dim, bg = c.bg_alt },
    TabLineFill = { bg = deep },
    TabLineSel = { fg = c.fg_bright, bg = c.bg_surface, bold = true },

    -- Floating windows and borders
    NormalFloat = { fg = c.fg, bg = c.bg_popup },
    FloatBorder = { fg = c.border, bg = c.bg_popup },
    FloatTitle = { fg = c.fg_bright, bg = c.bg_popup, bold = true },
    FloatFooter = { fg = c.fg_dim, bg = c.bg_popup },
    LspInfoBorder = { link = "FloatBorder" },

    -- Popup menus
    Pmenu = { fg = c.fg, bg = c.bg_popup },
    PmenuSel = { fg = c.fg_bright, bg = c.bg_selection, bold = true },
    PmenuKind = { fg = c.fg_dim, bg = c.bg_popup },
    PmenuKindSel = { fg = c.fg_bright, bg = c.bg_selection },
    PmenuExtra = { fg = c.fg_muted, bg = c.bg_popup },
    PmenuExtraSel = { fg = c.fg_dim, bg = c.bg_selection },
    PmenuMatch = { fg = c.type, bg = c.bg_popup },
    PmenuMatchSel = { fg = c.type, bg = c.bg_selection, bold = true },
    PmenuSbar = { bg = c.bg_alt },
    PmenuThumb = { bg = c.fg_hidden },
    WildMenu = { link = "PmenuSel" },

    -- Whitespace and separators
    Whitespace = { fg = c.fg_hidden },
    NonText = { fg = c.fg_hidden },
    SpecialKey = { fg = c.fg_hidden },

    -- Messages and lists
    ErrorMsg = { link = "LimeiError" },
    WarningMsg = { link = "LimeiWarning" },
    MoreMsg = { link = "LimeiInfo" },
    ModeMsg = { fg = c.fg_bright, bold = true },
    Question = { link = "LimeiInfo" },
    QuickFixLine = { fg = c.fg_bright, bg = c.bg_selection },

    -- Diff and spelling
    DiffAdd = { fg = c.literal, bg = c.bg_alt },
    DiffChange = { fg = c.warning, bg = c.bg_alt },
    DiffDelete = { fg = c.error, bg = c.bg_alt },
    DiffText = { fg = c.fg_bright, bg = c.bg_selection, bold = true },
    Added = { link = "LimeiAdded" },
    Changed = { link = "LimeiChanged" },
    Removed = { link = "LimeiRemoved" },
    SpellBad = { sp = c.error, undercurl = true },
    SpellCap = { sp = c.fg_dim, undercurl = true },
    SpellLocal = { sp = c.fg_dim, undercurl = true },
    SpellRare = { sp = c.fg_dim, undercurl = true },
  }
end

return M
