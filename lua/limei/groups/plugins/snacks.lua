local M = {}

function M.get(c)
  return {
    -- Shared window surfaces
    SnacksNormal = { fg = c.fg, bg = c.bg_popup },
    SnacksNormalNC = { fg = c.fg_muted, bg = c.bg_inactive },
    SnacksTitle = { fg = c.fg_bright, bg = c.bg_popup, bold = true },
    SnacksFooter = { fg = c.fg_dim, bg = c.bg_popup },
    SnacksWinBar = { fg = c.fg, bg = c.bg_popup },
    SnacksWinBarNC = { fg = c.fg_muted, bg = c.bg_inactive },
    SnacksWinSeparator = { link = "WinSeparator" },
    SnacksBackdrop = { bg = c.bg_deep },

    -- Picker surfaces, borders, and focus
    SnacksPicker = { fg = c.fg, bg = c.bg_popup },
    SnacksPickerBorder = { fg = c.border, bg = c.bg_popup },
    SnacksPickerTitle = { fg = c.fg_bright, bg = c.bg_popup, bold = true },
    SnacksPickerInput = { fg = c.fg, bg = c.bg_popup },
    SnacksPickerInputBorder = { fg = c.border, bg = c.bg_popup },
    SnacksPickerInputTitle = { fg = c.fg_bright, bg = c.bg_popup, bold = true },
    SnacksPickerList = { fg = c.fg, bg = c.bg_popup },
    SnacksPickerListBorder = { fg = c.border, bg = c.bg_popup },
    SnacksPickerListTitle = { fg = c.fg_bright, bg = c.bg_popup, bold = true },
    SnacksPickerPreview = { fg = c.fg, bg = c.bg_alt },
    SnacksPickerPreviewBorder = { fg = c.border, bg = c.bg_alt },
    SnacksPickerPreviewTitle = { fg = c.fg_bright, bg = c.bg_alt, bold = true },
    SnacksPickerListCursorLine = { link = "PmenuSel" },
    SnacksPickerPreviewCursorLine = { link = "PmenuSel" },
    SnacksPickerMatch = { fg = c.type, bold = true },
    SnacksPickerPrompt = { fg = c.warning },
    SnacksPickerDir = { fg = c.fg_dim },
    SnacksPickerFile = { fg = c.fg },
    SnacksPickerGitStatusAdded = { link = "LimeiAdded" },
    SnacksPickerGitStatusModified = { fg = c.warning },
    SnacksPickerGitStatusDeleted = { link = "LimeiRemoved" },
    SnacksPickerGitStatusStaged = { fg = c.staged },
    SnacksPickerGitStatusUntracked = { fg = c.untracked },
    SnacksPickerGitStatusUnmerged = { fg = c.conflict },
    SnacksPickerGitStatusRenamed = { fg = c.renamed },
    SnacksPickerPathHidden = { fg = c.fg_muted },
    SnacksPickerPathIgnored = { fg = c.fg_hidden },

    -- Dashboard
    SnacksDashboardNormal = { link = "Normal" },
    SnacksDashboardDesc = { fg = c.fg },
    SnacksDashboardIcon = { fg = c.fg_dim },
    SnacksDashboardKey = { fg = c.type },

    -- Notifier, input, terminal, and scratch surfaces
    SnacksNotifier = { fg = c.fg, bg = c.bg_popup },
    SnacksNotifierMinimal = { fg = c.fg, bg = c.bg_popup },
    SnacksNotifierHistory = { fg = c.fg, bg = c.bg_popup },
    SnacksNotifierHistoryTitle = { link = "FloatTitle" },
    SnacksNotifierError = { fg = c.fg, bg = c.bg_popup },
    SnacksNotifierWarn = { fg = c.fg, bg = c.bg_popup },
    SnacksNotifierInfo = { fg = c.fg, bg = c.bg_popup },
    SnacksNotifierDebug = { fg = c.fg, bg = c.bg_popup },
    SnacksNotifierTrace = { fg = c.fg, bg = c.bg_popup },
    SnacksNotifierBorderError = { link = "FloatBorder" },
    SnacksNotifierBorderWarn = { link = "FloatBorder" },
    SnacksNotifierBorderInfo = { link = "FloatBorder" },
    SnacksNotifierBorderDebug = { link = "FloatBorder" },
    SnacksNotifierBorderTrace = { link = "FloatBorder" },
    SnacksInputNormal = { fg = c.fg, bg = c.bg_popup },
    SnacksInputBorder = { link = "FloatBorder" },
    SnacksInputTitle = { link = "FloatTitle" },
    SnacksInputIcon = { fg = c.warning },
    SnacksTerminal = { fg = c.fg, bg = c.bg },
    SnacksTerminalBorder = { link = "FloatBorder" },
    SnacksScratch = { fg = c.fg, bg = c.bg_popup },
    SnacksScratchKey = { fg = c.type },
    SnacksScratchDesc = { fg = c.fg_dim },

    -- Explorer, indent, scope, words, and zen
    SnacksPickerDirectory = { fg = c.navigation },
    SnacksIndent = { fg = c.indent },
    SnacksIndentScope = { fg = c.indent_scope },
    SnacksIndentChunk = { fg = c.indent_scope },
    SnacksWordsCurrent = { bg = c.bg_alt },
    SnacksWordsNext = { bg = c.bg_alt },
    SnacksZenIcon = { fg = c.fg_muted },

    -- Diff
    SnacksDiffAdd = { link = "DiffAdd" },
    SnacksDiffDelete = { link = "DiffDelete" },
    SnacksDiffContext = { fg = c.fg_dim },
    SnacksDiffConflict = { fg = c.conflict },
  }
end

return M
