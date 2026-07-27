local M = {}

local sections = {
  "editor",
  "syntax",
  "treesitter",
  "semantic",
  "diagnostics",
}

function M.get(colors, options)
  local groups = {}

  -- Core sections load in this explicit order.
  for _, name in ipairs(sections) do
    groups = vim.tbl_extend("force", groups, require("limei.groups." .. name).get(colors, options))
  end

  -- Plugin groups only contain plain highlight tables and are safe when their
  -- plugins are absent.
  groups = vim.tbl_extend("force", groups, require("limei.groups.plugins").get(colors, options))

  -- User overrides always run last.
  local overrides = options.highlights
  if type(overrides) == "function" then
    overrides = overrides(colors)
  end
  if type(overrides) == "table" then
    groups = vim.tbl_extend("force", groups, overrides)
  end

  return groups
end

return M
