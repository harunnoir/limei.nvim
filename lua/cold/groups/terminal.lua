local M = {}

function M.apply(c)
  local colors = {
    c.bg_deep,
    c.rose,
    c.sage,
    c.amber,
    c.steel,
    c.lavender,
    c.mist,
    c.fg,
    c.fg_hidden,
    c.rose,
    c.sage,
    c.wheat,
    c.steel,
    c.lavender,
    c.mist,
    c.fg_bright,
  }

  for index, color in ipairs(colors) do
    vim.g["terminal_color_" .. (index - 1)] = color
  end
end

return M
