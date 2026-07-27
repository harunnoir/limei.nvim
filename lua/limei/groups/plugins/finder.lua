local M = {}

function M.get(c)
  return {
    -- fzf-lua
    FzfLuaNormal = { fg = c.fg, bg = c.bg_popup },
    FzfLuaBorder = { fg = c.border, bg = c.bg_popup },
    FzfLuaTitle = { fg = c.fg_bright, bg = c.bg_popup, bold = true },
    FzfLuaPreviewNormal = { fg = c.fg, bg = c.bg_alt },
    FzfLuaPreviewBorder = { fg = c.border, bg = c.bg_alt },
    FzfLuaPreviewTitle = { fg = c.fg_bright, bg = c.bg_alt, bold = true },
    FzfLuaCursor = { link = "Cursor" },
    FzfLuaCursorLine = { fg = c.fg_bright, bg = c.bg_selection },
    FzfLuaCursorLineNr = { fg = c.warning },
    FzfLuaSearch = { fg = c.type, bold = true },
    FzfLuaScrollBorderEmpty = { fg = c.fg_hidden },
    FzfLuaScrollBorderFull = { fg = c.fg_muted },
    FzfLuaScrollFloatEmpty = { fg = c.fg_hidden },
    FzfLuaScrollFloatFull = { fg = c.fg_muted },
    FzfLuaHelpNormal = { link = "NormalFloat" },
    FzfLuaHelpBorder = { link = "FloatBorder" },
    FzfLuaHeaderBind = { fg = c.string },
    FzfLuaHeaderText = { fg = c.fg_dim },
    FzfLuaPathColNr = { fg = c.fg_dim },
    FzfLuaPathLineNr = { fg = c.navigation },
    FzfLuaBufName = { fg = c.fg },
    FzfLuaBufId = { fg = c.fg_dim },
    FzfLuaBufNr = { fg = c.fg_dim },
    FzfLuaBufLineNr = { fg = c.navigation },
    FzfLuaBufFlagCur = { fg = c.string },
    FzfLuaBufFlagAlt = { fg = c.constant },
    FzfLuaTabTitle = { fg = c.fg_bright },
    FzfLuaTabMarker = { fg = c.fg_bright },
    FzfLuaLivePrompt = { fg = c.warning },
    FzfLuaLiveSym = { fg = c.fg_dim },
    FzfLuaFzfPrompt = { fg = c.warning },
    FzfLuaFzfMatch = { fg = c.type, bold = true },
    FzfLuaFzfPointer = { fg = c.fg_bright },
    FzfLuaFzfMarker = { fg = c.string },
    FzfLuaFzfScrollbar = { fg = c.fg_muted },
    FzfLuaBackdrop = { fg = c.fg_hidden },

    -- fzf-oil.nvim defines no dedicated highlight groups. It composes the
    -- FzfLua and Oil groups styled by this theme.
  }
end

return M
