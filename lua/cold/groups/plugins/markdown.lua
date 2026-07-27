local M = {}

function M.get(c)
  local groups = {
    -- render-markdown.nvim
    RenderMarkdownH1 = { fg = c.fg_bright, bold = true },
    RenderMarkdownH2 = { link = "RenderMarkdownH1" },
    RenderMarkdownH3 = { link = "RenderMarkdownH1" },
    RenderMarkdownH4 = { link = "RenderMarkdownH1" },
    RenderMarkdownH5 = { link = "RenderMarkdownH1" },
    RenderMarkdownH6 = { link = "RenderMarkdownH1" },
    RenderMarkdownH1Bg = { bg = c.bg_alt },
    RenderMarkdownH2Bg = { link = "RenderMarkdownH1Bg" },
    RenderMarkdownH3Bg = { link = "RenderMarkdownH1Bg" },
    RenderMarkdownH4Bg = { link = "RenderMarkdownH1Bg" },
    RenderMarkdownH5Bg = { link = "RenderMarkdownH1Bg" },
    RenderMarkdownH6Bg = { link = "RenderMarkdownH1Bg" },
    RenderMarkdownCode = { bg = c.bg_alt },
    RenderMarkdownCodeInline = { fg = c.sage, bg = c.bg_alt },
    RenderMarkdownCodeInfo = { fg = c.fg_muted, bg = c.bg_alt },
    RenderMarkdownBullet = { fg = c.ochre },
    RenderMarkdownQuote = { fg = c.fg_muted },
    RenderMarkdownChecked = { fg = c.sage },
    RenderMarkdownUnchecked = { fg = c.amber },
    RenderMarkdownSuccess = { fg = c.sage },
    RenderMarkdownWarn = { fg = c.amber },
    RenderMarkdownError = { fg = c.rose },
    RenderMarkdownInfo = { fg = c.steel },
    RenderMarkdownHint = { fg = c.mist },
    RenderMarkdownLink = { fg = c.steel },
    RenderMarkdownTableHead = { fg = c.fg_bright },
    RenderMarkdownTableRow = { fg = c.fg_dim },
    RenderMarkdownTableFill = { fg = c.fg_hidden },

    -- csvview.nvim: three quiet tones repeat instead of rainbow columns.
    CsvViewCol0 = { fg = c.fg },
    CsvViewCol1 = { fg = c.sage },
    CsvViewCol2 = { fg = c.wheat },
    CsvViewCol3 = { link = "CsvViewCol0" },
    CsvViewCol4 = { link = "CsvViewCol1" },
    CsvViewCol5 = { link = "CsvViewCol2" },
    CsvViewCol6 = { link = "CsvViewCol0" },
    CsvViewCol7 = { link = "CsvViewCol1" },
    CsvViewCol8 = { link = "CsvViewCol2" },
    CsvViewDelimiter = { fg = c.fg_hidden },
    CsvViewComment = { link = "Comment" },
    CsvViewHeaderLine = { fg = c.fg_bright, bg = c.bg_alt, bold = true },
    CsvViewStickyHeaderSeparator = { link = "WinSeparator" },
  }

  return groups
end

return M
