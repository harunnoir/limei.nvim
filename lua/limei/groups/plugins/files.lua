local M = {}

function M.get(c)
  return {
    -- oil.nvim
    OilDir = { fg = c.navigation },
    OilDirIcon = { fg = c.keyword },
    OilLink = { fg = c.information },
    OilLinkTarget = { fg = c.fg_dim },
    OilOrphanLink = { fg = c.error },
    OilOrphanLinkTarget = { fg = c.error },
    OilCopy = { fg = c.added },
    OilMove = { fg = c.renamed },
    OilCreate = { fg = c.added },
    OilDelete = { fg = c.deleted },
    OilChange = { fg = c.changed },
    OilRestore = { fg = c.success },
    OilPurge = { fg = c.error },
    OilTrash = { fg = c.error },
    OilTrashSourcePath = { fg = c.fg_muted },
    OilFile = { fg = c.fg },
    OilHidden = { fg = c.fg_muted },
    OilFileHidden = { link = "OilHidden" },
    OilDirHidden = { link = "OilHidden" },
    OilLinkHidden = { link = "OilHidden" },
    OilVtext = { fg = c.fg_muted },
    OilPreviewCursor = { link = "CursorLine" },

    -- oil-git.nvim
    OilGitAdded = { link = "LimeiAdded" },
    OilGitModified = { fg = c.changed },
    OilGitRenamed = { fg = c.renamed },
    OilGitUntracked = { fg = c.untracked },
    OilGitIgnored = { fg = c.ignored },
    -- oil-lsp-diagnostics.nvim uses the central Diagnostic groups directly.
  }
end

return M
