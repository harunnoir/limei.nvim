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

local identities = {
  "variable",
  "callable",
  "structure",
  "literal",
  "numeric",
  "type",
  "symbol",
  "logic",
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

local seen = {}
for _, key in ipairs(identities) do
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
check(contrast(colors.fg_dim, colors.bg) >= 4.5, "secondary foreground contrast is below 4.5:1")
check(math.abs(luminance(colors.bg_popup) - luminance(colors.bg)) < 0.01, "popup background is too far from the editor")
check(luminance(colors.separator) < luminance(colors.bg), "separator is not darker than the editor")
check(colors.separator ~= "#000000", "separator must not be pure black")

local groups = require("limei.groups").get(colors, require("limei.config").defaults)
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
check(groups.CodeCompanionChatToolSuccess.fg == colors.success, "CodeCompanion success state is inconsistent")
check(groups.AerialFunctionIcon.fg == colors.callable, "Aerial functions do not use callable identity")
check(groups.NavicIconsClass.fg == colors.type, "Navic classes do not use type identity")
check(groups.IblIndent.fg == colors.indent, "indent-blankline does not use the indent hierarchy")

local readme = table.concat(vim.fn.readfile("README.md"), "\n"):lower()
for role, meaning in pairs(palette.semantic) do
  check(readme:find(role, 1, true) ~= nil, "README does not document " .. role)
  check(type(meaning) == "string" and meaning ~= "", "semantic role has no meaning: " .. role)
end

if #failures > 0 then
  error("limei.nvim audit failed:\n- " .. table.concat(failures, "\n- "))
end

print("limei.nvim audit passed")
