local M = {}

local defaults = {
  -- Background hierarchy
  bg_deep = "#090909",
  bg = "#101010",
  bg_alt = "#151515",
  bg_surface = "#1b1b1b",
  bg_popup = "#202020",
  bg_selection = "#2b2b2b",
  bg_active = "#32302e",

  -- Foreground hierarchy
  fg = "#b5b2ad",
  fg_bright = "#c6c2bb",
  fg_dim = "#84807a",
  fg_muted = "#65615c",
  fg_hidden = "#3a3734",

  -- Warm earthy accents
  rose = "#9b797a",
  brick = "#987269",
  clay = "#9e816d",
  rust = "#9d795f",
  amber = "#a78e66",
  wheat = "#a09776",
  ochre = "#918862",

  -- Natural accents
  sage = "#838f7a",
  moss = "#78866e",
  olive = "#898764",

  -- Rare cool accents
  slate = "#7b8184",
  faded_lavender = "#898187",

  -- UI neutrals
  border = "#34312f",
  separator = "#292725",
  whitespace = "#373431",
  indent = "#292724",
  indent_scope = "#554c43",

  -- Virtual text stays quieter than diagnostic signs.
  rose_dim = "#795f60",
  amber_dim = "#7d6b4d",
  sage_dim = "#626b5c",
}

function M.get(overrides)
  return vim.tbl_extend("force", vim.deepcopy(defaults), overrides or {})
end

return M
