local M = {}

local defaults = {
  -- Background hierarchy
  bg_deep = "#090909",
  bg = "#101010",
  bg_alt = "#151515",
  bg_surface = "#1b1b1b",
  bg_popup = "#212121",
  bg_selection = "#2b2b2b",
  bg_active = "#323232",

  -- Foreground hierarchy
  fg = "#b8b8b8",
  fg_bright = "#c9c9c9",
  fg_dim = "#878787",
  fg_muted = "#666666",
  fg_hidden = "#3a3a3a",

  -- Warm accents
  rose = "#a07d7f",
  clay = "#a68871",
  orange = "#a98768",
  amber = "#b09a70",
  ochre = "#98916c",
  wheat = "#a79b7b",

  -- Cool accents
  sage = "#889882",
  moss = "#7f917b",
  steel = "#81909d",
  mist = "#829797",
  lavender = "#93889f",

  -- UI colors
  border = "#343434",
  separator = "#292929",
  whitespace = "#373737",
  indent = "#292929",
  indent_static = "#262626",
  indent_scope = "#59534b",

  -- Virtual text stays quieter than diagnostic signs.
  rose_dim = "#806568",
  amber_dim = "#877657",
  steel_dim = "#687580",
  mist_dim = "#687979",
  sage_dim = "#6d7b69",
}

function M.get(overrides)
  return vim.tbl_extend("force", vim.deepcopy(defaults), overrides or {})
end

return M
