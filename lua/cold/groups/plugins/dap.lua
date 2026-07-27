local M = {}

function M.get(c)
  return {
    -- nvim-dap signs
    DapBreakpoint = { fg = c.rose },
    DapBreakpointCondition = { fg = c.amber },
    DapBreakpointRejected = { fg = c.fg_muted },
    DapLogPoint = { fg = c.slate },
    DapStopped = { fg = c.amber, bg = c.bg_alt },

    -- nvim-dap-ui
    DapUINormal = { link = "Normal" },
    DapUIFloatNormal = { link = "NormalFloat" },
    DapUIFloatBorder = { link = "FloatBorder" },
    DapUIVariable = { link = "ColdVariable" },
    DapUIScope = { fg = c.fg_bright, bold = true },
    DapUIType = { link = "ColdType" },
    DapUIValue = { fg = c.fg },
    DapUIModifiedValue = { fg = c.amber },
    DapUIDecoration = { fg = c.fg_dim },
    DapUIThread = { fg = c.fg },
    DapUIStoppedThread = { fg = c.amber },
    DapUISource = { fg = c.fg },
    DapUILineNumber = { link = "LineNr" },
    DapUIWatchesEmpty = { fg = c.fg_muted },
    DapUIWatchesValue = { fg = c.sage },
    DapUIWatchesError = { fg = c.rose },
    DapUIBreakpointsPath = { fg = c.fg_dim },
    DapUIBreakpointsInfo = { fg = c.slate },
    DapUIBreakpointsCurrentLine = { fg = c.fg_bright, bold = true },
    DapUIBreakpointsDisabledLine = { fg = c.fg_muted },
    DapUIUnavailable = { fg = c.fg_hidden },
    DapUIUnavailableNC = { link = "DapUIUnavailable" },
  }
end

return M
