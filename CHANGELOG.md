# Changelog

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
