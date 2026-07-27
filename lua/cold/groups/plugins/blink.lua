local M = {}

function M.get(c)
  return {
    -- blink.cmp and blink-cmp-words
    BlinkCmpMenu = { link = "Pmenu" },
    BlinkCmpMenuBorder = { link = "FloatBorder" },
    BlinkCmpMenuSelection = { link = "PmenuSel" },
    BlinkCmpLabel = { fg = c.fg, bg = c.bg_popup },
    BlinkCmpLabelDeprecated = { fg = c.fg_muted, bg = c.bg_popup, strikethrough = true },
    BlinkCmpLabelMatch = { fg = c.wheat, bg = c.bg_popup, bold = true },
    BlinkCmpLabelDetail = { link = "PmenuExtra" },
    BlinkCmpLabelDescription = { link = "PmenuExtra" },
    BlinkCmpKind = { link = "PmenuKind" },
    BlinkCmpSource = { link = "PmenuExtra" },
    BlinkCmpGhostText = { fg = c.fg_hidden },
    BlinkCmpDoc = { link = "NormalFloat" },
    BlinkCmpDocBorder = { link = "FloatBorder" },
    BlinkCmpDocSeparator = { fg = c.separator, bg = c.bg_popup },
    BlinkCmpDocCursorLine = { link = "CursorLine" },
    BlinkCmpSignatureHelp = { link = "NormalFloat" },
    BlinkCmpSignatureHelpBorder = { link = "FloatBorder" },
    BlinkCmpSignatureHelpActiveParameter = { fg = c.wheat, bold = true },
    BlinkCmpScrollBarGutter = { link = "PmenuSbar" },
    BlinkCmpScrollBarThumb = { link = "PmenuThumb" },

    -- nvim-cmp
    CmpItemAbbr = { link = "Pmenu" },
    CmpItemAbbrMatch = { link = "PmenuMatch" },
    CmpItemAbbrMatchFuzzy = { link = "PmenuMatch" },
    CmpItemAbbrDeprecated = { fg = c.fg_muted, strikethrough = true },
    CmpItemKind = { link = "PmenuKind" },
    CmpItemMenu = { link = "PmenuExtra" },
  }
end

return M
