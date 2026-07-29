local M = {}

local defaults = {
  -- Background hierarchy
  bg_deep = "#080808",
  bg = "#101010",
  bg_inactive = "#0c0c0c",
  bg_alt = "#141414",
  bg_surface = "#171717",
  bg_popup = "#141414",
  bg_selection = "#292724",
  bg_active = "#302d29",

  -- Foreground hierarchy
  fg = "#ada9a3",
  fg_bright = "#c0bbb3",
  fg_dim = "#837f78",
  fg_muted = "#64605a",
  fg_hidden = "#393632",

  -- Major code identities
  variable = "#ada9a3",
  callable = "#7984bd",
  structure = "#ad72b9",
  literal = "#50964a",
  numeric = "#ac7e55",
  type = "#759047",
  symbol = "#4e919e",
  logic = "#927cbf",

  -- State and relationship colors
  error = "#bd7a85",
  conflict = "#ba7e72",
  transform = "#bc77a5",
  warning = "#958f49",
  success = "#4d9c6d",
  information = "#6b91b6",
  navigation = "#4c998d",

  -- Neutral UI colors
  border = "#373330",
  separator = "#090909",
  whitespace = "#34312f",
  indent = "#272522",
  indent_scope = "#514940",
}

-- Compatibility aliases remain centralized here. New highlight code uses the
-- canonical semantic roles above.
local aliases = {
  variable_color = "variable",
  function_color = "callable",
  keyword_color = "structure",
  string_color = "literal",
  number_color = "numeric",
  type_color = "type",
  constant_color = "symbol",
  rose = "error",
  brick = "conflict",
  rust = "transform",
  amber = "warning",
  wheat = "type",
  ochre = "navigation",
  sage = "literal",
  moss = "success",
  olive = "logic",
  slate = "information",
  clay = "structure",
  faded_lavender = "symbol",
}

M.semantic = {
  variable = "ordinary data",
  callable = "callable behavior and execution",
  structure = "language grammar and construction",
  literal = "literal textual content",
  numeric = "numeric quantity",
  type = "shape, schema, and data category",
  symbol = "fixed or symbolic identity",
  logic = "logical state and bounded choice",
  error = "failure, deletion, and destructive state",
  conflict = "conflict, exception, and interruption",
  transform = "pattern, replacement, and transformation",
  warning = "attention, warning, and active process",
  success = "completed success and accepted state",
  information = "reference, link, and non-urgent information",
  navigation = "path, directory, import, and external target",
}

function M.get(overrides)
  overrides = overrides or {}
  local colors = vim.tbl_extend("force", vim.deepcopy(defaults), overrides)

  for alias, canonical in pairs(aliases) do
    if overrides[alias] ~= nil and overrides[canonical] == nil then
      colors[canonical] = overrides[alias]
    end
    colors[alias] = colors[canonical]
  end

  return colors
end

return M
