local M = {}

function M.get(c)
  return {
    -- lspsaga.nvim (names verified from its current highlight module)
    SagaNormal = { link = "NormalFloat" },
    SagaBorder = { link = "FloatBorder" },
    SagaTitle = { link = "FloatTitle" },
    SagaBeacon = { fg = c.rose, bg = c.bg_alt },
    SagaVirtLine = { fg = c.fg_hidden },
    SagaCount = { fg = c.fg_bright, bg = c.bg_selection, bold = true },
    SagaText = { fg = c.fg },
    SagaDetail = { fg = c.fg_dim },
    SagaFinderFname = { fg = c.fg },
    SagaSelect = { link = "PmenuSel" },
    SagaSearch = { link = "Search" },
    SagaSep = { link = "ColdPunctuation" },
    ActionPreviewNormal = { link = "NormalFloat" },
    ActionPreviewBorder = { link = "FloatBorder" },
    ActionPreviewTitle = { link = "FloatTitle" },
    CodeActionText = { fg = c.fg },
    CodeActionNumber = { fg = c.amber },
    CodeActionCursorLine = { link = "CursorLine" },
    HoverNormal = { link = "NormalFloat" },
    HoverBorder = { link = "FloatBorder" },
    RenameNormal = { link = "NormalFloat" },
    RenameBorder = { link = "FloatBorder" },
    RenameMatch = { fg = c.clay, underline = true },
    DiagnosticNormal = { link = "NormalFloat" },
    DiagnosticBorder = { link = "FloatBorder" },
    SagaLightBulb = { fg = c.amber },
    SagaFileName = { fg = c.fg },
    SagaFolderName = { fg = c.ochre },
    SagaWinbarSep = { fg = c.fg_hidden },
    SagaWinbarFileName = { fg = c.fg_dim },
    SagaWinbarFolderName = { fg = c.fg_dim },
    SagaWinbarFolder = { fg = c.fg_muted },

    -- fidget.nvim
    FidgetTitle = { fg = c.fg_dim },
    FidgetTask = { fg = c.fg_muted },

    -- glance.nvim
    GlanceListNormal = { fg = c.fg, bg = c.bg_surface },
    GlancePreviewNormal = { fg = c.fg, bg = c.bg_alt },
    GlanceListCursorLine = { link = "PmenuSel" },
    GlancePreviewCursorLine = { link = "CursorLine" },
    GlanceListMatch = { fg = c.wheat, bold = true },
    GlancePreviewMatch = { link = "Search" },
    GlanceListFilename = { fg = c.fg },
    GlanceListFilepath = { fg = c.fg_dim },
    GlanceWinBarTitle = { fg = c.fg_bright, bold = true },
    GlanceWinBarFilename = { fg = c.fg },
    GlanceWinBarFilepath = { fg = c.fg_dim },
    GlanceBorderTop = { link = "WinSeparator" },
    GlanceListBorderBottom = { link = "WinSeparator" },
    GlancePreviewBorderBottom = { link = "WinSeparator" },

    -- trouble.nvim
    TroubleNormal = { link = "NormalFloat" },
    TroubleNormalNC = { link = "NormalFloat" },
    TroubleText = { fg = c.fg },
    TroubleSource = { fg = c.fg_dim },
    TroubleCode = { fg = c.fg_muted },
    TroubleCount = { fg = c.amber },
    TroublePreview = { bg = c.bg_alt },
    TroubleIndent = { fg = c.indent },
    TroubleFilename = { fg = c.fg },
    TroubleDirectory = { fg = c.fg_dim },

    -- tiny-inline-diagnostic.nvim
    TinyInlineDiagnosticVirtualTextError = { fg = c.rose_dim },
    TinyInlineDiagnosticVirtualTextWarn = { fg = c.amber_dim },
    TinyInlineDiagnosticVirtualTextInfo = { fg = c.fg_dim },
    TinyInlineDiagnosticVirtualTextHint = { fg = c.sage_dim },
    TinyInlineDiagnosticVirtualTextArrow = { fg = c.fg_hidden },
    TinyInlineDiagnosticVirtualTextArrowNoBg = { fg = c.fg_hidden },

    -- symbol-usage.nvim and quicker.nvim
    SymbolUsageRef = { fg = c.fg_muted },
    SymbolUsageDef = { fg = c.fg_dim },
    SymbolUsageImpl = { fg = c.fg_dim },
    QuickFixHeaderHard = { fg = c.fg_dim, bold = true },
    QuickFixHeaderSoft = { link = "Comment" },
    QuickFixFilename = { link = "Directory" },
    QuickFixFilenameInvalid = { link = "Comment" },
    QuickFixLineNr = { link = "LineNr" },
    QuickFixTextInvalid = { fg = c.fg_muted },
  }
end

return M
