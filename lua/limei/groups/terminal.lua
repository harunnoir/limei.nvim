local M = {}

function M.apply(c)
  local colors = {
    c.bg_deep,
    c.rose,
    c.moss,
    c.amber,
    c.blue,
    c.lavender,
    c.teal,
    c.fg,
    c.fg_hidden,
    c.coral,
    c.sage,
    c.sand,
    c.sky,
    c.magenta,
    c.cyan,
    c.fg_bright,
  }

  for index, color in ipairs(colors) do
    vim.g["terminal_color_" .. (index - 1)] = color
  end
end

return M
