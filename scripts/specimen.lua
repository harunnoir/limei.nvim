local entries = {
  { section = "LIMEI VISUAL SPECIMEN" },
  { label = "Primary text", group = "Normal", text = "ordinary readable content" },
  { label = "Bright text", group = "Title", text = "active and important content" },
  { label = "Secondary text", group = "LimeiMuted", text = "metadata and supporting information" },
  { label = "Hidden structure", group = "NonText", text = "quiet structural furniture" },

  { section = "CODE IDENTITIES" },
  { label = "Variable", group = "LimeiVariable", text = "request context property" },
  { label = "Callable", group = "LimeiFunction", text = "render_preview()" },
  { label = "Structure", group = "LimeiKeyword", text = "local function return end" },
  { label = "Literal", group = "LimeiString", text = '"quiet textual content"' },
  { label = "Numeric", group = "LimeiNumber", text = "10 42 3.14159" },
  { label = "Type", group = "LimeiType", text = "Palette HighlightGroup Result" },
  { label = "Symbol", group = "LimeiConstant", text = "DEFAULT MAX_RETRIES" },
  { label = "Logic", group = "LimeiBoolean", text = "true false enabled disabled" },

  { section = "STATE AND RELATIONSHIP" },
  { label = "Error", group = "DiagnosticError", text = "failed, invalid, or deleted" },
  { label = "Conflict", group = "LimeiException", text = "conflict or interruption" },
  { label = "Transform", group = "LimeiRegex", text = "pattern, rename, replacement" },
  { label = "Warning", group = "DiagnosticWarn", text = "attention or active process" },
  { label = "Success", group = "LimeiSuccess", text = "completed and accepted" },
  { label = "Information", group = "DiagnosticInfo", text = "reference and non-urgent information" },
  { label = "Navigation", group = "Directory", text = "src/components/palette.lua" },

  { section = "SURFACES AND INTERACTION" },
  { label = "Cursor line", group = "CursorLine", text = "current editing position" },
  { label = "Selection", group = "Visual", text = "selected content" },
  { label = "Search", group = "Search", text = "matching search result" },
  { label = "Current search", group = "CurSearch", text = "active search result" },
  { label = "Popup selection", group = "PmenuSel", text = "selected completion item" },
  { label = "Added", group = "DiffAdd", text = "+ accepted addition" },
  { label = "Changed", group = "DiffChange", text = "~ modified content" },
  { label = "Deleted", group = "DiffDelete", text = "- removed content" },
}

local bufnr = vim.api.nvim_create_buf(false, true)
vim.api.nvim_set_current_buf(bufnr)
vim.bo[bufnr].buftype = "nofile"
vim.bo[bufnr].bufhidden = "wipe"
vim.bo[bufnr].swapfile = false
vim.bo[bufnr].filetype = "limei-specimen"

local lines = {}
local highlights = {}
for _, entry in ipairs(entries) do
  if entry.section then
    if #lines > 0 then
      table.insert(lines, "")
    end
    table.insert(lines, entry.section)
    table.insert(highlights, { row = #lines - 1, start_col = 0, group = "Title" })
  else
    local prefix = string.format("%-18s ", entry.label)
    table.insert(lines, prefix .. entry.text)
    table.insert(highlights, {
      row = #lines - 1,
      start_col = #prefix,
      group = entry.group,
    })
  end
end

vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
local namespace = vim.api.nvim_create_namespace("limei.specimen")
for _, highlight in ipairs(highlights) do
  vim.api.nvim_buf_set_extmark(bufnr, namespace, highlight.row, highlight.start_col, {
    end_row = highlight.row,
    end_col = #lines[highlight.row + 1],
    hl_group = highlight.group,
  })
end

vim.bo[bufnr].modifiable = false
vim.bo[bufnr].modified = false

return bufnr
