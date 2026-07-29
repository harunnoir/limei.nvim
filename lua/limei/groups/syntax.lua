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

    -- Comments and documentation
    LimeiComment = vim.tbl_extend("force", { fg = c.fg_muted }, styles.comments),
    LimeiDocComment = { fg = c.fg_dim },

    -- Keywords and language structure
    LimeiSignature = { fg = c.conflict },
    LimeiKeyword = vim.tbl_extend("force", { fg = c.structure }, styles.keywords),
    LimeiDeclaration = vim.tbl_extend("force", { fg = c.conflict }, styles.keywords),
    LimeiControl = { fg = c.transform },
    LimeiException = { fg = c.conflict },
    LimeiReturn = { fg = c.structure },
    LimeiImport = { fg = c.navigation },
    LimeiRegex = { fg = c.transform },
    LimeiSpecial = { fg = c.transform },
    LimeiOperator = { fg = c.logic },

    -- Strings and textual literals
    LimeiString = { fg = c.literal },
    LimeiEscape = { fg = c.navigation },

    -- Numbers, logic, and symbolic identity
    LimeiNumber = { fg = c.numeric },
    LimeiBoolean = { fg = c.logic },
    LimeiConstant = { fg = c.symbol },
    LimeiBuiltinConstant = { fg = c.symbol },
    LimeiEnum = { fg = c.logic },

    -- Types, schemas, and secondary structure
    LimeiType = { fg = c.type },
    LimeiBuiltinType = { fg = c.type },
    LimeiClass = { fg = c.type },
    LimeiNamespace = { fg = c.information },

    -- State and urgency
    LimeiError = { fg = c.error },
    LimeiWarning = { fg = c.warning },
    LimeiInfo = { fg = c.information },
    LimeiHint = { fg = c.literal },
    LimeiSuccess = { fg = c.success },
    LimeiAdded = { fg = c.success },
    LimeiChanged = { fg = c.warning },
    LimeiRemoved = { fg = c.error },

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
    Operator = { link = "LimeiOperator" },
    Keyword = { link = "LimeiKeyword" },
    Exception = { link = "LimeiException" },
    -- Keep the broad fallback neutral; language-specific Include, Define,
    -- Macro, and PreCondit groups retain their semantic identities below.
    PreProc = { link = "LimeiMuted" },
    Include = { link = "LimeiImport" },
    Define = { link = "LimeiDeclaration" },
    Macro = { link = "LimeiConstant" },
    PreCondit = { link = "LimeiInfo" },
    Type = { link = "LimeiType" },
    StorageClass = { link = "LimeiMuted" },
    Structure = { link = "LimeiClass" },
    Typedef = { link = "LimeiType" },
    Special = { link = "LimeiSpecial" },
    SpecialChar = { link = "LimeiEscape" },
    Tag = { link = "LimeiKeyword" },
    Delimiter = { link = "LimeiPunctuation" },
    Debug = { link = "LimeiException" },
    Underlined = { fg = c.information, underline = true },
    Ignore = { fg = c.fg_hidden },
    Error = { link = "LimeiError" },
    Todo = { fg = c.warning, bold = true },

    -- Neovim's legacy shell syntax funnels expansions, commands, and control
    -- flow through broad Vim groups. Keep those frequent concepts distinct
    -- when a Bash/POSIX shell Tree-sitter parser is unavailable.
    shShellVariables = { link = "LimeiVariable" },
    shDeref = { link = "LimeiPunctuation" },
    shDerefVar = { link = "LimeiVariable" },
    shDerefSimple = { link = "LimeiVariable" },
    shDerefSpecial = { link = "LimeiConstant" },
    shDerefDelim = { link = "LimeiPunctuation" },
    shPosnParm = { link = "LimeiConstant" },
    bashSpecialVariables = { link = "LimeiConstant" },
    shStatement = { link = "LimeiFunction" },
    bashStatement = { link = "LimeiFunction" },
    shCommandSub = { link = "LimeiFunction" },
    shOption = { link = "LimeiInfo" },
    shQuote = { link = "LimeiStringDelimiter" },
    shEchoDelim = { link = "LimeiPunctuation" },
    shEscape = { link = "LimeiEscape" },
    shCtrlSeq = { link = "LimeiEscape" },
    shSpecialDQ = { link = "LimeiEscape" },
    shSpecialSQ = { link = "LimeiEscape" },
    shStringSpecial = { link = "LimeiEscape" },
    shLoop = { link = "LimeiKeyword" },
    shConditional = { link = "LimeiControl" },
    shTestOpr = { link = "LimeiOperator" },
    shOperator = { link = "LimeiOperator" },
    shCmdSubRegion = { link = "LimeiPunctuation" },
    shArithRegion = { link = "LimeiPunctuation" },
  }
end

return M
