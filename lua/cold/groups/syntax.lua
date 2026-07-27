local M = {}

function M.get(c, options)
  local styles = options.styles

  return {
    -- Variables and ordinary data
    ColdText = { fg = c.fg },
    ColdVariable = vim.tbl_extend("force", { fg = c.variable }, styles.variables),
    ColdMuted = { fg = c.fg_dim },
    ColdPunctuation = { fg = c.fg_muted },

    -- Functions and callables
    ColdFunction = vim.tbl_extend("force", { fg = c.callable }, styles.functions),

    -- Comments and documentation
    ColdComment = vim.tbl_extend("force", { fg = c.fg_muted }, styles.comments),
    ColdDocComment = { fg = c.fg_dim },

    -- Keywords and language structure
    ColdKeyword = vim.tbl_extend("force", { fg = c.structure }, styles.keywords),
    ColdDeclaration = vim.tbl_extend("force", { fg = c.structure }, styles.keywords),
    ColdControl = { fg = c.structure },
    ColdException = { fg = c.conflict },
    ColdReturn = { fg = c.structure },
    ColdImport = { fg = c.navigation },
    ColdRegex = { fg = c.transform },
    ColdSpecial = { fg = c.transform },

    -- Strings and textual literals
    ColdString = { fg = c.literal },
    ColdEscape = { fg = c.type },

    -- Numbers, logic, and symbolic identity
    ColdNumber = { fg = c.numeric },
    ColdBoolean = { fg = c.logic },
    ColdConstant = { fg = c.symbol },
    ColdBuiltinConstant = { fg = c.symbol },
    ColdEnum = { fg = c.logic },

    -- Types, schemas, and secondary structure
    ColdType = { fg = c.type },
    ColdBuiltinType = { fg = c.type },
    ColdClass = { fg = c.type },
    ColdNamespace = { fg = c.fg_dim },

    -- State and urgency
    ColdError = { fg = c.error },
    ColdWarning = { fg = c.warning },
    ColdInfo = { fg = c.information },
    ColdHint = { fg = c.literal },
    ColdSuccess = { fg = c.success },
    ColdAdded = { fg = c.literal },
    ColdChanged = { fg = c.warning },
    ColdRemoved = { fg = c.error },

    -- Legacy syntax
    Comment = { link = "ColdComment" },
    SpecialComment = { link = "ColdDocComment" },
    Constant = { link = "ColdConstant" },
    String = { link = "ColdString" },
    Character = { link = "ColdString" },
    Number = { link = "ColdNumber" },
    Boolean = { link = "ColdBoolean" },
    Float = { link = "ColdNumber" },
    Identifier = { link = "ColdVariable" },
    Function = { link = "ColdFunction" },
    Statement = { link = "ColdKeyword" },
    Conditional = { link = "ColdControl" },
    Repeat = { link = "ColdControl" },
    Label = { link = "ColdImport" },
    Operator = { link = "ColdMuted" },
    Keyword = { link = "ColdKeyword" },
    Exception = { link = "ColdException" },
    PreProc = { link = "ColdKeyword" },
    Include = { link = "ColdImport" },
    Define = { link = "ColdDeclaration" },
    Macro = { link = "ColdConstant" },
    PreCondit = { link = "ColdKeyword" },
    Type = { link = "ColdType" },
    StorageClass = { link = "ColdMuted" },
    Structure = { link = "ColdClass" },
    Typedef = { link = "ColdType" },
    Special = { link = "ColdSpecial" },
    SpecialChar = { link = "ColdEscape" },
    Tag = { link = "ColdDeclaration" },
    Delimiter = { link = "ColdPunctuation" },
    Debug = { link = "ColdException" },
    Underlined = { fg = c.information, underline = true },
    Ignore = { fg = c.fg_hidden },
    Error = { link = "ColdError" },
    Todo = { fg = c.warning, bold = true },
  }
end

return M
