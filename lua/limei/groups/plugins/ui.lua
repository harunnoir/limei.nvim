local M = {}

function M.get(c)
  return {
    -- lazy.nvim and mason.nvim
    LazyNormal = { link = "NormalFloat" },
    LazyButton = { link = "Pmenu" },
    LazyButtonActive = { link = "PmenuSel" },
    LazyH1 = { link = "FloatTitle" },
    LazySpecial = { fg = c.fg_dim },
    LazyComment = { link = "Comment" },
    MasonNormal = { link = "NormalFloat" },
    MasonHeader = { fg = c.fg_bright, bg = c.bg_surface, bold = true },
    MasonHeaderSecondary = { link = "FloatBorder" },
    MasonHighlight = { fg = c.fg_dim },
    MasonHighlightBlockBold = { link = "PmenuSel" },
    MasonMuted = { fg = c.fg_muted },

    -- WhichKey, Noice, Notify, and nui.nvim
    WhichKeyNormal = { link = "NormalFloat" },
    WhichKeyBorder = { link = "FloatBorder" },
    WhichKey = { fg = c.type },
    WhichKeyDesc = { fg = c.fg },
    WhichKeyGroup = { fg = c.structure },
    WhichKeySeparator = { fg = c.fg_hidden },
    WhichKeyValue = { fg = c.fg_muted },
    NoicePopup = { link = "NormalFloat" },
    NoicePopupBorder = { link = "FloatBorder" },
    NoiceCmdlinePopup = { link = "NormalFloat" },
    NoiceCmdlinePopupBorder = { link = "FloatBorder" },
    NotifyBackground = { link = "NormalFloat" },
    NotifyERRORBorder = { link = "DiagnosticError" },
    NotifyWARNBorder = { link = "DiagnosticWarn" },
    NotifyINFOBorder = { link = "DiagnosticInfo" },

    -- slimline.nvim and bufferline.nvim
    SlimlineModeNormal = { fg = c.fg_bright, bold = true },
    SlimlineModeInsert = { fg = c.literal, bold = true },
    SlimlineModeVisual = { fg = c.symbol, bold = true },
    SlimlineModeReplace = { fg = c.transform, bold = true },
    SlimlineModeCommand = { fg = c.fg_bright, bold = true },
    SlimlineInactive = { fg = c.fg_muted },
    BufferLineFill = { link = "TabLineFill" },
    BufferLineBackground = { link = "TabLine" },
    BufferLineBufferVisible = { link = "TabLine" },
    BufferLineBufferSelected = { link = "TabLineSel" },
    BufferLineSeparator = { link = "WinSeparator" },
    BufferLineModified = { fg = c.warning },

    -- satellite.nvim and columns
    SatelliteBackground = { fg = c.fg_hidden },
    SatelliteBar = { fg = c.fg_muted },
    SatelliteCursor = { fg = c.fg_dim },
    SatelliteSearch = { fg = c.type },
    SatelliteSearchCurrent = { fg = c.warning },
    SatelliteDiagnosticError = { link = "DiagnosticError" },
    SatelliteDiagnosticWarn = { link = "DiagnosticWarn" },
    SatelliteDiagnosticInfo = { link = "DiagnosticInfo" },
    SatelliteDiagnosticHint = { link = "DiagnosticHint" },
    SatelliteGitSignsAdd = { link = "LimeiAdded" },
    SatelliteGitSignsChange = { link = "LimeiChanged" },
    SatelliteGitSignsDelete = { link = "LimeiRemoved" },
    VirtColumn = { fg = c.fg_hidden },

    -- grug-far.nvim
    GrugFarInputLabel = { fg = c.fg_bright, bold = true },
    GrugFarInputPlaceholder = { fg = c.fg_muted },
    GrugFarResultsMatch = { fg = c.type, bold = true },
    GrugFarCurrentMatch = { link = "CurSearch" },
    GrugFarResultsPath = { fg = c.fg_dim },
    GrugFarResultsLineNr = { link = "LineNr" },
    GrugFarResultsAddIndicator = { link = "LimeiAdded" },
    GrugFarResultsRemoveIndicator = { link = "LimeiRemoved" },

    -- Marks, Harpoon, Yanky, hardtime, ToggleTerm, and nvim-ufo
    HauntAnnotation = { link = "DiagnosticVirtualTextHint" },
    HauntAnnotationBorder = { link = "FloatBorder" },
    ToggleTermNormal = { link = "Normal" },
    ToggleTermNormalFloat = { link = "NormalFloat" },
    UfoFoldedBg = { bg = c.bg_alt },
    UfoCursorFoldedLine = { link = "CursorLine" },
    UfoPreviewSbar = { bg = c.bg_alt },
    UfoPreviewThumb = { bg = c.fg_muted },
  }
end

return M
