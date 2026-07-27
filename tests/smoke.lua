local limei = require("limei")

local function load(options)
  limei.setup(options)
  limei.load()
  assert(vim.g.colors_name == "limei")
end

vim.cmd.colorscheme("limei")
assert(vim.g.colors_name == "limei")

load()
assert(require("limei.config").options.dim_inactive == false)

load({ transparent = true })
assert(vim.api.nvim_get_hl(0, { name = "Normal" }).bg == nil)
assert(vim.api.nvim_get_hl(0, { name = "NormalFloat" }).bg ~= nil)

load({ dim_inactive = true })
local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
local normal_nc = vim.api.nvim_get_hl(0, { name = "NormalNC", link = false })
assert(normal_nc.fg == normal.fg and normal_nc.bg == normal.bg)

local separator = vim.api.nvim_get_hl(0, { name = "WinSeparator", link = false })
assert(separator.fg == tonumber("000000", 16))
assert(separator.bg == nil)
assert(vim.api.nvim_get_hl(0, { name = "VertSplit" }).link == "WinSeparator")

local line_nr = vim.api.nvim_get_hl(0, { name = "LineNr", link = false })
local cursor_line_nr = vim.api.nvim_get_hl(0, { name = "CursorLineNr", link = false })
assert(line_nr.fg == tonumber(limei.get_palette().fg_hidden:sub(2), 16))
assert(vim.api.nvim_get_hl(0, { name = "LineNrAbove" }).link == "LineNr")
assert(vim.api.nvim_get_hl(0, { name = "LineNrBelow" }).link == "LineNr")
assert(cursor_line_nr.fg == tonumber(limei.get_palette().fg_dim:sub(2), 16))
assert(cursor_line_nr.fg ~= tonumber(limei.get_palette().fg_bright:sub(2), 16))
assert(cursor_line_nr.bold == true)

local match_paren = vim.api.nvim_get_hl(0, { name = "MatchParen", link = false })
assert(match_paren.bold == true)
for _, attribute in ipairs({ "fg", "bg", "sp", "underline", "undercurl", "reverse", "standout", "italic" }) do
  assert(match_paren[attribute] == nil or match_paren[attribute] == false)
end

local quote_match = vim.api.nvim_get_hl(0, { name = "LimeiMatchDelimiter", link = false })
assert(quote_match.bold == true)
for _, attribute in ipairs({ "fg", "bg", "sp", "underline", "undercurl", "reverse", "standout", "italic", "nocombine" }) do
  assert(quote_match[attribute] == nil or quote_match[attribute] == false)
end

for _, name in ipairs({ "Whitespace", "NonText", "SpecialKey" }) do
  local group = vim.api.nvim_get_hl(0, { name = name, link = false })
  assert(group.fg == tonumber(limei.get_palette().fg_hidden:sub(2), 16))
  assert(group.bg == nil and group.bold ~= true and group.italic ~= true)
end

local end_of_buffer = vim.api.nvim_get_hl(0, { name = "EndOfBuffer", link = false })
assert(end_of_buffer.fg == normal.bg and end_of_buffer.bg == normal.bg)

local float_border = vim.api.nvim_get_hl(0, { name = "FloatBorder" })
assert(float_border.link ~= "WinSeparator")

local directory = vim.api.nvim_get_hl(0, { name = "Directory", link = false })
local oil_dir = vim.api.nvim_get_hl(0, { name = "OilDir", link = false })
local oil_dir_icon = vim.api.nvim_get_hl(0, { name = "OilDirIcon", link = false })
assert(oil_dir.fg == directory.fg and oil_dir_icon.fg == directory.fg)
load({ palette = { bg = "#0e0e0e", callable = "#99887b" } })
assert(limei.get_palette().bg == "#0e0e0e")
assert(limei.get_palette().callable == "#99887b")

load({ palette = { function_color = "#97877a" } })
assert(limei.get_palette().callable == "#97877a")

load({ highlights = { Comment = { fg = "#706c66", italic = true } } })
assert(vim.api.nvim_get_hl(0, { name = "Comment" }).italic == true)

load({
  highlights = function(colors)
    return { TestLimeiOverride = { fg = colors.warning } }
  end,
})
assert(vim.api.nvim_get_hl(0, { name = "TestLimeiOverride" }).fg ~= nil)

for _, module in ipairs({
  "completion",
  "dap",
  "files",
  "finder",
  "git",
  "lsp",
  "markdown",
  "mini",
  "motion",
  "snacks",
  "testing",
  "ui",
}) do
  local groups = require("limei.groups.plugins." .. module).get(limei.get_palette())
  assert(type(groups) == "table" and next(groups) ~= nil)
end

for _, group in ipairs({
  "Normal",
  "NormalNC",
  "NormalFloat",
  "FloatBorder",
  "WinSeparator",
  "Function",
  "@function",
  "@lsp.type.function",
  "DiagnosticError",
  "BlinkCmpKindFunction",
  "SnacksPicker",
}) do
  assert(next(vim.api.nvim_get_hl(0, { name = group })) ~= nil, "missing highlight: " .. group)
end

local samples = {
  lua = "local answer = compute(42, 'quiet') -- note",
  c = "const int answer = compute(42); /* note */",
  cpp = "const auto answer = compute(42); // note",
  python = "answer = compute(42, 'quiet')  # note",
  javascript = "const answer = compute(42, 'quiet'); // note",
  typescript = "const answer: Result = compute(42);",
  rust = "let answer: usize = compute(42);",
  go = "answer := compute(42)",
  sh = "answer=$(compute 42) # note",
  json = '{"answer": 42, "valid": true}',
  yaml = "answer: 42\nvalid: true",
  markdown = "# Heading\n\n`compute(42)` [reference](https://example.com)",
}
for filetype, line in pairs(samples) do
  vim.cmd.enew()
  vim.bo.filetype = filetype
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(line, "\n"))
  vim.cmd.syntax("on")
end

limei.load()
dofile("tests/matching.lua")
print("limei.nvim smoke tests passed")
