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
  callable = "#9a897c",
  structure = "#9a7869",
  literal = "#7f8c77",
  numeric = "#a38762",
  type = "#97916f",
  symbol = "#8d818a",
  logic = "#898661",

  -- State and relationship colors
  error = "#9a7477",
  conflict = "#9b7469",
  transform = "#9c795e",
  warning = "#a38762",
  success = "#768569",
  information = "#788184",
  navigation = "#918862",

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

function M.terminal(colors)
  return {
    colors.bg_deep,
    colors.error,
    colors.literal,
    colors.warning,
    colors.information,
    colors.symbol,
    colors.fg_dim,
    colors.fg,
    colors.fg_hidden,
    colors.conflict,
    colors.success,
    colors.type,
    colors.fg_dim,
    colors.structure,
    colors.information,
    colors.fg_bright,
  }
end

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
