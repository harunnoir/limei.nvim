local M = {}

local modules = {
  "blink",
  "dap",
  "fzf",
  "git",
  "lsp",
  "markdown",
  "mini",
  "oil",
  "snacks",
  "ui",
}

function M.get(colors, options)
  local groups = {}
  for _, name in ipairs(modules) do
    groups = vim.tbl_extend("force", groups, require("cold.groups.plugins." .. name).get(colors, options))
  end
  return groups
end

return M
