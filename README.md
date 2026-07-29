**Heyyy... Shuush IT’S NIGHT... CODE doesn’t have to be noisy. let’s listen to the rain... drops... and our heartbeats... isn’t it Limei...**

# limei.nvim

`limei.nvim` is a deeply dark, muted Neovim colorscheme designed for long
programming sessions. It combines a neutral `#101010` charcoal canvas, soft
foregrounds, distinct semantic syntax identities, and quiet plugin surfaces.

The goal is not maximum contrast or screenshot impact. The goal is an editor
that remains readable and comfortable after ten hours.

### Editor

<img width="1340" height="726" alt="image" src="https://github.com/user-attachments/assets/7e918655-6d03-470e-a9ee-d3817bcfde64" />

### Explorer

<img width="1340" height="726" alt="image" src="https://github.com/user-attachments/assets/325867c0-45f1-4666-a4f8-d435ba52a4b6" />

## A quiet, neutral palette

Limei is emotionally neutral: calm, precise, detached from visual noise, and
timeless. Its muted spectrum balances warm and cool identities without letting
one hue dominate the editor.

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

Limei explicitly maps Neovim's complete standard Tree-sitter capture taxonomy.
Specialized captures retain their actual meaning: paths use navigation, URLs
use information, function-like macros use callable identity, constant macros
and symbols use symbolic identity, checked items use success, and tag
attributes use variable identity. Tree-sitter query-control captures remain
unstyled. Parser-backed tests verify representative captures emitted by
Neovim's Lua, C, and Markdown queries.

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
reuse the same visible color or a perceptually adjacent color. Parameters,
modules, namespaces, operators, punctuation, paths, and metadata stay neutral
or dim.

Code identities and state colors remain distinct from one another. Added
content uses success, changed content uses warning, removed content uses error,
and untracked content stays neutral until its state becomes meaningful.

## Quiet surfaces

Floating windows, completion menus, and plugin popups stay close to the editor
background. Active and inactive splits share one editor background, with focus
communicated by ordinary editor cues. Split separators are subtle
darker-than-background characters. Floats use visible muted neutral borders,
including standard LSP hover documentation.

Critical states use signs, labels, undercurls, icons, or text styles where the
interface supports them, rather than relying on hue alone.

## Quiet structural cues

Limei keeps ordinary line numbers dim so they remain available without
competing with code. The current line number is slightly clearer.

Matching brackets and quotes use Limei's muted warning yellow with bold
emphasis, making the active pair clear without adding a background block.

Active and inactive splits share the same editor background. A foreground-only
black separator provides a subtle boundary between windows.

Whitespace markers use very low-contrast neutral colors. They remain
discoverable when needed without becoming immediate visual noise, while
end-of-buffer markers disappear into the editor background.

## Requirements

- Neovim 0.10+
- A true-color terminal
- No runtime dependencies

## Installation

With lazy.nvim:

```lua
{
  "harunnoir/limei.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("limei").setup()
    vim.cmd.colorscheme("limei")
  end,
}
```

For local development, replace the repository name with:

```lua
dir = "/path/to/limei.nvim"
```

Calling `setup()` is optional:

```vim
:colorscheme limei
```

## Configuration

```lua
require("limei").setup({
  transparent = false,
  terminal_colors = true,
  matching = {
    brackets = true,
    quotes = true,
  },

  styles = {
    comments = { italic = false },
    keywords = { italic = false },
    functions = { bold = false },
    variables = {},
  },

  palette = {},
  highlights = {},
})

vim.cmd.colorscheme("limei")
```

Configuration is reset to defaults on every `setup()` call. Reapply the
colorscheme after changing it.

### Matching pairs

For asymmetric pairs such as parentheses, square brackets, and braces,
Neovim’s built-in matching system emphasizes both endpoints. Limei loads that
runtime matcher when `matching.brackets` is enabled, even when a plugin manager
has omitted it from startup.

For Tree-sitter-aware same-character delimiters, Limei emphasizes the opening
and closing spans of single quotes, double quotes, backticks, and triple quotes.
Unsupported or incomplete syntax is left untouched rather than guessed.
Ordinary cursor movement performs no Tree-sitter query unless the cursor is on
or immediately after a quote-like character.

Matching emphasis uses the muted `warning` foreground with bold text. Limei
adds no background, underline, or undercurl. Disable quote extmarks with
`matching.quotes = false`; disable Limei’s built-in matcher activation with
`matching.brackets = false`.

### Transparency and split presentation

```lua
require("limei").setup({
  transparent = true,
})
```

Transparency removes only editor canvas backgrounds. Popups and menus remain
opaque for readability. Active and inactive editing windows share the same
background; focus remains visible through the cursor, cursor line, current line
number, statusline, and winbar. Split separators use a thin foreground-only line
that is darker than the editor background.

The deprecated `dim_inactive` option is still accepted for compatibility but no
longer changes any highlight.

### Oil directories

Ordinary Oil directory icons and directory names both inherit `Directory`, so
they render as one visual unit. File-type icons retain their useful individual
colors, while Git and diagnostic states may still override the directory color
when communicating a real state.

### Palette overrides

```lua
require("limei").setup({
  palette = {
    bg = "#0e0e0e",
    callable = "#99887b",
  },
})
```

The resolved palette is available through `require("limei").get_palette()`.
Legacy v0.x palette role names remain accepted where practical.

### Highlight overrides

Use a table:

```lua
require("limei").setup({
  highlights = {
    Comment = { fg = "#706c66", italic = true },
  },
})
```

Or a function:

```lua
require("limei").setup({
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
- Telescope, fzf-lua, and fzf-oil
- Oil, Neo-tree, nvim-tree, Yazi, oil-git, and oil-lsp-diagnostics
- Gitsigns, Diffview, Neogit, Gitgraph, and Undotree
- Aerial, nvim-navic, Lspsaga, Fidget, Glance, Trouble, Tiny Inline Diagnostic, symbol-usage, and Quicker
- nvim-dap and nvim-dap-ui
- Neotest, Overseer, and Leetcode
- CodeCompanion
- indent-blankline.nvim and Mini Indentscope, Starter, Hipatterns, and Surround
- render-markdown.nvim 8.13 and CSVView
- Snacks picker, explorer, dashboard, notifier, input, terminal, indent, and diff
- lazy.nvim, Mason, WhichKey, Noice, Notify, lualine, Slimline, Bufferline, Satellite, virt-column.nvim, and ToggleTerm
- Flash, todo-comments, grug-far, Marks, Harpoon, Yanky, hardtime, Haunt, and nvim-ufo

Plugins without dedicated highlight groups inherit standard editor, syntax,
diagnostic, diff, popup, and floating-window groups. No plugin is required at
theme load time. Support claims are limited to groups verified against the
locally installed plugin versions.

## Development

```sh
make format
make check
make test
make specimen
```

`make check` runs StyLua and the palette/semantic audit. `make test` loads the
theme headlessly in default, transparent, override, and reload configurations.
`make specimen` opens a deterministic visual reference containing the neutral
hierarchy, semantic identities, states, surfaces, and interaction highlights.
See `:help limei.nvim` for concise in-editor documentation.

## Design lineage

The grayscale-first restraint is inspired by
[nendix/zen.nvim](https://github.com/nendix/zen.nvim), while the pigment
relationships take broad inspiration from Gruvbox. The palette,
implementation, semantic model, and integrations are original to `limei.nvim`.
