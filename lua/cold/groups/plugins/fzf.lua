local M = {}

function M.get(c)
  return {
    -- fzf-lua
    FzfLuaNormal = { fg = c.fg, bg = c.bg_surface },
    FzfLuaBorder = { fg = c.border, bg = c.bg_surface },
    FzfLuaTitle = { fg = c.fg_bright, bg = c.bg_surface, bold = true },
    FzfLuaPreviewNormal = { fg = c.fg, bg = c.bg_alt },
    FzfLuaPreviewBorder = { fg = c.border, bg = c.bg_alt },
    FzfLuaPreviewTitle = { fg = c.fg_bright, bg = c.bg_alt, bold = true },
    FzfLuaCursor = { link = "Cursor" },
    FzfLuaCursorLine = { fg = c.fg_bright, bg = c.bg_selection },
    FzfLuaCursorLineNr = { fg = c.amber },
    FzfLuaSearch = { fg = c.wheat, bold = true },
    FzfLuaScrollBorderEmpty = { fg = c.fg_hidden },
    FzfLuaScrollBorderFull = { fg = c.fg_muted },
    FzfLuaScrollFloatEmpty = { fg = c.fg_hidden },
    FzfLuaScrollFloatFull = { fg = c.fg_muted },
    FzfLuaHelpNormal = { link = "NormalFloat" },
    FzfLuaHelpBorder = { link = "FloatBorder" },
    FzfLuaHeaderBind = { fg = c.sage },
    FzfLuaHeaderText = { fg = c.fg_dim },
    FzfLuaPathColNr = { fg = c.fg_dim },
    FzfLuaPathLineNr = { fg = c.ochre },
    FzfLuaBufName = { fg = c.fg },
    FzfLuaBufId = { fg = c.fg_dim },
    FzfLuaBufNr = { fg = c.fg_dim },
    FzfLuaBufLineNr = { fg = c.ochre },
    FzfLuaBufFlagCur = { fg = c.sage },
    FzfLuaBufFlagAlt = { fg = c.faded_lavender },
    FzfLuaTabTitle = { fg = c.fg_bright },
    FzfLuaTabMarker = { fg = c.fg_bright },
    FzfLuaLivePrompt = { fg = c.amber },
    FzfLuaLiveSym = { fg = c.fg_dim },
    FzfLuaFzfPrompt = { fg = c.amber },
    FzfLuaFzfMatch = { fg = c.wheat, bold = true },
    FzfLuaFzfPointer = { fg = c.fg_bright },
    FzfLuaFzfMarker = { fg = c.sage },
    FzfLuaFzfScrollbar = { fg = c.fg_muted },
    FzfLuaBackdrop = { fg = c.fg_hidden },

    -- fzf-oil.nvim defines no dedicated highlight groups. It composes the
    -- FzfLua and Oil groups styled by this theme.
  }
end

return M
