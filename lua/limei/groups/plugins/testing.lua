local M = {}

function M.get(c)
  return {
    -- neotest
    NeotestPassed = { fg = c.success },
    NeotestFailed = { fg = c.error },
    NeotestRunning = { fg = c.warning },
    NeotestSkipped = { fg = c.fg_muted },
    NeotestTest = { fg = c.fg },
    NeotestNamespace = { fg = c.type },
    NeotestFocused = { fg = c.fg_bright, bold = true, underline = true },
    NeotestFile = { fg = c.fg },
    NeotestDir = { fg = c.navigation },
    NeotestBorder = { link = "FloatBorder" },
    NeotestIndent = { fg = c.indent },
    NeotestExpandMarker = { fg = c.fg_hidden },
    NeotestAdapterName = { fg = c.fg_bright, bold = true },
    NeotestWinSelect = { fg = c.warning, bold = true },
    NeotestMarked = { fg = c.warning, bold = true },
    NeotestTarget = { fg = c.transform },
    NeotestUnknown = { fg = c.fg_muted },
    NeotestWatching = { fg = c.information },

    -- Shared sidebar surface used by leetcode.nvim.
    NormalSB = { fg = c.fg, bg = c.bg },

    -- overseer.nvim
    OverseerSUCCESS = { fg = c.success },
    OverseerRUNNING = { fg = c.warning },
    OverseerFAILURE = { fg = c.error },
    OverseerPENDING = { fg = c.fg_dim },
    OverseerCANCELED = { fg = c.fg_muted },
    OverseerDISPOSED = { fg = c.fg_hidden },
    OverseerTaskBorder = { link = "FloatBorder" },

    -- leetcode.nvim
    leetcode_easy = { fg = c.literal },
    leetcode_medium = { fg = c.warning },
    leetcode_hard = { fg = c.conflict },
    leetcode_easy_alt = { fg = c.fg_dim },
    leetcode_medium_alt = { fg = c.fg_dim },
    leetcode_hard_alt = { fg = c.fg_muted },
    leetcode_ok = { fg = c.success },
    leetcode_info = { fg = c.information },
    leetcode_hint = { fg = c.literal },
    leetcode_error = { fg = c.error },
    leetcode_case_ok = { fg = c.success, bg = c.bg, bold = true },
    leetcode_case_err = { fg = c.error, bg = c.bg, bold = true },
    leetcode_calendar_0 = { fg = c.fg_hidden },
    leetcode_calendar_10 = { fg = c.fg_dim },
    leetcode_calendar_20 = { fg = c.fg_dim },
    leetcode_calendar_30 = { fg = c.fg_dim },
    leetcode_calendar_40 = { fg = c.fg_dim },
    leetcode_calendar_50 = { fg = c.literal },
    leetcode_calendar_60 = { fg = c.literal },
    leetcode_calendar_70 = { fg = c.literal },
    leetcode_calendar_80 = { fg = c.literal },
    leetcode_calendar_90 = { fg = c.literal },
    leetcode_calendar_100 = { fg = c.literal },

    -- Standard health groups also cover formatter and lint health surfaces.
    healthError = { link = "LimeiError" },
    healthWarning = { link = "LimeiWarning" },
    healthSuccess = { link = "LimeiSuccess" },
  }
end

return M
