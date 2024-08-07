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

-- Add lazy to the `runtimepath`
vim.opt.rtp:prepend(lazypath)
-- }}}

require("lazy").setup({
    -- {{{ Autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter"
    },
    -- }}}

    -- {{{ Colors
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {



        },
    },

    -- { "catppuccin/nvim",
    --   name = "catppuccin",
    --   priority = 1000
    -- },

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

    -- {{{ GIT
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy"
    },
    -- }}}

    -- {{{ Harpoon
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

    -- {{{ Indent blankline
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

    -- {{{ LSP [Mason]
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

    -- {{{ Oil
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
    }
    -- }}}
})
