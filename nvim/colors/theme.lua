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
    CursorLineNr = { fg = c.inverse_primary, bold = true },  -- LineNr when 'cursorline' or 'relativenumber' is set
    -- }}}

    -- Base {{{
    ColorColumn  = { bg = c.bg                           },  -- Columns set with 'colorcolumn'
    Conceal      = { fg = c.fg                           },  -- placeholder characters substituted for concealed text (see 'conceallevel')
    Directory    = { fg = c.primary                      },  -- Directory names
    EndOfBuffer  = { fg = c.transparent                  },  -- Filler lines (~)
    File         = { fg = c.primary                      },  -- File (custom)
    MatchParen   = { fg = c.orange, bold = true          },  -- Matching parentheses (`:h pi_paren.txt`)
    ModeMsg      = { fg = c.fg_dark, bold = true         },  -- 'showmode' message (e.g. -- INSERT --)
    MoreMsg      = { fg = c.fg                           },  -- |more-prompt|
    MsgArea      = { fg = c.fg                           },  -- Area for messages and cmdline
    NonText      = { fg = c.fg                           },  -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Question     = { fg = c.fg                           },  -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = c.bg, bold = true              },  -- Current |quickfix| item in the quickfix window
    SpecialKey   = { fg = c.bg_dark                      },  -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    Title        = { fg = c.inverse_primary, bold = true },  -- titles for output from ":set all", ":autocmd" etc.
    VertSplit    = { fg = c.fg, bg = c.bg                },  -- the column separating vertically split windows
    Whitespace   = { fg = c.comment                      },  -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WinSeparator = { fg = c.bg_dark, bg = c.transparent  },  -- the column separating vertically split windows
    WildMenu     = { bg = c.bg_dark                      },  -- Current match in 'wildmenu' completion

    Define        = { fg = c.primary },  -- Preprocessor #define
    -- Include = { fg = p.blueGray1 }, -- Preprocessor #include
    Macro         = { fg = c.primary },  -- Same as Define
    -- PreCondit     = { }, -- Preprocessor #if, #else, #endif, etc.
    -- PreProc = { fg = p.text }, -- Generic Preprocessor (preferred)
    -- }}}

    -- Diagnostic {{{
    DiagnosticError          = { fg = c.error                },
    DiagnosticWarn           = { fg = c.warn                 },
    DiagnosticWarning        = { link = "DiagnosticWarn"     },
    DiagnosticInfo           = { fg = c.info                 },
    DiagnosticInformation    = { link = "DiagnosticInfo"     },
    DiagnosticHint           = { fg = c.hint                 },
    DiagnosticSignError      = { link = "DiagnosticError"    },
    DiagnosticSignWarn       = { link = "DiagnosticWarn"     },
    DiagnosticSignInfo       = { link = "DiagnosticInfo"     },
    DiagnosticSignHint       = { link = "DiagnosticHint"     },
    DiagnosticUnderlineError = { undercurl=true, sp = c.error},
    DiagnosticUnderlineWarn  = { undercurl=true, sp = c.warn },
    DiagnosticUnderlineInfo  = { undercurl=true, sp = c.info },
    DiagnosticUnderlineHint  = { undercurl=true, sp = c.hint },
    -- }}}

    -- Diff {{{
    -- DiffAdd                     = { bg = c.diff.add    }, -- Added line
    -- DiffChange                  = { bg = c.diff.change }, -- Changed line
    -- DiffDelete                  = { bg = c.diff.delete }, -- Deleted line
    -- DiffText                    = { bg = c.diff.text   }, -- Changed text within a changed line
    -- }}}

    -- Error & Warning {{{
    Error                       = { fg = c.on_error },  -- (preferred) any erroneous construct
    ErrorMsg                    = { fg = c.primary  },  -- error messages on the command line
    -- WarningMsg                  = { fg = c.warning },  -- warning messages
    -- }}}

    -- Fold {{{
    Folded     = { fg = c.comment, bg = c.transparent },  -- Closed folds
    FoldColumn = { fg = c.comment, bg = c.transparent },  -- `:h foldcolumn`
    -- }}}

    -- Float {{{
    FloatBorder = { fg = c.primary, bg = c.none },
    FloatTitle  = { fg = c.fg, bg = c.bg },
    -- }}}

    -- Health {{{
    -- healthError   = { fg = c.error },
    -- healthSuccess = { fg = c.green1 },
    -- healthWarning = { fg = c.warning },
    -- }}}

    -- Line number {{{
    LineNr      = { fg = c.primary, bold = true },
    LineNrAbove = { fg = c.fg_dark              },
    LineNrBelow = { fg = c.fg_dark              },
    -- }}}

    -- LSP {{{
    -- LspReferenceText            = { bg = c.fg_gutter },  -- used for highlighting "text" references
    -- LspReferenceRead            = { bg = c.fg_gutter },  -- used for highlighting "read" references
    -- LspReferenceWrite           = { bg = c.fg_gutter },  -- used for highlighting "write" references
    -- LspSignatureActiveParameter = { bg = Util.blend_bg(c.bg_visual, 0.4), bold = true },
    LspCodeLens                 = { fg = c.comment      },
    -- LspCodeLensSeparator        = { fg = c.blueGray3 },  -- separator between two or more code lens
    LspInlayHint                = { fg = c.comment, bg = c.transparent },
    -- LspInfoBorder               = { fg = c.on_error, bg = c.primary    },
    -- }}}

    -- Normal {{{
    Normal      = { fg = c.fg, bg = c.transparent },  -- Normal window
    NormalNC    = { fg = c.fg, bg = c.transparent },  -- Non-current window
    NormalSB    = { fg = c.fg, bg = c.bg          },  -- Sidebar
    NormalFloat = { fg = c.fg, bg = c.bg          },  -- Floating window
    -- }}}

    -- Popup menu {{{
    Pmenu         = { bg = c.bg, fg = c.fg             },  -- Normal item
    PmenuSbar     = { bg = c.bg_dark                   },  -- Scrollbar
    PmenuThumb    = { bg = c.inverse_primary           },  -- Scrollbar thumb
    PmenuMatch    = { bg = c.on_error, fg = c.on_error },  -- Matched text in normal item
    PmenuMatchSel = { bg = c.on_error, fg = c.on_error },  -- Matched text in selected item
    PmenuSel      = { bg = c.bg_dark, fg = c.fg        },  -- Selected item
    -- }}}

    -- Search & Replace {{{
    Search     = { bg = c.bg_dark_3, fg = c.fg },
    IncSearch  = { bg = c.bg_dark_2, fg = c.fg },  -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute = { bg = c.bg_dark_2, fg = c.fg },  -- `:substitute` replacement text highlighting
    CurSearch  = { link = "IncSearch"          },
    -- }}}

    -- SignColumn {{{
    -- SignColumn   = { bg = c.transparent and c.none or c.bg, fg = c.fg_gutter }, -- column where |signs| are displayed
    -- SignColumnSB = { bg = c.bg_sidebar, fg = c.fg_gutter                     }, -- column where |signs| are displayed
    -- }}}

    -- Spell {{{
    SpellBad   = { sp = c.error, undercurl = true },  -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap   = { sp = c.warn, undercurl = true  },  -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = c.info, undercurl = true  },  -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare  = { sp = c.hint, undercurl = true  },  -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    -- }}}

    -- StatusLine {{{
    -- StatusLine   = { fg = c.fg_sidebar, bg = c.bg_statusline },  -- status line of current window
    -- StatusLineNC = { fg = c.fg_gutter, bg = c.bg_statusline  },  -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- }}}

    -- TabLine {{{
    -- TabLine     -- tab pages line, not active tab page label
    -- TabLineFill = { bg = c.black              }, -- tab pages line, where there are no labels
    -- TabLineSel  = { fg = c.black, bg = c.blue }, -- tab pages line, active tab page label
    -- }}}

    -- Type {{{
    Type    = { fg = c.primary },  -- (preferred) int, long, char, etc.
    Typedef = { fg = c.primary },  --  A typedef
    -- }}}

    -- Visual {{{
    -- Visual    = { bg = c.bg_visual },  -- Visual mode selection
    -- VisualNOS = { bg = c.bg_visual },  -- Visual mode selection when vim is "Not Owning the Selection".
    -- }}}

    -- WinBar {{{
    -- WinBar   = "StatusLine" ,  -- window bar
    -- WinBarNC = "StatusLineNC", -- window bar in inactive windows
    -- }}}
    -- }}}

    -- Plugins {{{
    -- CMP {{{
    CmpItemAbbrMatch      = { fg = c.fg,      bold = true },
    CmpItemAbbrMatchFuzzy = { fg = c.primary, bold = true },
    CmpItemKindClass      = { link = "Keyword"            },
    CmpItemKindConstant   = { link = "Constant"           },
    CmpItemKindFunction   = { link = "Function"           },
    CmpItemKindKeyword    = { link = "Keyword"            },
    CmpItemKindModule     = { link = "Module"             },
    CmpItemKindMethod     = { fg = c.primary              },
    CmpItemKindText       = { link = "String"             },
    CmpItemKindSnippet    = { fg = c.fg                   },
    CmpItemKindVariable   = { link = "Variable"           },
    -- }}}

    -- GitSigns {{{
    GitSignsAdd              = { fg = "#449dab" },
    GitSignsChange           = { fg = "#6183bb" },
    GitSignsDelete           = { fg = "#914c54" },
    GitSignsCurrentLineBlame = { fg = c.comment },
    -- }}}

    -- Hex {{{
    xxdAddress = { fg = c.primary  },
    xxdAscii   = { fg = c.tertiary },
    xxdSep     = { fg = c.tertiary },
    -- }}}

    -- Indent-blankline {{{
    IndentBlanklineChar               = { fg = c.primary },
    IndentBlanklineContextChar        = { fg = c.primary },
    IndentBlanklineContextStart       = { fg = c.primary },
    -- IndentBlanklineSpaceChar          = { link = "Whitespace" },
    -- IndentBlanklineSpaceCharBlankline = { link = "Whitespace" },
    -- }}}

    -- Lazy {{{
    LazyBold          = { bold = true                   },
    LazyButton        = { fg = c.fg, bg = c.bg_dark     },
    LazyButtonActive  = { fg = c.fg, bg = c.on_primary  },
    LazyComment       = { link = "Comment"              },
    LazyItalic        = { italic = true                 },
    LazyUrl           = { link = "String"               },
    LazyH1            = { fg = c.fg, bg = c.on_primary  },
    LazyH2            = { fg = c.fg, bg = c.transparent },
    LazyProgressDone  = { fg = c.primary                },
    LazyProgressTodo  = { fg = c.fg                     },
    LazyReasonEvent   = { fg = c.primary                },
    LazyReasonRequire = { fg = c.secondary      },
    LazyReasonSource  = { fg = c.tertiary               },
    LazyReasonStart   = { link = "LazyReasonEvent"      },
    LazyReasonPlugin  = { fg = c.on_primary             },
    -- }}}

    -- Mason {{{
    MasonHeader             = { fg = c.primary                      },
    MasonHighlight          = { fg = c.primary                      },
    MasonHighlightBlockBold = { fg = c.fg, bg = c.on_primary },
    MasonMutedBlock         = { fg = c.fg, bg = c.bg_dark           },
    -- }}}

    -- Oil {{{
    OilDir        = { link = "Directory"     },
    OilDirHidden  = { fg = c.inverse_primary },
    OilFile       = { link = "File"          },
    OilFileHidden = { fg = c.inverse_primary },
    -- }}}

    -- Telescope {{{
    TelescopeNormal       = { fg = c.fg, bg = c.bg          },  -- Normal
    TelescopeBorder       = { fg = c.primary, bg = c.bg     },  -- Border
    TelescopePromptBorder = { link = "TelescopeBorder"      },  -- Prompt Border
    TelescopePromptNormal = { fg = c.fg, bg = c.bg          },  -- Prompt Normal
    TelescopePromptPrefix = { fg = c.fg                     },  -- Prompt Sign
    TelescopePromptTitle  = { fg = c.primary, bg = c.bg     },  -- Prompt Title
    TelescopePreviewTitle = { link = "TelescopePromptTitle" },  -- Preview
    TelescopeMatching     = { fg = c.primary                },  -- Matching
    TelescopeSelection    = { bg = c.bg_dark                },  -- Selection
    -- TelescopeResultsDiffAdd = { fg = p.teal1 },
    -- TelescopeResultsDiffChange = { fg = p.yellow },
    -- TelescopeResultsDiffDelete = { fg = p.pink3 },
    -- }}}

    -- Trouble {{{
    TroubleCount            = { fg = c.fg, bg = c.transparent },
    TroubleDiagnosticsCount = { link = "TroubleCount"         },
    TroubleDirectory        = { link = "Directory"            },
    TroubleFilename         = { link = "File"                 },
    TroubleIconDirectory    = { link = "Directory"            },
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

    -- Which-key {{{
    WhichKey          = { fg = c.fg      },  -- Keys
    WhichKeyDesc      = { fg = c.fg      },  -- Normal
    WhichKeyGroup     = { fg = c.primary },  -- Groups
    WhichKeyNormal    = { bg = c.bg      },  -- Background
    WhichKeySeparator = { fg = c.comment },  -- Separator
    WhichKeyValue     = { fg = c.fg      },  -- Value
    -- }}}

    -- Yazi {{{
    YaziBorder = { bg = c.bg },
    YaziFloat  = { bg = c.bg },
    -- }}}
    -- }}}

    -- Syntax {{{
    Bold                        = { bold = true, fg = c.fg           },  -- (preferred) any bold text
    Debug                       = { fg = c.on_error                  },  --    debugging statements
    debugBreakpoint             = { bg = c.on_error, fg = c.on_error },  -- used for breakpoint colors in terminal-debug
    debugPC                     = { bg = c.primary                   },  -- used for highlighting the current line in terminal-debug
    Italic                      = { italic = true, fg = c.fg         },  -- (preferred) any italic text
    Underlined                  = { underline = true                 },  -- (preferred) text that stands out, HTML links

    -- Syntax Variables {{{
    Boolean      = { fg = c.tertiary },
    Constructor  = { fg = c.tertiary },
    Constant     = { fg = c.fg       },
    Character    = { fg = c.tertiary },
    Float        = { fg = c.tertiary },
    Function     = { fg = c.primary  },
    Number       = { fg = c.tertiary },
    Property     = { fg = c.primary  },
    String       = { fg = c.tertiary },
    Variable     = { fg = c.fg       },
    -- }}}

    -- Syntax Keywords {{{
    Comment     = { fg = c.comment, italic = true },  -- Comments
    Conditional = { fg = c.inverse_primary        },  -- if, else, endif, then, switch
    Delimiter   = { fg = c.fg                     },
    Exception   = { fg = c.inverse_primary        },  -- try, catch, throw
    Identifier  = { fg = c.primary                },  -- (preferred) any variable name
    Keyword     = { fg = c.inverse_primary        },  -- Any other keyword
    Label       = { fg = c.primary                },  -- case, default
    Module      = { fg = c.primary                },  -- Modules
    Operator    = { fg = c.primary                },  -- sizeof, +, *, =, .
    Punctuation = { fg = c.fg                     },  -- , / ; / ::
    -- Repeat      = { fg = p.blue3                  },  -- for, do, while, etc.
    -- Statement   = { fg = p.text                   },  -- (preferred) any statement
    -- Todo        = { bg = c.yellow, fg = c.bg      },  -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    -- }}}

    -- CSS {{{
    -- cssBoxProp         = { fg = c.fg              },
    -- cssBorderProp      = { fg = c.fg              },
    -- cssBackgroundProp  = { fg = c.fg              },
    cssCustomProp      = { fg = c.primary              },
    cssDefinition      = { fg = c.primary              },
    -- cssFontProp        = { fg = c.fg              },
    cssImportant       = { fg = c.inverse_primary },
    -- cssMediaProp       = { fg = c.fg              },
    -- cssTextProp        = { fg = c.fg              },
    -- cssPositioningProp = { fg = c.fg              },
    cssValueLength     = { link = "Number"        },
    -- }}}

    -- Hypr {{{
    hyprBoolean      = { link = "Boolean"  },
    hyprCommand      = { fg = c.primary    },
    hyprComment      = { link = "Comment"  },
    hyprCategoryD    = { fg = c.primary    },
    hyprNumber       = { link = "Constant" },
    hyprValue        = { link = "String"   },
    hyprVariable     = { link = "Variable" },
    hyprString       = { link = "String"   },
    -- }}}
    -- }}}

    -- Treesitter {{{
    -- Treesitter base {{{
    ["@boolean"]                    = { link = "Boolean"     },
    ["@character"]                  = { link = "Character"   },
    ["@character.printf"]           = { link = "Character"   },
    ["@character.special"]          = { link = "Character"   },
    ["@comment.note.vimdoc"]        = { link = "Title"       },
    ["@constructor"]                = { link = "Constructor" },
    ["@constant"]                   = { link = "Constant"    },
    ["@constant.builtin"]           = { link = "Constant"    },
    ["@constant.macro"]             = { link = "Constant"    },
    ["@diff.delta"]                 = { link = "DiffChange"  },
    ["@diff.minus"]                 = { link = "DiffDelete"  },
    ["@diff.plus"]                  = { link = "DiffAdd"     },
    ["@function"]                   = { link = "Function"    },
    ["@function.builtin"]           = { link = "Function"    },
    ["@function.call"]              = { link = "Function"    },
    ["@function.macro"]             = { link = "Function"    },
    ["@function.meghod"]            = { link = "Function"    },
    ["@function.method.call"]       = { link = "Function"    },
    ["@keyword"]                    = { link = "Keyword"     },
    ["@keyword.conditional"]        = { link = "Keyword"     },
    ["@keyword.debug"]              = { link = "Keyword"     },
    ["@keyword.exception"]          = { link = "Keyword"     },
    ["@keyword.import"]             = { link = "Keyword"     },
    ["@keyword.operator"]           = { link = "Keyword"     },
    ["@keyword.function"]           = { link = "Keyword"     },
    ["@keyword.return"]             = { link = "Keyword"     },
    ["@label"]                      = { link = "Label"       },
    ["@label.vimdoc"]               = { link = "Label"       },
    ["@markup.heading.1.vimdoc"]    = { link = "Title"       },
    ["@markup.heading.2.vimdoc"]    = { link = "Title"       },
    ["@markup.raw.vimdoc"]          = { link = "Title"       },
    ["@module.builtin"]             = { link = "Module"      },
    ["@number"]                     = { link = "Number"      },
    ["@number.float"]               = { link = "Number"      },
    ["@operator"]                   = { link = "Operator"    },
    ["@punctuation"]                = { link = "Punctuation" },
    ["@punctuation.bracket"]        = { link = "Punctuation" },
    ["@punctuation.delimiter"]      = { link = "Delimiter"   },
    ["@punctuation.special"]        = { link = "Bracket"     },
    ["@property.vim"]               = { link = "Property"    },
    ["@string"]                     = { link = "String"      },
    ["@string.documentation"]       = { link = "String"      },
    ["@type"]                       = { link = "Type"        },
    ["@type.builtin"]               = { link = "Type"        },
    ["@type.definition"]            = { link = "Type"        },
    ["@type.quilifier"]             = { link = "Type"        },
    ["@variable"]                   = { link = "Variable"    },
    ["@variable.builtin"]           = { link = "Variable"    },
    ["@variable.member"]            = { link = "Variable"    },
    ["@variable.parameter"]         = { link = "Variable"    },
    ["@variable.parameter.builtin"] = { link = "Variable"    },
    -- }}}

    -- Treesitter - Lua {{{
    ["@boolean.lua"]             = { link = "Boolean"     },
    ["@constructor.lua"]         = { link = "Constructor" },
    ["@function.lua"]            = { link = "Function"    },
    ["@keyword.return.lua"]      = { link = "Keyword"     },
    ["@number.lua"]              = { link = "Number"      },
    ["@operator.lua"]            = { link = "Operator"    },
    ["@property.lua"]            = { link = "Property"    },
    ["@punctuation.bracket.lua"] = { link = "Punctuation" },
    -- }}}

    -- Treesitter - Python {{{
    ["@boolean.python"]             = { link = "Boolean"     },
    ["@constant.builtin.python"]    = { link = "Constant"    },
    ["@function.python"]            = { link = "Function"    },
    ["@function.call.python"]       = { link = "Function"    },
    ["@function.builtin.python"]    = { link = "Function"    },
    ["@keyword.conditional.python"] = { link = "Conditional" },
    ["@keyword.exception.python"]   = { link = "Exception"   },
    ["@keyword.operator.python"]    = { link = "Keyword"     },
    ["@keyword.repeat.python"]      = { link = "Keyword"     },
    ["@module.python"]              = { link = "Module"      },
    ["@type.python"]                = { link = "Type"        },
    ["@type.builtin.python"]        = { link = "Type"        },
    ["@string.escape.python"]       = { link = "Operator"    },
    ["@variable.parameter.python"]  = { link = "Variable"    },
    ["@variable.python"]            = { link = "Variable"    },
    -- }}}

    -- Treesitter - Rust {{{
    ["@character.special.rust"]     = { link = "Operator"    },
    ["@function.call.rust"]         = { link = "Function"    },
    ["@function.macro.rust"]        = { link = "Macro"       },
    ["@keyword.function.rust"]      = { link = "Keyword"     },
    ["@keyword.import.rust"]        = { link = "Keyword"     },
    ["@keyword.modifier.rust"]      = { link = "Keyword"     },
    ["@keyword.repeat.rust"]        = { link = "Keyword"     },
    ["@keyword.rust"]               = { link = "Keyword"     },
    ["@module.rust"]                = { link = "Module"      },
    ["@number.rust"]                = { link = "Number"      },
    ["@operator.rust"]              = { link = "Operator"    },
    ["@punctuation.delimiter.rust"] = { link = "Delimiter"   },
    ["@punctuation.bracket.rust"]   = { link = "Punctuation" },
    ["@punctuation.special.rust"]   = { link = "Punctuation" },
    ["@string.rust"]                = { link = "String"      },
    ["@type.rust"]                  = { link = "Type"        },
    ["@type.builtin.rust"]          = { link = "Type"        },
    ["@type.function.rust"]         = { link = "Function"    },
    ["@variable.rust"]              = { link = "Variable"    },
    ["@variable.parameter.rust"]    = { link = "Variable"    },
    ["@variable.member.rust"]       = { link = "Variable"    },
    -- }}}
    -- }}}

    -- LSP {{{
    -- Lua {{{
    ["@lsp.type.function.lua"] = { link = "Function" },
    ["@lsp.type.property.lua"] = { link = "Property" },
    -- }}}

    -- Markup {{{
    ["@markup.link.markdown_inline"]       = { link = "String"   },
    ["@markup.link.label.markdown_inline"] = { fg = c.primary    },
    ["@markup.list.markdown"]              = { link = "Function" },
    ["@markup.raw.markdown_inline"]        = { link = "Function" },
    ["@markup.raw.block.markdown"]         = { link = "Function" },
    ["@string.special.path.bash"]          = { link = "String"   },
    -- }}}

    -- Rust {{{
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
    ["@lsp.type.selfKeyword.rust"]              = { link = "Keyword"  },
    ["@lsp.type.property.rust"]                 = { link = "Variable" },
    ["@lsp.type.variable.rust"]                 = { link = "Variable" },
    ["@lsp.typemod.function.public.rust"]       = { link = "Function" },
    ["@lsp.typemod.function.declaration.rust"]  = { link = "Function" },
    ["@lsp.typemod.keyword.controlFlow.rust"]   = { link = "Keyword"  },
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
