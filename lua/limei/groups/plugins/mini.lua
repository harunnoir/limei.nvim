local M = {}

function M.get(c)
  return {
    -- mini.indentscope
    MiniIndentscopeSymbol = { fg = c.indent_scope, nocombine = true },
    MiniIndentscopeSymbolOff = { fg = c.indent, nocombine = true },

    -- mini.starter
    MiniStarterCurrent = { fg = c.fg_bright, bg = c.bg_alt },
    MiniStarterFooter = { fg = c.fg_muted },
    MiniStarterHeader = { fg = c.fg_dim },
    MiniStarterInactive = { fg = c.fg_hidden },
    MiniStarterItem = { fg = c.fg },
    MiniStarterItemBullet = { fg = c.fg_muted },
    MiniStarterItemPrefix = { fg = c.fg_muted },
    MiniStarterQuery = { fg = c.type },
    MiniStarterSection = { fg = c.fg_bright, bold = true },

    -- mini.hipatterns
    MiniHipatternsFixme = { fg = c.error, bold = true },
    MiniHipatternsHack = { fg = c.conflict, bold = true },
    MiniHipatternsTodo = { fg = c.warning, bold = true },
    MiniHipatternsNote = { fg = c.literal, bold = true },

    -- mini.surround
    MiniSurround = { fg = c.bg, bg = c.warning },

    -- mini.ai and mini.align define no persistent highlight groups; they
    -- inherit the active buffer's core syntax and UI groups.
  }
end

return M
