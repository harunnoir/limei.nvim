local M = {}

function M.get(c)
  return {
    -- flash.nvim
    FlashLabel = { fg = c.bg, bg = c.warning, bold = true },
    FlashMatch = { fg = c.type },
    FlashCurrent = { fg = c.transform, underline = true },
    FlashBackdrop = { fg = c.fg_muted },

    -- todo-comments.nvim
    TodoFgFIX = { fg = c.error, bold = true },
    TodoFgWARN = { fg = c.warning, bold = true },
    TodoFgTODO = { fg = c.warning, bold = true },
    TodoFgNOTE = { fg = c.information, bold = true },
    TodoFgPERF = { fg = c.symbol, bold = true },
    TodoSignFIX = { link = "TodoFgFIX" },
    TodoSignWARN = { link = "TodoFgWARN" },
    TodoSignTODO = { link = "TodoFgTODO" },
    TodoSignNOTE = { link = "TodoFgNOTE" },
    TodoSignPERF = { link = "TodoFgPERF" },

    -- marks.nvim, harpoon, yanky.nvim, and hardtime.nvim
    MarkSignHL = { fg = c.navigation },
    MarkSignNumHL = { fg = c.fg_dim },
    HarpoonCurrentFile = { fg = c.fg_bright, bold = true },
    YankyPut = { link = "Search" },
    YankyYanked = { link = "IncSearch" },
    HardtimeGroup = { fg = c.warning },
  }
end

return M
