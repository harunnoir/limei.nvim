local palette_module = require("limei.palette")
local roles_module = require("limei.roles")
local palette = palette_module.get()
local roles, references = roles_module.get(palette)
local colors = vim.tbl_extend("force", palette, roles)

local required_palette = {
  "bg_deep",
  "bg_inactive",
  "bg",
  "bg_alt",
  "bg_cursorline",
  "bg_surface",
  "bg_elevated",
  "bg_overlay",
  "bg_selection",
  "bg_active",
  "bg_popup",
  "fg_highest",
  "fg_bright",
  "pearl",
  "ivory",
  "silver",
  "fg",
  "fg_soft",
  "fg_dim",
  "fg_muted",
  "fg_subtle",
  "fg_hidden",
  "rose",
  "brick",
  "coral",
  "clay",
  "copper",
  "amber",
  "sand",
  "olive",
  "fern",
  "moss",
  "sage",
  "mint",
  "teal",
  "cyan",
  "sky",
  "blue",
  "indigo",
  "lavender",
  "violet",
  "magenta",
  "plum",
  "border",
  "border_focus",
  "separator",
  "whitespace",
  "indent",
  "indent_scope",
  "scrollbar",
  "scrollbar_track",
}

local required_roles = {
  "variable",
  "callable",
  "keyword",
  "string",
  "number",
  "type",
  "constant",
  "boolean",
  "comment",
  "error",
  "warning",
  "success",
  "information",
  "hint",
  "conflict",
  "navigation",
  "transformation",
  "added",
  "changed",
  "deleted",
  "untracked",
  "ignored",
  "staged",
  "renamed",
}

local identities = {
  "variable",
  "callable",
  "keyword",
  "string",
  "number",
  "type",
  "constant",
  "boolean",
  "comment",
}

local failures = {}

local function check(ok, message)
  if not ok then
    failures[#failures + 1] = message
  end
end

local function rgb(hex)
  local red, green, blue = hex:match("^#(%x%x)(%x%x)(%x%x)$")
  return red and tonumber(red, 16), green and tonumber(green, 16), blue and tonumber(blue, 16)
end

local function channel(value)
  value = value / 255
  return value <= 0.04045 and value / 12.92 or ((value + 0.055) / 1.055) ^ 2.4
end

local function luminance(hex)
  local red, green, blue = rgb(hex)
  check(red ~= nil, "invalid color: " .. tostring(hex))
  if not red then
    return 0
  end
  return 0.2126 * channel(red) + 0.7152 * channel(green) + 0.0722 * channel(blue)
end

local function contrast(a, b)
  local high, low = luminance(a), luminance(b)
  if high < low then
    high, low = low, high
  end
  return (high + 0.05) / (low + 0.05)
end

local function lab(hex)
  local red, green, blue = rgb(hex)
  red, green, blue = channel(red), channel(green), channel(blue)
  local x = (red * 0.4124 + green * 0.3576 + blue * 0.1805) / 0.95047
  local y = (red * 0.2126 + green * 0.7152 + blue * 0.0722)
  local z = (red * 0.0193 + green * 0.1192 + blue * 0.9505) / 1.08883
  local function pivot(value)
    return value > 0.008856 and value ^ (1 / 3) or 7.787 * value + 16 / 116
  end
  x, y, z = pivot(x), pivot(y), pivot(z)
  return 116 * y - 16, 500 * (x - y), 200 * (y - z)
end

local function distance(a, b)
  local l1, a1, b1 = lab(a)
  local l2, a2, b2 = lab(b)
  return math.sqrt((l1 - l2) ^ 2 + (a1 - a2) ^ 2 + (b1 - b2) ^ 2)
end

for _, key in ipairs(required_palette) do
  check(type(palette[key]) == "string" and rgb(palette[key]) ~= nil, "missing or invalid palette key: " .. key)
end
for _, role in ipairs(required_roles) do
  check(type(roles[role]) == "string" and rgb(roles[role]) ~= nil, "missing or invalid role: " .. role)
  local reference = references[role]
  check(
    palette[reference] ~= nil or (type(reference) == "string" and rgb(reference) ~= nil),
    "invalid role reference: " .. role
  )
end

local seen = {}
for index, role in ipairs(identities) do
  check(not seen[roles[role]], role .. " duplicates " .. tostring(seen[roles[role]]))
  seen[roles[role]] = role
  for other_index = index + 1, #identities do
    local other = identities[other_index]
    check(
      distance(roles[role], roles[other]) >= 7,
      ("%s and %s are not perceptually distinct enough"):format(role, other)
    )
  end
end

local primary_contrast = contrast(palette.fg, palette.bg)
check(primary_contrast >= 7 and primary_contrast <= 9.5, "primary foreground contrast is outside 7:1-9.5:1")
for _, role in ipairs({ "variable", "keyword", "string", "number", "type", "constant", "boolean" }) do
  local ratio = contrast(roles[role], palette.bg)
  check(ratio >= 4.5 and ratio <= 6.5, role .. " contrast is outside 4.5:1-6.5:1")
end
local callable_contrast = contrast(roles.callable, palette.bg)
check(callable_contrast >= 7 and callable_contrast <= 10, "callable contrast is outside 7:1-10:1")
check(contrast(palette.fg_dim, palette.bg) >= 4.5, "secondary foreground contrast is below 4.5:1")
check(luminance(palette.bg_inactive) < luminance(palette.bg), "inactive background is not darker")
check(
  math.abs(luminance(palette.bg_popup) - luminance(palette.bg)) < 0.01,
  "popup background is too far from the editor"
)
check(contrast(palette.separator, palette.bg) < 1.5, "separator is too prominent")
local sr, sg, sb = rgb(palette.separator)
check(math.max(sr, sg, sb) - math.min(sr, sg, sb) <= 6, "separator is not neutral")

local accent_luminance = {}
for _, key in ipairs({
  "rose",
  "coral",
  "amber",
  "sage",
  "teal",
  "cyan",
  "blue",
  "lavender",
  "violet",
}) do
  accent_luminance[#accent_luminance + 1] = luminance(palette[key])
end
table.sort(accent_luminance)
check(accent_luminance[#accent_luminance] - accent_luminance[1] < 0.08, "accent perceived-lightness range is too wide")

local families = {
  warm = { coral = true, amber = true, rose = true },
  green = { sage = true, olive = true },
  cool = { blue = true, cyan = true },
  purple = { lavender = true },
  neutral = { fg_muted = true },
}
for family, members in pairs(families) do
  local count = 0
  for _, role in ipairs(identities) do
    count = count + (members[references[role]] and 1 or 0)
  end
  check(count <= 3, family .. " is overrepresented in major code roles")
end

local near_white = {
  [palette.fg_highest] = true,
  [palette.fg_bright] = true,
  [palette.pearl] = true,
  [palette.ivory] = true,
  [palette.silver] = true,
}
local near_white_roles = 0
for _, role in ipairs(identities) do
  near_white_roles = near_white_roles + (near_white[roles[role]] and 1 or 0)
end
check(near_white_roles <= 1, "near-white is assigned to too many high-frequency roles")
for key, value in pairs(palette) do
  check(value:lower() ~= "#ffffff", "pure white is not allowed: " .. key)
end

local groups = require("limei.groups").get(colors, require("limei.config").defaults)
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
local foreground_count, near_white_count, highest_count = 0, 0, 0
for name, value in pairs(groups) do
  check(type(name) == "string" and type(value) == "table", "invalid highlight entry: " .. tostring(name))
  for attribute, attribute_value in pairs(value) do
    check(allowed[attribute], "invalid highlight attribute " .. attribute .. " in " .. name)
    if attribute == "fg" or attribute == "bg" or attribute == "sp" then
      check(attribute_value == "NONE" or rgb(attribute_value) ~= nil, "invalid color in " .. name .. "." .. attribute)
    end
    if attribute == "fg" then
      foreground_count = foreground_count + 1
      near_white_count = near_white_count + (near_white[attribute_value] and 1 or 0)
      highest_count = highest_count + (attribute_value == palette.fg_highest and 1 or 0)
    elseif attribute == "bg" and near_white[attribute_value] then
      check(false, "near-white background is not allowed: " .. name)
    end
  end
end
check(near_white_count / foreground_count <= 0.2, "near-white foreground usage exceeds 20%")
check(highest_count / foreground_count <= 0.05, "highest-focus foreground usage exceeds 5%")

for _, fixture in ipairs({
  "sample.lua",
  "sample.c",
  "sample.cpp",
  "sample.py",
  "sample.js",
  "sample.ts",
  "sample.rs",
  "sample.go",
  "sample.sh",
  "sample.json",
  "sample.yaml",
  "sample.md",
}) do
  check(vim.fn.filereadable("tests/fixtures/" .. fixture) == 1, "missing syntax fixture: " .. fixture)
end

local readme = table.concat(vim.fn.readfile("README.md"), "\n"):lower()
for role, meaning in pairs(roles_module.meanings) do
  check(readme:find(role, 1, true) ~= nil, "README does not document " .. role)
  check(type(meaning) == "string" and meaning ~= "", "semantic role has no meaning: " .. role)
end

if #failures > 0 then
  error("limei.nvim audit failed:\n- " .. table.concat(failures, "\n- "))
end

print("limei.nvim audit passed")
