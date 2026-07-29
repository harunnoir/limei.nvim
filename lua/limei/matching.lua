local M = {}

local namespace = vim.api.nvim_create_namespace("limei.matching")
local group_name = "LimeiMatching"
local active_buffer

local function clear(bufnr)
  if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
    vim.api.nvim_buf_clear_namespace(bufnr, namespace, 0, -1)
  end
  if active_buffer == bufnr then
    active_buffer = nil
  end
end

local function is_string_like(node)
  local kind = node:type():lower()
  return kind:find("string", 1, true) ~= nil
    or kind:find("char", 1, true) ~= nil
    or kind:find("template", 1, true) ~= nil
end

local function delimiter_at_start(line, start_col)
  local head = line:sub(start_col + 1, start_col + 16)
  local prefix, delimiter = head:match('^([rRuUbBfF]*)(""")')
  if not delimiter then
    prefix, delimiter = head:match("^([rRuUbBfF]*)(''')")
  end
  if not delimiter then
    prefix, delimiter = head:match("^([rRuUbBfF]*)([\"'`])")
  end
  if not delimiter then
    return nil
  end
  return start_col + #prefix, delimiter
end

local function delimiter_pair(bufnr, node)
  if not is_string_like(node) then
    return nil
  end

  local start_row, start_col, end_row, end_col = node:range()
  if end_row < start_row or (end_row == start_row and end_col <= start_col) then
    return nil
  end

  local start_line = vim.api.nvim_buf_get_lines(bufnr, start_row, start_row + 1, false)[1]
  local end_line = vim.api.nvim_buf_get_lines(bufnr, end_row, end_row + 1, false)[1]
  if not start_line or not end_line then
    return nil
  end

  local opening_col, delimiter = delimiter_at_start(start_line, start_col)
  if not delimiter then
    return nil
  end

  local length = #delimiter
  local closing_col = end_col - length
  if closing_col < 0 or end_line:sub(closing_col + 1, end_col) ~= delimiter then
    return nil
  end
  if start_row == end_row and closing_col < opening_col + length then
    return nil
  end

  return {
    opening = { start_row, opening_col, opening_col + length },
    closing = { end_row, closing_col, end_col },
  }
end

local function cursor_touches(pair, row, col)
  for _, endpoint in pairs(pair) do
    if row == endpoint[1] and col >= endpoint[2] and col < endpoint[3] then
      return true
    end
  end
  return false
end

local function node_at(bufnr, row, col)
  if col < 0 then
    return nil
  end
  local ok, node = pcall(vim.treesitter.get_node, {
    bufnr = bufnr,
    pos = { row, col },
    ignore_injections = false,
  })
  return ok and node or nil
end

local function cursor_touches_quote(bufnr, row, col)
  local line = vim.api.nvim_buf_get_lines(bufnr, row, row + 1, false)[1]
  if not line then
    return false
  end

  local character = line:sub(col + 1, col + 1)
  return character == "'" or character == '"' or character == "`"
end

local function find_pair(bufnr, row, col)
  local node = node_at(bufnr, row, col)
  local depth = 0
  while node and depth < 12 do
    local pair = delimiter_pair(bufnr, node)
    if pair and cursor_touches(pair, row, col) then
      return pair
    end
    node = node:parent()
    depth = depth + 1
  end
  return nil
end

local function add_endpoint(bufnr, endpoint)
  vim.api.nvim_buf_set_extmark(bufnr, namespace, endpoint[1], endpoint[2], {
    end_row = endpoint[1],
    end_col = endpoint[3],
    hl_group = "LimeiMatchDelimiter",
    hl_mode = "combine",
    priority = 200,
  })
end

function M.update(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  if active_buffer and active_buffer ~= bufnr then
    clear(active_buffer)
  end
  clear(bufnr)

  if not vim.api.nvim_buf_is_valid(bufnr) or vim.bo[bufnr].buftype ~= "" then
    return
  end

  local cursor = vim.api.nvim_win_get_cursor(0)
  local row, col = cursor[1] - 1, cursor[2]
  if not cursor_touches_quote(bufnr, row, col) then
    return
  end

  local pair = find_pair(bufnr, row, col)
  if not pair then
    return
  end

  add_endpoint(bufnr, pair.opening)
  add_endpoint(bufnr, pair.closing)
  active_buffer = bufnr
end

local function enable_builtin_matchparen()
  local pairs = vim.opt.matchpairs:get()
  if not vim.tbl_contains(pairs, "<:>") then
    vim.opt.matchpairs:append("<:>")
  end
  if vim.g.loaded_matchparen == nil then
    pcall(vim.cmd.runtime, "plugin/matchparen.vim")
  end
end

function M.setup(options)
  options = options or {}

  pcall(vim.api.nvim_del_augroup_by_name, group_name)
  clear(active_buffer)

  if options.brackets then
    enable_builtin_matchparen()
  end
  if not options.quotes then
    return
  end

  local group = vim.api.nvim_create_augroup(group_name, { clear = true })
  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "TextChanged", "TextChangedI", "InsertLeave" }, {
    group = group,
    callback = function(args)
      M.update(args.buf)
    end,
  })
  vim.api.nvim_create_autocmd({ "BufLeave", "BufWipeout" }, {
    group = group,
    callback = function(args)
      clear(args.buf)
    end,
  })
end

M.namespace = namespace

return M
