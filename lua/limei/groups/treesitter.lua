local M = {}

function M.get(c)
  return {
    -- Variables and data
    ["@variable"] = { link = "LimeiVariable" },
    ["@variable.builtin"] = { link = "@variable" },
    ["@variable.parameter"] = { link = "LimeiMuted" },
    ["@variable.member"] = { link = "@variable" },
    ["@property"] = { link = "@variable" },
    ["@label"] = { link = "LimeiMuted" },

    -- Functions and callables
    ["@function"] = { link = "LimeiFunctionDeclaration" },
    ["@function.builtin"] = { link = "LimeiBuiltinFunction" },
    ["@function.call"] = { link = "LimeiFunctionCall" },
    ["@function.method"] = { link = "LimeiFunctionDeclaration" },
    ["@function.method.call"] = { link = "LimeiFunctionCall" },
    ["@constructor"] = { link = "LimeiFunctionDeclaration" },

    -- Keywords and structure
    ["@attribute"] = { link = "LimeiDeclaration" },
    ["@keyword"] = { link = "LimeiKeyword" },
    ["@keyword.function"] = { link = "LimeiDeclaration" },
    ["@keyword.modifier"] = { link = "LimeiMuted" },
    ["@keyword.operator"] = { link = "@keyword" },
    ["@keyword.return"] = { link = "LimeiReturn" },
    ["@keyword.import"] = { link = "LimeiImport" },
    ["@keyword.conditional"] = { link = "LimeiControl" },
    ["@keyword.repeat"] = { link = "LimeiControl" },
    ["@keyword.exception"] = { link = "LimeiException" },

    -- Strings and literals
    ["@string"] = { link = "LimeiString" },
    ["@string.documentation"] = { link = "LimeiDocComment" },
    ["@string.regexp"] = { link = "LimeiRegex" },
    ["@string.escape"] = { link = "LimeiEscape" },
    ["@character"] = { link = "LimeiString" },

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

    -- Modules and namespaces
    ["@module"] = { link = "LimeiNamespace" },
    ["@module.builtin"] = { link = "@module" },

    -- Operators and punctuation
    ["@operator"] = { link = "LimeiMuted" },
    ["@punctuation.delimiter"] = { link = "LimeiPunctuation" },
    ["@punctuation.bracket"] = { link = "LimeiMuted" },
    ["@punctuation.special"] = { link = "LimeiPunctuation" },

    -- Comments and documentation
    ["@comment"] = { link = "LimeiComment" },
    ["@comment.documentation"] = { link = "LimeiDocComment" },
    ["@comment.error"] = { fg = c.error, bold = true },
    ["@comment.warning"] = { fg = c.warning, bold = true },
    ["@comment.todo"] = { fg = c.warning, bold = true },
    ["@comment.note"] = { fg = c.string, bold = true },

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
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },

    -- Diff
    ["@diff.plus"] = { link = "LimeiAdded" },
    ["@diff.minus"] = { link = "LimeiRemoved" },
    ["@diff.delta"] = { link = "LimeiChanged" },
  }
end

return M
