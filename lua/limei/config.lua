local M = {}

M.defaults = {
  transparent = false,
  -- Deprecated compatibility option. Active and inactive windows now share
  -- one background regardless of its value.
  dim_inactive = false,
  terminal_colors = true,
  matching = {
    brackets = true,
    quotes = true,
    string_delimiters = true,
  },
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
    functions = { bold = false },
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
