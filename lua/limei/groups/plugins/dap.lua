local M = {}

function M.get(c)
  return {
    -- nvim-dap signs
    DapBreakpoint = { fg = c.error },
    DapBreakpointCondition = { fg = c.warning },
    DapBreakpointRejected = { fg = c.fg_muted },
    DapLogPoint = { fg = c.information },
    DapStopped = { fg = c.warning, bg = c.bg_alt },

    -- nvim-dap-ui
    DapUINormal = { link = "Normal" },
    DapUIFloatNormal = { link = "NormalFloat" },
    DapUIFloatBorder = { link = "FloatBorder" },
    DapUIVariable = { link = "LimeiVariable" },
    DapUIScope = { fg = c.fg_bright, bold = true },
    DapUIType = { link = "LimeiType" },
    DapUIValue = { fg = c.fg },
    DapUIModifiedValue = { fg = c.warning },
    DapUIDecoration = { fg = c.fg_dim },
    DapUIThread = { fg = c.fg },
    DapUIStoppedThread = { fg = c.warning },
    DapUISource = { fg = c.fg },
    DapUILineNumber = { link = "LineNr" },
    DapUIWatchesEmpty = { fg = c.fg_muted },
    DapUIWatchesValue = { fg = c.literal },
    DapUIWatchesError = { fg = c.error },
    DapUIBreakpointsPath = { fg = c.fg_dim },
    DapUIBreakpointsInfo = { fg = c.information },
    DapUIBreakpointsCurrentLine = { fg = c.fg_bright, bold = true },
    DapUIBreakpointsDisabledLine = { fg = c.fg_muted },
    DapUIUnavailable = { fg = c.fg_hidden },
    DapUIUnavailableNC = { link = "DapUIUnavailable" },
  }
end

return M
