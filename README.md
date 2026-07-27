# cold.nvim

`cold.nvim` is a deeply dark, muted Neovim colorscheme designed for long
programming sessions. It combines a neutral `#101010` charcoal canvas, soft
foregrounds, distinct semantic syntax identities, and quiet plugin surfaces.

The goal is not maximum contrast or screenshot impact. The goal is an editor
that remains readable and comfortable after ten hours.

> Screenshot placeholder — add representative code, picker, and explorer
> screenshots before publishing.

## Cold does not mean blue

“Cold” means emotionally neutral: calm, precise, detached from visual noise,
and timeless. It does not mean blue, cyan, icy, or metallic. Cool color is
reserved for occasional links, references, and informational states.

## Colors have meaning

Color is a semantic language rather than decoration.

| Role | Meaning |
| --- | --- |
| `variable` | Ordinary contextual data |
| `callable` | Callable behavior and execution |
| `structure` | Language grammar and construction |
| `literal` | Literal textual content |
| `numeric` | Numeric quantity |
| `type` | Shape, schema, and data category |
| `symbol` | Fixed or symbolic identity |
| `logic` | Logical state and bounded choice |
| `error` | Failure, deletion, and destructive state |
| `conflict` | Conflict, exception, and interruption |
| `transform` | Pattern, replacement, and transformation |
| `warning` | Attention, warning, and active process |
| `success` | Completed success and accepted state |
| `information` | Reference, link, and non-urgent information |
| `navigation` | Path, directory, import, and external target |

These meanings remain stable across syntax, Treesitter, semantic tokens,
diagnostics, Git, completion, LSP, file explorers, DAP, tasks, and plugins.
Most code and UI remain neutral.

## Distinct semantic identities

Important categories are recognizable without rainbow syntax:

| Code category | Identity |
| --- | --- |
| Variables, fields, properties | Neutral data |
| Functions and methods | Muted callable |
| Keywords and declarations | Muted structure |
| Strings and characters | Muted literal |
| Numbers and floats | Muted numeric |
| Types and schemas | Muted type |
| Constants | Muted symbol |
| Booleans and state enums | Muted logic |
| Comments | Secondary neutral |

Related elements share an identity; unrelated high-frequency categories do not
reuse the same visible color. Parameters, modules, namespaces, operators,
punctuation, paths, and metadata stay neutral or dim.

## Quiet surfaces

Floating windows, completion menus, and plugin popups stay close to the editor
background. Inactive splits recede with a slightly darker background by
default. Split separators are black and unobtrusive. Floats use visible muted
neutral borders, including standard LSP hover documentation.

Critical states use signs, labels, undercurls, icons, or text styles where the
interface supports them, rather than relying on hue alone.

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

For local development, replace the repository name with:

```lua
dir = "/path/to/cold.nvim"
```

Calling `setup()` is optional:

```vim
:colorscheme cold
```

## Configuration

```lua
require("cold").setup({
  transparent = false,
  dim_inactive = true,
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

Configuration is reset to defaults on every `setup()` call. Reapply the
colorscheme after changing it.

### Transparency and inactive splits

```lua
require("cold").setup({
  transparent = true,
  dim_inactive = true,
})
```

Transparency removes only editor canvas backgrounds. Popups and menus remain
opaque for readability. In opaque mode, `dim_inactive` uses the recessed
background and dim foreground for inactive windows.

### Palette overrides

```lua
require("cold").setup({
  palette = {
    bg = "#0e0e0e",
    callable = "#99887b",
  },
})
```

The resolved palette is available through `require("cold").get_palette()`.
Legacy v0.x palette role names remain accepted where practical.

### Highlight overrides

Use a table:

```lua
require("cold").setup({
  highlights = {
    Comment = { fg = "#706c66", italic = true },
  },
})
```

Or a function:

```lua
require("cold").setup({
  highlights = function(colors)
    return {
      CursorLineNr = { fg = colors.warning, bold = true },
    }
  end,
})
```

User highlight overrides always run last.

## Plugin support

Dedicated grouped highlights cover the visible interfaces in the project’s
tested environment:

- Blink, blink-cmp-words, and nvim-cmp
- fzf-lua and fzf-oil
- Oil, oil-git, and oil-lsp-diagnostics
- Gitsigns, Gitgraph, and Undotree
- Lspsaga, Fidget, Glance, Trouble, Tiny Inline Diagnostic, symbol-usage, and Quicker
- nvim-dap and nvim-dap-ui
- Mini Indentscope, Starter, Hipatterns, and Surround
- render-markdown and CSVView
- Snacks picker, explorer, dashboard, notifier, input, terminal, indent, and diff
- lazy.nvim, Mason, WhichKey, Noice, Notify, Slimline, Bufferline, Satellite, and ToggleTerm
- Overseer, Leetcode, Flash, todo-comments, grug-far, Marks, Harpoon, Yanky, hardtime, Haunt, and nvim-ufo

Plugins without dedicated highlight groups inherit standard editor, syntax,
diagnostic, diff, popup, and floating-window groups. No plugin is required at
theme load time. Support claims are limited to groups verified against the
locally installed plugin versions.

## Development

```sh
make format
make check
make test
```

`make check` runs StyLua and the palette/semantic audit. `make test` loads the
theme headlessly in default, transparent, override, and reload configurations.
See `:help cold.nvim` for concise in-editor documentation.

## Design lineage

The grayscale-first restraint is inspired by
[nendix/zen.nvim](https://github.com/nendix/zen.nvim), while the pigment
relationships take broad inspiration from Gruvbox. The palette,
implementation, semantic model, and integrations are original to `cold.nvim`.
