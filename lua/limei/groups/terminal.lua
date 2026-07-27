local M = {}

function M.apply(c)
  local colors = {
    c.bg_deep,
    c.error,
    c.literal,
    c.warning,
    c.information,
    c.symbol,
    c.fg_dim,
    c.fg,
    c.fg_hidden,
    c.conflict,
    c.success,
    c.type,
    c.fg_dim,
    c.structure,
    c.information,
    c.fg_bright,
  }

  for index, color in ipairs(colors) do
    vim.g["terminal_color_" .. (index - 1)] = color
  end
end

return M
