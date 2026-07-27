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

load({ transparent = true })
assert(vim.api.nvim_get_hl(0, { name = "Normal" }).bg == nil)
assert(vim.api.nvim_get_hl(0, { name = "NormalFloat" }).bg ~= nil)

load({ dim_inactive = false })
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
print("limei.nvim smoke tests passed")
