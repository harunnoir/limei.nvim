local M = {}

function M.get(c)
  return {
    ["@lsp.type.namespace"] = { link = "ColdNamespace" },
    ["@lsp.type.type"] = { link = "ColdType" },
    ["@lsp.type.class"] = { link = "ColdClass" },
    ["@lsp.type.enum"] = { link = "ColdEnum" },
    ["@lsp.type.interface"] = { link = "@lsp.type.type" },
    ["@lsp.type.struct"] = { link = "ColdClass" },
    ["@lsp.type.typeParameter"] = { link = "ColdMuted" },
    ["@lsp.type.parameter"] = { link = "ColdMuted" },
    ["@lsp.type.variable"] = { link = "ColdVariable" },
    ["@lsp.type.property"] = { link = "ColdVariable" },
    ["@lsp.type.enumMember"] = { link = "ColdEnum" },
    ["@lsp.type.function"] = { link = "ColdFunction" },
    ["@lsp.type.method"] = { link = "ColdFunction" },
    ["@lsp.type.keyword"] = { link = "ColdKeyword" },
    ["@lsp.type.string"] = { link = "ColdString" },
    ["@lsp.type.number"] = { link = "ColdNumber" },
    ["@lsp.type.module"] = { link = "ColdNamespace" },
    ["@lsp.type.macro"] = { link = "ColdConstant" },
    ["@lsp.type.decorator"] = { link = "ColdDeclaration" },

    -- Modifiers intentionally preserve the base semantic role.
    ["@lsp.mod.defaultLibrary"] = {},
    ["@lsp.mod.readonly"] = {},
    ["@lsp.mod.static"] = {},
    ["@lsp.mod.declaration"] = {},
    ["@lsp.mod.definition"] = {},
    ["@lsp.mod.abstract"] = {},
    ["@lsp.mod.async"] = {},
    ["@lsp.mod.modification"] = {},
    ["@lsp.mod.documentation"] = {},
    ["@lsp.mod.deprecated"] = { strikethrough = true },

    LspReferenceText = { bg = c.bg_alt },
    LspReferenceRead = { link = "LspReferenceText" },
    LspReferenceWrite = { bg = c.bg_alt, sp = c.transform, underline = true },
    LspReferenceTarget = { bg = c.bg_selection },
    LspSignatureActiveParameter = { fg = c.callable, underline = true },
    LspCodeLens = { link = "ColdMuted" },
    LspCodeLensSeparator = { link = "ColdPunctuation" },
    LspInlayHint = { fg = c.fg_muted, bg = c.bg_alt },
  }
end

return M
