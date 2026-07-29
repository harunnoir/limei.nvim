local matching = require("limei.matching")

local function assert_match_emphasis(name)
  local group = vim.api.nvim_get_hl(0, { name = name, link = false })
  assert(group.bold == true, name .. " is not bold")
  assert(group.fg == tonumber(require("limei").get_palette().warning:sub(2), 16), name .. " does not use warning")
  for _, attribute in ipairs({
    "bg",
    "sp",
    "underline",
    "undercurl",
    "underdouble",
    "underdotted",
    "underdashed",
    "italic",
    "reverse",
    "standout",
    "strikethrough",
    "nocombine",
  }) do
    assert(group[attribute] == nil or group[attribute] == false, name .. " defines " .. attribute)
  end
end

assert_match_emphasis("MatchParen")
assert_match_emphasis("LimeiMatchDelimiter")

local function matchparen_positions()
  for _, match in ipairs(vim.fn.getmatches()) do
    if match.group == "MatchParen" then
      local positions = {}
      for index = 1, 8 do
        local position = match["pos" .. index]
        if position then
          table.insert(positions, position)
        end
      end
      return positions
    end
  end
  return {}
end

if vim.fn.exists(":NoMatchParen") == 2 then
  vim.cmd.NoMatchParen()
end
assert(vim.g.loaded_matchparen == nil, "test could not disable the built-in matcher")
matching.setup({ brackets = true, quotes = false })
assert(vim.g.loaded_matchparen == 1, "Limei did not restore the built-in matcher")
vim.cmd.enew()

for _, pair in ipairs({ "(value)", "[value]", "{value}" }) do
  vim.api.nvim_buf_set_lines(0, 0, -1, false, { pair, "plain" })
  for _, col in ipairs({ 0, 6 }) do
    vim.api.nvim_win_set_cursor(0, { 1, col })
    vim.api.nvim_exec_autocmds("CursorMoved", {})
    assert(#matchparen_positions() == 2, "built-in matchparen did not emphasize both endpoints")
  end
end

vim.api.nvim_win_set_cursor(0, { 2, 0 })
vim.api.nvim_exec_autocmds("CursorMoved", {})
assert(#matchparen_positions() == 0, "built-in matchparen did not clear its endpoints")

local function extmarks(bufnr)
  return vim.api.nvim_buf_get_extmarks(bufnr, matching.namespace, 0, -1, { details = true })
end

local function parser_available(language)
  local ok, parser = pcall(vim.treesitter.get_parser, 0, language)
  return ok and parser or nil
end

local function assert_quote_pair(language, lines, opening, closing)
  vim.cmd.enew()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.bo[bufnr].filetype = language
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)

  local parser = parser_available(language)
  if not parser then
    return false
  end

  parser:parse()

  for _, endpoint in ipairs({ opening, closing }) do
    vim.api.nvim_win_set_cursor(0, { endpoint[1] + 1, endpoint[2] })
    matching.update(bufnr)
    local marks = extmarks(bufnr)
    assert(#marks == 2, language .. " pair did not create exactly two extmarks")
    assert(marks[1][2] == opening[1] and marks[1][3] == opening[2])
    assert(marks[1][4].end_col == opening[3])
    assert(marks[2][2] == closing[1] and marks[2][3] == closing[2])
    assert(marks[2][4].end_col == closing[3])
    for _, mark in ipairs(marks) do
      assert(mark[4].hl_group == "LimeiMatchDelimiter")
    end
  end

  local adjacent = {
    { opening[1], opening[2] - 1 },
    { opening[1], opening[3] },
    { closing[1], closing[2] - 1 },
    { closing[1], closing[3] },
  }
  for _, position in ipairs(adjacent) do
    local line = lines[position[1] + 1]
    if position[2] >= 0 and position[2] < #line then
      vim.api.nvim_win_set_cursor(0, { position[1] + 1, position[2] })
      matching.update(bufnr)
      assert(#extmarks(bufnr) == 0, language .. " pair activated next to a delimiter")
    end
  end

  return true
end

matching.setup({ brackets = true, quotes = true })

vim.cmd.enew()
vim.api.nvim_buf_set_lines(0, 0, -1, false, { "ordinary navigation" })
vim.api.nvim_win_set_cursor(0, { 1, 5 })
local original_get_node = vim.treesitter.get_node
local tree_queries = 0
vim.treesitter.get_node = function(...)
  tree_queries = tree_queries + 1
  return original_get_node(...)
end
matching.update(0)
vim.treesitter.get_node = original_get_node
assert(tree_queries == 0, "ordinary cursor movement performed a Tree-sitter quote query")

assert_quote_pair("lua", { [[local value = "hello"]] }, { 0, 14, 15 }, { 0, 20, 21 })
assert_quote_pair("lua", { [[local value = 'hello']] }, { 0, 14, 15 }, { 0, 20, 21 })
assert_quote_pair("javascript", { "const value = `hello`;" }, { 0, 14, 15 }, { 0, 20, 21 })
assert_quote_pair("python", { 'value = """hello"""' }, { 0, 8, 11 }, { 0, 16, 19 })
assert_quote_pair("python", { "value = '''hello'''" }, { 0, 8, 11 }, { 0, 16, 19 })
assert_quote_pair("python", { 'value = """hello', 'world"""' }, { 0, 8, 11 }, { 1, 5, 8 })
assert_quote_pair("python", { 'value = r"hello"' }, { 0, 9, 10 }, { 0, 15, 16 })
assert_quote_pair("lua", { [[local value = "a \"quoted\" word"]] }, { 0, 14, 15 }, { 0, 32, 33 })

vim.cmd.enew()
vim.bo.filetype = "lua"
vim.api.nvim_buf_set_lines(0, 0, -1, false, { "-- don't treat this as a string pair" })
local lua_parser = parser_available("lua")
if lua_parser then
  lua_parser:parse()
  vim.api.nvim_win_set_cursor(0, { 1, 4 })
  matching.update(0)
  assert(#extmarks(0) == 0, "apostrophe in a comment was treated as a delimiter")
end

vim.cmd.enew()
vim.bo.filetype = "python"
vim.api.nvim_buf_set_lines(0, 0, -1, false, { [[name = "don't"]] })
local python_parser = parser_available("python")
if python_parser then
  python_parser:parse()
  vim.api.nvim_win_set_cursor(0, { 1, 11 })
  matching.update(0)
  assert(#extmarks(0) == 0, "apostrophe inside a word was treated as a delimiter boundary")
end

vim.cmd.enew()
vim.bo.filetype = "lua"
vim.api.nvim_buf_set_lines(0, 0, -1, false, { [[local value = "incomplete]] })
lua_parser = parser_available("lua")
if lua_parser then
  lua_parser:parse()
  vim.api.nvim_win_set_cursor(0, { 1, 14 })
  matching.update(0)
  assert(#extmarks(0) == 0, "incomplete string produced a false delimiter pair")
end

matching.setup({ brackets = true, quotes = false })
assert(#extmarks(vim.api.nvim_get_current_buf()) == 0, "disabling quote matching left stale extmarks")
local has_group, quote_autocmds = pcall(vim.api.nvim_get_autocmds, { group = "LimeiMatching" })
assert(not has_group or #quote_autocmds == 0, "disabling quote matching left active autocommands")

print("limei.nvim matching tests passed")
