# Changelog

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
