local M = {}

local defaults = {
  -- Background hierarchy
  bg_deep = "#090909",
  bg = "#101010",
  bg_inactive = "#0c0c0c",
  bg_alt = "#151515",
  bg_surface = "#181818",
  bg_popup = "#151515",
  bg_selection = "#292827",
  bg_active = "#2e2c2a",

  -- Foreground hierarchy
  fg = "#b5b2ad",
  fg_bright = "#c6c2bb",
  fg_dim = "#84807a",
  fg_muted = "#65615c",
  fg_hidden = "#3a3734",

  -- Major code identities
  function_color = "#938d80",
  variable_color = "#b5b2ad",
  keyword_color = "#9b7f6e",
  string_color = "#818c78",
  number_color = "#a38b65",
  type_color = "#a19877",
  constant_color = "#898187",

  -- Semantic states
  rose = "#9b797a",
  brick = "#987269",
  rust = "#9d795f",
  amber = "#a38b65",
  ochre = "#918862",
  sage = "#818c78",
  moss = "#78866e",
  olive = "#898764",
  slate = "#7b8184",

  -- Established semantic names retained for palette overrides.
  clay = "#9b7f6e",
  wheat = "#a19877",
  faded_lavender = "#898187",

  -- Neutral UI colors
  border = "#353230",
  separator = "#000000",
  whitespace = "#343230",
  indent = "#272522",
  indent_scope = "#514940",

  -- Virtual text stays quieter than diagnostic signs.
  rose_dim = "#795f60",
  amber_dim = "#7d6b4d",
  sage_dim = "#626b5c",
}

-- Stable semantic language used throughout core and plugin highlights.
M.semantic = {
  failure = "rose",
  conflict = "brick",
  structure = "keyword_color",
  transform = "rust",
  attention = "amber",
  type = "type_color",
  navigation = "ochre",
  content = "string_color",
  success = "moss",
  logic = "olive",
  information = "slate",
  constant = "constant_color",
}

-- High-frequency identities stay distinct without creating subtype rainbows.
M.identity = {
  variable = "variable_color",
  function_call = "function_color",
  keyword = "keyword_color",
  string = "string_color",
  number = "number_color",
  type = "type_color",
  constant = "constant_color",
  comment = "fg_muted",
}

function M.get(overrides)
  return vim.tbl_extend("force", vim.deepcopy(defaults), overrides or {})
end

return M
