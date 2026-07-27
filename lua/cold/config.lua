local M = {}

M.defaults = {
  transparent = false,
  dim_inactive = false,
  terminal_colors = true,
  styles = {
    comments = {},
    keywords = {},
    functions = {},
    variables = {},
  },
  palette = {},
  highlights = {},
}

M.options = vim.deepcopy(M.defaults)

function M.setup(options)
  M.options = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), options or {})
end

return M
