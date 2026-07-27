# Changelog

## [1.1.1]

### Added

- Added a controlled soft-light foreground hierarchy.
- Added pearl, ivory, silver, and highest-focus foreground colors.
- Added perceptual role-distance and near-white frequency validation.
- Added realistic syntax fixtures for twelve languages and structured formats.

### Changed

- Restored lighter syntax anchors to improve code depth and recognition.
- Refined function declarations, calls, built-ins, active signatures, and completion identities with restrained near-white values.
- Improved contrast rhythm without brightening editor or popup surfaces.
- Preserved balanced full-spectrum semantic colors and long-session comfort.
- Updated role validation, smoke coverage, fixtures, and palette documentation.

### Fixed

- Fixed syntax appearing uniformly dim or visually flat.
- Fixed the absence of lighter textual anchors in normal code.

## [1.1.0]

### Added

- Added a raw-palette and semantic-role separation.
- Added configurable role mappings for major code categories and editor states.
- Added balanced support for the complete color spectrum without banning blue or other hues.
- Added validation for repetitive high-frequency code-role colors and hue-family dominance.
- Added a plugin highlight discovery helper.
- Added the final full palette, role map, and ANSI palette documentation.

### Changed

- Refined color balancing so no hue family dominates the editor.
- Reworked major syntax identities so unrelated high-frequency categories use distinct colors.
- Allowed blue, cyan, teal, violet, and other cool hues to participate normally when logically appropriate.
- Replaced the fully black split separator with a simple low-contrast neutral separator.
- Refined inactive split backgrounds without aggressively dimming their content.
- Kept floating and Snacks windows dark, bordered, and visually integrated.
- Unified syntax, Treesitter, semantic tokens, completion, LSP, diagnostics, Git, testing, and plugin interfaces through the role map.
- Improved long-session visual comfort and maintainability.

### Removed

- Removed hue-ban logic and anti-blue special cases.
- Removed fixed assumptions that specific hues must always represent specific concepts.
- Removed repetitive color assignments between unrelated important code categories.
- Removed the fully black split-separator treatment.

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
