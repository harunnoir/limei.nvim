local c = require("limei").get_palette()

local status_bg = require("limei.config").options.transparent and "NONE" or c.bg
local section_b = { fg = c.fg, bg = status_bg }
local section_c = { fg = c.fg_dim, bg = status_bg }

return {
  normal = {
    a = { fg = c.fg_bright, bg = status_bg, gui = "bold" },
    b = section_b,
    c = section_c,
  },
  insert = {
    a = { fg = c.literal, bg = status_bg, gui = "bold" },
    b = section_b,
    c = section_c,
  },
  visual = {
    a = { fg = c.symbol, bg = status_bg, gui = "bold" },
    b = section_b,
    c = section_c,
  },
  replace = {
    a = { fg = c.transform, bg = status_bg, gui = "bold" },
    b = section_b,
    c = section_c,
  },
  command = {
    a = { fg = c.warning, bg = status_bg, gui = "bold" },
    b = section_b,
    c = section_c,
  },
  terminal = {
    a = { fg = c.information, bg = status_bg, gui = "bold" },
    b = section_b,
    c = section_c,
  },
  inactive = {
    a = { fg = c.fg_muted, bg = status_bg },
    b = { fg = c.fg_muted, bg = status_bg },
    c = { fg = c.fg_muted, bg = status_bg },
  },
}
