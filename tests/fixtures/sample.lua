-- SPDX-License-Identifier: GPL-2.0-or-later

local DEFAULT_LIMIT = 42

---@class Worker
local Worker = {}
Worker.__index = Worker

function Worker.new(name)
  return setmetatable({ name = name, active = true }, Worker)
end

function Worker:run(items)
  local pattern = "^task:%d+$"
  for _, item in ipairs(items) do
    if self.active and item:match(pattern) then
      print(("%s:%d"):format(self.name, DEFAULT_LIMIT))
    end
  end
end

return Worker
