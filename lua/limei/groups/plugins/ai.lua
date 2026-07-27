local M = {}

function M.get(c)
  return {
    -- CopilotChat.nvim (names verified from current upstream documentation)
    CopilotChatHeader = { fg = c.fg_bright, bold = true },
    CopilotChatSeparator = { fg = c.separator },
    CopilotChatSelection = { bg = c.bg_selection },
    CopilotChatStatus = { fg = c.warning },
    CopilotChatHelp = { fg = c.fg_muted },
    CopilotChatResource = { fg = c.information },
    CopilotChatTool = { fg = c.transformation },
    CopilotChatPrompt = { fg = c.navigation },
    CopilotChatModel = { fg = c.type },
    CopilotChatUri = { fg = c.information, underline = true },
    CopilotChatAnnotation = { fg = c.fg_dim, bg = c.bg_alt },
    CopilotChatAnnotationHeader = { fg = c.fg_bright, bg = c.bg_alt, bold = true },

    -- copilot.lua
    CopilotSuggestion = { fg = c.fg_hidden, italic = true },
    CopilotAnnotation = { fg = c.fg_muted },
  }
end

return M
