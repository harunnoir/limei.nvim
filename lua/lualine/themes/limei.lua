local c = require("limei").get_palette()

local section_b = { fg = c.fg, bg = c.bg_alt }
local section_c = { fg = c.fg_dim, bg = c.bg_surface }

return {
  normal = {
    a = { fg = c.fg_bright, bg = c.bg_active, gui = "bold" },
    b = section_b,
    c = section_c,
  },
  insert = {
    a = { fg = c.literal, bg = c.bg_active, gui = "bold" },
    b = section_b,
    c = section_c,
  },
  visual = {
    a = { fg = c.symbol, bg = c.bg_active, gui = "bold" },
    b = section_b,
    c = section_c,
  },
  replace = {
    a = { fg = c.transform, bg = c.bg_active, gui = "bold" },
    b = section_b,
    c = section_c,
  },
  command = {
    a = { fg = c.warning, bg = c.bg_active, gui = "bold" },
    b = section_b,
    c = section_c,
  },
  terminal = {
    a = { fg = c.information, bg = c.bg_active, gui = "bold" },
    b = section_b,
    c = section_c,
  },
  inactive = {
    a = { fg = c.fg_muted, bg = c.bg_surface },
    b = { fg = c.fg_muted, bg = c.bg_surface },
    c = { fg = c.fg_muted, bg = c.bg_surface },
  },
}
