# limei.nvim

`limei.nvim` is a deeply dark, muted Neovim colorscheme designed for long
programming sessions. Its first impression is a quiet charcoal workspace:
neutral UI and readable text first, then balanced semantic color.

Long-session comfort is the deciding constraint. Limei avoids bright surfaces,
pure-white text, neon accents, decorative color, and screenshot-driven
contrast. Important code categories remain recognizable without turning the
editor into rainbow syntax. A controlled layer of pearl-like callable text
keeps normal code crisp without making the screen white-heavy.

<img width="1323" height="745" alt="Limei code view" src="https://github.com/user-attachments/assets/52ed072a-5d06-49b6-98f5-bb3d49b5e8fe" />
<img width="1323" height="745" alt="Limei picker view" src="https://github.com/user-attachments/assets/b67890df-cc8d-4493-9a25-5115c38e2013" />
<img width="1323" height="745" alt="Limei explorer view" src="https://github.com/user-attachments/assets/f3aca5f3-14b4-4080-9d8c-1fafef0a1350" />
<img width="1323" height="745" alt="Limei split view" src="https://github.com/user-attachments/assets/3472a270-22c9-479a-811b-7215e156f572" />

## Neutral does not mean blue-free

The original “cold” direction means emotionally neutral, not anti-blue. No hue
is banned and no hue is privileged. Blue, cyan, warm pigments, greens, and
violets all participate at similar visual weight when they improve recognition.
What Limei avoids is assigning one family to many frequent roles until that
family becomes the identity of the whole screen.

The visible target is roughly 55–70% neutral UI and foregrounds, with all
accents sharing the remainder. Balance is judged by screen area, not by counting
palette entries. Secondary structure—parameters, modules, punctuation,
operators, paths, and metadata—therefore remains neutral.

## Raw palette and semantic roles

The raw palette contains pigments and surfaces only. A separate role map assigns
meaning. Palette overrides are resolved first, role overrides second, highlight
groups third, and user highlights last.

| Role | Palette key | Meaning |
| --- | --- | --- |
| `variable` | `coral` | Variables, fields, and properties |
| `callable` | `ivory` | Functions, methods, and calls |
| `keyword` | `lavender` | Keywords, declarations, and control |
| `string` | `sage` | Strings and characters |
| `number` | `amber` | Numbers and quantities |
| `type` | `cyan` | Types, classes, interfaces, and schemas |
| `constant` | `rose` | Constants and immutable symbols |
| `boolean` | `olive` | Booleans and bounded logical states |
| `comment` | `fg_muted` | Readable secondary explanation |
| `error` | `rose` | Errors and destructive states |
| `warning` | `amber` | Warnings and active attention |
| `success` | `sage` | Successful and accepted states |
| `information` | `sky` | References and non-urgent information |
| `hint` | `teal` | Quiet guidance |
| `conflict` | `brick` | Conflicts and interruptions |
| `navigation` | `copper` | Directories, imports, and external targets |
| `transformation` | `violet` | Regex, replacement, and transformation |

The nine high-frequency identities—variables, callables, keywords, strings,
numbers, types, constants, booleans, and comments—resolve to nine different hex
values. Related concepts keep the same identity in syntax, Treesitter, semantic
tokens, completion, LSP symbol views, and plugins.

## Soft-light hierarchy

Limei uses a small amount of pearl, ivory, and silver-like text to create depth
inside a deeply dark editor. Function declarations use `pearl`, function calls
and the shared callable role use `ivory`, and built-in functions use `silver`.
They remain one warm-neutral identity family while differing gently in
lightness.

The light hierarchy is also available to focused titles, the current line
number, active signatures, headings, and selected completion text. It is never
used for comments, ordinary variables, punctuation, operators, indentation,
borders, inactive metadata, or large surfaces.

The audit limits near-white to one of the nine high-frequency semantic roles,
at most 20% of explicit foreground definitions, and less than 5% for
`fg_highest`. Pure white and near-white backgrounds are rejected. This restores
code rhythm without glowing text or high-contrast UI.

## Quiet surfaces

The editor uses small background steps around `#101112`. Floats and popup menus
use `#141516`, visible neutral borders, and restrained selection backgrounds.
Snacks, fzf-lua, completion documentation, LSP windows, DAP panels, Noice, and
notifications reuse the same hierarchy rather than inventing brighter panels.

Inactive splits use the darker `#0c0d0e` background while retaining readable
foreground and semantic colors. The `#27282b` separator is a simple neutral line
without a special background. With transparency enabled, editor canvases become
transparent while floats and menus remain opaque.

## Requirements

- Neovim 0.10+
- A true-color terminal
- No runtime dependencies

## Installation

With lazy.nvim:

```lua
{
  "your-name/limei.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("limei").setup()
    vim.cmd.colorscheme("limei")
  end,
}
```

`setup()` is optional:

```vim
:colorscheme limei
```

## Configuration

```lua
require("limei").setup({
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
  roles = {},
  highlights = {},
})

vim.cmd.colorscheme("limei")
```

Each `setup()` call starts from defaults. Reapply the colorscheme afterward.

### Palette and role overrides

```lua
require("limei").setup({
  palette = {
    bg = "#0e0f10",
    ivory = "#c0b9ae",
  },
  roles = {
    callable = "violet", -- palette key
    variable = "#aa8174", -- or #RRGGBB
  },
})
```

Use `require("limei").get_palette()` for raw colors and
`require("limei").get_roles()` for resolved role colors.

### Highlight overrides

```lua
require("limei").setup({
  highlights = {
    Comment = { fg = "#706e69", italic = true },
  },
})
```

The value may also be a function receiving the combined palette and resolved
roles:

```lua
highlights = function(colors)
  return { CursorLineNr = { fg = colors.warning, bold = true } }
end
```

### Transparency and inactive splits

```lua
require("limei").setup({
  transparent = true,
  dim_inactive = true,
})
```

Transparency affects `Normal` and `NormalNC`; floats, menus, and borders remain
readable. `dim_inactive` changes the inactive canvas, statusline, winbar, and
line-number hierarchy without stripping syntax identity.

## Verified plugin support

The installed versions were inspected for actual highlight names. Dedicated
groups cover:

- blink.cmp, blink-cmp-words, and nvim-cmp-compatible completion kinds
- fzf-lua and fzf-oil (through shared fzf-lua and Oil groups)
- Oil, oil-git, and oil-lsp-diagnostics
- Gitsigns, Gitgraph, and Undotree
- Lspsaga, Fidget, Glance, Trouble, Tiny Inline Diagnostic, symbol-usage, and Quicker
- nvim-dap and nvim-dap-ui; language adapters inherit these DAP groups
- Mini Indentscope, Starter, Hipatterns, Surround, AI, and Align
- render-markdown and CSVView
- Snacks picker, explorer, dashboard, notifier, input, terminal, indent, words, and diff
- lazy.nvim, Mason, WhichKey, Noice, Notify, Slimline, Bufferline, Satellite, ToggleTerm, and nvim-ufo
- Overseer, Leetcode, Flash, todo-comments, grug-far, Marks, Harpoon, Yanky, hardtime, and Haunt
- CopilotChat.nvim and copilot.lua groups verified from current upstream documentation

Comment.nvim, conform.nvim, dial.nvim, nvim-lint, smart-splits, treesj,
virt-column, nvim-web-devicons, and plugins without useful dedicated groups
inherit core syntax, diagnostics, diff, float, popup, and icon highlights. No
plugin is required at theme load time. Other uninstalled AI integrations are
not advertised as verified and inherit Markdown, diff, diagnostic, and float
groups safely.

## Full palette

```text
Backgrounds
bg_deep #08090a  bg_inactive #0c0d0e  bg #101112
bg_alt #141516  bg_cursorline #161719  bg_surface #18191b
bg_elevated #1d1e21  bg_overlay #232428  bg_selection #2b2c30
bg_active #303136  bg_popup #141516

Soft-light foregrounds
fg_highest #d2cdc4  fg_bright #c5c0b7  pearl #c1bbb1
ivory #bbb5aa  silver #b4b6b3

Standard foregrounds
fg #b2afa9  fg_soft #9c9993  fg_dim #85827d
fg_muted #686560  fg_subtle #56534f  fg_hidden #3d3b38

Warm
rose #a8797d  brick #a57b74  coral #a77f72  clay #a08472
copper #a68767  amber #a28e67  sand #9d936d

Green and earth
olive #8b916c  fern #849276  moss #7f9278  sage #80947f  mint #7d9386

Cool
teal #79918e  cyan #7e9096  sky #7e8e9a  blue #7e899b  indigo #88859b

Purple and red-purple
lavender #91839a  violet #968196  magenta #9a8290  plum #967d87

UI
border #36383a  border_focus #4a4b4e  separator #27282b
whitespace #343537  indent #27282a  indent_scope #4d4b47
scrollbar #46474a  scrollbar_track #252629
```

## ANSI terminal palette

| Slot | Value | Slot | Value |
| --- | --- | --- | --- |
| 0 black | `#08090a` | 8 bright black | `#3d3b38` |
| 1 red | `#a8797d` | 9 bright red | `#a77f72` |
| 2 green | `#7f9278` | 10 bright green | `#80947f` |
| 3 yellow | `#a28e67` | 11 bright yellow | `#9d936d` |
| 4 blue | `#7e899b` | 12 bright blue | `#7e8e9a` |
| 5 magenta | `#91839a` | 13 bright magenta | `#9a8290` |
| 6 cyan | `#79918e` | 14 bright cyan | `#7e9096` |
| 7 white | `#b2afa9` | 15 bright white | `#c5c0b7` |

Terminal background is `#101112`, foreground is `#b2afa9`, and Neovim’s
terminal cursor uses the normal foreground identity.

## Development

```sh
make format
make check
make test
```

`make check` runs StyLua and the palette/role audit, including CIE Lab role
distance and soft-light frequency checks. `make test` loads defaults,
transparency, inactive splits, palette/role overrides, plugin modules, twelve
realistic language fixtures, and reload behavior headlessly. To inspect locally
installed plugin highlight definitions:

```sh
nvim --clean --headless -u tests/minimal_init.lua \
  -c "lua dofile('scripts/discover-highlights.lua')" -c "qa!"
```

See `:help limei.nvim` for concise in-editor documentation.
