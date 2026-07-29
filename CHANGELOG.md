# Changelog

## [Unreleased]

### Changed

- Removed visible-line scanning and per-character extmarks for static string
  quote colors. Parsers without stable delimiter captures now keep coherent
  sage strings, while separately captured escapes and special content use the
  canonical navigation role.
- Established locked `#9b7469` as a focused signature accent for selected
  declarations, primary Markdown headings, and compact normal-mode labels,
  supported by clay, orange, taupe, amber, and neutral high-frequency syntax.
- Balanced legacy shell, Tree-sitter, semantic-token, completion, and symbol
  highlights so frequent variables and punctuation remain neutral while
  commands, control flow, built-ins, operators, modules, and attributes retain
  distinct semantic identities.
- Rebalanced canonical color usage without changing the Limei palette.
  Additions, untracked files, hints, and file operations now use success,
  neutral, and transformation roles according to their meaning.
- Gave parser-verified string delimiters a quiet neutral shade distinct from
  their literal contents without adding work to ordinary cursor movement.
- Extended built-in matching to angle brackets while preserving existing
  `matchpairs` entries across repeated colorscheme loads.
- Flattened the core statusline and bundled lualine theme onto the editor
  background for a quieter, more minimal presentation.

### Added

- Completed semantic highlight coverage for render-markdown.nvim 8.13,
  including code borders, nested quotes, links, math, checkbox states, signs,
  indentation, and inline rendering.

## [1.2.0] - 2026-07-29

### Changed

- Linked virt-column.nvim guides to the same quiet black structural highlight
  used by split separators and color columns.
- Updated the README installation example, screenshots, and plugin support list.
- Avoided Tree-sitter work during ordinary cursor movement by checking for a
  quote-like character before querying syntax nodes.
- Changed active bracket and quote pairs from bold-only emphasis to bold muted
  warning-yellow emphasis without a background.
- Completed Gitsigns highlight coverage with semantic colors for combined,
  untracked, cursor-line, preview, virtual-line, and inline-diff states while
  preserving Gitsigns' derived dimming for staged changes.

### Added

- Added semantic highlight support for Telescope, Neo-tree, nvim-tree, Yazi,
  Diffview, Neogit, and Neotest.
- Added a native lualine theme that follows Limei's quiet surface hierarchy and
  semantic mode colors.
- Added semantic highlight support for CodeCompanion, Aerial, nvim-navic, and
  indent-blankline.nvim.
- Added a deterministic visual specimen for reviewing palette identities,
  states, surfaces, and interaction highlights.
- Added audit enforcement against arbitrary non-palette colors and raw hex
  values in highlight modules.
- Added explicit semantic mappings for Neovim's complete standard Tree-sitter
  capture taxonomy, including specialized strings, macros, directives, markup,
  and tags.
- Added parser-backed Lua, C, and Markdown capture tests plus an audit that
  prevents standard Tree-sitter groups from going missing.
- Audited the mappings against nvim-treesitter's shipped query vocabulary,
  kept query-control captures unstyled, and added C parser tests distinguishing
  callable function macros from symbolic constant macros.

## [1.0.5]

### Added

- Added Tree-sitter-aware matching for single quotes, double quotes, backticks, and triple-quoted string delimiters.
- Added bold-only emphasis for both endpoints of same-character delimiter pairs.

### Fixed

- Restored Neovim’s built-in matching-pair runtime when enabled through Limei, including configurations that omit it during startup.
- Ensured both opening and closing brackets receive bold-only emphasis.
- Preserved the original syntax foreground and background of all matched delimiters.
- Prevented escaped quotes, apostrophes in comments, and incomplete strings from being treated as matching boundaries in verified cases.

## [1.0.4]

### Changed

- Reduced the visibility of ordinary whitespace markers.
- Dimmed ordinary line numbers while keeping the current line number gently clearer.
- Changed matching-bracket emphasis to bold-only while preserving existing bracket colors.
- Changed split separators to a foreground-only `#000000` character.
- Continued the conservative semantic color-usage audit.

### Fixed

- Fixed whitespace markers competing visually with normal code.
- Fixed matching brackets receiving unnecessary color and background changes.

## [1.0.1]

### Changed

- Unified Oil directory icons and directory names under the same directory highlight.
- Removed inactive-window background dimming.
- Restored one consistent editor background across active and inactive splits.
- Refined split separators into a simple, subtle line darker than the main background.

### Fixed

- Fixed Oil folder icons and folder names rendering with inconsistent colors.
- Fixed split separators appearing as heavy or excessively dark gaps.

## [1.0.0]

### Added

- Added the first stable release of limei.nvim.
- Added a complete semantic color-language system.
- Added distinct identities for variables, callables, keywords, literals, numbers, types, constants, and logical values.
- Added quiet active, inactive, popup, and floating-window surface hierarchies.
- Added visible neutral floating-window borders and dark inactive splits.
- Added verified support for the visible plugin environment.
- Added palette auditing, headless smoke tests, CI, Vim help documentation, and development commands.

### Changed

- Refined the palette for long-session visual comfort and balanced color frequency.
- Removed remaining blue and cool-color dominance from common structural roles.
- Unified syntax, Treesitter, semantic tokens, completion, LSP, diagnostics, Git, DAP, testing, and plugin states.
- Reduced repetitive color reuse between unrelated high-frequency code categories.
- Darkened popup surfaces and integrated Snacks and other floating interfaces with the editor.
- Changed inactive splits to a slightly darker background by default.
- Changed split separators to a black, unobtrusive gap.
- Simplified and documented the project structure.

### Removed

- Removed contradictory, arbitrary, obsolete, and unused palette definitions.
- Removed duplicated pigment-level mappings from core highlight modules.

## [0.4.0]

### Added

- Added distinct visual identities for major high-frequency code categories.
- Added dedicated semantic colors for variables, functions, keywords, strings, numbers, types, and constants.
- Added consistent callable, data, type, literal, numeric, and symbolic mappings across syntax, Treesitter, semantic tokens, completion, and LSP interfaces.

### Changed

- Reduced repetitive color reuse between unrelated important code elements.
- Refined popup and floating-window backgrounds to remain close to the editor background.
- Darkened inactive splits for clearer focus without high contrast.
- Changed split separators to a fully black, unobtrusive appearance.
- Improved floating-window border consistency, including LSP hover documentation.
- Refined Snacks window surfaces to avoid bright, detached popup backgrounds.
- Preserved muted contrast and long-session visual comfort.

## [0.3.0]

### Added

- Introduced a consistent semantic meaning for every accent color.
- Added a documented color-language system across syntax, diagnostics, Git, LSP, completion, file explorers, DAP, tasks, and plugins.
- Added semantic auditing rules to prevent contradictory color assignments.

### Changed

- Reworked syntax and plugin highlights so colors represent stable concepts rather than decoration.
- Unified success, warning, failure, information, navigation, type, literal, and transformation colors.
- Reduced arbitrary plugin coloring and increased neutral-first highlighting.
- Improved code recognition while preserving low visual noise and long-session comfort.

## [0.2.1]

### Changed

- Refined terminal and file-explorer colors to reduce remaining blue dominance.
- Changed directory colors toward muted ochre and clay.
- Reduced cool-color usage in common structural and plugin highlight groups.
- Improved neutral foreground balance across syntax and UI elements.
- Softened Mini Indentscope and UI neutral colors.
- Preserved restrained cool accents for links and informational states.
- Improved long-session visual comfort and overall palette harmony.
