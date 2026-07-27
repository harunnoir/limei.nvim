local M = {}

function M.get(c)
  return {
    ["@lsp.type.namespace"] = { link = "ColdNamespace" },
    ["@lsp.type.type"] = { link = "ColdType" },
    ["@lsp.type.class"] = { link = "@lsp.type.type" },
    ["@lsp.type.enum"] = { link = "@lsp.type.type" },
    ["@lsp.type.interface"] = { link = "@lsp.type.type" },
    ["@lsp.type.struct"] = { link = "@lsp.type.type" },
    ["@lsp.type.typeParameter"] = { link = "@lsp.type.type" },
    ["@lsp.type.parameter"] = { link = "ColdVariable" },
    ["@lsp.type.variable"] = { link = "ColdVariable" },
    ["@lsp.type.property"] = { link = "ColdVariable" },
    ["@lsp.type.enumMember"] = { link = "ColdConstant" },
    ["@lsp.type.function"] = { link = "ColdFunction" },
    ["@lsp.type.method"] = { link = "ColdFunction" },
    ["@lsp.type.macro"] = { link = "ColdKeyword" },
    ["@lsp.type.decorator"] = { link = "ColdFunction" },

    -- Modifiers intentionally preserve the base semantic role.
    ["@lsp.mod.defaultLibrary"] = {},
    ["@lsp.mod.readonly"] = {},
    ["@lsp.mod.static"] = {},
    ["@lsp.mod.deprecated"] = { strikethrough = true },

    LspReferenceText = { bg = c.bg_alt },
    LspReferenceRead = { link = "LspReferenceText" },
    LspReferenceWrite = { fg = c.fg_bright, bg = c.bg_alt },
    LspSignatureActiveParameter = { fg = c.fg_bright, bold = true },
    LspCodeLens = { link = "ColdMuted" },
    LspCodeLensSeparator = { link = "ColdPunctuation" },
    LspInlayHint = { fg = c.fg_muted, bg = c.bg_alt },
  }
end

return M
