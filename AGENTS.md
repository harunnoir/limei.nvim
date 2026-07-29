# Limei Agent Guide

This file defines the design and implementation rules for AI agents working on
`limei.nvim`. Read it before changing the palette, highlights, plugin support,
matching behavior, documentation, tests, or audit rules.

## Purpose

Limei is a deeply dark, muted Neovim colorscheme designed for long programming
sessions. It should remain readable and comfortable after many hours without
becoming visually noisy.

The theme is not designed for maximum contrast, rainbow syntax, or screenshot
impact. Its central rule is:

> Use the least visual intervention that still communicates meaning.

Every change should preserve:

- semantic consistency;
- neutral-first presentation;
- restrained contrast;
- clear information hierarchy;
- stable syntax identity;
- integrated editor and plugin surfaces;
- long-session visual comfort.

## Color Is Semantic Language

Do not choose colors because they merely look attractive in isolation. Map the
element to its meaning, frequency, and urgency, then use the corresponding
palette role.

### Code identities

| Role | Meaning | Typical uses |
| --- | --- | --- |
| `variable` | Ordinary contextual data | Variables, fields, properties |
| `callable` | Callable behavior and execution | Functions, methods |
| `structure` | Language grammar and construction | Keywords, declarations, constructors |
| `literal` | Literal textual content | Strings, characters, textual values |
| `numeric` | Numeric quantity | Integers, floats, numeric values |
| `type` | Shape, schema, and data category | Types, classes, interfaces |
| `symbol` | Fixed or symbolic identity | Constants, macros |
| `logic` | Logical state and bounded choice | Booleans, enums, enum members |

These identities must remain recognizable across legacy syntax, Tree-sitter,
semantic tokens, completion menus, symbol lists, LSP interfaces, and plugins.
Related concepts should share an identity. Unrelated high-frequency concepts
should not reuse the same visible color without a semantic reason.

Keep every standard capture listed under Neovim's
`treesitter-highlight-groups` explicitly defined. Do not rely on fallback when
a specialized capture carries distinct meaning, such as paths, URLs, macros,
symbols, checked states, or tag attributes. Update the standard-capture audit
and parser-backed tests when Neovim adds or renames captures.

### State and relationship roles

| Role | Meaning | Typical uses |
| --- | --- | --- |
| `error` | Failure, deletion, destructive state | Errors, deleted content, invalid state |
| `conflict` | Conflict, exception, interruption | Exceptions, merge conflicts, hard difficulty |
| `transform` | Pattern, replacement, transformation | Regex, rename, replacement, moved content |
| `warning` | Attention, warning, active process | Warnings, running tasks, current prompts |
| `success` | Completed success, accepted state | Successful tasks, restored state |
| `information` | Reference, link, non-urgent information | Links, references, informational messages |
| `navigation` | Path, directory, import, external target | Directories, imports, paths |

Do not make every plugin status colorful. Use state colors only when the color
communicates real state.

### Neutral hierarchy

Use neutral foregrounds deliberately:

- `fg_bright`: selected, active, titled, or especially important content;
- `fg`: normal readable content;
- `fg_dim`: secondary information;
- `fg_muted`: metadata, comments, inactive or low-priority information;
- `fg_hidden`: structural furniture that should remain discoverable but quiet.

Use the background hierarchy to separate surfaces gently:

- `bg`: main editor canvas;
- `bg_alt`: cursor lines, previews, code blocks, and subtle local distinction;
- `bg_surface`: statuslines, tabs, and slightly raised surfaces;
- `bg_popup`: floating windows and menus;
- `bg_selection`: selected or referenced content;
- `bg_active`: stronger active emphasis;
- `bg_deep`: recessed or backdrop areas.

Do not introduce a new hex value when an existing semantic or neutral role
expresses the intended meaning. Add a palette role only when a genuinely new,
reusable concept exists.

Pure black is reserved for quiet structural boundaries such as
`WinSeparator`, `ColorColumn`, and `VirtColumn`. Prefer linking those groups to
`WinSeparator` instead of repeating `#000000`.

## Frequency, Contrast, and Comfort

Color intensity must be proportional to information value:

- high-frequency syntax should be muted and comfortable;
- ordinary UI should remain neutral;
- low-information structure should recede;
- rare or urgent states may be brighter or styled more strongly;
- large surfaces should not use loud accent colors;
- popups should feel connected to the editor, not like bright detached cards.

Primary text must remain clearly readable. Major semantic identities should be
distinct but softer than the main foreground. Follow the contrast constraints
encoded in `scripts/audit.lua`.

Avoid blue, cyan, icy, metallic, or cool-color dominance. Restrained cool tones
are acceptable for links, references, and non-urgent information.

Judge a color in context and at realistic frequency. A color suitable for one
diagnostic sign may be exhausting when applied to every variable or an entire
window.

## Styling Rules

Color should not be the only available signal for important state:

- use bold for active labels, signs, titles, and rare emphasis;
- use undercurls for diagnostics without painting the buffer;
- use underline for references or transformation when useful;
- use strikethrough for deprecated content;
- use backgrounds sparingly for selection, active rows, and focused regions.

Preserve existing syntax identity whenever possible. Matching brackets and
quotes are the deliberate exception: they use the muted `warning` foreground
with bold emphasis, but no background, underline, or undercurl.

Whitespace, punctuation, indentation, ordinary line numbers, and metadata
should never compete with code. End-of-buffer markers should disappear into
the editor canvas.

Active and inactive editing windows share the same editor background. Do not
restore inactive-window dimming. Focus should be communicated through ordinary
editor cues such as the cursor, cursor line, current line number, statusline,
and winbar.

Transparent mode removes editor canvas backgrounds only. Popups and menus
remain opaque for readability.

## Adding or Editing Plugin Highlights

Before adding plugin groups:

1. Verify the exact highlight group names against the plugin version in scope.
2. Understand what each group represents in the plugin interface.
3. Map each concept to Limei's existing semantic or neutral vocabulary.
4. Prefer links to core or `Limei*` groups when the meanings are identical.
5. Use explicit foreground/background definitions only when the plugin needs a
   distinct surface or combines highlights in a way that makes links unsuitable.
6. Keep plugin windows consistent with `NormalFloat`, `FloatBorder`, `Pmenu`,
   `CursorLine`, `WinSeparator`, diagnostics, and diff groups.
7. Avoid rainbow icon or column schemes. Repeat restrained neutral roles when
   differentiation has no semantic value.
8. Ensure the plugin remains optional. Highlight modules must contain plain
   tables and must not require or call the plugin at theme load time.

Examples of logical mappings:

- function/method completion kinds -> `callable`;
- class/interface/struct kinds -> `type`;
- variables/fields/properties -> `variable`;
- strings/snippets/text -> `literal`;
- constants/macros -> `symbol`;
- booleans/enums -> `logic`;
- folders and directories -> `navigation`;
- links and references -> `information`;
- added/successful -> `LimeiAdded` or `success`, according to meaning;
- modified/running/warning -> `warning`;
- deleted/failed/invalid -> `LimeiRemoved` or `error`;
- plugin popup surfaces -> core float or popup groups;
- plugin separators and structural columns -> `WinSeparator`.

Do not assign a state role by visual convention alone. For example, something
called "green" in a plugin API is not necessarily success; determine what the
element actually means.

Place new plugin highlights in the closest module under
`lua/limei/groups/plugins/`. Create another focused module only when existing
categories would become unclear. Register new modules in
`lua/limei/groups/plugins/init.lua`.

## Architecture and Overrides

Keep palette definitions centralized in `lua/limei/palette.lua`. New highlight
code should use canonical semantic names, not legacy compatibility aliases.

Core highlight generation order is intentional:

1. editor;
2. syntax;
3. Tree-sitter;
4. semantic tokens;
5. diagnostics;
6. plugins;
7. user overrides.

User highlight overrides must always run last. Configuration must remain safe
to reload, and repeated `:colorscheme limei` calls must be deterministic.

Preserve compatibility aliases and deprecated options unless a deliberate
breaking release removes them. Do not use deprecated names in new code.

## Documentation

When adding verified plugin support:

- add the plugin to the README support list;
- document user-facing configuration or behavior when it is not obvious;
- update `doc/limei.txt` when the public setup API changes;
- add an entry under `[Unreleased]` in `CHANGELOG.md`.

Do not claim support for plugin groups that have not been verified. Keep
documentation focused on behavior and meaning rather than marketing every
individual highlight.

## Verification

Every highlight change must be checked in proportion to its scope.

At minimum, run:

```sh
make check
make test
git diff --check
```

Add or update audit rules when a change represents a lasting design invariant.
Add smoke-test assertions for important resolved Neovim behavior, links,
backgrounds, or attributes. Add focused tests for behavioral features such as
delimiter matching.

For plugin modules, ensure the module returns a non-empty plain highlight table
without requiring the plugin. Test important representative groups rather than
only checking that the module loads.

Before finishing, review the full diff for:

- arbitrary raw hex colors;
- semantic contradictions;
- excessive contrast or color frequency;
- plugin-specific colors that bypass Limei's vocabulary;
- accidental backgrounds on transparent editor surfaces;
- duplicated definitions that should be links;
- documentation claims unsupported by tests or verification;
- regressions to long-session comfort.

If a requested change conflicts with these principles, preserve the user's
explicit intent but point out the tradeoff and implement it in the most
consistent, maintainable way available.
