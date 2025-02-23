-- Colorscheme
-- `:h colorscheme`

local c = dofile(os.getenv("HOME") .. "/.cache/matugen/colors.lua")

local theme = {}

function theme.setup()
  vim.o.termguicolors = true
  vim.g.colors_name = "theme"

  local groups = {
    -- Base {{{

    -- Normal {{{
    Normal      = { fg = c.fg, bg = c.transparent },  -- Normal window
    NormalNC    = { fg = c.fg, bg = c.transparent },  -- Non-current window
    NormalSB    = { fg = c.fg, bg = c.bg          },  -- Sidebar
    NormalFloat = { fg = c.fg, bg = c.bg          },  -- Floating window
    -- }}}

    -- Base {{{
    ColorColumn  = { bg = c.bg                          },  -- Columns set with 'colorcolumn'
    Conceal      = { fg = c.fg                          },  -- placeholder characters substituted for concealed text (see 'conceallevel')
    Directory    = { fg = c.primary                     },  -- Directory names
    EndOfBuffer  = { fg = c.transparent                 },  -- Filler lines (~)
    MatchParen   = { fg = c.orange, bold = true         },  -- Matching parentheses (`:h pi_paren.txt`)
    ModeMsg      = { fg = c.fg_dark, bold = true        },  -- 'showmode' message (e.g. -- INSERT --)
    MoreMsg      = { fg = c.fg                          },  -- |more-prompt|
    MsgArea      = { fg = c.fg                          },  -- Area for messages and cmdline
    NonText      = { fg = c.fg                          },  -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Question     = { fg = c.fg                          },  -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = c.bg, bold = true             },  -- Current |quickfix| item in the quickfix window
    SpecialKey   = { fg = c.bg_dark                     },  -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    Title        = { fg = c.fg, bold = true             },  -- titles for output from ":set all", ":autocmd" etc.
    VertSplit    = { fg = c.fg, bg = c.bg               },  -- the column separating vertically split windows
    Whitespace   = { fg = c.comment                     },  -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WinSeparator = { fg = c.bg_dark, bg = c.transparent },  -- the column separating vertically split windows
    WildMenu     = { bg = c.bg_dark                     },  -- Current match in 'wildmenu' completion
    -- }}}

    -- Diagnostic {{{
    DiagnosticError            = { fg = "#ffffff"                   },
    DiagnosticHint             = { fg = "#1abc9c"                   },
    DiagnosticInfo             = { fg = "#0db9d7"                   },
    DiagnosticInformation      = { fg = "#0db9d7"                   },
    DiagnosticUnderlineError   = { sp = "#db4b4b", undercurl = true },
    DiagnosticUnderlineHint    = { sp = "#1abc9c", undercurl = true },
    DiagnosticUnderlineInfo    = { sp = "#0db9d7", undercurl = true },
    DiagnosticUnderlineWarn    = { sp = "#e0af68", undercurl = true },
    DiagnosticUnnecessary      = { fg = "#414868"                   },
    DiagnosticVirtualTextError = { fg = "#db4b4b", bg = "#2d202a"   },
    DiagnosticVirtualTextHint  = { fg = "#1abc9c", bg = "#1a2b32"   },
    DiagnosticVirtualTextInfo  = { fg = "#0db9d7", bg = "#192b38"   },
    DiagnosticVirtualTextWarn  = { fg = "#e0af68", bg = "#2e2a2d"   },
    DiagnosticWarn             = { fg = "#e0af68"                   },
    DiagnosticWarning          = { fg = "#e0af68"                   },
    -- }}}

    -- Cursor {{{
    Cursor       = { fg = c.bg, bg = c.fg   },  -- Character under cursor
    lCursor      = { fg = c.bg, bg = c.fg   },  -- Character under cursor when |language-mapping| is used (`:h guicursor`)
    CursorIM     = { fg = c.bg, bg = c.fg   },  -- Cursor, but used in IME mode |CursorIM|
    CursorColumn = { bg = c.bg              },  -- Cursor screen-column when 'cursorcolumn' is set
    CursorLine   = { bg = c.bg_dark         },  -- Cursor screen-line when 'cursorline' is set
    CursorLineNr = { fg = c.fg, bold = true },  -- LineNr when 'cursorline' or 'relativenumber' is set
    -- }}}

    -- Fold {{{
    Folded     = { fg = c.comment, bg = c.transparent },  -- Closed folds
    FoldColumn = { fg = c.comment, bg = c.transparent },  -- `:h foldcolumn`
    -- }}}

    -- Float {{{
    FloatBorder = { fg = c.fg, bg = c.bg },
    FloatTitle  = { fg = c.fg, bg = c.bg },
    -- }}}

    -- Line number {{{
    LineNr      = { fg = c.fg, bold = true },
    LineNrAbove = { fg = c.fg_dark         },
    LineNrBelow = { fg = c.fg_dark         },
    -- }}}

    -- Search & Replace {{{
    Search     = { bg = c.secondary_container, fg = c.fg },
    IncSearch  = { bg = c.primary_container, fg = c.fg   },  -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute = { bg = c.primary_container, fg = c.fg   },  -- `:substitute` replacement text highlighting
    CurSearch  = { link = "IncSearch"                    },
    -- }}}

    -- LSP {{{
    LspInlayHint = { fg = c.comment, bg = c.transparent },
    -- }}}

    -- Type {{{
    Type = { fg = c.primary },  -- (preferred) int, long, char, etc.
    -- [[ Structure = { fg = p.blueGray1 },  --  struct, union, enum, etc. ]]
    -- StorageClass  = { },  -- static, register, volatile, etc.
    -- Typedef = { fg = p.blueGray1 },  --  A typedef
    -- }}}
    -- }}}

    -- Plugins {{{
    -- Alpha {{{
    AlphaButtons     = { fg = c.on_error, bg = c.on_error },  -- !!!
    AlphaFooter      = { fg = c.on_error, bg = c.on_error },  -- !!!
    AlphaHeader      = { fg = c.on_error, bg = c.on_error },  -- !!!
    AlphaHeaderLabel = { fg = c.on_error, bg = c.on_error },  -- !!!
    AlphaShortcut    = { fg = c.on_error, bg = c.on_error },  -- !!!
    -- }}}

    -- Cmp {{{
    -- CmpItemAbbr = { fg = p.blueGray2 },
    -- CmpItemAbbrDeprecated = { fg = p.pink3, style = 'strikethrough' },
    CmpItemAbbrMatch      = { fg = c.fg,      bold = true },
    CmpItemAbbrMatchFuzzy = { fg = c.primary, bold = true },
    -- CmpItemKind = { fg = p.blue3 },
    -- CmpItemKindClass = { fg = p.yellow },
    -- CmpItemKindFunction = { fg = p.blue1 },
    -- CmpItemKindInterface = { fg = p.blue2 },
    -- CmpItemKindMethod = { fg = p.pink3 },
    -- CmpItemKindSnippet = { fg = p.blueGray1 },
    CmpItemKindVariable   = { fg = c.primary },
    -- }}}

    -- GitSigns.nvim {{{
    GitSignsAdd              = { fg = "#449dab" },
    GitSignsChange           = { fg = "#6183bb" },
    GitSignsDelete           = { fg = "#914c54" },
    GitSignsCurrentLineBlame = { fg = c.comment },
    -- }}}

    -- Hex.nvim {{{
    -- }}}

    -- Indent-blankline.nvim {{{
    IndentBlanklineChar               = { fg = c.primary },
    IndentBlanklineContextChar        = { fg = c.primary },
    IndentBlanklineContextStart       = { fg = c.primary },
    -- IndentBlanklineSpaceChar          = { link = "Whitespace" },
    -- IndentBlanklineSpaceCharBlankline = { link = "Whitespace" },
    -- }}}

    -- Mason {{{
    -- }}}

    -- Trouble {{{
    TroubleCount            = { fg = c.fg, bg = c.transparent },
    TroubleDiagnosticsCount = { link = "TroubleCount"         },
    TroubleDirectory        = { fg = c.primary                },
    TroubleFilename         = { fg = c.primary                },
    TroubleIconDirectory    = { fg = c.primary                },
    TroubleIndent           = { fg = c.fg                     },
    TroubleIndentFoldClosed = { link = "TroubleIndent"        },
    TroubleIndentFoldOpen   = { link = "TroubleIndent"        },
    TroubleIndentLast       = { link = "TroubleIndent"        },
    TroubleIndentMiddle     = { link = "TroubleIndent"        },
    TroubleIndentTop        = { link = "TroubleIndent"        },
    TroubleIndentWs         = { link = "TroubleIndent"        },
    TroubleNormal           = { fg = c.fg, bg = c.bg          },
    TroublePos              = { fg = c.fg                     },
    TroubleText             = { fg = c.fg                     },
    -- }}}

    -- Which-key.nvim {{{
    WhichKey          = { fg = c.fg      },  -- Keys
    WhichKeyDesc      = { fg = c.fg      },  -- Normal
    WhichKeyGroup     = { fg = c.fg_dark },  -- Groups
    WhichKeyNormal    = { bg = c.bg      },  -- Background
    WhichKeySeparator = { fg = c.comment },  -- Separator
    WhichKeyValue     = { fg = c.fg      },  -- Value
    -- }}}

    -- Telescope.nvim {{{
    TelescopeNormal       = { fg = c.fg,      bg = c.bg     },  -- Normal
    TelescopeBorder       = { fg = c.primary, bg = c.bg     },  -- Border
    TelescopePromptBorder = { link = "TelescopeBorder"      },  -- Prompt Border
    TelescopePromptNormal = { fg = c.fg,      bg = c.bg     },  -- Prompt Normal
    TelescopePromptPrefix = { fg = c.fg                     },  -- Prompt Sign
    TelescopePromptTitle  = { fg = c.primary, bg = c.bg     },  -- Prompt Title
    TelescopePreviewTitle = { link = "TelescopePromptTitle" },  -- Preview
    TelescopeMatching     = { fg = c.primary                },  -- Matching
    TelescopeSelection    = { bg = c.bg_dark                },  -- Selection
    -- TelescopeResultsDiffAdd = { fg = p.teal1 },
    -- TelescopeResultsDiffChange = { fg = p.yellow },
    -- TelescopeResultsDiffDelete = { fg = p.pink3 },
    -- }}}
    -- }}}

    -- Syntax {{{
    -- Syntax
    -- Bold                        = { bold = true, fg = c.fg }, -- (preferred) any bold text
    -- Debug                       = { fg = c.orange }, --    debugging statements
    -- Delimiter                   =  "Special", --  character that needs attention
    -- Error                       = { fg = c.error }, -- (preferred) any erroneous construct
    -- Function                    = { fg = c.blue, style = c.styles.functions }, -- function name (also: methods for classes)
    -- Identifier                  = { fg = c.primary }, -- (preferred) any variable name
    -- Italic                      = { italic = true, fg = c.fg }, -- (preferred) any italic text
    -- PreProc                     = { fg = c.cyan }, -- (preferred) generic Preprocessor
    -- Special                     = { fg = c.blue1 }, -- (preferred) any special symbol
    -- Todo                        = { bg = c.yellow, fg = c.bg }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    -- Type                        = { fg = c.blue1 }, -- (preferred) int, long, char, etc.
    -- Underlined                  = { underline = true }, -- (preferred) text that stands out, HTML links
    -- debugBreakpoint             = { bg = Util.blend_bg(c.info, 0.1), fg = c.info }, -- used for breakpoint colors in terminal-debug
    -- debugPC                     = { bg = c.bg_sidebar }, -- used for highlighting the current line in terminal-debug
    -- dosIniLabel                 = "@property",
    -- helpCommand                 = { bg = c.terminal_black, fg = c.blue },
    -- htmlH1                      = { fg = c.magenta, bold = true },
    -- htmlH2                      = { fg = c.blue, bold = true },
    -- qfFileName                  = { fg = c.blue },
    -- qfLineNr                    = { fg = c.dark5 },
    -- }}}

    -- Syntax Variables {{{
    Boolean   = { fg = c.tertiary },
    -- Constant  = { fg = p.text },
    -- Character = { fg = p.pink3 },
    -- Float     = { fg = c.bg },
    Function  = { fg = c.primary  },
    Number    = { fg = c.tertiary },
    String    = { fg = c.tertiary },
    -- }}}

    -- Syntax Keywords {{{
    Comment        = { fg = c.comment, italic = true },  -- Comments
    -- Conditional = { fg = p.blueGray1 },  -- if, then, else, endif, switch, etc.
    -- Exception   = { fg = p.blue3 },  -- try, catch, throw
    Keyword        = { fg = c.primary },  -- Any other keyword
    -- Label       = { fg = p.text },  -- case, default, etc.
    Operator       = { fg = c.fg },  -- sizeof, +, *, =, etc.
    -- Repeat      = { fg = p.blue3 },  -- for, do, while, etc.
    -- Statement   = { fg = p.text },  -- (preferred) any statement
    -- }}}

    -- Treesitter {{{
    ["@constructor"]           = { fg = c.fg      },
    ["@function.builtin"]      = { fg = c.primary },
    ["@keyword.function"]      = { fg = c.primary },
    ["@keyword.return"]        = { fg = c.primary },
    ["@punctuation.bracket"]   = { fg = c.fg      },
    ["@punctuation.delimiter"] = { fg = c.fg      },
    ["@variable"]              = { fg = c.fg      },
    ["@variable.builtin"]      = { fg = c.primary },
    -- }}}

    -- Treesitter-Lua {{{
    ["@boolean.lua"]           = { link = "Boolean"         },
    ["@constructor.lua"]       = { fg = c.tertiary          },
    ["@function.lua"]          = { fg = c.fg                },
    ["@keyword.return.lua"]    = { link = "@keyword.return" },
    ["@number.lua"]            = { link = "Number"          },

    ["@lsp.type.function.lua"] = { fg = c.fg },
    ["@lsp.type.property.lua"] = { fg = c.primary },
    -- }}}

    -- Treesitter-Python {{{
    ["@boolean.python"]          = { link = "Boolean" },
    ["@variable.python"]         = { fg = c.fg        },
    ["@module.python"]           = { fg = c.fg        },

    ["@function.python"]         = { link = "Function" },
    ["@function.call.python"]    = { fg = c.fg },
    ["@function.builtin.python"] = { link = "@function.builtin" },
    ["@keyword.operator.python"] = { fg = c.tertiary   },
    -- }}}

    -- Treesitter-Rust {{{
    ["@keyword.function.rust"]      = { link = "@keyword.function"      },
    ["@operator.rust"]              = { fg = c.primary                  },
    ["@punctuation.delimiter.rust"] = { link = "@punctuation.delimiter" },
    ["@punctuation.bracket.rust"]   = { link = "@punctuation.bracket"   },
    ["@punctuation.special.rust"]   = { fg = c.primary },
    ["@type.builtin.rust"]          = { link = "Type"                   },
    ["@variable.rust"]              = { fg = c.fg                       },
    ["@variable.member.rust"]       = { link = "@variable.builtin" },

    ["@lsp.type.builtinType.rust"]             = { link = "@type.builtin.rust" },
    ["@lsp.type.interface.rust"]               = { fg = c.fg },
    ["@lsp.type.struct.rust"]                  = { fg = c.fg },
    ["@lsp.type.property.rust"]                = { link =  "@variable.member.rust" },
    ["@lsp.typemod.function.public.rust"]      = { fg = c.primary },
    ["@lsp.typemod.function.declaration.rust"] = { fg = c.primary },
    ["@lsp.typemod.macro.defaultLibrary.rust"] = { fg = c.primary },
    ["@lsp.typemod.macro.library.rust"]        = { fg = c.primary },
    -- }}}
  }

  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

return theme.setup()

-- BASE {{{

-- -- Diff
-- -- DiffAdd                     = { bg = c.diff.add }, -- diff mode: Added line |diff.txt|
-- -- DiffChange                  = { bg = c.diff.change }, -- diff mode: Changed line |diff.txt|
-- -- DiffDelete                  = { bg = c.diff.delete }, -- diff mode: Deleted line |diff.txt|
-- -- DiffText                    = { bg = c.diff.text }, -- diff mode: Changed text within a changed line |diff.txt|
--
-- -- Error & Warning
-- ErrorMsg                    = { fg = c.error }, -- error messages on the command line
-- WarningMsg                  = { fg = c.warning }, -- warning messages



-- -- Health
-- healthError                 = { fg = c.error },
-- healthSuccess               = { fg = c.green1 },
-- healthWarning               = { fg = c.warning },


-- -- LSP
-- LspReferenceText            = { bg = c.fg_gutter }, -- used for highlighting "text" references
-- LspReferenceRead            = { bg = c.fg_gutter }, -- used for highlighting "read" references
-- LspReferenceWrite           = { bg = c.fg_gutter }, -- used for highlighting "write" references
-- -- LspSignatureActiveParameter = { bg = Util.blend_bg(c.bg_visual, 0.4), bold = true },
-- LspCodeLens                 = { fg = c.comment },
-- LspCodeLensSeparator        = { fg = c.blueGray3 }, -- separator between two or more code lens
-- -- LspInlayHint                = { bg = Util.blend_bg(c.blue7, 0.1), fg = c.dark3 },
-- LspInfoBorder               = { fg = c.border_highlight, bg = c.bg_float },

-- -- Popup menu
-- Pmenu                       = { bg = c.bg_popup, fg = c.fg }, -- Popup menu: normal item.
-- PmenuMatch                  = { bg = c.bg_popup, fg = c.blue1 }, -- Popup menu: Matched text in normal item.
-- -- PmenuSel                    = { bg = Util.blend_bg(c.fg_gutter, 0.8) }, -- Popup menu: selected item.
-- -- PmenuMatchSel               = { bg = Util.blend_bg(c.fg_gutter, 0.8), fg = c.blue1 }, -- Popup menu: Matched text in selected item.
-- -- PmenuSbar                   = { bg = Util.blend_fg(c.bg_popup, 0.95) }, -- Popup menu: scrollbar.
-- PmenuThumb                  = { bg = c.fg_gutter }, -- Popup menu: Thumb of the scrollbar.


-- -- SignColumn
-- SignColumn                  = { bg = c.transparent and c.none or c.bg, fg = c.fg_gutter }, -- column where |signs| are displayed
-- SignColumnSB                = { bg = c.bg_sidebar, fg = c.fg_gutter }, -- column where |signs| are displayed

-- -- Spell
-- SpellBad                    = { sp = c.error, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
-- SpellCap                    = { sp = c.warning, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
-- SpellLocal                  = { sp = c.info, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
-- SpellRare                   = { sp = c.hint, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

-- -- StatusLine
-- StatusLine                  = { fg = c.fg_sidebar, bg = c.bg_statusline }, -- status line of current window
-- StatusLineNC                = { fg = c.fg_gutter, bg = c.bg_statusline }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

--
-- -- TabLine
-- TabLine                     = { bg = c.bg_statusline, fg = c.fg_gutter }, -- tab pages line, not active tab page label
-- TabLineFill                 = { bg = c.black }, -- tab pages line, where there are no labels
-- TabLineSel                  = { fg = c.black, bg = c.blue }, -- tab pages line, active tab page label
--
-- -- Visual
-- Visual                      = { bg = c.bg_visual }, -- Visual mode selection
-- VisualNOS                   = { bg = c.bg_visual }, -- Visual mode selection when vim is "Not Owning the Selection".
--
-- -- WinBar
-- WinBar                      = "StatusLine" , -- window bar
-- WinBarNC                    = "StatusLineNC", -- window bar in inactive windows
-- -- }}}

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

-- -- lspsaga.nvim {{{
-- TitleString         = { fg = '' },
-- TitleIcon           = { fg = '' },
-- SagaBorder          = { bg = '', fg = '' },
-- SagaNormal          = { bg = '' },
-- SagaExpand          = { fg = '' },
-- SagaCollapse        = { fg = '' },
-- SagaBeacon          = { bg = '' },
-- -- Code action
-- ActionPreviewNormal = { link = '' },
-- ActionPreviewBorder = { link = '' },
-- ActionPreviewTitle  = { fg = '', bg = '' },
-- CodeActionNormal    = { link = '' },
-- CodeActionBorder    = { link = '' },
-- CodeActionText      = { fg = '' },
-- CodeActionNumber    = { fg = '' },
-- -- Finder
-- FinderSelection     = { fg = '', bold = true },
-- FinderFileName      = { fg = '' },
-- FinderCount         = { link = 'Label' },
-- FinderIcon          = { fg = '' },
-- FinderType          = { fg = '' },
-- -- finder spinner
-- -- FinderSpinnerTitle = { fg = p.pink3, bold = true },
-- -- FinderSpinner = { fg = p.pink3, bold = true },
-- -- FinderPreviewSearch = { link = 'Search' },
-- -- FinderVirtText = { fg = p.blue1 },
-- -- FinderNormal = { link = 'SagaNormal' },
-- -- FinderBorder = { link = 'SagaBorder' },
-- -- FinderPreviewBorder = { link = 'SagaBorder' },
-- -- definition
-- -- DefinitionBorder = { link = 'SagaBorder' },
-- -- DefinitionNormal = { link = 'SagaNormal' },
-- -- DefinitionSearch = { link = 'Search' },
-- -- hover
-- -- HoverNormal = { link = 'SagaNormal' },
-- -- HoverBorder = { link = 'SagaBorder' },
-- -- rename
-- -- RenameBorder = { link = 'SagaBorder' },
-- -- RenameNormal = { fg = p.white, p.background2 },
-- -- RenameMatch = { link = 'Search' },
-- -- diagnostic
-- -- DiagnosticBorder = { link = 'SagaBorder' },
-- -- DiagnosticSource = { fg = p.blueGray2 },
-- -- DiagnosticNormal = { link = 'SagaNormal' },
-- -- DiagnosticErrorBorder = { link = 'DiagnosticError' },
-- -- DiagnosticWarnBorder = { link = 'DiagnosticWarn' },
-- -- DiagnosticHintBorder = { link = 'DiagnosticHint' },
-- -- DiagnosticInfoBorder = { link = 'DiagnosticInfo' },
-- -- DiagnosticPos = { fg = p.blueGray2 },
-- -- DiagnosticWord = { fg = p.white },
-- -- Call Hierachry
-- -- CallHierarchyNormal = { link = 'SagaNormal' },
-- -- CallHierarchyBorder = { link = 'SagaBorder' },
-- -- CallHierarchyIcon = { fg = p.pink2 },
-- -- CallHierarchyTitle = { fg = p.pink2 },
-- -- lightbulb
-- -- LspSagaLightBulb = { link = 'DiagnosticSignHint' },
-- -- shadow
-- -- SagaShadow = { bg = p.background3 },
-- -- Outline
-- -- OutlineIndent = { fg = p.blue2 },
-- -- OutlinePreviewBorder = { link = 'SagaNormal' },
-- -- OutlinePreviewNormal = { link = 'SagaBorder' },
-- -- Float term
-- -- TerminalBorder = { link = 'SagaBorder' },
-- -- TerminalNormal = { link = 'SagaNormal' },
-- -- }}}



-- -- tree-sitter {{{
-- -- -- TSAttribute = {},
-- -- -- TSKeywordReturn = { fg = p.teal2 },
-- -- ['@boolean'] = { link = 'Boolean' },
-- -- -- TSCharacter = { link = 'Character' },
-- -- ['@comment'] = { link = 'Comment' },
-- -- -- TSConditional = { link = 'Conditional' },
-- -- ['@variable.builtin'] = { fg = p.blue2 },
-- -- ['@constant.builtin'] = { fg = p.blue2 },
-- -- ['@constant.falsy'] = { fg = p.pink3 },
-- -- -- TSConstMacro = {},
-- -- -- TSConstant = { fg = p.text },
-- -- ['@constructor'] = { fg = p.teal1 },
-- -- -- TSEmphasis = {},
-- -- -- TSError = {},
-- -- -- TSException = {},
-- -- ['field'] = { fg = p.text },
-- -- -- TSFloat = {},
-- -- ['@function.builtin'] = { fg = p.blue2 },
-- -- -- TSFuncMacro = {},
-- -- ['@function'] = { link = 'Function' },
-- -- ['@function.call'] = { fg = p.blueGray1 },
-- -- TSInclude = { fg = p.blue2 },
-- -- ['@label'] = { fg = p.blue3 },
-- -- -- TSLiteral = {},
-- -- ['@method'] = { fg = p.teal1 },
-- -- -- TSNamespace = {},
-- -- -- TSNone = {},
-- -- -- TSNumber = { link = 'Number' },
-- -- ['@operator'] = { link = 'Operator' },
-- -- ['@parameter'] = { fg = p.text },
-- -- -- TSParameterReference = {},
-- -- ['@property'] = { fg = p.blue2 },
-- -- ['@punctuation.delimiter'] = { fg = groups.punctuation },
-- -- ['@punctuation.special'] = { fg = groups.punctuation },
-- -- ['@punctuation.bracket'] = { fg = p.text },
-- -- -- TSRepeat = {},
-- -- -- TSStrike = {},
-- -- ['@string'] = { link = 'String' },
-- -- ['@string.escape'] = { fg = p.pink3 },
-- -- -- TSStringRegex = {},
-- -- -- TSStringSpecial = { fg = p.teal1 },
-- -- -- TSSymbol = {},
-- -- ['@tag'] = { fg = p.teal1 },
-- -- ['@tag.delimiter'] = { fg = p.text },
-- -- ['@tag.attribute'] = { fg = p.blue3, style = styles.italic },
-- -- ['@text'] = { fg = p.text },
-- -- ['@title'] = { fg = groups.headings.h1, style = 'bold' },
-- -- ['@type'] = { link = 'Type' },
-- -- ['@type.builtin'] = { link = 'Type' },
-- -- TSURI = { fg = groups.link },
-- -- -- TSUnderline = {},
-- -- }}}

-- }}}

-- SYNTAX {{{

-- PreProc = { fg = p.text }, -- (preferred) generic Preprocessor
-- Include = { fg = p.blueGray1 }, --  preprocessor #include
-- -- Define        = { }, --   preprocessor #define
-- -- Macro         = { }, --    same as Define
-- -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.


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
