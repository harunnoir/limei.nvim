local M = {}

function M.get(c)
  return {
    -- Identifiers
    ["@variable"] = { link = "ColdVariable" },
    ["@variable.builtin"] = { link = "@variable" },
    ["@variable.parameter"] = { link = "ColdMuted" },
    ["@variable.member"] = { link = "@variable" },
    ["@property"] = { link = "@variable" },
    ["@constant"] = { link = "ColdConstant" },
    ["@constant.builtin"] = { link = "ColdBuiltinConstant" },
    ["@label"] = { link = "ColdKeyword" },
    ["@module"] = { link = "ColdNamespace" },
    ["@module.builtin"] = { link = "@module" },

    -- Functions
    ["@function"] = { link = "ColdFunction" },
    ["@function.builtin"] = { link = "@function" },
    ["@function.call"] = { link = "@function" },
    ["@function.method"] = { link = "@function" },
    ["@function.method.call"] = { link = "@function" },
    ["@constructor"] = { link = "ColdClass" },

    -- Types and keywords
    ["@type"] = { link = "ColdType" },
    ["@type.builtin"] = { link = "ColdBuiltinType" },
    ["@type.definition"] = { link = "@type" },
    ["@type.qualifier"] = { link = "ColdMuted" },
    ["@attribute"] = { link = "ColdType" },
    ["@keyword"] = { link = "ColdKeyword" },
    ["@keyword.function"] = { link = "@keyword" },
    ["@keyword.modifier"] = { link = "ColdMuted" },
    ["@keyword.operator"] = { link = "@keyword" },
    ["@keyword.return"] = { link = "ColdReturn" },
    ["@keyword.import"] = { link = "ColdImport" },
    ["@keyword.conditional"] = { link = "ColdControl" },
    ["@keyword.repeat"] = { link = "ColdControl" },
    ["@keyword.exception"] = { link = "ColdControl" },
    ["@operator"] = { link = "ColdMuted" },

    -- Literals
    ["@string"] = { link = "ColdString" },
    ["@string.documentation"] = { link = "ColdDocComment" },
    ["@string.regexp"] = { link = "ColdRegex" },
    ["@string.escape"] = { link = "ColdEscape" },
    ["@character"] = { link = "ColdString" },
    ["@boolean"] = { link = "ColdBoolean" },
    ["@number"] = { link = "ColdNumber" },
    ["@number.float"] = { link = "@number" },

    -- Punctuation
    ["@punctuation.delimiter"] = { link = "ColdPunctuation" },
    ["@punctuation.bracket"] = { link = "ColdMuted" },
    ["@punctuation.special"] = { link = "ColdPunctuation" },

    -- Documentation
    ["@comment"] = { link = "ColdComment" },
    ["@comment.documentation"] = { link = "ColdDocComment" },
    ["@comment.error"] = { fg = c.rose, bold = true },
    ["@comment.warning"] = { fg = c.amber, bold = true },
    ["@comment.todo"] = { fg = c.wheat, bold = true },
    ["@comment.note"] = { fg = c.sage, bold = true },

    -- Markup
    ["@markup.heading"] = { link = "Title" },
    ["@markup.heading.1"] = { link = "@markup.heading" },
    ["@markup.heading.2"] = { link = "@markup.heading" },
    ["@markup.heading.3"] = { link = "@markup.heading" },
    ["@markup.heading.4"] = { link = "@markup.heading" },
    ["@markup.heading.5"] = { link = "@markup.heading" },
    ["@markup.heading.6"] = { link = "@markup.heading" },
    ["@markup.link"] = { fg = c.slate },
    ["@markup.link.url"] = { fg = c.slate, underline = true },
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
