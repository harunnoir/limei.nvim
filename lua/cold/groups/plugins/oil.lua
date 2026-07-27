local M = {}

function M.get(c)
  return {
    -- oil.nvim
    OilDir = { fg = c.steel },
    OilDirIcon = { fg = c.steel_dim },
    OilLink = { fg = c.mist },
    OilLinkTarget = { fg = c.fg_dim },
    OilOrphanLink = { fg = c.rose },
    OilOrphanLinkTarget = { fg = c.rose_dim },
    OilCopy = { fg = c.sage },
    OilMove = { fg = c.amber },
    OilCreate = { fg = c.sage },
    OilDelete = { fg = c.rose },
    OilChange = { fg = c.amber },
    OilRestore = { fg = c.sage },
    OilPurge = { fg = c.rose },
    OilTrash = { fg = c.rose },
    OilTrashSourcePath = { fg = c.fg_muted },
    OilFile = { fg = c.fg },
    OilHidden = { fg = c.fg_muted },
    OilFileHidden = { link = "OilHidden" },
    OilDirHidden = { link = "OilHidden" },
    OilLinkHidden = { link = "OilHidden" },
    OilVtext = { fg = c.fg_muted },
    OilPreviewCursor = { link = "CursorLine" },

    -- oil-git.nvim
    OilGitAdded = { link = "ColdAdded" },
    OilGitModified = { fg = c.amber },
    OilGitRenamed = { fg = c.wheat },
    OilGitUntracked = { link = "ColdAdded" },
    OilGitIgnored = { link = "ColdPunctuation" },

    -- oil-lsp-diagnostics.nvim
    OilLspDiagnostics = { link = "DiagnosticInfo" },
  }
end

return M
