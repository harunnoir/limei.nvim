local palette = require("cold.palette")
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
check(luminance(colors.bg_inactive) < luminance(colors.bg), "inactive background is not darker")
check(math.abs(luminance(colors.bg_popup) - luminance(colors.bg)) < 0.01, "popup background is too far from the editor")
check(colors.separator == "#000000" or colors.separator == colors.bg_deep, "separator is not black or bg_deep")

local groups = require("cold.groups").get(colors, require("cold.config").defaults)
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
end

local readme = table.concat(vim.fn.readfile("README.md"), "\n"):lower()
for role, meaning in pairs(palette.semantic) do
  check(readme:find(role, 1, true) ~= nil, "README does not document " .. role)
  check(type(meaning) == "string" and meaning ~= "", "semantic role has no meaning: " .. role)
end

if #failures > 0 then
  error("cold.nvim audit failed:\n- " .. table.concat(failures, "\n- "))
end

print("cold.nvim audit passed")
