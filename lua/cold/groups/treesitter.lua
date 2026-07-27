local M = {}

function M.get(c)
  return {
    -- Variables and data
    ["@variable"] = { link = "ColdVariable" },
    ["@variable.builtin"] = { link = "@variable" },
    ["@variable.parameter"] = { link = "ColdMuted" },
    ["@variable.member"] = { link = "@variable" },
    ["@property"] = { link = "@variable" },
    ["@label"] = { link = "ColdMuted" },

    -- Functions and callables
    ["@function"] = { link = "ColdFunction" },
    ["@function.builtin"] = { link = "@function" },
    ["@function.call"] = { link = "@function" },
    ["@function.method"] = { link = "@function" },
    ["@function.method.call"] = { link = "@function" },
    ["@constructor"] = { link = "ColdDeclaration" },

    -- Keywords and structure
    ["@attribute"] = { link = "ColdDeclaration" },
    ["@keyword"] = { link = "ColdKeyword" },
    ["@keyword.function"] = { link = "ColdDeclaration" },
    ["@keyword.modifier"] = { link = "ColdMuted" },
    ["@keyword.operator"] = { link = "@keyword" },
    ["@keyword.return"] = { link = "ColdReturn" },
    ["@keyword.import"] = { link = "ColdImport" },
    ["@keyword.conditional"] = { link = "ColdControl" },
    ["@keyword.repeat"] = { link = "ColdControl" },
    ["@keyword.exception"] = { link = "ColdException" },

    -- Strings and literals
    ["@string"] = { link = "ColdString" },
    ["@string.documentation"] = { link = "ColdDocComment" },
    ["@string.regexp"] = { link = "ColdRegex" },
    ["@string.escape"] = { link = "ColdEscape" },
    ["@character"] = { link = "ColdString" },

    -- Numbers and logic
    ["@boolean"] = { link = "ColdBoolean" },
    ["@number"] = { link = "ColdNumber" },
    ["@number.float"] = { link = "@number" },

    -- Types and schemas
    ["@type"] = { link = "ColdType" },
    ["@type.builtin"] = { link = "ColdBuiltinType" },
    ["@type.definition"] = { link = "@type" },
    ["@type.qualifier"] = { link = "ColdMuted" },

    -- Constants and symbolic values
    ["@constant"] = { link = "ColdConstant" },
    ["@constant.builtin"] = { link = "ColdBuiltinConstant" },

    -- Modules and namespaces
    ["@module"] = { link = "ColdNamespace" },
    ["@module.builtin"] = { link = "@module" },

    -- Operators and punctuation
    ["@operator"] = { link = "ColdMuted" },
    ["@punctuation.delimiter"] = { link = "ColdPunctuation" },
    ["@punctuation.bracket"] = { link = "ColdMuted" },
    ["@punctuation.special"] = { link = "ColdPunctuation" },

    -- Comments and documentation
    ["@comment"] = { link = "ColdComment" },
    ["@comment.documentation"] = { link = "ColdDocComment" },
    ["@comment.error"] = { fg = c.error, bold = true },
    ["@comment.warning"] = { fg = c.warning, bold = true },
    ["@comment.todo"] = { fg = c.warning, bold = true },
    ["@comment.note"] = { fg = c.literal, bold = true },

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
    ["@markup.raw"] = { link = "ColdString" },
    ["@markup.list"] = { link = "ColdPunctuation" },
    ["@markup.quote"] = { link = "ColdMuted" },
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },

    -- Diff
    ["@diff.plus"] = { link = "ColdAdded" },
    ["@diff.minus"] = { link = "ColdRemoved" },
    ["@diff.delta"] = { link = "ColdChanged" },
  }
end

return M
