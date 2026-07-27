local data = vim.fn.stdpath("data")
local roots = {
  data .. "/lazy",
  data .. "/site/pack",
}
local patterns = {
  "nvim_set_hl",
  "set_hl",
  "hl_group",
  "hlgroup",
  "highlight",
  "winhighlight",
}

local function plugin_directories()
  local directories = {}
  for _, root in ipairs(roots) do
    for _, path in ipairs(vim.fn.glob(root .. "/*", true, true)) do
      if vim.fn.isdirectory(path) == 1 then
        table.insert(directories, path)
      end
    end
  end
  table.sort(directories)
  return directories
end

local function candidates(path)
  local found = {}
  local files = vim.fn.globpath(path, "**/*.{lua,vim}", true, true)
  for _, file in ipairs(files) do
    local ok, lines = pcall(vim.fn.readfile, file)
    if ok then
      for number, line in ipairs(lines) do
        for _, pattern in ipairs(patterns) do
          if line:find(pattern, 1, true) then
            found[#found + 1] = ("%s:%d: %s"):format(file:sub(#path + 2), number, vim.trim(line))
            break
          end
        end
      end
    end
  end
  return found
end

for _, path in ipairs(plugin_directories()) do
  local found = candidates(path)
  if #found > 0 then
    print(("\n## %s"):format(vim.fn.fnamemodify(path, ":t")))
    for _, line in ipairs(found) do
      print(line)
    end
  end
end
