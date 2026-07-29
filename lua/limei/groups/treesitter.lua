local M = {}

function M.get(c)
  return {
    -- Variables and data
    ["@variable"] = { link = "LimeiVariable" },
    ["@variable.builtin"] = { link = "LimeiBuiltinConstant" },
    ["@variable.parameter"] = { link = "LimeiMuted" },
    ["@variable.parameter.builtin"] = { link = "@variable.parameter" },
    ["@variable.member"] = { link = "@variable" },
    ["@property"] = { link = "@variable" },
    ["@label"] = { link = "LimeiMuted" },

    -- Functions and callables
    ["@function"] = { link = "LimeiFunction" },
    ["@function.builtin"] = { link = "LimeiInfo" },
    ["@function.call"] = { link = "@function" },
    ["@function.macro"] = { link = "@function" },
    ["@function.method"] = { link = "@function" },
    ["@function.method.call"] = { link = "@function" },
    ["@constructor"] = { link = "LimeiType" },

    -- Keywords and structure
    ["@attribute"] = { link = "LimeiInfo" },
    ["@attribute.builtin"] = { link = "@attribute" },
    ["@keyword"] = { link = "LimeiKeyword" },
    ["@keyword.coroutine"] = { link = "LimeiControl" },
    ["@keyword.function"] = { link = "LimeiDeclaration" },
    ["@keyword.modifier"] = { link = "LimeiMuted" },
    ["@keyword.operator"] = { link = "LimeiOperator" },
    ["@keyword.type"] = { link = "LimeiDeclaration" },
    ["@keyword.return"] = { link = "LimeiReturn" },
    ["@keyword.import"] = { link = "LimeiImport" },
    ["@keyword.conditional"] = { link = "LimeiControl" },
    ["@keyword.conditional.ternary"] = { link = "@keyword.conditional" },
    ["@keyword.repeat"] = { link = "LimeiControl" },
    ["@keyword.debug"] = { fg = c.warning },
    ["@keyword.exception"] = { link = "LimeiException" },
    ["@keyword.directive"] = { link = "LimeiKeyword" },
    ["@keyword.directive.define"] = { link = "LimeiDeclaration" },

    -- Strings and literals
    ["@string"] = { link = "LimeiString" },
    ["@string.documentation"] = { link = "LimeiDocComment" },
    ["@string.regexp"] = { link = "LimeiRegex" },
    ["@string.escape"] = { link = "LimeiEscape" },
    ["@string.special"] = { link = "LimeiString" },
    ["@string.special.symbol"] = { link = "LimeiConstant" },
    ["@string.special.path"] = { link = "LimeiImport" },
    ["@string.special.url"] = { fg = c.information, underline = true },
    ["@character"] = { link = "LimeiString" },
    ["@character.special"] = { link = "LimeiEscape" },

    -- Numbers and logic
    ["@boolean"] = { link = "LimeiBoolean" },
    ["@number"] = { link = "LimeiNumber" },
    ["@number.float"] = { link = "@number" },

    -- Types and schemas
    ["@type"] = { link = "LimeiType" },
    ["@type.builtin"] = { link = "LimeiBuiltinType" },
    ["@type.definition"] = { link = "@type" },
    ["@type.qualifier"] = { link = "LimeiMuted" },

    -- Constants and symbolic values
    ["@constant"] = { link = "LimeiConstant" },
    ["@constant.builtin"] = { link = "LimeiBuiltinConstant" },
    ["@constant.macro"] = { link = "LimeiConstant" },

    -- Modules and namespaces
    ["@module"] = { link = "LimeiNamespace" },
    ["@module.builtin"] = { link = "@module" },

    -- Operators and punctuation
    ["@operator"] = { link = "LimeiOperator" },
    ["@punctuation"] = { link = "LimeiPunctuation" },
    ["@punctuation.delimiter"] = { link = "LimeiPunctuation" },
    ["@punctuation.bracket"] = { link = "LimeiMuted" },
    ["@punctuation.special"] = { link = "LimeiOperator" },

    -- Comments and documentation
    ["@comment"] = { link = "LimeiComment" },
    ["@comment.documentation"] = { link = "LimeiDocComment" },
    ["@comment.error"] = { fg = c.error, bold = true },
    ["@comment.warning"] = { fg = c.warning, bold = true },
    ["@comment.todo"] = { fg = c.warning, bold = true },
    ["@comment.note"] = { fg = c.information, bold = true },

    -- Markup
    ["@markup.heading"] = { link = "Title" },
    ["@markup.heading.1"] = { link = "@markup.heading" },
    ["@markup.heading.2"] = { link = "@markup.heading" },
    ["@markup.heading.3"] = { link = "@markup.heading" },
    ["@markup.heading.4"] = { link = "@markup.heading" },
    ["@markup.heading.5"] = { link = "@markup.heading" },
    ["@markup.heading.6"] = { link = "@markup.heading" },
    ["@markup.link"] = { fg = c.information },
    ["@markup.link.url"] = { fg = c.information, underline = true },
    ["@markup.raw"] = { link = "LimeiString" },
    ["@markup.list"] = { link = "LimeiPunctuation" },
    ["@markup.quote"] = { link = "LimeiMuted" },
    ["@markup.math"] = { link = "LimeiNumber" },
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.link.label"] = { fg = c.information },
    ["@markup.raw.block"] = { link = "@markup.raw" },
    ["@markup.list.checked"] = { fg = c.success },
    ["@markup.list.unchecked"] = { fg = c.warning },

    -- Diff
    ["@diff.plus"] = { link = "LimeiAdded" },
    ["@diff.minus"] = { link = "LimeiRemoved" },
    ["@diff.delta"] = { link = "LimeiChanged" },

    -- Tags
    ["@tag"] = { link = "LimeiDeclaration" },
    ["@tag.builtin"] = { link = "@tag" },
    ["@tag.attribute"] = { link = "LimeiInfo" },
    ["@tag.delimiter"] = { link = "LimeiPunctuation" },

    -- Query controls intentionally carry no visual styling.
    ["@none"] = {},
    ["@conceal"] = {},
    ["@spell"] = {},
    ["@nospell"] = {},
  }
end

return M
