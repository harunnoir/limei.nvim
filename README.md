# cold.nvim

An extremely dark, muted Neovim colorscheme built for long programming
sessions. `cold.nvim` uses a nearly black neutral charcoal canvas, soft
foregrounds, and a small family of weathered warm and cool pigments.

Neutral text defines the screen, while muted ochre directories and restrained
earthy, natural, and rare slate accents provide quiet semantic structure.

The goal is not maximum contrast or an impressive screenshot. The goal is an
editor that remains comfortable after ten hours.

> Screenshot placeholder — add a representative code and plugin screenshot
> before publishing.

## Requirements

- Neovim 0.10+
- A true-color terminal
- No runtime dependencies

## Installation

With lazy.nvim:

```lua
{
  "your-name/cold.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cold").setup()
    vim.cmd.colorscheme("cold")
  end,
}
```

For local development:

```lua
{
  dir = "/path/to/cold.nvim",
  name = "cold.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("cold")
  end,
}
```

Calling `setup()` is optional. This works by itself:

```vim
:colorscheme cold
```

## Configuration

```lua
require("cold").setup({
  transparent = false,
  dim_inactive = false,
  terminal_colors = true,

  styles = {
    comments = { italic = false },
    keywords = { italic = false },
    functions = { bold = false },
    variables = {},
  },

  palette = {},
  highlights = {},
})

vim.cmd.colorscheme("cold")
```

Configuration is reset to safe defaults on each `setup()` call. Reapply the
colorscheme after changing it.

### Transparency and inactive windows

```lua
require("cold").setup({
  transparent = true,
  dim_inactive = true,
})
vim.cmd.colorscheme("cold")
```

Transparency removes only editor canvas backgrounds. Popups and menus remain
opaque for readability. With `dim_inactive`, inactive windows use the recessed
background and dim foreground when transparency is disabled.

### Palette overrides

```lua
require("cold").setup({
  palette = {
    bg = "#0e0e0e",
  },
})
```

The resolved palette is available through:

```lua
local colors = require("cold").get_palette()
```

### Highlight overrides

Use a table:

```lua
require("cold").setup({
  highlights = {
    Comment = { fg = "#707070", italic = true },
  },
})
```

Or a function:

```lua
require("cold").setup({
  highlights = function(colors)
    return {
      CursorLineNr = { fg = colors.wheat, bold = true },
    }
  end,
})
```

Highlight overrides are applied after all built-in and plugin groups.

## Supported integrations

The theme includes dedicated groups for:

- Treesitter and LSP semantic tokens
- Native diagnostics and Tiny Inline Diagnostic
- Blink, blink-cmp-words, and nvim-cmp
- fzf-lua and the combined fzf-oil workflow
- Oil, oil-git, and oil-lsp-diagnostics
- GitSigns, GitGraph, and Undotree
- Mini Indentscope, Starter, Hipatterns, and Surround
- nvim-dap and nvim-dap-ui
- Lspsaga, Fidget, Glance, Trouble, and symbol-usage
- render-markdown and CSVView
- Snacks picker, dashboard, notifier, input, terminal, explorer, indent, and diff
- lazy.nvim, Mason, WhichKey, Noice, Notify, Slimline, Bufferline
- Satellite, Overseer, Flash, todo-comments, grug-far, Marks, Yanky, hardtime, ToggleTerm, and nvim-ufo
- Haunt, Leetcode, and Quicker

Plugins without dedicated highlight groups naturally inherit core editor,
syntax, floating-window, diagnostic, or diff groups. Plugin modules are never
required at colorscheme load time, so missing plugins are safe.

## Development

The code is divided into editor, syntax, Treesitter, semantic-token,
diagnostic, terminal, and grouped plugin modules. Highlights are plain Lua
tables and are applied with `vim.api.nvim_set_hl()`.

Format the project with:

```sh
stylua lua colors
```

Validate a local checkout with:

```sh
nvim --headless -u NONE --cmd "set rtp^=." \
  +"colorscheme cold" \
  +"lua print(vim.g.colors_name)" \
  +qa
```

## Design lineage

The grayscale-first simplicity is inspired by
[nendix/zen.nvim](https://github.com/nendix/zen.nvim). The palette,
implementation, and integrations in `cold.nvim` are distinct.
