local M = {}

function M.get(c)
  return {
    -- codecompanion.nvim
    CodeCompanionChatError = { link = "DiagnosticError" },
    CodeCompanionChatFold = { link = "LimeiMuted" },
    CodeCompanionChatHeader = { fg = c.fg_bright, bold = true },
    CodeCompanionChatInfo = { link = "DiagnosticInfo" },
    CodeCompanionChatSeparator = { fg = c.fg_hidden },
    CodeCompanionChatSubtext = { fg = c.fg_muted },
    CodeCompanionChatTokens = { fg = c.fg_muted },
    CodeCompanionChatTool = { fg = c.transform },
    CodeCompanionChatToolFailure = { link = "DiagnosticError" },
    CodeCompanionChatToolFailureIcon = { link = "DiagnosticSignError" },
    CodeCompanionChatToolGroup = { fg = c.symbol },
    CodeCompanionChatToolInProgress = { fg = c.warning },
    CodeCompanionChatToolInProgressIcon = { fg = c.warning, bold = true },
    CodeCompanionChatToolPending = { fg = c.fg_dim },
    CodeCompanionChatToolPendingIcon = { fg = c.fg_dim },
    CodeCompanionChatToolSuccess = { fg = c.success },
    CodeCompanionChatToolSuccessIcon = { fg = c.success, bold = true },
    CodeCompanionChatToolText = { fg = c.fg_muted },
    CodeCompanionChatEditorContext = { fg = c.navigation },
    CodeCompanionChatWarn = { link = "DiagnosticWarn" },
    CodeCompanionDiffAdd = { link = "DiffAdd" },
    CodeCompanionDiffDelete = { link = "DiffDelete" },
    CodeCompanionDiffText = { link = "DiffText" },
    CodeCompanionDiffTextDelete = { fg = c.error, bg = c.bg_selection, bold = true },
    CodeCompanionDiffBanner = { fg = c.fg_bright, bg = c.bg_alt },
    CodeCompanionDiffBannerInline = { fg = c.fg_muted },
    CodeCompanionCLIPath = { fg = c.navigation },
    CodeCompanionCodeReviewComment = { fg = c.information },
    CodeCompanionVirtualText = { fg = c.fg_muted },
  }
end

return M
