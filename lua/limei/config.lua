local M = {}

M.defaults = {
  transparent = false,
  dim_inactive = true,
  terminal_colors = true,
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
    functions = { bold = false },
    variables = {},
  },
  palette = {},
  roles = {},
  highlights = {},
}

M.options = vim.deepcopy(M.defaults)

function M.setup(options)
  if options ~= nil and type(options) ~= "table" then
    error("limei.nvim: setup options must be a table")
  end
  for _, key in ipairs({ "transparent", "dim_inactive", "terminal_colors" }) do
    if options and options[key] ~= nil and type(options[key]) ~= "boolean" then
      error(("limei.nvim: '%s' must be a boolean"):format(key))
    end
  end
  for _, key in ipairs({ "styles", "palette", "roles" }) do
    if options and options[key] ~= nil and type(options[key]) ~= "table" then
      error(("limei.nvim: '%s' must be a table"):format(key))
    end
  end
  if
    options
    and options.highlights ~= nil
    and type(options.highlights) ~= "table"
    and type(options.highlights) ~= "function"
  then
    error("limei.nvim: 'highlights' must be a table or function")
  end
  M.options = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), options or {})
end

return M
