local M = {}

function M.apply(c)
  for index, color in ipairs(require("limei.palette").terminal(c)) do
    vim.g["terminal_color_" .. (index - 1)] = color
  end
end

return M
