-- Colorscheme
-- `:h colorscheme`

local c = dofile(os.getenv("HOME") .. "/.cache/matugen/colors.lua")

local theme = {}

function theme.setup()
  vim.o.termguicolors = true
  vim.g.colors_name = "theme"

  local groups = {
    -- Base {{{

    -- Cursor {{{
    Cursor       = { fg = c.bg, bg = c.fg   },  -- Character under cursor
    lCursor      = { fg = c.bg, bg = c.fg   },  -- Character under cursor when |language-mapping| is used (`:h guicursor`)
    CursorIM     = { fg = c.bg, bg = c.fg   },  -- Cursor, but used in IME mode |CursorIM|
    CursorColumn = { bg = c.bg              },  -- Cursor screen-column when 'cursorcolumn' is set
    CursorLine   = { bg = c.bg_dark         },  -- Cursor screen-line when 'cursorline' is set
    CursorLineNr = { fg = c.fg, bold = true },  -- LineNr when 'cursorline' or 'relativenumber' is set
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

    Define        = { fg = c.primary },  --   preprocessor #define
    -- Include = { fg = p.blueGray1 }, --  preprocessor #include
    Macro         = { fg = c.primary },  --    same as Define
    -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.
    -- PreProc = { fg = p.text }, -- (preferred) generic Preprocessor
    -- }}}

    -- Diagnostic {{{
    DiagnosticError            = { fg = "#db3b4b"                   },
    DiagnosticWarn             = { fg = "#e0af68"                   },
    DiagnosticWarning          = { link = "DiagnosticWarn"          },
    DiagnosticInfo             = { fg = "#0db9d7"                   },
    DiagnosticInformation      = { link = "DiagnosticInfo"          },
    DiagnosticHint             = { fg = "#1abc9c"                   },
    DiagnosticSignError        = { link = "DiagnosticError"         },
    DiagnosticSignWarn         = { link = "DiagnosticWarn"          },
    DiagnosticSignInfo         = { link = "DiagnosticInfo"          },
    DiagnosticSignHint         = { link = "DiagnosticHint"          },
    DiagnosticUnderlineError   = { link = "DiagnosticError", undercurl = false },
    DiagnosticUnderlineWarn    = { link = "DiagnosticWarn", undercurl = false },
    DiagnosticUnderlineInfo    = { link = "DiagnosticInfo", undercurl = false },
    DiagnosticUnderlineHint    = { link = "DiagnosticHint", undercurl = false },
    -- DiagnosticUnnecessary      = { fg = "#414868"                   },
    -- DiagnosticVirtualTextError = { fg = "#db4b4b", bg = "#2d202a"   },
    -- DiagnosticVirtualTextHint  = { fg = "#1abc9c", bg = "#1a2b32"   },
    -- DiagnosticVirtualTextInfo  = { fg = "#0db9d7", bg = "#192b38"   },
    -- DiagnosticVirtualTextWarn  = { fg = "#e0af68", bg = "#2e2a2d"   },
    -- }}}

    -- Diff {{{
    -- DiffAdd                     = { bg = c.diff.add    }, -- Added line
    -- DiffChange                  = { bg = c.diff.change }, -- Changed line
    -- DiffDelete                  = { bg = c.diff.delete }, -- Deleted line
    -- DiffText                    = { bg = c.diff.text   }, -- Changed text within a changed line
    -- }}}

    -- Error & Warning {{{
    -- Error                       = { fg = c.on_error }, -- (preferred) any erroneous construct
    -- ErrorMsg                    = { fg = c.error }, -- error messages on the command line
    -- WarningMsg                  = { fg = c.warning }, -- warning messages
    -- }}}

    -- Fold {{{
    Folded     = { fg = c.comment, bg = c.transparent },  -- Closed folds
    FoldColumn = { fg = c.comment, bg = c.transparent },  -- `:h foldcolumn`
    -- }}}

    -- Float {{{
    FloatBorder = { fg = c.fg, bg = c.bg },
    FloatTitle  = { fg = c.fg, bg = c.bg },
    -- }}}

    -- Health {{{
    -- healthError                 = { fg = c.error },
    -- healthSuccess               = { fg = c.green1 },
    -- healthWarning               = { fg = c.warning },
    -- }}}

    -- Line number {{{
    LineNr      = { fg = c.fg, bold = true },
    LineNrAbove = { fg = c.fg_dark         },
    LineNrBelow = { fg = c.fg_dark         },
    -- }}}

    -- LSP {{{
    -- LspReferenceText            = { bg = c.fg_gutter }, -- used for highlighting "text" references
    -- LspReferenceRead            = { bg = c.fg_gutter }, -- used for highlighting "read" references
    -- LspReferenceWrite           = { bg = c.fg_gutter }, -- used for highlighting "write" references
    -- LspSignatureActiveParameter = { bg = Util.blend_bg(c.bg_visual, 0.4), bold = true },
    -- LspCodeLens                 = { fg = c.comment },
    -- LspCodeLensSeparator        = { fg = c.blueGray3 }, -- separator between two or more code lens
    LspInlayHint = { fg = c.comment, bg = c.transparent },
    -- LspInfoBorder               = { fg = c.border_highlight, bg = c.bg_float },
    -- }}}

    -- Normal {{{
    Normal      = { fg = c.fg, bg = c.transparent },  -- Normal window
    NormalNC    = { fg = c.fg, bg = c.transparent },  -- Non-current window
    NormalSB    = { fg = c.fg, bg = c.bg          },  -- Sidebar
    NormalFloat = { fg = c.fg, bg = c.bg          },  -- Floating window
    -- }}}

    -- Popup menu {{{
    Pmenu            = { bg = c.bg, fg = c.fg }, -- Popup menu: normal item.
    -- PmenuMatch       = { bg = c.bg_popup, fg = c.blue1 }, -- Popup menu: Matched text in normal item.
    -- PmenuMatchSel    = { bg = Util.blend_bg(c.fg_gutter, 0.8), fg = c.blue1 }, -- Popup menu: Matched text in selected item.
    -- PmenuSbar        = { bg = Util.blend_fg(c.bg_popup, 0.95) }, -- Popup menu: scrollbar.
    -- PmenuSel         = { bg = Util.blend_bg(c.fg_gutter, 0.8) }, -- Popup menu: selected item.
    -- PmenuThumb       = { bg = c.fg_gutter }, -- Popup menu: Thumb of the scrollbar.
    -- }}}

    -- Search & Replace {{{
    Search     = { bg = c.secondary_container, fg = c.fg },
    IncSearch  = { bg = c.primary_container, fg = c.fg   },  -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute = { bg = c.primary_container, fg = c.fg   },  -- `:substitute` replacement text highlighting
    CurSearch  = { link = "IncSearch"                    },
    -- }}}

    -- SignColumn {{{
    -- SignColumn   = { bg = c.transparent and c.none or c.bg, fg = c.fg_gutter }, -- column where |signs| are displayed
    -- SignColumnSB = { bg = c.bg_sidebar, fg = c.fg_gutter }, -- column where |signs| are displayed
    -- }}}

    -- Spell {{{
    -- SpellBad                    = { sp = c.error, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap                    = { sp = c.warning, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal                  = { sp = c.info, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare                   = { sp = c.hint, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    -- }}}

    -- StatusLine {{{
    -- StatusLine                  = { fg = c.fg_sidebar, bg = c.bg_statusline }, -- status line of current window
    -- StatusLineNC                = { fg = c.fg_gutter, bg = c.bg_statusline }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- }}}

    -- TabLine {{{
    -- TabLine                     = { bg = c.bg_statusline, fg = c.fg_gutter }, -- tab pages line, not active tab page label
    -- TabLineFill                 = { bg = c.black }, -- tab pages line, where there are no labels
    -- TabLineSel                  = { fg = c.black, bg = c.blue }, -- tab pages line, active tab page label
    -- }}}

    -- Type {{{
    Type = { fg = c.primary    },  -- (preferred) int, long, char, etc.
    Typedef = { fg = c.primary },  --  A typedef
    -- }}}

    -- Visual {{{
    -- Visual                      = { bg = c.bg_visual }, -- Visual mode selection
    -- VisualNOS                   = { bg = c.bg_visual }, -- Visual mode selection when vim is "Not Owning the Selection".
    -- }}}

    -- WinBar {{{
    -- WinBar                      = "StatusLine" , -- window bar
    -- WinBarNC                    = "StatusLineNC", -- window bar in inactive windows
    -- }}}
    -- }}}

    -- Plugins {{{
    -- Alpha {{{
    -- AlphaButtons     = { fg = c.on_error, bg = c.on_error },  -- !!!
    -- AlphaFooter      = { fg = c.on_error, bg = c.on_error },  -- !!!
    -- AlphaHeader      = { fg = c.on_error, bg = c.on_error },  -- !!!
    -- AlphaHeaderLabel = { fg = c.on_error, bg = c.on_error },  -- !!!
    -- AlphaShortcut    = { fg = c.on_error, bg = c.on_error },  -- !!!
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
    -- Identifier                  = { fg = c.primary }, -- (preferred) any variable name
    -- Italic                      = { italic = true, fg = c.fg }, -- (preferred) any italic text
    -- PreProc                     = { fg = c.cyan }, -- (preferred) generic Preprocessor
    -- Special                     = { fg = c.blue1 }, -- (preferred) any special symbol
    -- Todo                        = { bg = c.yellow, fg = c.bg }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    -- Underlined                  = { underline = true }, -- (preferred) text that stands out, HTML links
    -- debugBreakpoint             = { bg = Util.blend_bg(c.info, 0.1), fg = c.info }, -- used for breakpoint colors in terminal-debug
    -- debugPC                     = { bg = c.bg_sidebar }, -- used for highlighting the current line in terminal-debug
    -- dosIniLabel                 = "@property",
    -- helpCommand                 = { bg = c.terminal_black, fg = c.blue },
    -- htmlH1                      = { fg = c.magenta, bold = true },
    -- htmlH2                      = { fg = c.blue, bold = true },
    -- qfFileName                  = { fg = c.blue },
    -- qfLineNr                    = { fg = c.dark5 },

    -- Syntax Variables {{{
    Boolean   = { fg = c.tertiary },
    Constant  = { fg = c.fg       },
    Character = { fg = c.tertiary },
    Float     = { fg = c.tertiary },
    Function  = { fg = c.primary  },
    Number    = { fg = c.tertiary },
    String    = { fg = c.tertiary },
    Variable  = { fg = c.fg       },
    -- }}}

    -- Syntax Keywords {{{
    Comment        = { fg = c.comment, italic = true },  -- Comments
    Conditional    = { fg = c.inverse_primary        },  -- if, else, endif, then, switch
    Exception      = { fg = c.inverse_primary        },  -- try, catch, throw
    Keyword        = { fg = c.inverse_primary        },  -- Any other keyword
    -- Label       = { fg = p.text                     },  -- case, default
    Operator       = { fg = c.primary                },  -- sizeof, +, *, =, .
    Punctuation    =  { fg = c.fg                    },  -- , / ; / ::
    -- Repeat      = { fg = p.blue3                    },  -- for, do, while, etc.
    -- Statement   = { fg = p.text                     },  -- (preferred) any statement
    -- }}}
    -- }}}

    -- Treesitter {{{
    ["@constructor"]           = { fg = c.fg            },
    ["@function.builtin"]      = { link = "Function"    },
    ["@keyword.function"]      = { link = "Keyword"     },
    ["@keyword.return"]        = { link = "Keyword"     },
    ["@punctuation"]           = { link = "Punctuation" },
    ["@punctuation.bracket"]   = { link = "Punctuation" },
    ["@punctuation.delimiter"] = { link = "Punctuation" },
    ["@variable"]              = { fg = c.fg            },
    ["@variable.builtin"]      = { fg = c.primary       },

    -- Treesitter-Lua {{{
    ["@boolean.lua"]           = { link = "Boolean"  },
    ["@constructor.lua"]       = { fg = c.tertiary   },
    ["@function.lua"]          = { link = "Function" },
    ["@keyword.return.lua"]    = { link = "Keyword"  },
    ["@number.lua"]            = { link = "Number"   },

    ["@lsp.type.function.lua"] = { fg = c.fg },
    ["@lsp.type.property.lua"] = { fg = c.primary },
    -- }}}

    -- Treesitter-Python {{{

    ["@boolean.python"]             = { link = "Boolean"     },
    ["@constant.builtin.python"]    = { link = "Constant"    },
    ["@function.python"]            = { link = "Function"    },
    ["@function.call.python"]       = { fg = c.fg            },
    ["@function.builtin.python"]    = { link = "Function"    },
    ["@keyword.conditional.python"] = { link = "Conditional" },
    ["@keyword.exception.python"]   = { link = "Exception"   },
    ["@keyword.operator.python"]    = { link = "Operator"    },
    ["@module.python"]              = { fg = c.fg            },
    ["@type.python"]                = { link = "Type"        },
    ["@type.builtin.python"]        = { link = "Type"        },
    ["@variable.parameter.python"]  = { link = "Variable"    },
    ["@variable.python"]            = { link = "Variable"    },
    -- }}}

    -- Treesitter-Rust {{{
    ["@character.special.rust"]     = { link = "Operator"    },
    ["@function.call.rust"]         = { link = "Function"    },
    ["@function.macro.rust"]        = { link = "Macro"       },
    ["@keyword.function.rust"]      = { link = "Keyword"     },
    ["@keyword.import.rust"]        = { link = "Keyword"     },
    ["@keyword.modifier.rust"]      = { link = "Keyword"     },
    ["@keyword.rust"]               = { link = "Keyword"     },
    ["@module.rust"]                = { link = "Directory"   },
    ["@number.rust"]                = { link = "Number"      },
    ["@operator.rust"]              = { link = "Operator"    },
    ["@punctuation.delimiter.rust"] = { link = "Punctuation" },
    ["@punctuation.bracket.rust"]   = { link = "Punctuation" },
    ["@punctuation.special.rust"]   = { link = "Punctuation" },
    ["@string.rust"]                = { link = "String"      },
    ["@type.rust"]                  = { link = "Type"        },
    ["@type.builtin.rust"]          = { link = "Type"        },
    ["@type.function.rust"]         = { link = "Function"    },
    ["@variable.rust"]              = { link = "Variable"    },
    ["@variable.parameter.rust"]    = { link = "Variable"    },
    ["@variable.member.rust"]       = { link = "Variable"    },

    -- Rust - LSP
    ["@lsp.type.builtinType.rust"]              = { link = "Type"     },
    ["@lsp.type.decorator.rust"]                = { link = "Type"     },
    ["@lsp.type.formatSpecifier.rust"]          = { link = "String"   },
    ["@lsp.type.keyword.rust"]                  = { link = "Keyword"  },
    ["@lsp.type.macro.rust"]                    = { link = "Macro"    },
    ["@lsp.type.namespace.rust"]                = { link = "Type"     },
    ["@lsp.type.interface.rust"]                = { link = "Type"     },
    ["@lsp.type.enum.rust"]                     = { link = "Type"     },
    ["@lsp.type.enumMember.rust"]               = { link = "Type"     },
    ["@lsp.type.parameter.rust"]                = { link = "Variable" },
    ["@lsp.type.struct.rust"]                   = { link = "Type"     },
    ["@lsp.type.property.rust"]                 = { link = "Variable" },
    ["@lsp.type.variable.rust"]                 = { link = "Variable" },
    ["@lsp.typemod.function.public.rust"]       = { link = "Function" },
    ["@lsp.typemod.function.declaration.rust"]  = { link = "Function" },
    ["@lsp.typemod.macro.defaultLibrary.rust"]  = { link = "Macro"    },
    ["@lsp.typemod.macro.library.rust"]         = { link = "Macro"    },
    ["@lsp.typemod.struct.defaultLibrary.rust"] = { link = "Type"     },
    ["@lsp.typemod.variable.mutable.rust"]      = { link = "Variable" },
    -- }}}
    -- }}}
  }

  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

return theme.setup()
