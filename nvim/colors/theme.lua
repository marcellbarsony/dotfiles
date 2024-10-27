-- Colorscheme
-- h: colorscheme

-- Colors {{{
local c = {
  transparent  = 'none',

  bg      = "#000000",
  bg_dark = "#1e2030",
  fg      = "#FFFFFF",
  fg_dark = "#828bb8",

  comment = "#636da6",

  -- Grey {{{
  Grey         = '#808080',
  Grey5        = '#1a1a1a',
  Grey10       = '#262626',
  Grey15       = '#333333',
  Grey20       = '#404040',
  Grey25       = '#4d4d4d',
  Grey30       = '#595959',
  Grey35       = '#666666',
  Grey40       = '#4c4c4c',
  Grey45       = '#7f7f7f',
  Grey50       = '#7f7f7f',
  Grey55       = '#8c8c8c',
  Grey60       = '#999999',
  Grey65       = '#a6a6a6',
  Grey70       = '#b3b3b3',
  Grey75       = '#c0c0c0',
  Grey80       = '#d1d1d1',
  Grey85       = '#e0e0e0',
  Grey90       = '#f5f5f5',
  Grey100      = '#ffffff',
  -- }}}

  -- Red {{{
  Red          = '#FF0000',
  Red2         = '#FF0000',
  Red3         = '#CD0000',
  DarkRed      = '#8B0000',
  IndianRed    = '#CD5C5C',
  IndianRed1   = '#FF6A6A',
  -- }}}

  -- Blue {{{
  blue {
    Blue         = '#0000FF',
    Blue2        = '#007FFF',
    Blue3        = '#66A3FF',
    Blue4        = '#99C2FF',
    NavyBlue     = '#000080',
    CadetBlue    = '#5F9EA0',
    DeepSkyBlue  = '#00BFFF',
    LightSkyBlue = '#87CEFA',
    LightBlue    = '#ADD8E6',
    SteelBlue    = '#4682B4',
    DodgerBlue   = '#1C86EE',
    RoyalBlue    = '#4169E1',
    SlateBlue    = '#6A5ACD',
  },
  -- }}}

  cyan = "#86e1fc",
  dark3 = "#545c7e",
  dark5 = "#737aa2",
  green = "#c3e88d",
  green1 = "#4fd6be",
  green2 = "#41a6b5",
  magenta = "#c099ff",
  magenta2 = "#ff007c",
  orange = "#ff966c",
  purple = "#fca7ea",
  red = "#ff757f",
  red1 = "#c53b53",
  teal = "#4fd6be",
  yellow = "#ffc777",

  git = {
    add    = "#b8db87",
    change = "#7ca1f2",
    delete = "#e26a75",
  },
}
-- }}}

local function set_groups()
  local groups = {
    -- BASE {{{
    -- Normal
    Normal                      = { fg = c.fg, bg = opts.transparent and c.none or c.bg }, -- normal text
    NormalNC                    = { fg = c.fg, bg = opts.transparent and c.none or opts.dim_inactive and c.bg_dark or c.bg }, -- normal text in non-current windows
    NormalSB                    = { fg = c.fg_sidebar, bg = c.bg_sidebar }, -- normal text in sidebar
    NormalFloat                 = { fg = c.fg_float, bg = c.bg_float }, -- Normal text in floating windows

    -- Base
    ColorColumn                 = { bg = c.black }, -- columns set with 'colorcolumn'
    Comment                     = { fg = c.comment, style = opts.styles.comments },
    Conceal                     = { fg = c.dark5 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Directory                   = { fg = c.blue }, -- directory names (and other special names in listings)
    EndOfBuffer                 = { fg = c.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    MatchParen                  = { fg = c.orange, bold = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg                     = { fg = c.fg_dark, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MoreMsg                     = { fg = c.blue }, -- |more-prompt|
    MsgArea                     = { fg = c.fg_dark }, -- Area for messages and cmdline
    NonText                     = { fg = c.dark3 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Question                    = { fg = c.blue }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine                = { bg = c.bg_visual, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    SpecialKey                  = { fg = c.dark3 }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    Title                       = { fg = c.blue, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
    VertSplit                   = { fg = c.border }, -- the column separating vertically split windows
    Whitespace                  = { fg = c.fg_gutter }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WinSeparator                = { fg = c.border, bold = true }, -- the column separating vertically split windows
    WildMenu                    = { bg = c.bg_visual }, -- current match in 'wildmenu' completion

    -- Cursor
    Cursor                      = { fg = c.bg, bg = c.fg }, -- character under the cursor
    lCursor                     = { fg = c.bg, bg = c.fg }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM                    = { fg = c.bg, bg = c.fg }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn                = { bg = c.bg_highlight }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine                  = { bg = c.bg_highlight }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorLineNr                = { fg = c.orange, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.

    -- Diagnostics
    DiagnosticError             = { fg = c.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn              = { fg = c.warning }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo              = { fg = c.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint              = { fg = c.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticUnnecessary       = { fg = c.terminal_black }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticVirtualTextError  = { bg = Util.blend_bg(c.error, 0.1), fg = c.error }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn   = { bg = Util.blend_bg(c.warning, 0.1), fg = c.warning }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo   = { bg = Util.blend_bg(c.info, 0.1), fg = c.info }, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint   = { bg = Util.blend_bg(c.hint, 0.1), fg = c.hint }, -- Used for "Hint" diagnostic virtual text
    DiagnosticUnderlineError    = { undercurl = true, sp = c.error }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn     = { undercurl = true, sp = c.warning }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo     = { undercurl = true, sp = c.info }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint     = { undercurl = true, sp = c.hint }, -- Used to underline "Hint" diagnostics

    -- Diff
    DiffAdd                     = { bg = c.diff.add }, -- diff mode: Added line |diff.txt|
    DiffChange                  = { bg = c.diff.change }, -- diff mode: Changed line |diff.txt|
    DiffDelete                  = { bg = c.diff.delete }, -- diff mode: Deleted line |diff.txt|
    DiffText                    = { bg = c.diff.text }, -- diff mode: Changed text within a changed line |diff.txt|

    -- Error & Warning
    ErrorMsg                    = { fg = c.error }, -- error messages on the command line
    WarningMsg                  = { fg = c.warning }, -- warning messages

    -- Float
    FloatBorder                 = { fg = c.border_highlight, bg = c.bg_float },
    FloatTitle                  = { fg = c.border_highlight, bg = c.bg_float },

    -- Fold
    Folded                      = { fg = c.blue, bg = c.fg_gutter }, -- line used for closed folds
    FoldColumn                  = { bg = opts.transparent and c.none or c.bg, fg = c.comment }, -- 'foldcolumn'

    -- Health
    healthError                 = { fg = c.error },
    healthSuccess               = { fg = c.green1 },
    healthWarning               = { fg = c.warning },

    -- Line number
    LineNr                      = { fg = c.fg_gutter }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove                 = { fg = c.fg_gutter },
    LineNrBelow                 = { fg = c.fg_gutter },

    -- LSP
    LspReferenceText            = { bg = c.fg_gutter }, -- used for highlighting "text" references
    LspReferenceRead            = { bg = c.fg_gutter }, -- used for highlighting "read" references
    LspReferenceWrite           = { bg = c.fg_gutter }, -- used for highlighting "write" references
    LspSignatureActiveParameter = { bg = Util.blend_bg(c.bg_visual, 0.4), bold = true },
    LspCodeLens                 = { fg = c.comment },
    LspCodeLensSeparator        = { fg = c.blueGray3 }, -- separator between two or more code lens
    LspInlayHint                = { bg = Util.blend_bg(c.blue7, 0.1), fg = c.dark3 },
    LspInfoBorder               = { fg = c.border_highlight, bg = c.bg_float },

    -- Popup menu
    Pmenu                       = { bg = c.bg_popup, fg = c.fg }, -- Popup menu: normal item.
    PmenuMatch                  = { bg = c.bg_popup, fg = c.blue1 }, -- Popup menu: Matched text in normal item.
    PmenuSel                    = { bg = Util.blend_bg(c.fg_gutter, 0.8) }, -- Popup menu: selected item.
    PmenuMatchSel               = { bg = Util.blend_bg(c.fg_gutter, 0.8), fg = c.blue1 }, -- Popup menu: Matched text in selected item.
    PmenuSbar                   = { bg = Util.blend_fg(c.bg_popup, 0.95) }, -- Popup menu: scrollbar.
    PmenuThumb                  = { bg = c.fg_gutter }, -- Popup menu: Thumb of the scrollbar.

    -- Search & Replace
    Search                      = { bg = c.bg_search, fg = c.fg }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch                   = { bg = c.orange, fg = c.black }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CurSearch                   =  "IncSearch",
    Substitute                  = { bg = c.red, fg = c.black }, -- |:substitute| replacement text highlighting

    -- SignColumn
    SignColumn                  = { bg = opts.transparent and c.none or c.bg, fg = c.fg_gutter }, -- column where |signs| are displayed
    SignColumnSB                = { bg = c.bg_sidebar, fg = c.fg_gutter }, -- column where |signs| are displayed

    -- Spell
    SpellBad                    = { sp = c.error, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap                    = { sp = c.warning, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal                  = { sp = c.info, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare                   = { sp = c.hint, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

    -- StatusLine
    StatusLine                  = { fg = c.fg_sidebar, bg = c.bg_statusline }, -- status line of current window
    StatusLineNC                = { fg = c.fg_gutter, bg = c.bg_statusline }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

    -- Syntax
    Bold                        = { bold = true, fg = c.fg }, -- (preferred) any bold text
    Character                   = { fg = c.green }, --  a character constant: 'c', '\n'
    Constant                    = { fg = c.orange }, -- (preferred) any constant
    Debug                       = { fg = c.orange }, --    debugging statements
    Delimiter                   =  "Special", --  character that needs attention
    Error                       = { fg = c.error }, -- (preferred) any erroneous construct
    Function                    = { fg = c.blue, style = opts.styles.functions }, -- function name (also: methods for classes)
    Identifier                  = { fg = c.magenta, style = opts.styles.variables }, -- (preferred) any variable name
    Italic                      = { italic = true, fg = c.fg }, -- (preferred) any italic text
    Keyword                     = { fg = c.cyan, style = opts.styles.keywords }, --  any other keyword
    Operator                    = { fg = c.blue5 }, -- "sizeof", "+", "*", etc.
    PreProc                     = { fg = c.cyan }, -- (preferred) generic Preprocessor
    Special                     = { fg = c.blue1 }, -- (preferred) any special symbol
    Statement                   = { fg = c.magenta }, -- (preferred) any statement
    String                      = { fg = c.green }, --   a string constant: "this is a string"
    Todo                        = { bg = c.yellow, fg = c.bg }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Type                        = { fg = c.blue1 }, -- (preferred) int, long, char, etc.
    Underlined                  = { underline = true }, -- (preferred) text that stands out, HTML links
    debugBreakpoint             = { bg = Util.blend_bg(c.info, 0.1), fg = c.info }, -- used for breakpoint colors in terminal-debug
    debugPC                     = { bg = c.bg_sidebar }, -- used for highlighting the current line in terminal-debug
    dosIniLabel                 = "@property",
    helpCommand                 = { bg = c.terminal_black, fg = c.blue },
    htmlH1                      = { fg = c.magenta, bold = true },
    htmlH2                      = { fg = c.blue, bold = true },
    qfFileName                  = { fg = c.blue },
    qfLineNr                    = { fg = c.dark5 },

    -- TabLine
    TabLine                     = { bg = c.bg_statusline, fg = c.fg_gutter }, -- tab pages line, not active tab page label
    TabLineFill                 = { bg = c.black }, -- tab pages line, where there are no labels
    TabLineSel                  = { fg = c.black, bg = c.blue }, -- tab pages line, active tab page label

    -- Visual
    Visual                      = { bg = c.bg_visual }, -- Visual mode selection
    VisualNOS                   = { bg = c.bg_visual }, -- Visual mode selection when vim is "Not Owning the Selection".

    -- WinBar
    WinBar                      = "StatusLine" , -- window bar
    WinBarNC                    = "StatusLineNC", -- window bar in inactive windows
    -- }}}

    -- LANGUAGES {{{
    -- CSS
    -- cssTSFunction = { fg = p.blueGray1 },
    -- cssTSProperty = { fg = p.blue2 },
    -- cssTSType = { fg = p.teal1 },
    -- cssTSKeyword = { fg = p.blueGray1 },
    -- cssClassName = { fg = p.teal2, style = styles.italic },
    -- cssPseudoClass = { fg = p.blue3, style = styles.italic },
    -- cssDefinition = { fg = p.blue2 },
    -- cssTSError = { link = 'cssClassName' },

    -- TypeScript
    -- ['@keyword.export.typescript'] = { fg = p.teal1 },
    -- ['@keyword.import.typescript'] = { fg = p.teal1 },
    -- ['@import.identifier.typescript'] = { fg = p.blue2 },
    -- typescriptVariable = { fg = p.blue2 },
    -- typescriptExport = { fg = p.teal1 },
    -- typescriptDefault = { fg = p.teal1 },
    -- typescriptConstraint = { fg = p.teal1 },
    -- typescriptBlock = { fg = p.text },
    -- typescriptIdentifierName = { fg = p.blueGray2 },
    -- typescriptTSInclude = { fg = p.teal1 },
    -- typescriptCastKeyword = { fg = p.blueGray2 },
    -- typescriptEnum = { fg = p.blue4 },
    -- typescriptTypeCast = { fg = p.blueGray2 },
    -- typescriptParenExp = { fg = p.blueGray2 },
    -- typescriptObjectType = { fg = p.blueGray1 },
    -- }}}

    -- PLUGINS {{{
    -- gitsigns.nvim {{{
    GitSignsAdd    = { fg = c.git.add }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = c.git.change }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = c.git.delete }, -- diff mode: Deleted line |diff.txt|
    -- }}}

    -- indent-blankline.nvim {{{
    -- IndentBlanklineChar = { fg = p.background1 },
    -- IndentBlanklineContextChar = { fg = p.yellow, gui = 'nocombine' },
    -- IndentBlanklineContextStart = { fg = p.yellow, gui = 'underline' },
    -- IndentBlanklineSpaceChar = { link = 'Whitespace' },
    -- IndentBlanklineSpaceCharBlankline = { link = 'Whitespace' },
    -- }}}

    -- lspsaga.nvim {{{
    TitleString         = { fg = '' },
    TitleIcon           = { fg = '' },
    SagaBorder          = { bg = '', fg = '' },
    SagaNormal          = { bg = '' },
    SagaExpand          = { fg = '' },
    SagaCollapse        = { fg = '' },
    SagaBeacon          = { bg = '' },
    -- Code action
    ActionPreviewNormal = { link = '' },
    ActionPreviewBorder = { link = '' },
    ActionPreviewTitle  = { fg = '', bg = '' },
    CodeActionNormal    = { link = '' },
    CodeActionBorder    = { link = '' },
    CodeActionText      = { fg = '' },
    CodeActionNumber    = { fg = '' },
    -- Finder
    FinderSelection     = { fg = '', bold = true },
    FinderFileName      = { fg = '' },
    FinderCount         = { link = 'Label' },
    FinderIcon          = { fg = '' },
    FinderType          = { fg = '' },
    -- finder spinner
    -- FinderSpinnerTitle = { fg = p.pink3, bold = true },
    -- FinderSpinner = { fg = p.pink3, bold = true },
    -- FinderPreviewSearch = { link = 'Search' },
    -- FinderVirtText = { fg = p.blue1 },
    -- FinderNormal = { link = 'SagaNormal' },
    -- FinderBorder = { link = 'SagaBorder' },
    -- FinderPreviewBorder = { link = 'SagaBorder' },
    -- definition
    -- DefinitionBorder = { link = 'SagaBorder' },
    -- DefinitionNormal = { link = 'SagaNormal' },
    -- DefinitionSearch = { link = 'Search' },
    -- hover
    -- HoverNormal = { link = 'SagaNormal' },
    -- HoverBorder = { link = 'SagaBorder' },
    -- rename
    -- RenameBorder = { link = 'SagaBorder' },
    -- RenameNormal = { fg = p.white, p.background2 },
    -- RenameMatch = { link = 'Search' },
    -- diagnostic
    -- DiagnosticBorder = { link = 'SagaBorder' },
    -- DiagnosticSource = { fg = p.blueGray2 },
    -- DiagnosticNormal = { link = 'SagaNormal' },
    -- DiagnosticErrorBorder = { link = 'DiagnosticError' },
    -- DiagnosticWarnBorder = { link = 'DiagnosticWarn' },
    -- DiagnosticHintBorder = { link = 'DiagnosticHint' },
    -- DiagnosticInfoBorder = { link = 'DiagnosticInfo' },
    -- DiagnosticPos = { fg = p.blueGray2 },
    -- DiagnosticWord = { fg = p.white },
    -- Call Hierachry
    -- CallHierarchyNormal = { link = 'SagaNormal' },
    -- CallHierarchyBorder = { link = 'SagaBorder' },
    -- CallHierarchyIcon = { fg = p.pink2 },
    -- CallHierarchyTitle = { fg = p.pink2 },
    -- lightbulb
    -- LspSagaLightBulb = { link = 'DiagnosticSignHint' },
    -- shadow
    -- SagaShadow = { bg = p.background3 },
    -- Outline
    -- OutlineIndent = { fg = p.blue2 },
    -- OutlinePreviewBorder = { link = 'SagaNormal' },
    -- OutlinePreviewNormal = { link = 'SagaBorder' },
    -- Float term
    -- TerminalBorder = { link = 'SagaBorder' },
    -- TerminalNormal = { link = 'SagaNormal' },
    -- }}}

    -- nvim-cmp {{{
    -- CmpItemAbbr = { fg = p.blueGray2 },
    -- CmpItemAbbrDeprecated = { fg = p.pink3, style = 'strikethrough' },
    -- CmpItemAbbrMatch = { fg = p.text, style = 'bold' },
    -- CmpItemAbbrMatchFuzzy = { fg = p.teal1, style = 'bold' },
    -- CmpItemKind = { fg = p.blue3 },
    -- CmpItemKindClass = { fg = p.yellow },
    -- CmpItemKindFunction = { fg = p.blue1 },
    -- CmpItemKindInterface = { fg = p.blue2 },
    -- CmpItemKindMethod = { fg = p.pink3 },
    -- CmpItemKindSnippet = { fg = p.blueGray1 },
    -- CmpItemKindVariable = { fg = p.teal1 },
    -- }}}

    -- telescope.nvim {{{
    -- TelescopeMatching = { fg = p.teal1 },
    -- TelescopeNormal = { fg = p.text },
    -- TelescopeSelection = { fg = p.text, bg = p.background1 },
    -- TelescopeTitle = { fg = p.blueGray2 },
    -- TelescopeBorder = { fg = p.background1 },
    -- TelescopePromptBorder = { fg = p.background1 },
    -- TelescopePromptNormal = { fg = p.text },
    -- TelescopePromptPrefix = { fg = p.blueGray2 },
    -- TelescopePreviewTitle = { fg = p.background2, bg = p.teal1 },
    -- TelescopePromptTitle = { fg = p.background2, bg = p.blue1 },
    -- TelescopeResultsDiffAdd = { fg = p.teal1 },
    -- TelescopeResultsDiffChange = { fg = p.yellow },
    -- TelescopeResultsDiffDelete = { fg = p.pink3 },
    -- }}}

    -- tree-sitter {{{
    -- ['@variable'] = { fg = p.text },
    -- -- TSAttribute = {},
    -- -- TSKeywordReturn = { fg = p.teal2 },
    -- ['@boolean'] = { link = 'Boolean' },
    -- -- TSCharacter = { link = 'Character' },
    -- ['@comment'] = { link = 'Comment' },
    -- -- TSConditional = { link = 'Conditional' },
    -- ['@variable.builtin'] = { fg = p.blue2 },
    -- ['@constant.builtin'] = { fg = p.blue2 },
    -- ['@constant.falsy'] = { fg = p.pink3 },
    -- -- TSConstMacro = {},
    -- -- TSConstant = { fg = p.text },
    -- ['@constructor'] = { fg = p.teal1 },
    -- -- TSEmphasis = {},
    -- -- TSError = {},
    -- -- TSException = {},
    -- ['field'] = { fg = p.text },
    -- -- TSFloat = {},
    -- ['@function.builtin'] = { fg = p.blue2 },
    -- -- TSFuncMacro = {},
    -- ['@function'] = { link = 'Function' },
    -- ['@function.call'] = { fg = p.blueGray1 },
    -- TSInclude = { fg = p.blue2 },
    -- ['@keyword'] = { link = 'Keyword' },
    -- ['@keyword.return'] = { fg = p.teal2 },
    -- ['@keyword.function'] = { fg = p.blue2 },
    -- ['@keyword.operator'] = { fg = p.teal1 },
    -- ['@label'] = { fg = p.blue3 },
    -- -- TSLiteral = {},
    -- ['@method'] = { fg = p.teal1 },
    -- -- TSNamespace = {},
    -- -- TSNone = {},
    -- -- TSNumber = { link = 'Number' },
    -- ['@operator'] = { link = 'Operator' },
    -- ['@parameter'] = { fg = p.text },
    -- -- TSParameterReference = {},
    -- ['@property'] = { fg = p.blue2 },
    -- ['@punctuation.delimiter'] = { fg = groups.punctuation },
    -- ['@punctuation.special'] = { fg = groups.punctuation },
    -- ['@punctuation.bracket'] = { fg = p.text },
    -- -- TSRepeat = {},
    -- -- TSStrike = {},
    -- ['@string'] = { link = 'String' },
    -- ['@string.escape'] = { fg = p.pink3 },
    -- -- TSStringRegex = {},
    -- -- TSStringSpecial = { fg = p.teal1 },
    -- -- TSSymbol = {},
    -- ['@tag'] = { fg = p.teal1 },
    -- ['@tag.delimiter'] = { fg = p.text },
    -- ['@tag.attribute'] = { fg = p.blue3, style = styles.italic },
    -- ['@text'] = { fg = p.text },
    -- ['@title'] = { fg = groups.headings.h1, style = 'bold' },
    -- ['@type'] = { link = 'Type' },
    -- ['@type.builtin'] = { link = 'Type' },
    -- TSURI = { fg = groups.link },
    -- -- TSUnderline = {},
    -- }}}

    -- which-key.nvim {{{
    -- WhichKey = { fg = p.text },
    -- WhichKeyGroup = { fg = p.text },
    -- WhichKeySeparator = { fg = p.text },
    -- WhichKeyDesc = { fg = p.text },
    -- WhichKeyFloat = { bg = groups.panel },
    -- WhichKeyValue = { fg = p.text },
    -- }}}
    -- }}}

    -- SYNTAX {{{
    -- Comment = { fg = p.blueGray1 },

    -- Variables
    -- Constant  = { fg = p.text },
    -- String    = { fg = p.teal1 },
    -- Character = { fg = p.pink3 },
    -- Number    = { fg = p.teal1 },
    -- Boolean   = { fg = p.teal1 },
    -- Float     = { fg = p.teal1 },

    -- Statement   = { fg = p.text },      -- (preferred) any statement
    -- Conditional = { fg = p.blueGray1 }, -- if, then, else, endif, switch, etc.
    -- Repeat      = { fg = p.blue3 },     -- for, do, while, etc.
    -- Label       = { fg = p.text },      -- case, default, etc.
    -- Operator    = { fg = p.blue2 },     -- sizeof, +, *, etc.
    -- Keyword     = { fg = p.blue3 },     -- any other keyword
    -- Exception   = { fg = p.blue3 },     -- try, catch, throw

    -- PreProc = { fg = p.text }, -- (preferred) generic Preprocessor
    -- Include = { fg = p.blueGray1 }, --  preprocessor #include
    -- -- Define        = { }, --   preprocessor #define
    -- -- Macro         = { }, --    same as Define
    -- -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

    -- Type = { fg = p.blueGray1 }, -- (preferred) int, long, char, etc.
    -- --[[ Structure = { fg = p.blueGray1 }, --  struct, union, enum, etc. ]]
    -- -- StorageClass  = { }, -- static, register, volatile, etc.
    -- -- Typedef = { fg = p.blueGray1 }, --  A typedef

    -- Special = { fg = p.blueGray2 }, -- (preferred) any special symbol
    -- -- SpecialChar   = { }, --  special character in a constant
    -- Tag = { fg = p.text }, --    you can use CTRL-] on this
    -- Delimiter = { fg = p.blueGray1 }, --  character that needs attention
    -- SpecialComment = { fg = p.blueGray1 }, -- special things inside a comment
    -- -- Debug         = { }, --    debugging statements


    -- Underlined = { style = 'underline' }, -- (preferred) text that stands out, HTML links
    -- Bold = { style = 'bold' },
    -- Italic = { style = 'italic' },

    -- Error = { fg = p.pink3 }, -- (preferred) any erroneous construct
    -- Todo = { bg = p.yellow, fg = p.background3 }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- qfLineNr = { fg = p.blueGray3 },
    -- qfFileName = { fg = p.blueGray2 },

    -- htmlH1 = { fg = p.teal1, style = 'bold' },
    -- htmlH2 = { fg = p.teal1, style = 'bold' },

    -- -- mkdHeading = { fg = c.orange, style = "bold" },
    -- -- mkdCode = { bg = c.terminal_black, fg = c.fg },
    -- mkdCodeDelimiter = { bg = p.background3, fg = p.text },
    -- mkdCodeStart = { fg = p.teal2, style = 'bold' },
    -- mkdCodeEnd = { fg = p.teal2, style = 'bold' },
    -- mkdLink = { fg = p.blue1, style = 'underline' },

    -- MARKDOWN {{{
    -- markdownHeadingDelimiter = { fg = p.blue4, style = 'bold' },
    -- markdownCode = { fg = p.blueGray1 },
    -- markdownCodeBlock = { fg = p.teal2 },
    -- markdownH1 = { fg = p.blue2, style = 'bold' },
    -- markdownH2 = { fg = p.blue2, style = 'bold' },
    -- markdownH3 = { fg = p.blue2, style = 'bold' },
    -- markdownH4 = { fg = p.blue2, style = 'bold' },
    -- markdownLinkText = { fg = p.blue1, style = 'underline' },
    -- }}}
    -- }}}
  }

  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

function colorscheme()
  vim.o.termguicolors = true
  vim.g.colors_name = "mytheme"

  set_groups()
end

colorscheme()
