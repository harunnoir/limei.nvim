local M = {}

function M.apply(c)
  local colors = {
    c.bg_deep,
    c.rose,
    c.sage,
    c.amber,
    c.slate,
    c.faded_lavender,
    c.fg_dim,
    c.fg,
    c.fg_hidden,
    c.brick,
    c.moss,
    c.wheat,
    c.fg_dim,
    c.clay,
    c.slate,
    c.fg_bright,
  }

  for index, color in ipairs(colors) do
    vim.g["terminal_color_" .. (index - 1)] = color
  end
end

return M
