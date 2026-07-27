local M = {}

local modules = {
  "completion",
  "dap",
  "finder",
  "git",
  "lsp",
  "markdown",
  "mini",
  "motion",
  "files",
  "snacks",
  "testing",
  "ui",
}

function M.get(colors, options)
  local groups = {}
  for _, name in ipairs(modules) do
    groups = vim.tbl_extend("force", groups, require("limei.groups.plugins." .. name).get(colors, options))
  end
  return groups
end

return M
