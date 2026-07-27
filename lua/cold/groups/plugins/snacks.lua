local M = {}

function M.get(c)
  return {
    -- Picker
    SnacksPicker = { link = "NormalFloat" },
    SnacksPickerInput = { link = "NormalFloat" },
    SnacksPickerList = { fg = c.fg, bg = c.bg_surface },
    SnacksPickerPreview = { fg = c.fg, bg = c.bg_alt },
    SnacksPickerListCursorLine = { link = "PmenuSel" },
    SnacksPickerPreviewCursorLine = { link = "CursorLine" },
    SnacksPickerMatch = { fg = c.wheat, bold = true },
    SnacksPickerPrompt = { fg = c.amber },
    SnacksPickerDir = { fg = c.fg_dim },
    SnacksPickerFile = { fg = c.fg },
    SnacksPickerGitStatusAdded = { link = "ColdAdded" },
    SnacksPickerGitStatusModified = { fg = c.amber },
    SnacksPickerGitStatusDeleted = { link = "ColdRemoved" },
    SnacksPickerPathHidden = { fg = c.fg_muted },
    SnacksPickerPathIgnored = { fg = c.fg_hidden },

    -- Dashboard
    SnacksDashboardNormal = { link = "Normal" },
    SnacksDashboardDesc = { fg = c.fg },
    SnacksDashboardIcon = { fg = c.fg_dim },
    SnacksDashboardKey = { fg = c.wheat },

    -- Notifier, input, terminal, and scratch
    SnacksNotifier = { link = "NormalFloat" },
    SnacksNotifierMinimal = { link = "NormalFloat" },
    SnacksNotifierHistory = { link = "NormalFloat" },
    SnacksNotifierHistoryTitle = { link = "FloatTitle" },
    SnacksInputNormal = { link = "NormalFloat" },
    SnacksInputBorder = { link = "FloatBorder" },
    SnacksInputTitle = { link = "FloatTitle" },
    SnacksInputIcon = { fg = c.amber },
    SnacksTerminal = { link = "NormalFloat" },
    SnacksTerminalBorder = { link = "FloatBorder" },
    SnacksScratch = { link = "NormalFloat" },
    SnacksScratchKey = { fg = c.wheat },
    SnacksScratchDesc = { fg = c.fg_dim },

    -- Explorer, indent, scope, words, and zen
    SnacksPickerDirectory = { fg = c.steel },
    SnacksIndent = { fg = c.indent_static },
    SnacksIndentScope = { fg = c.indent_scope },
    SnacksIndentChunk = { fg = c.indent_scope },
    SnacksWordsCurrent = { bg = c.bg_alt },
    SnacksWordsNext = { bg = c.bg_alt },
    SnacksZenIcon = { fg = c.fg_muted },

    -- Diff
    SnacksDiffAdd = { link = "DiffAdd" },
    SnacksDiffDelete = { link = "DiffDelete" },
    SnacksDiffContext = { fg = c.fg_dim },
    SnacksDiffConflict = { fg = c.amber },
  }
end

return M
