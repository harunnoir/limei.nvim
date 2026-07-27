local M = {}

function M.get(c)
  return {
    -- Primary diagnostics and signs
    DiagnosticError = { fg = c.rose },
    DiagnosticWarn = { fg = c.amber },
    DiagnosticInfo = { fg = c.slate },
    DiagnosticHint = { fg = c.sage },
    DiagnosticOk = { fg = c.moss },
    DiagnosticSignError = { link = "DiagnosticError" },
    DiagnosticSignWarn = { link = "DiagnosticWarn" },
    DiagnosticSignInfo = { link = "DiagnosticInfo" },
    DiagnosticSignHint = { link = "DiagnosticHint" },
    DiagnosticSignOk = { link = "DiagnosticOk" },

    -- Virtual text is deliberately quieter than signs.
    DiagnosticVirtualTextError = { fg = c.rose_dim },
    DiagnosticVirtualTextWarn = { fg = c.amber_dim },
    DiagnosticVirtualTextInfo = { fg = c.fg_dim },
    DiagnosticVirtualTextHint = { fg = c.sage_dim },
    DiagnosticVirtualTextOk = { fg = c.moss },

    -- Undercurls never paint the buffer.
    DiagnosticUnderlineError = { sp = c.rose, undercurl = true },
    DiagnosticUnderlineWarn = { sp = c.amber, undercurl = true },
    DiagnosticUnderlineInfo = { sp = c.slate, undercurl = true },
    DiagnosticUnderlineHint = { sp = c.sage, undercurl = true },

    -- Diagnostic floats reuse the central palette.
    DiagnosticFloatingError = { link = "DiagnosticError" },
    DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
    DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
    DiagnosticFloatingHint = { link = "DiagnosticHint" },
    DiagnosticFloatingOk = { link = "DiagnosticOk" },
  }
end

return M
