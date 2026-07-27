local M = {}

M.defaults = {
  variable = "coral",
  callable = "blue",
  keyword = "lavender",
  string = "sage",
  number = "amber",
  type = "cyan",
  constant = "rose",
  boolean = "olive",
  comment = "fg_muted",

  error = "rose",
  warning = "amber",
  success = "sage",
  information = "sky",
  hint = "teal",
  conflict = "brick",
  navigation = "copper",
  transformation = "violet",

  added = "fern",
  changed = "amber",
  deleted = "rose",
  untracked = "mint",
  ignored = "fg_muted",
  staged = "sage",
  renamed = "violet",
}

M.meanings = {
  variable = "ordinary contextual data",
  callable = "callable behavior and execution",
  keyword = "language grammar and control",
  string = "textual literal content",
  number = "numeric quantity",
  type = "shape, schema, and data category",
  constant = "fixed or immutable symbolic identity",
  boolean = "logical state and bounded choice",
  comment = "secondary explanatory text",
  error = "failure and destructive state",
  warning = "attention and active process",
  success = "completed and accepted state",
  information = "reference and non-urgent information",
  hint = "quiet guidance",
  conflict = "conflict and interruption",
  navigation = "path, directory, import, and external target",
  transformation = "pattern, replacement, and transformation",
}

local function resolve(palette, role, value)
  if palette[value] then
    return palette[value], value
  end
  if type(value) == "string" and value:match("^#%x%x%x%x%x%x$") then
    return value, value
  end
  error(("limei.nvim: role '%s' must reference a palette key or #RRGGBB value"):format(role))
end

function M.get(palette, overrides)
  local mappings = vim.tbl_extend("force", vim.deepcopy(M.defaults), overrides or {})
  local resolved, references = {}, {}
  for role, value in pairs(mappings) do
    resolved[role], references[role] = resolve(palette, role, value)
  end
  return resolved, references
end

return M
