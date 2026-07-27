local M = {}

function M.get(c, options)
  local bg = options.transparent and "NONE" or c.bg
  local deep = options.transparent and "NONE" or c.bg_deep
  local inactive = options.transparent and "NONE" or c.bg_inactive
  local normal_nc = options.dim_inactive and { fg = c.fg_dim, bg = inactive } or { fg = c.fg, bg = bg }
  local inactive_surface = options.dim_inactive and inactive or c.bg_alt

  return {
    -- Active and inactive windows
    Normal = { fg = c.fg, bg = bg },
    NormalNC = normal_nc,
    EndOfBuffer = { fg = bg, bg = bg },
    Conceal = { fg = c.fg_dim },
    Directory = { fg = c.ochre },
    Title = { fg = c.fg_bright, bold = true },

    WinBar = { fg = c.fg, bg = bg },
    WinBarNC = { fg = c.fg_muted, bg = inactive_surface },

    -- Split separators
    WinSeparator = { fg = c.separator, bg = c.separator },
    VertSplit = { fg = c.separator, bg = c.separator },

    -- Cursor and current line
    Cursor = { fg = c.bg, bg = c.fg_bright },
    lCursor = { link = "Cursor" },
    CursorIM = { link = "Cursor" },
    TermCursor = { link = "Cursor" },
    TermCursorNC = { fg = c.bg, bg = c.fg_dim },
    CursorLine = { bg = c.bg_alt },
    CursorColumn = { bg = c.bg_alt },
    ColorColumn = { bg = c.bg_alt },
    LineNr = { fg = c.fg_muted },
    LineNrAbove = { link = "LineNr" },
    LineNrBelow = { link = "LineNr" },
    CursorLineNr = { fg = c.fg_bright, bold = true },
    SignColumn = { fg = c.fg_muted, bg = bg },
    FoldColumn = { fg = c.fg_muted, bg = bg },
    Folded = { fg = c.fg_dim, bg = c.bg_alt },

    -- Selection and search
    Visual = { bg = c.bg_selection },
    VisualNOS = { link = "Visual" },
    Search = { fg = c.wheat, bg = c.bg_selection },
    CurSearch = { fg = c.bg, bg = c.amber, bold = true },
    IncSearch = { fg = c.bg, bg = c.amber, bold = true },
    Substitute = { fg = c.bg, bg = c.rust, bold = true },
    MatchParen = { fg = c.wheat, bold = true, underline = true },

    -- Tabs and statusline
    StatusLine = { fg = c.fg, bg = c.bg_surface },
    StatusLineNC = { fg = c.fg_muted, bg = inactive_surface },
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
    PmenuMatch = { fg = c.wheat, bg = c.bg_popup },
    PmenuMatchSel = { fg = c.wheat, bg = c.bg_selection, bold = true },
    PmenuSbar = { bg = c.bg_alt },
    PmenuThumb = { bg = c.fg_hidden },
    WildMenu = { link = "PmenuSel" },

    -- Whitespace and separators
    Whitespace = { fg = c.whitespace },
    NonText = { fg = c.fg_hidden },
    SpecialKey = { fg = c.fg_hidden },

    -- Messages and lists
    ErrorMsg = { link = "ColdError" },
    WarningMsg = { link = "ColdWarning" },
    MoreMsg = { link = "ColdInfo" },
    ModeMsg = { fg = c.fg_bright, bold = true },
    Question = { link = "ColdInfo" },
    QuickFixLine = { fg = c.fg_bright, bg = c.bg_selection },

    -- Diff and spelling
    DiffAdd = { fg = c.sage, bg = c.bg_alt },
    DiffChange = { fg = c.amber, bg = c.bg_alt },
    DiffDelete = { fg = c.rose, bg = c.bg_alt },
    DiffText = { fg = c.fg_bright, bg = c.bg_selection, bold = true },
    Added = { link = "ColdAdded" },
    Changed = { link = "ColdChanged" },
    Removed = { link = "ColdRemoved" },
    SpellBad = { sp = c.rose, undercurl = true },
    SpellCap = { sp = c.fg_dim, undercurl = true },
    SpellLocal = { sp = c.fg_dim, undercurl = true },
    SpellRare = { sp = c.fg_dim, undercurl = true },
  }
end

return M
