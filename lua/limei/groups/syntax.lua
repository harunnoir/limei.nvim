local M = {}

function M.get(c, options)
  local styles = options.styles

  return {
    -- Variables and ordinary data
    LimeiText = { fg = c.fg },
    LimeiVariable = vim.tbl_extend("force", { fg = c.variable }, styles.variables),
    LimeiMuted = { fg = c.fg_dim },
    LimeiPunctuation = { fg = c.fg_muted },

    -- Functions and callables
    LimeiFunction = vim.tbl_extend("force", { fg = c.callable }, styles.functions),
    LimeiFunctionDeclaration = vim.tbl_extend("force", { fg = c.pearl }, styles.functions),
    LimeiFunctionCall = vim.tbl_extend("force", { fg = c.callable }, styles.functions),
    LimeiBuiltinFunction = vim.tbl_extend("force", { fg = c.silver }, styles.functions),

    -- Comments and documentation
    LimeiComment = vim.tbl_extend("force", { fg = c.comment }, styles.comments),
    LimeiDocComment = { fg = c.fg_dim },

    -- Keywords and language structure
    LimeiKeyword = vim.tbl_extend("force", { fg = c.keyword }, styles.keywords),
    LimeiDeclaration = vim.tbl_extend("force", { fg = c.keyword }, styles.keywords),
    LimeiControl = { fg = c.keyword },
    LimeiException = { fg = c.conflict },
    LimeiReturn = { fg = c.keyword },
    LimeiImport = { fg = c.navigation },
    LimeiRegex = { fg = c.transformation },
    LimeiSpecial = { fg = c.transformation },

    -- Strings and textual literals
    LimeiString = { fg = c.string },
    LimeiEscape = { fg = c.type },

    -- Numbers, logic, and symbolic identity
    LimeiNumber = { fg = c.number },
    LimeiBoolean = { fg = c.boolean },
    LimeiConstant = { fg = c.constant },
    LimeiBuiltinConstant = { fg = c.constant },
    LimeiEnum = { fg = c.boolean },

    -- Types, schemas, and secondary structure
    LimeiType = { fg = c.type },
    LimeiBuiltinType = { fg = c.type },
    LimeiClass = { fg = c.type },
    LimeiNamespace = { fg = c.fg_dim },

    -- State and urgency
    LimeiError = { fg = c.error },
    LimeiWarning = { fg = c.warning },
    LimeiInfo = { fg = c.information },
    LimeiHint = { fg = c.string },
    LimeiSuccess = { fg = c.success },
    LimeiAdded = { fg = c.added },
    LimeiChanged = { fg = c.changed },
    LimeiRemoved = { fg = c.deleted },

    -- Legacy syntax
    Comment = { link = "LimeiComment" },
    SpecialComment = { link = "LimeiDocComment" },
    Constant = { link = "LimeiConstant" },
    String = { link = "LimeiString" },
    Character = { link = "LimeiString" },
    Number = { link = "LimeiNumber" },
    Boolean = { link = "LimeiBoolean" },
    Float = { link = "LimeiNumber" },
    Identifier = { link = "LimeiVariable" },
    Function = { link = "LimeiFunction" },
    Statement = { link = "LimeiKeyword" },
    Conditional = { link = "LimeiControl" },
    Repeat = { link = "LimeiControl" },
    Label = { link = "LimeiImport" },
    Operator = { link = "LimeiMuted" },
    Keyword = { link = "LimeiKeyword" },
    Exception = { link = "LimeiException" },
    PreProc = { link = "LimeiKeyword" },
    Include = { link = "LimeiImport" },
    Define = { link = "LimeiDeclaration" },
    Macro = { link = "LimeiConstant" },
    PreCondit = { link = "LimeiKeyword" },
    Type = { link = "LimeiType" },
    StorageClass = { link = "LimeiMuted" },
    Structure = { link = "LimeiClass" },
    Typedef = { link = "LimeiType" },
    Special = { link = "LimeiSpecial" },
    SpecialChar = { link = "LimeiEscape" },
    Tag = { link = "LimeiDeclaration" },
    Delimiter = { link = "LimeiPunctuation" },
    Debug = { link = "LimeiException" },
    Underlined = { fg = c.information, underline = true },
    Ignore = { fg = c.fg_hidden },
    Error = { link = "LimeiError" },
    Todo = { fg = c.warning, bold = true },
  }
end

return M
