local M = {}

function M.set_highlights(groups)
  for name, value in pairs(groups) do
    vim.api.nvim_set_hl(0, name, value)
  end
end

return M
