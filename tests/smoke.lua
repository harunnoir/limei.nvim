local limei = require("limei")

local function load(options)
  limei.setup(options)
  limei.load()
  assert(vim.g.colors_name == "limei")
end

vim.cmd.colorscheme("limei")
assert(vim.g.colors_name == "limei")

load()
assert(require("limei.config").options.dim_inactive == true)
local palette = limei.get_palette()
assert(vim.api.nvim_get_hl(0, { name = "Normal" }).bg == tonumber(palette.bg:sub(2), 16))
assert(vim.api.nvim_get_hl(0, { name = "NormalNC" }).bg == tonumber(palette.bg_inactive:sub(2), 16))
assert(vim.api.nvim_get_hl(0, { name = "NormalFloat" }).bg == tonumber(palette.bg_popup:sub(2), 16))
assert(vim.api.nvim_get_hl(0, { name = "WinSeparator" }).bg == nil)
assert(vim.g.terminal_color_4 == palette.blue)
assert(vim.g.terminal_color_6 == palette.teal)
assert(vim.g.terminal_color_12 == palette.sky)
assert(vim.g.terminal_color_14 == palette.cyan)

load({ transparent = true })
assert(vim.api.nvim_get_hl(0, { name = "Normal" }).bg == nil)
assert(vim.api.nvim_get_hl(0, { name = "NormalFloat" }).bg ~= nil)

load({ dim_inactive = false })
load({ palette = { bg = "#0e0f10", ivory = "#c0b9ae" } })
assert(limei.get_palette().bg == "#0e0f10")
assert(limei.get_roles().callable == "#c0b9ae")

load({ roles = { callable = "violet", variable = "#aa8174" } })
assert(limei.get_roles().callable == limei.get_palette().violet)
assert(limei.get_roles().variable == "#aa8174")

load({ highlights = { Comment = { fg = "#706c66", italic = true } } })
assert(vim.api.nvim_get_hl(0, { name = "Comment" }).italic == true)

load({
  highlights = function(colors)
    return { TestLimeiOverride = { fg = colors.warning } }
  end,
})
assert(vim.api.nvim_get_hl(0, { name = "TestLimeiOverride" }).fg ~= nil)

local colors = vim.tbl_extend("force", limei.get_palette(), limei.get_roles())
for _, module in ipairs({
  "ai",
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
  local groups = require("limei.groups.plugins." .. module).get(colors)
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

local fixtures = {
  lua = "sample.lua",
  c = "sample.c",
  cpp = "sample.cpp",
  python = "sample.py",
  javascript = "sample.js",
  typescript = "sample.ts",
  rust = "sample.rs",
  go = "sample.go",
  sh = "sample.sh",
  json = "sample.json",
  yaml = "sample.yaml",
  markdown = "sample.md",
}
for filetype, fixture in pairs(fixtures) do
  vim.cmd.enew()
  vim.bo.filetype = filetype
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.readfile("tests/fixtures/" .. fixture))
  vim.cmd.syntax("on")
end

local seen = {}
for _, role in ipairs({
  "variable",
  "callable",
  "keyword",
  "string",
  "number",
  "type",
  "constant",
  "boolean",
  "comment",
}) do
  local value = limei.get_roles()[role]
  assert(seen[value] == nil, role .. " duplicates " .. tostring(seen[value]))
  seen[value] = role
end

load()
local function highlight_foreground(name)
  return vim.api.nvim_get_hl(0, { name = name }).fg
end
assert(limei.get_roles().callable == limei.get_palette().ivory)
assert(highlight_foreground("LimeiFunctionDeclaration") == tonumber(limei.get_palette().pearl:sub(2), 16))
assert(highlight_foreground("LimeiFunctionCall") == tonumber(limei.get_palette().ivory:sub(2), 16))
assert(highlight_foreground("LimeiBuiltinFunction") == tonumber(limei.get_palette().silver:sub(2), 16))
assert(highlight_foreground("LimeiVariable") ~= highlight_foreground("LimeiFunctionCall"))
assert(highlight_foreground("LimeiComment") ~= highlight_foreground("LimeiFunctionCall"))

limei.load()
print("limei.nvim smoke tests passed")
