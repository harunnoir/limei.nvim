**Heyyy... Shuush IT’S NIGHT... CODE doesn’t have to be noisy. let’s listen to the rain... drops... and our heartbeats... isn’t it Limei...**

# limei.nvim

`limei.nvim` is a deeply dark, muted Neovim colorscheme designed for long
programming sessions. It combines a neutral `#101010` charcoal canvas, soft
foregrounds, distinct semantic syntax identities, and quiet plugin surfaces.

The goal is not maximum contrast or screenshot impact. The goal is an editor
that remains readable and comfortable after ten hours.

### Editor

<img width="1285" height="696" alt="image" src="https://github.com/user-attachments/assets/d6d3cf38-e484-4784-87b0-ca53fce96198" />

<!--
### Explorer

<img width="1340" height="726" alt="image" src="https://github.com/user-attachments/assets/325867c0-45f1-4666-a4f8-d435ba52a4b6" />
-->
## A quiet, neutral palette

Limei is emotionally neutral: calm, precise, detached from visual noise, and
timeless. It is not dominated by blue, cyan, icy, or metallic color. Cool color
is reserved for occasional links, references, and informational states.

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

## Locked palette

The canonical palette is immutable. Integrations and generated terminal themes
must reuse these roles without modifying, deriving, brightening, or darkening
their values.

### Surfaces and foregrounds

| Role | Value | Role | Value |
| --- | --- | --- | --- |
| `bg_deep` | `#080808` | `bg` | `#101010` |
| `bg_inactive` | `#0c0c0c` | `bg_alt` | `#141414` |
| `bg_surface` | `#171717` | `bg_popup` | `#141414` |
| `bg_selection` | `#292724` | `bg_active` | `#302d29` |
| `fg` | `#ada9a3` | `fg_bright` | `#c0bbb3` |
| `fg_dim` | `#837f78` | `fg_muted` | `#64605a` |
| `fg_hidden` | `#393632` | | |

### Semantic colors

| Role | Value | Role | Value |
| --- | --- | --- | --- |
| `variable` | `#ada9a3` | `callable` | `#9a897c` |
| `structure` | `#9a7869` | `literal` | `#7f8c77` |
| `numeric` | `#a38762` | `type` | `#97916f` |
| `symbol` | `#8d818a` | `logic` | `#898661` |
| `error` | `#9a7477` | `conflict` | `#9b7469` |
| `transform` | `#9c795e` | `warning` | `#a38762` |
| `success` | `#768569` | `information` | `#788184` |
| `navigation` | `#918862` | | |

### Structural colors

| Role | Value | Role | Value |
| --- | --- | --- | --- |
| `border` | `#373330` | `separator` | `#090909` |
| `whitespace` | `#34312f` | `indent` | `#272522` |
| `indent_scope` | `#514940` | | |

Limei explicitly maps Neovim's complete standard Tree-sitter capture taxonomy.
Specialized captures retain their actual meaning: paths use navigation, URLs
use information, function-like macros use callable identity, constant macros
and symbols use symbolic identity, checked items use success, and attributes
use information identity. Tree-sitter query-control captures remain unstyled.
Parser-backed tests verify representative captures emitted by Neovim's Lua, C,
and Markdown queries.

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
reuse the same visible color. Parameters and punctuation stay neutral or dim;
modules and attributes use restrained information, operators use logic, and
paths use navigation.

Neovim's legacy Bash and POSIX shell syntax is normalized when a Tree-sitter
parser is unavailable: ordinary variables remain neutral, expansion punctuation
recedes, commands use callable emphasis, control flow uses transformation,
special variables use symbolic identity, and operators use logic.

Added content uses success, changed content uses warning, removed content uses
error, and untracked content stays neutral until its state becomes meaningful.
These mappings reuse Limei's canonical palette without altering its colors.

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

The statusline and bundled lualine theme use the editor background as well,
keeping mode and section identity in the foreground instead of colored blocks.

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
    string_delimiters = true,
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

For asymmetric pairs such as parentheses, square brackets, braces, and angle
brackets, Neovim’s built-in matching system emphasizes both endpoints. Limei
adds `<:>` to `matchpairs` without replacing existing entries and loads that
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

Ordinary opening and closing string quotes use a secondary neutral foreground,
separating delimiters from literal text without making strings busier. The
parser-aware layer scans visible lines on buffer entry, edits, and scrolling;
ordinary cursor movement performs no work. It ignores apostrophes in comments
and quote-like characters that are not syntax delimiters. Disable it with
`matching.string_delimiters = false`.

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

### Generated terminal themes

Limei ships generated themes for Alacritty, Foot, Ghostty, Kitty, WezTerm, and
Windows Terminal under `extras/`. They use the same palette and ANSI mapping as
Neovim's terminal colors.

After changing `palette.lua`, regenerate every external theme with:

```sh
make extras
```

`make check` fails when a generated theme is stale.

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
