-- SPDX-License-Identifier: GPL-2.0-or-later
-- Copyright (C) 2026 limei.nvim contributors

local M = {}

local config = require("limei.config")

function M.setup(options)
  config.setup(options)
end

function M.get_palette()
  return require("limei.palette").get(config.options.palette)
end

function M.get_roles()
  local roles = require("limei.roles").get(M.get_palette(), config.options.roles)
  return roles
end

function M.load()
  if vim.fn.has("nvim-0.10") ~= 1 then
    vim.notify("limei.nvim requires Neovim 0.10 or newer", vim.log.levels.ERROR)
    return
  end

  -- Clearing first makes repeated :colorscheme calls deterministic.
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "limei"

  local roles = M.get_roles()
  local colors = vim.tbl_extend("force", M.get_palette(), roles)
  local groups = require("limei.groups").get(colors, config.options)
  require("limei.utils").set_highlights(groups)

  if config.options.terminal_colors then
    require("limei.groups.terminal").apply(colors)
  end
end

return M
