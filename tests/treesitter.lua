local groups = require("limei.groups.treesitter").get(require("limei").get_palette())

local function capture_names(bufnr, row, col)
  local names = {}
  for _, capture in ipairs(vim.treesitter.get_captures_at_pos(bufnr, row, col)) do
    names[capture.capture] = true
  end
  return names
end

local function assert_capture(filetype, language, lines, row, col, capture)
  vim.cmd.enew()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.bo[bufnr].filetype = filetype
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)

  local ok, parser = pcall(vim.treesitter.get_parser, bufnr, language)
  if not ok or not parser then
    return false
  end

  parser:parse()
  vim.treesitter.start(bufnr, language)
  local captures = capture_names(bufnr, row, col)
  assert(captures[capture], string.format("%s query did not emit @%s at %d:%d", language, capture, row, col))
  assert(type(groups["@" .. capture]) == "table", "Limei does not define @" .. capture)
  return true
end

local function assert_no_capture(filetype, language, lines, row, col, capture)
  vim.cmd.enew()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.bo[bufnr].filetype = filetype
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)

  local ok, parser = pcall(vim.treesitter.get_parser, bufnr, language)
  if not ok or not parser then
    return false
  end

  parser:parse()
  vim.treesitter.start(bufnr, language)
  local captures = capture_names(bufnr, row, col)
  assert(not captures[capture], string.format("%s unexpectedly emitted @%s at %d:%d", language, capture, row, col))
  return true
end

if vim.fn.has("nvim-0.12") == 1 then
  local lua = { "local answer = math.floor(42)" }
  assert_capture("lua", "lua", lua, 0, 0, "keyword")
  assert_capture("lua", "lua", lua, 0, 6, "variable")
  assert_capture("lua", "lua", lua, 0, 15, "module.builtin")
  assert_capture("lua", "lua", lua, 0, 20, "variable.member")
  assert_capture("lua", "lua", lua, 0, 20, "function.call")
  assert_capture("lua", "lua", lua, 0, 26, "number")

  local c = { "#define MAX 10", "#define CALL(x) x" }
  assert_capture("c", "c", c, 0, 8, "constant.macro")
  assert_capture("c", "c", c, 1, 8, "function.macro")

  local lua_string = { [[local value = "a\n"]] }
  assert_capture("lua", "lua", lua_string, 0, 14, "string")
  assert_no_capture("lua", "lua", lua_string, 0, 14, "string.delimiter")
  assert_capture("lua", "lua", lua_string, 0, 16, "string.escape")

  local c_string = { [[const char *value = "a\n";]] }
  assert_capture("c", "c", c_string, 0, 20, "string")
  assert_no_capture("c", "c", c_string, 0, 20, "string.delimiter")
  assert_capture("c", "c", c_string, 0, 22, "string.escape")

  assert_capture("markdown", "markdown", { "- [x] complete" }, 0, 2, "markup.list.checked")
  assert_capture("markdown", "markdown", { "- [ ] pending" }, 0, 2, "markup.list.unchecked")
end

print("limei.nvim Tree-sitter tests passed")
