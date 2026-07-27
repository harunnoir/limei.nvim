local M = {}

function M.get(c, options)
  local styles = options.styles

  return {
    -- Neutral structure and active identity
    ColdText = { fg = c.fg },
    ColdVariable = vim.tbl_extend("force", { fg = c.fg }, styles.variables),
    ColdFunction = vim.tbl_extend("force", { fg = c.fg_bright }, styles.functions),
    ColdMuted = { fg = c.fg_dim },
    ColdPunctuation = { fg = c.fg_muted },
    ColdComment = vim.tbl_extend("force", { fg = c.fg_muted }, styles.comments),
    ColdDocComment = { fg = c.fg_dim },

    -- Language structure, transformation, and navigation
    ColdKeyword = vim.tbl_extend("force", { fg = c.fg_dim }, styles.keywords),
    ColdDeclaration = vim.tbl_extend("force", { fg = c.clay }, styles.keywords),
    ColdControl = { fg = c.fg_dim },
    ColdException = { fg = c.brick },
    ColdReturn = { fg = c.fg_dim },
    ColdImport = { fg = c.ochre },
    ColdRegex = { fg = c.rust },
    ColdSpecial = { fg = c.rust },

    -- Literal content, logic, constants, and types
    ColdString = { fg = c.sage },
    ColdEscape = { fg = c.wheat },
    ColdNumber = { fg = c.amber },
    ColdBoolean = { fg = c.olive },
    ColdConstant = { fg = c.faded_lavender },
    ColdBuiltinConstant = { fg = c.amber },
    ColdType = { fg = c.wheat },
    ColdBuiltinType = { fg = c.ochre },
    ColdClass = { fg = c.clay },
    ColdEnum = { fg = c.olive },
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
