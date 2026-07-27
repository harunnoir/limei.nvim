local M = {}

function M.get(c)
  return {
    -- gitsigns.nvim
    GitSignsAdd = { link = "LimeiAdded" },
    GitSignsAddNr = { link = "LimeiAdded" },
    GitSignsAddLn = { link = "DiffAdd" },
    GitSignsChange = { fg = c.changed },
    GitSignsChangeNr = { fg = c.changed },
    GitSignsChangeLn = { link = "DiffChange" },
    GitSignsDelete = { link = "LimeiRemoved" },
    GitSignsDeleteNr = { link = "LimeiRemoved" },
    GitSignsDeleteLn = { link = "DiffDelete" },
    GitSignsCurrentLineBlame = { fg = c.fg_muted },

    -- gitgraph.nvim
    GitGraphBranch1 = { fg = c.sage },
    GitGraphBranch2 = { fg = c.type },
    GitGraphBranch3 = { fg = c.fg_dim },
    GitGraphBranch4 = { fg = c.lavender },
    GitGraphBranch5 = { fg = c.coral },
    GitGraphHash = { fg = c.fg_muted },
    GitGraphTimestamp = { fg = c.fg_dim },
    GitGraphAuthor = { fg = c.fg_dim },
    GitGraphBranchName = { fg = c.sage },
    GitGraphBranchTag = { fg = c.type },
    GitGraphBranchMsg = { fg = c.fg },

    -- undotree
    UndotreeNode = { fg = c.navigation },
    UndotreeCurrent = { fg = c.fg_bright, bold = true },
    UndotreeSeq = { fg = c.fg_dim },
    UndotreeTimeStamp = { fg = c.fg_muted },
  }
end

return M
