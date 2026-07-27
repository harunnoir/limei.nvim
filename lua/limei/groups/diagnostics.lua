local M = {}

function M.get(c)
  return {
    -- Primary diagnostics and signs
    DiagnosticError = { fg = c.error },
    DiagnosticWarn = { fg = c.warning },
    DiagnosticInfo = { fg = c.information },
    DiagnosticHint = { fg = c.literal },
    DiagnosticOk = { fg = c.success },
    DiagnosticSignError = { fg = c.error, bold = true },
    DiagnosticSignWarn = { fg = c.warning, bold = true },
    DiagnosticSignInfo = { fg = c.information, bold = true },
    DiagnosticSignHint = { fg = c.literal, bold = true },
    DiagnosticSignOk = { fg = c.success, bold = true },

    -- Virtual text is deliberately quieter than signs.
    DiagnosticVirtualTextError = { fg = c.error },
    DiagnosticVirtualTextWarn = { fg = c.warning },
    DiagnosticVirtualTextInfo = { fg = c.fg_dim },
    DiagnosticVirtualTextHint = { fg = c.fg_dim },
    DiagnosticVirtualTextOk = { fg = c.success },

    -- Undercurls never paint the buffer.
    DiagnosticUnderlineError = { sp = c.error, undercurl = true },
    DiagnosticUnderlineWarn = { sp = c.warning, undercurl = true },
    DiagnosticUnderlineInfo = { sp = c.information, undercurl = true },
    DiagnosticUnderlineHint = { sp = c.literal, undercurl = true },
    DiagnosticUnderlineOk = { sp = c.success, undercurl = true },

    -- Diagnostic floats reuse the central palette.
    DiagnosticFloatingError = { link = "DiagnosticError" },
    DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
    DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
    DiagnosticFloatingHint = { link = "DiagnosticHint" },
    DiagnosticFloatingOk = { link = "DiagnosticOk" },
  }
end

return M
