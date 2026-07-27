local M = {}

function M.get(c, options)
  local styles = options.styles

  return {
    -- Variables and ordinary data
    ColdText = { fg = c.fg },
    ColdVariable = vim.tbl_extend("force", { fg = c.variable_color }, styles.variables),
    ColdMuted = { fg = c.fg_dim },
    ColdPunctuation = { fg = c.fg_muted },

    -- Functions and callables
    ColdFunction = vim.tbl_extend("force", { fg = c.function_color }, styles.functions),

    -- Comments and documentation
    ColdComment = vim.tbl_extend("force", { fg = c.fg_muted }, styles.comments),
    ColdDocComment = { fg = c.fg_dim },

    -- Keywords and language structure
    ColdKeyword = vim.tbl_extend("force", { fg = c.keyword_color }, styles.keywords),
    ColdDeclaration = vim.tbl_extend("force", { fg = c.keyword_color }, styles.keywords),
    ColdControl = { fg = c.keyword_color },
    ColdException = { fg = c.brick },
    ColdReturn = { fg = c.keyword_color },
    ColdImport = { fg = c.ochre },
    ColdRegex = { fg = c.rust },
    ColdSpecial = { fg = c.rust },

    -- Strings and textual literals
    ColdString = { fg = c.string_color },
    ColdEscape = { fg = c.type_color },

    -- Numbers, logic, and symbolic identity
    ColdNumber = { fg = c.number_color },
    ColdBoolean = { fg = c.olive },
    ColdConstant = { fg = c.constant_color },
    ColdBuiltinConstant = { fg = c.constant_color },
    ColdEnum = { fg = c.olive },

    -- Types, schemas, and secondary structure
    ColdType = { fg = c.type_color },
    ColdBuiltinType = { fg = c.type_color },
    ColdClass = { fg = c.type_color },
    ColdNamespace = { fg = c.fg_dim },

    -- State and urgency
    ColdError = { fg = c.rose },
    ColdWarning = { fg = c.amber },
    ColdInfo = { fg = c.slate },
    ColdHint = { fg = c.sage },
    ColdSuccess = { fg = c.moss },
    ColdAdded = { fg = c.sage },
    ColdChanged = { fg = c.amber },
    ColdRemoved = { fg = c.rose },

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
    Label = { link = "ColdKeyword" },
    Operator = { link = "ColdMuted" },
    Keyword = { link = "ColdKeyword" },
    Exception = { link = "ColdException" },
    PreProc = { link = "ColdKeyword" },
    Include = { link = "ColdImport" },
    Define = { link = "ColdDeclaration" },
    Macro = { link = "ColdDeclaration" },
    PreCondit = { link = "ColdKeyword" },
    Type = { link = "ColdType" },
    StorageClass = { link = "ColdMuted" },
    Structure = { link = "ColdClass" },
    Typedef = { link = "ColdType" },
    Special = { link = "ColdSpecial" },
    SpecialChar = { link = "ColdEscape" },
    Tag = { link = "ColdKeyword" },
    Delimiter = { link = "ColdPunctuation" },
    Debug = { link = "ColdWarning" },
    Underlined = { fg = c.fg_dim, underline = true },
    Ignore = { link = "ColdPunctuation" },
    Error = { link = "ColdError" },
    Todo = { fg = c.amber, bold = true },
  }
end

return M
