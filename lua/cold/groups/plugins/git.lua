local M = {}

function M.get(c)
  return {
    -- gitsigns.nvim
    GitSignsAdd = { link = "ColdAdded" },
    GitSignsAddNr = { link = "ColdAdded" },
    GitSignsAddLn = { link = "DiffAdd" },
    GitSignsChange = { fg = c.amber },
    GitSignsChangeNr = { fg = c.amber },
    GitSignsChangeLn = { link = "DiffChange" },
    GitSignsDelete = { link = "ColdRemoved" },
    GitSignsDeleteNr = { link = "ColdRemoved" },
    GitSignsDeleteLn = { link = "DiffDelete" },
    GitSignsCurrentLineBlame = { fg = c.fg_muted },

    -- gitgraph.nvim
    GitGraphBranch1 = { fg = c.sage },
    GitGraphBranch2 = { fg = c.wheat },
    GitGraphBranch3 = { fg = c.steel },
    GitGraphBranch4 = { fg = c.lavender },
    GitGraphBranch5 = { fg = c.clay },
    GitGraphHash = { fg = c.fg_muted },
    GitGraphTimestamp = { fg = c.fg_dim },
    GitGraphAuthor = { fg = c.mist },
    GitGraphBranchName = { fg = c.sage },
    GitGraphBranchTag = { fg = c.wheat },
    GitGraphBranchMsg = { fg = c.fg },

    -- undotree
    UndotreeNode = { fg = c.ochre },
    UndotreeCurrent = { fg = c.sage, bold = true },
    UndotreeSeq = { fg = c.fg_dim },
    UndotreeTimeStamp = { fg = c.fg_muted },
  }
end

return M
