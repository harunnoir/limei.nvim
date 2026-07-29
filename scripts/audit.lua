local palette = require("limei.palette")
local colors = palette.get()

local required = {
  "bg_deep",
  "bg",
  "bg_inactive",
  "bg_alt",
  "bg_surface",
  "bg_popup",
  "bg_selection",
  "bg_active",
  "fg",
  "fg_bright",
  "fg_dim",
  "fg_muted",
  "fg_hidden",
  "variable",
  "callable",
  "structure",
  "literal",
  "numeric",
  "type",
  "symbol",
  "logic",
  "error",
  "conflict",
  "transform",
  "warning",
  "success",
  "information",
  "navigation",
  "border",
  "separator",
  "whitespace",
  "indent",
  "indent_scope",
}

local code_identities = {
  "variable",
  "callable",
  "structure",
  "literal",
  "numeric",
  "type",
  "symbol",
  "logic",
}

local locked_palette = {
  bg_deep = "#080808",
  bg = "#101010",
  bg_inactive = "#0c0c0c",
  bg_alt = "#141414",
  bg_surface = "#171717",
  bg_popup = "#141414",
  bg_selection = "#292724",
  bg_active = "#302d29",
  fg = "#ada9a3",
  fg_bright = "#c0bbb3",
  fg_dim = "#837f78",
  fg_muted = "#64605a",
  fg_hidden = "#393632",
  variable = "#ada9a3",
  callable = "#9a897c",
  structure = "#9a7869",
  literal = "#7f8c77",
  numeric = "#a38762",
  type = "#97916f",
  symbol = "#8d818a",
  logic = "#898661",
  error = "#9a7477",
  conflict = "#9b7469",
  transform = "#9c795e",
  warning = "#a38762",
  success = "#768569",
  information = "#788184",
  navigation = "#918862",
  border = "#373330",
  separator = "#090909",
  whitespace = "#34312f",
  indent = "#272522",
  indent_scope = "#514940",
}

local failures = {}

local function check(ok, message)
  if not ok then
    table.insert(failures, message)
  end
end

local function channel(value)
  value = value / 255
  return value <= 0.04045 and value / 12.92 or ((value + 0.055) / 1.055) ^ 2.4
end

local function luminance(hex)
  local red, green, blue = hex:match("^#(%x%x)(%x%x)(%x%x)$")
  check(red ~= nil, "invalid color: " .. tostring(hex))
  if not red then
    return 0
  end
  return 0.2126 * channel(tonumber(red, 16))
    + 0.7152 * channel(tonumber(green, 16))
    + 0.0722 * channel(tonumber(blue, 16))
end

local function contrast(a, b)
  local high, low = luminance(a), luminance(b)
  if high < low then
    high, low = low, high
  end
  return (high + 0.05) / (low + 0.05)
end

for _, key in ipairs(required) do
  check(type(colors[key]) == "string", "missing palette key: " .. key)
end

for key, expected in pairs(locked_palette) do
  check(colors[key] == expected, ("%s changed from locked value %s to %s"):format(key, expected, tostring(colors[key])))
end

local seen = {}
for _, key in ipairs(code_identities) do
  local value = colors[key]
  check(not seen[value], key .. " duplicates " .. tostring(seen[value]))
  seen[value] = key
end

for key in pairs(colors) do
  check(not key:lower():match("blue|cyan|teal|aqua|ice|sky|mist|azure|ocean"), "forbidden cool palette key: " .. key)
end

check(contrast(colors.fg, colors.bg) >= 7, "primary foreground contrast is below 7:1")
for _, key in ipairs({ "callable", "structure", "literal", "numeric", "type", "symbol", "logic" }) do
  local ratio = contrast(colors[key], colors.bg)
  check(ratio >= 4.5 and ratio <= 6.5, key .. " contrast is outside 4.5:1-6.5:1")
end
for _, key in ipairs({ "error", "conflict", "transform", "warning", "success", "information", "navigation" }) do
  local ratio = contrast(colors[key], colors.bg)
  check(ratio >= 4.5 and ratio <= 6.5, key .. " contrast is outside 4.5:1-6.5:1")
end
check(contrast(colors.fg_dim, colors.bg) >= 4.5, "secondary foreground contrast is below 4.5:1")
check(math.abs(luminance(colors.bg_popup) - luminance(colors.bg)) < 0.01, "popup background is too far from the editor")
check(luminance(colors.separator) < luminance(colors.bg), "separator is not darker than the editor")
check(colors.separator ~= "#000000", "separator must not be pure black")

local groups = require("limei.groups").get(colors, require("limei.config").defaults)

local function resolve(name, seen_links)
  seen_links = seen_links or {}
  check(not seen_links[name], "highlight link cycle at " .. name)
  if seen_links[name] then
    return {}
  end
  seen_links[name] = true

  local group = groups[name] or {}
  if group.link then
    return resolve(group.link, seen_links)
  end
  return group
end

local function uses_foreground(name, expected, message)
  check(resolve(name).fg == expected, message or (name .. " has the wrong effective foreground"))
end

local allowed_colors = {
  NONE = true,
  ["#000000"] = true,
}
for _, color in pairs(colors) do
  allowed_colors[color] = true
end

local allowed = {
  altfont = true,
  bg = true,
  blend = true,
  bold = true,
  default = true,
  fg = true,
  italic = true,
  link = true,
  nocombine = true,
  reverse = true,
  sp = true,
  standout = true,
  strikethrough = true,
  undercurl = true,
  underdashed = true,
  underdotted = true,
  underdouble = true,
  underline = true,
}
for name, value in pairs(groups) do
  check(type(name) == "string" and type(value) == "table", "invalid highlight entry: " .. tostring(name))
  for attribute in pairs(value) do
    check(allowed[attribute], "invalid highlight attribute " .. attribute .. " in " .. name)
  end
  for _, attribute in ipairs({ "fg", "bg", "sp" }) do
    local color = value[attribute]
    check(color == nil or allowed_colors[color], name .. " uses non-palette " .. attribute .. ": " .. tostring(color))
  end
end

for _, path in ipairs(vim.fn.glob("lua/limei/groups/**/*.lua", false, true)) do
  for line_number, line in ipairs(vim.fn.readfile(path)) do
    for hex in line:gmatch("#%x%x%x%x%x%x") do
      local is_structural_black = path:match("/editor%.lua$") and hex == "#000000"
      check(is_structural_black, path .. ":" .. line_number .. " contains raw color " .. hex)
    end
  end
end

check(groups.NormalNC.link == "Normal", "NormalNC does not inherit Normal")
check(groups.StatusLine.bg == groups.Normal.bg, "StatusLine does not share the editor background")
check(groups.StatusLineNC.bg == groups.Normal.bg, "StatusLineNC does not share the editor background")
check(groups.WinSeparator.fg == "#000000" and groups.WinSeparator.bg == nil, "separator is not black foreground-only")
check(groups.VertSplit.link == "WinSeparator", "VertSplit does not inherit WinSeparator")
check(groups.VirtColumn.link == "WinSeparator", "VirtColumn does not inherit WinSeparator")
check(groups.OilDir.link == "Directory", "OilDir does not inherit Directory")
check(groups.OilDirIcon.link == "Directory", "OilDirIcon does not inherit Directory")
check(groups.LineNr.fg == colors.fg_hidden, "LineNr does not use the hidden foreground")
check(groups.LineNrAbove.link == "LineNr", "LineNrAbove does not inherit LineNr")
check(groups.LineNrBelow.link == "LineNr", "LineNrBelow does not inherit LineNr")
check(groups.CursorLineNr.fg == colors.fg_dim and groups.CursorLineNr.bold, "CursorLineNr hierarchy is incorrect")
check(
  groups.MatchParen.fg == colors.warning and groups.MatchParen.bold and vim.tbl_count(groups.MatchParen) == 2,
  "MatchParen must use bold warning emphasis"
)
check(
  groups.LimeiMatchDelimiter.fg == colors.warning
    and groups.LimeiMatchDelimiter.bold
    and vim.tbl_count(groups.LimeiMatchDelimiter) == 2,
  "LimeiMatchDelimiter must use bold warning emphasis"
)
check(groups.LimeiStringDelimiter.link == "LimeiMuted", "string delimiters do not use muted neutral emphasis")

-- Frequency-aware syntax invariants. Ordinary data and punctuation stay
-- neutral, while medium-frequency identities resolve to distinct palette roles.
for _, name in ipairs({
  "Identifier",
  "@variable",
  "@variable.member",
  "@property",
  "@lsp.type.variable",
  "@lsp.type.property",
}) do
  uses_foreground(name, colors.variable, name .. " does not use neutral variable identity")
end
for _, name in ipairs({ "@variable.parameter", "@variable.parameter.builtin", "@lsp.type.parameter" }) do
  uses_foreground(name, colors.fg_dim, name .. " does not use dim parameter identity")
end
for _, name in ipairs({ "Delimiter", "@punctuation", "@punctuation.delimiter" }) do
  uses_foreground(name, colors.fg_muted, name .. " is not quiet punctuation")
end
uses_foreground("@punctuation.bracket", colors.fg_dim, "brackets are not neutral")

local semantic_agreement = {
  {
    role = "callable",
    names = { "Function", "@function", "@function.call", "@lsp.type.function", "@lsp.type.method" },
  },
  { role = "literal", names = { "String", "Character", "@string", "@character", "@lsp.type.string" } },
  { role = "numeric", names = { "Number", "Float", "@number", "@number.float", "@lsp.type.number" } },
  { role = "symbol", names = { "Constant", "@constant", "@constant.macro", "@lsp.type.macro" } },
  { role = "structure", names = { "Statement", "Keyword", "@keyword", "@lsp.type.keyword" } },
  { role = "transform", names = { "Conditional", "Repeat", "@keyword.conditional", "@keyword.repeat" } },
  { role = "logic", names = { "Operator", "@operator", "@keyword.operator", "@lsp.type.operator" } },
  { role = "type", names = { "Type", "@type", "@type.builtin", "@lsp.type.type", "@lsp.type.class" } },
  {
    role = "information",
    names = { "@module", "@attribute", "@tag.attribute", "@lsp.type.namespace", "@lsp.type.decorator" },
  },
}
for _, identity in ipairs(semantic_agreement) do
  for _, name in ipairs(identity.names) do
    uses_foreground(name, colors[identity.role], name .. " disagrees with the " .. identity.role .. " hierarchy")
  end
end

uses_foreground("@variable.builtin", colors.symbol, "built-in variables do not use symbolic identity")
uses_foreground("@function.builtin", colors.information, "built-in functions do not use technical identity")
uses_foreground("@constructor", colors.type, "constructors do not use type identity")

local broad_legacy_groups = {
  "Identifier",
  "Function",
  "String",
  "Number",
  "Constant",
  "Statement",
  "Conditional",
  "Operator",
  "Type",
  "Delimiter",
}
local broad_colors = {}
for _, name in ipairs(broad_legacy_groups) do
  local foreground = resolve(name).fg
  check(
    not broad_colors[foreground],
    name .. " duplicates broad legacy identity " .. tostring(broad_colors[foreground])
  )
  broad_colors[foreground] = name
end

local neutral_surface_backgrounds = {
  NONE = true,
  [colors.bg] = true,
  [colors.bg_alt] = true,
  [colors.bg_surface] = true,
  [colors.bg_popup] = true,
  [colors.bg_selection] = true,
  [colors.bg_active] = true,
  [colors.bg_deep] = true,
}
for _, name in ipairs({
  "Normal",
  "NormalNC",
  "NormalFloat",
  "Pmenu",
  "StatusLine",
  "StatusLineNC",
  "TabLine",
  "TabLineFill",
  "WinBar",
  "WinBarNC",
}) do
  check(neutral_surface_backgrounds[resolve(name).bg or "NONE"], name .. " uses an accent background")
end
for _, name in ipairs({ "Visual", "PmenuSel", "TabLineSel", "QuickFixLine", "TelescopeSelection" }) do
  check(neutral_surface_backgrounds[resolve(name).bg or "NONE"], name .. " selection uses an accent background")
end

-- Red is intentionally absent from ordinary syntax identities.
for _, name in ipairs({
  "Normal",
  "Identifier",
  "Function",
  "String",
  "Number",
  "Constant",
  "Statement",
  "Conditional",
  "Operator",
  "Type",
  "Delimiter",
  "Comment",
  "@variable",
  "@function",
  "@string",
  "@number",
  "@constant",
  "@keyword",
  "@operator",
  "@type",
  "@punctuation",
  "@comment",
}) do
  check(resolve(name).fg ~= colors.error, name .. " incorrectly uses the error color")
end

-- Neovim's legacy shell fallback must not collapse frequent shell concepts.
local shell_roles = {
  shShellVariables = "variable",
  shDeref = "fg_muted",
  shDerefVar = "variable",
  shDerefSimple = "variable",
  bashSpecialVariables = "symbol",
  shStatement = "callable",
  bashStatement = "callable",
  shCommandSub = "callable",
  shOption = "information",
  shLoop = "transform",
  shConditional = "transform",
  shTestOpr = "logic",
  shOperator = "logic",
  shCmdSubRegion = "fg_muted",
}
for name, role in pairs(shell_roles) do
  uses_foreground(name, colors[role], name .. " contradicts the shell semantic hierarchy")
end

for _, name in ipairs({ "Whitespace", "NonText", "SpecialKey" }) do
  check(groups[name].fg == colors.fg_hidden, name .. " does not use the hidden foreground")
  check(groups[name].bg == nil and not groups[name].bold, name .. " contains distracting attributes")
end
check(groups.EndOfBuffer.fg == groups.Normal.bg and groups.EndOfBuffer.bg == groups.Normal.bg, "EndOfBuffer is visible")
check(groups.FloatBorder.link ~= "WinSeparator", "FloatBorder inherits the split separator")
check(groups.TelescopeResultsFunction.link == "LimeiFunction", "Telescope functions do not use callable identity")
check(groups.NeoTreeDirectoryName.link == "Directory", "Neo-tree directories do not use navigation identity")
check(groups.NvimTreeFolderName.link == "Directory", "nvim-tree directories do not use navigation identity")
check(groups.DiffviewStatusAdded.link == "LimeiAdded", "Diffview added state is inconsistent")
check(groups.NeogitChangeDeleted.link == "LimeiRemoved", "Neogit deleted state is inconsistent")
check(groups.NeotestPassed.fg == colors.success, "Neotest passed state is inconsistent")
check(groups.GitSignsAdd.link == "LimeiAdded", "Gitsigns additions do not use the added identity")
check(groups.GitSignsChange.link == "LimeiChanged", "Gitsigns changes do not use the changed identity")
check(groups.GitSignsDelete.link == "LimeiRemoved", "Gitsigns deletions do not use the removed identity")
check(groups.GitSignsChangedelete.fg == colors.transform, "Gitsigns combined changes do not use transform")
check(groups.GitSignsUntracked.fg == colors.fg_dim, "Gitsigns untracked state is too prominent")
check(groups.LimeiAdded.fg == colors.success, "added content does not use success")
check(groups.DiffAdd.fg == colors.success, "diff additions do not use success")
check(groups.NeoTreeGitUntracked.fg == colors.fg_dim, "Neo-tree untracked state is too prominent")
check(groups.DiffviewStatusUntracked.fg == colors.fg_dim, "Diffview untracked state is too prominent")
check(groups.OilGitUntracked.fg == colors.fg_dim, "Oil untracked state is too prominent")
check(groups.OilCopy.fg == colors.transform, "Oil copy does not use transform")
check(groups.OilMove.fg == colors.transform, "Oil move does not use transform")
check(groups.OilCreate.fg == colors.success, "Oil create does not use success")
check(groups.LimeiHint.fg == colors.fg_dim, "hints do not use the secondary neutral hierarchy")
check(groups.CodeCompanionChatToolSuccess.fg == colors.success, "CodeCompanion success state is inconsistent")
check(groups.AerialFunctionIcon.fg == colors.callable, "Aerial functions do not use callable identity")
check(groups.NavicIconsClass.fg == colors.type, "Navic classes do not use type identity")
check(groups.IblIndent.fg == colors.indent, "indent-blankline does not use the indent hierarchy")
check(groups.BlinkCmpKindConstructor.fg == colors.type, "Blink constructors do not use type identity")
check(groups.BlinkCmpKindModule.fg == colors.information, "Blink modules do not use information identity")
check(groups.BlinkCmpKindOperator.fg == colors.logic, "Blink operators do not use logic identity")
check(groups.AerialConstructorIcon.fg == colors.type, "Aerial constructors do not use type identity")
check(groups.AerialModuleIcon.fg == colors.information, "Aerial modules do not use information identity")
check(groups.AerialOperatorIcon.fg == colors.logic, "Aerial operators do not use logic identity")

local render_markdown_groups = {
  "RenderMarkdownH1",
  "RenderMarkdownH2",
  "RenderMarkdownH3",
  "RenderMarkdownH4",
  "RenderMarkdownH5",
  "RenderMarkdownH6",
  "RenderMarkdownH1Bg",
  "RenderMarkdownH2Bg",
  "RenderMarkdownH3Bg",
  "RenderMarkdownH4Bg",
  "RenderMarkdownH5Bg",
  "RenderMarkdownH6Bg",
  "RenderMarkdownCode",
  "RenderMarkdownCodeInfo",
  "RenderMarkdownCodeBorder",
  "RenderMarkdownCodeFallback",
  "RenderMarkdownCodeInline",
  "RenderMarkdownQuote",
  "RenderMarkdownQuote1",
  "RenderMarkdownQuote2",
  "RenderMarkdownQuote3",
  "RenderMarkdownQuote4",
  "RenderMarkdownQuote5",
  "RenderMarkdownQuote6",
  "RenderMarkdownInlineHighlight",
  "RenderMarkdownBullet",
  "RenderMarkdownDash",
  "RenderMarkdownSign",
  "RenderMarkdownMath",
  "RenderMarkdownIndent",
  "RenderMarkdownHtmlComment",
  "RenderMarkdownLink",
  "RenderMarkdownLinkTitle",
  "RenderMarkdownWikiLink",
  "RenderMarkdownUnchecked",
  "RenderMarkdownChecked",
  "RenderMarkdownTodo",
  "RenderMarkdownTableHead",
  "RenderMarkdownTableRow",
  "RenderMarkdownSuccess",
  "RenderMarkdownInfo",
  "RenderMarkdownHint",
  "RenderMarkdownWarn",
  "RenderMarkdownError",
}
for _, name in ipairs(render_markdown_groups) do
  check(type(groups[name]) == "table", "missing render-markdown.nvim highlight: " .. name)
end
check(groups.RenderMarkdownTableFill == nil, "removed render-markdown.nvim TableFill highlight is still defined")
check(groups.RenderMarkdownCodeBorder.link == "RenderMarkdownCode", "render-markdown code border is inconsistent")
check(groups.RenderMarkdownBullet.link == "LimeiPunctuation", "render-markdown bullets do not use punctuation identity")
check(groups.RenderMarkdownMath.link == "@markup.math", "render-markdown math does not inherit Tree-sitter math")
check(groups.RenderMarkdownLinkTitle.link == "RenderMarkdownLink", "render-markdown link title is inconsistent")
check(groups.RenderMarkdownChecked.fg == colors.success, "render-markdown checked state is inconsistent")
check(groups.RenderMarkdownUnchecked.fg == colors.warning, "render-markdown unchecked state is inconsistent")
check(groups.RenderMarkdownError.fg == colors.error, "render-markdown error callout is inconsistent")

local standard_captures = {
  "@variable",
  "@variable.builtin",
  "@variable.parameter",
  "@variable.parameter.builtin",
  "@variable.member",
  "@constant",
  "@constant.builtin",
  "@constant.macro",
  "@module",
  "@module.builtin",
  "@label",
  "@string",
  "@string.documentation",
  "@string.regexp",
  "@string.escape",
  "@string.special",
  "@string.special.symbol",
  "@string.special.path",
  "@string.special.url",
  "@character",
  "@character.special",
  "@boolean",
  "@number",
  "@number.float",
  "@type",
  "@type.builtin",
  "@type.definition",
  "@attribute",
  "@attribute.builtin",
  "@property",
  "@function",
  "@function.builtin",
  "@function.call",
  "@function.macro",
  "@function.method",
  "@function.method.call",
  "@constructor",
  "@operator",
  "@keyword",
  "@keyword.coroutine",
  "@keyword.function",
  "@keyword.operator",
  "@keyword.import",
  "@keyword.type",
  "@keyword.modifier",
  "@keyword.repeat",
  "@keyword.return",
  "@keyword.debug",
  "@keyword.exception",
  "@keyword.conditional",
  "@keyword.conditional.ternary",
  "@keyword.directive",
  "@keyword.directive.define",
  "@punctuation",
  "@punctuation.delimiter",
  "@punctuation.bracket",
  "@punctuation.special",
  "@comment",
  "@comment.documentation",
  "@comment.error",
  "@comment.warning",
  "@comment.todo",
  "@comment.note",
  "@markup.strong",
  "@markup.italic",
  "@markup.strikethrough",
  "@markup.underline",
  "@markup.heading",
  "@markup.heading.1",
  "@markup.heading.2",
  "@markup.heading.3",
  "@markup.heading.4",
  "@markup.heading.5",
  "@markup.heading.6",
  "@markup.quote",
  "@markup.math",
  "@markup.link",
  "@markup.link.label",
  "@markup.link.url",
  "@markup.raw",
  "@markup.raw.block",
  "@markup.list",
  "@markup.list.checked",
  "@markup.list.unchecked",
  "@diff.plus",
  "@diff.minus",
  "@diff.delta",
  "@tag",
  "@tag.builtin",
  "@tag.attribute",
  "@tag.delimiter",
}
for _, capture in ipairs(standard_captures) do
  check(type(groups[capture]) == "table", "missing standard Tree-sitter capture: " .. capture)
end

for _, capture in ipairs({ "@none", "@conceal", "@spell", "@nospell" }) do
  check(
    type(groups[capture]) == "table" and vim.tbl_isempty(groups[capture]),
    capture .. " must remain an unstyled Tree-sitter query control"
  )
end

check(groups["@string.special.path"].link == "LimeiImport", "Tree-sitter paths do not use navigation identity")
check(groups["@string.special.symbol"].link == "LimeiConstant", "Tree-sitter symbols do not use symbol identity")
check(groups["@constant.macro"].link == "LimeiConstant", "Tree-sitter constant macros do not use symbol identity")
check(groups["@function.macro"].link == "@function", "Tree-sitter function macros do not use callable identity")
check(groups["@comment.note"].fg == colors.information, "Tree-sitter notes do not use information identity")
check(groups["@markup.list.checked"].fg == colors.success, "checked markup does not use success identity")
check(groups["@tag.attribute"].link == "LimeiInfo", "tag attributes do not use information identity")

local readme = table.concat(vim.fn.readfile("README.md"), "\n"):lower()
for role, meaning in pairs(palette.semantic) do
  check(readme:find(role, 1, true) ~= nil, "README does not document " .. role)
  check(type(meaning) == "string" and meaning ~= "", "semantic role has no meaning: " .. role)
end

if #failures > 0 then
  error("limei.nvim audit failed:\n- " .. table.concat(failures, "\n- "))
end

print("limei.nvim audit passed")
