-- lazy.nvim
-- https://github.com/folke/lazy.nvim

-- {{{ Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
-- }}}

require("lazy").setup({
    -- {{{ Auto pair
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter"
    },
    -- }}}

    -- {{{ Color theme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
    },
    -- { "catppuccin/nvim",
    --   name = "catppuccin",
    --   priority = 1000
    -- },
    -- }}}

    -- {{{ Colorizer
    "NvChad/nvim-colorizer.lua",
    -- }}}

    -- {{{ Devicons
    {
        "nvim-tree/nvim-web-devicons",
        event = "VeryLazy"
    },
    -- }}}

    -- {{{ CMP
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-path",
        },
    },
    -- }}}

    -- {{{ DAP
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        dependencies = {
            "mfussenegger/nvim-dap-python",
            "nvim-telescope/telescope-dap.nvim",
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
    },
    -- }}}

    -- {{{ Greeter
    "goolord/alpha-nvim",
    -- }}}

    -- {{{ Git
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy"
    },
    -- }}}

    -- {{{ Harpoon 2
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        }
    },
    -- }}}

    -- {{{ HEX
    {
        "RaafatTurki/hex.nvim",
        event = "VeryLazy"
    },
    -- }}}

    -- {{{ Indent lines
    {
        "lukas-reineke/indent-blankline.nvim",
        event = {
            "BufReadPre",
            "BufNewFile"
        },
        main = "ibl",
        opts = {},
        commit = "29be0919b91fb59eca9e90690d76014233392bef",
    },
    -- }}}

    -- {{{ LSP
    {
        "neovim/nvim-lspconfig",
        event = {
            "BufReadPre",
            "BufNewFile",
        },
    },
    -- }}}

    -- {{{ LSP (Mason)
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "jay-babu/mason-nvim-dap.nvim",
            "onsails/lspkind.nvim",
        },
    },
    -- }}}

    -- {{{ Lspsaga
    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach"
    },
    -- }}}

    -- {{{ Markdown preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = {
            "MarkdownPreviewToggle",
            "MarkdownPreview",
            "MarkdownPreviewStop"
        },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    -- }}}

    -- {{{ Oil.nvim
    {
        "stevearc/oil.nvim",
        lazy = true
    },
    -- }}}

    -- {{{ Rust
    {
        "mrcjkb/rustaceanvim",
        version = '^4',
        lazy = false,
    },
    --}}}

    -- {{{ Snippets
    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
        },
    },
    -- }}}

    -- {{{ Status line
    "nvim-lualine/lualine.nvim",
    -- }}}

    -- {{{ Telescope
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
        }
    },
    -- }}}

    -- {{{ Toggleterm
    {
        "akinsho/toggleterm.nvim",
        lazy = true,
        cmd = "Toggleterm",
        version = "*",
        config = true
    },
    -- }}}

    -- {{{ Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = {
            "BufReadPre",
            "BufNewFile"
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-context",
            "p00f/nvim-ts-rainbow"
        }
    },
    -- }}}

    -- {{{ Trouble
    {
        "folke/trouble.nvim",
        event = {
            "BufReadPre",
            "BufNewFile"
        },
    },
    -- }}}

    -- {{{ Which key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            ---@type false | "classic" | "modern" | "helix"
            preset = "classic",
            -- Delay before showing the popup. Can be a number or a function that returns a number
            ---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
            delay = function(ctx)
                return ctx.plugin and 0 or 200
            end,
            ---@param mapping wk.Mapping
            filter = function(mapping)
                -- example to exclude mappings without a description
                -- return mapping.desc and mapping.desc ~= ""
                return true
            end,
            --- You can add any mappings here, or use `require('which-key').add()` later
            ---@type wk.Spec
            spec = {},
            -- Show mapping warnings
            notify = true,
            -- Toggle WhichKey for mapping modes
            modes = {
                n = true, -- Normal mode
                i = true, -- Insert mode
                x = true, -- Visual mode
                s = true, -- Select mode
                o = true, -- Operator pending mode
                t = true, -- Terminal mode
                c = true, -- Command mode
            },
            plugins = {
                marks = true,     -- shows a list of your marks on ' and `
                registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                -- No actual key bindings are created
                spelling = {
                    enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                    suggestions = 20, -- how many suggestions should be shown in the list?
                },
                presets = {
                    operators = true,    -- adds help for operators like d, y, ...
                    motions = true,      -- adds help for motions
                    text_objects = true, -- help for text objects triggered after entering an operator
                    windows = true,      -- default bindings on <c-w>
                    nav = true,          -- misc bindings to work with windows
                    z = true,            -- bindings for folds, spelling and others prefixed with z
                    g = true,            -- bindings for prefixed with g
                },
            },
            ---@type wk.Win
            win = {
                -- don't allow the popup to overlap with the cursor
                no_overlap = true,
                -- width = 1,
                height = { min = 4, max = 10 },
                -- col = 0,
                -- row = math.huge,
                -- border = "none",
                padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
                title = true,
                title_pos = "center",
                zindex = 1000,
                -- Additional vim.wo and vim.bo options
                bo = {},
                wo = {
                    -- winblend = 100, -- value between 0-100 0 for fully opaque and 100 for fully transparent
                },
            },
            layout = {
                width = { min = 5, max = 20 }, -- min and max width of the columns
                spacing = 3,                   -- spacing between columns
                align = "left",                -- left | center | right
            },
            keys = {
                scroll_down = "<c-d>", -- binding to scroll down inside the popup
                scroll_up = "<c-u>",   -- binding to scroll up inside the popup
            },
            ---@type (string|wk.Sorter)[]
            --- Add "manual" as the first element to use the order the mappings were registered
            --- Other sorters: "desc"
            sort = { "local", "order", "group", "alphanum", "mod", "lower", "icase" },
            ---@type number|fun(node: wk.Node):boolean?
            expand = 1, -- expand groups when <= n mappings
            -- expand = function(node)
            --   return not node.desc -- expand all nodes without a description
            -- end,
            ---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
            replace = {
                key = {
                    function(key)
                        return require("which-key.view").format(key)
                    end,
                    -- { "<Space>", "SPC" },
                },
                desc = {
                    { "<Plug>%((.*)%)", "%1" },
                    { "^%+",            "" },
                    { "<[cC]md>",       "" },
                    { "<[cC][rR]>",     "" },
                    { "<[sS]ilent>",    "" },
                    { "^lua%s+",        "" },
                    { "^call%s+",       "" },
                    { "^:%s*",          "" },
                },
            },
            icons = {
                breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
                separator = "➜", -- symbol used between a key and it's label
                group = "", -- symbol prepended to a group
                ellipsis = "…",
                --- See `lua/which-key/icons.lua` for more details
                --- Set to `false` to disable keymap icons
                ---@type wk.IconRule[]|false
                rules = {},
                -- use the highlights from mini.icons
                -- When `false`, it will use `WhichKeyIcon` instead
                colors = true,
                -- used by key format
                keys = {
                    Up = " ",
                    Down = " ",
                    Left = " ",
                    Right = " ",
                    C = "󰘴 ",
                    M = "󰘵 ",
                    S = "󰘶 ",
                    CR = "󰌑 ",
                    Esc = "󱊷 ",
                    ScrollWheelDown = "󱕐 ",
                    ScrollWheelUp = "󱕑 ",
                    NL = "󰌑 ",
                    BS = "⌫",
                    Space = "󱁐 ",
                    Tab = "󰌒 ",
                },
            },
            show_help = false, -- show a help message in the command line for using WhichKey
            show_keys = true,  -- show the currently pressed key and its label as a message in the command line
            -- Which-key automatically sets up triggers for your mappings.
            -- But you can disable this and setup the triggers yourself.
            -- Be aware, that triggers are not needed for visual and operator pending mode.
            triggers = true, -- automatically setup triggers
            disable = {
                -- disable WhichKey for certain buf types and file types.
                ft = {},
                bt = {},
                -- disable a trigger for a certain context by returning true
                ---@type fun(ctx: { keys: string, mode: string, plugin?: string }):boolean?
                trigger = function(ctx)
                    return false
                end,
            },
            debug = false, -- enable wk.log in the current directory

            -- your configuration comes here
        },
    }
    -- }}}
})
