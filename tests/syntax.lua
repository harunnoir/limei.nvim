local palette = require("limei").get_palette()

local function color(name)
  return tonumber(palette[name]:sub(2), 16)
end

local function resolved_at(row, col)
  local id = vim.fn.synID(row, col, true)
  local resolved = vim.fn.synIDtrans(id)
  return vim.fn.synIDattr(resolved, "name"), tonumber(vim.fn.synIDattr(resolved, "fg#", "gui"):sub(2), 16)
end

local function assert_role(row, col, group, role)
  local resolved, foreground = resolved_at(row, col)
  assert(resolved == group, string.format("%d:%d resolved to %s instead of %s", row, col, resolved, group))
  assert(foreground == color(role), string.format("%d:%d does not use %s", row, col, role))
end

vim.cmd.enew()
vim.bo.filetype = "sh"
vim.api.nvim_buf_set_lines(0, 0, -1, false, {
  "#!/usr/bin/env bash",
  "entry=${projects[0]}",
  'target="$HOME/${entry}"',
  'for fname in $(wget -q "$target"); do',
  "  if [[ -n $fname && $fname != *.tmp ]]; then",
  '    mkdir -p "$dir" | sha256sum',
  "  fi",
  "done",
})
vim.cmd.syntax("on")

-- Verify Neovim's effective legacy sh.vim chain, not only Limei's tables.
assert_role(2, 1, "LimeiVariable", "variable")
assert_role(2, 7, "LimeiMuted", "fg_dim")
assert_role(2, 9, "LimeiVariable", "variable")
assert_role(2, 17, "LimeiPunctuation", "fg_muted")
assert_role(2, 18, "LimeiNumber", "numeric")
assert_role(3, 8, "LimeiPunctuation", "fg_muted")
assert_role(4, 1, "LimeiControl", "transform")
assert_role(4, 16, "LimeiFunction", "callable")
assert_role(4, 21, "LimeiInfo", "information")
assert_role(4, 25, "LimeiVariable", "variable")
assert_role(5, 3, "LimeiControl", "transform")
assert_role(5, 9, "LimeiOperator", "logic")
assert_role(6, 5, "LimeiFunction", "callable")
assert_role(6, 21, "LimeiOperator", "logic")
assert_role(6, 23, "LimeiFunction", "callable")

print("limei.nvim legacy syntax tests passed")
