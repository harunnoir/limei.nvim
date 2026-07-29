local M = {}

function M.get(c)
  return {
    ["@lsp.type.namespace"] = { link = "LimeiNamespace" },
    ["@lsp.type.type"] = { link = "LimeiType" },
    ["@lsp.type.class"] = { link = "LimeiClass" },
    ["@lsp.type.enum"] = { link = "LimeiEnum" },
    ["@lsp.type.interface"] = { link = "@lsp.type.type" },
    ["@lsp.type.struct"] = { link = "LimeiClass" },
    ["@lsp.type.typeParameter"] = { link = "LimeiType" },
    ["@lsp.type.parameter"] = { link = "LimeiMuted" },
    ["@lsp.type.variable"] = { link = "LimeiVariable" },
    ["@lsp.type.property"] = { link = "LimeiVariable" },
    ["@lsp.type.enumMember"] = { link = "LimeiEnum" },
    ["@lsp.type.function"] = { link = "LimeiFunction" },
    ["@lsp.type.method"] = { link = "LimeiFunction" },
    ["@lsp.type.keyword"] = { link = "LimeiKeyword" },
    ["@lsp.type.string"] = { link = "LimeiString" },
    ["@lsp.type.number"] = { link = "LimeiNumber" },
    ["@lsp.type.operator"] = { link = "LimeiOperator" },
    ["@lsp.type.module"] = { link = "LimeiNamespace" },
    ["@lsp.type.macro"] = { link = "LimeiConstant" },
    ["@lsp.type.decorator"] = { link = "LimeiInfo" },

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
    LspCodeLens = { link = "LimeiMuted" },
    LspCodeLensSeparator = { link = "LimeiPunctuation" },
    LspInlayHint = { fg = c.fg_muted, bg = c.bg_alt },
  }
end

return M
