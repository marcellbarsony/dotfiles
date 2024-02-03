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

-- {{{ Setup
require("lazy").setup({
  -- {{{ Auto pair
  { "windwp/nvim-autopairs",
    event = "InsertEnter"
  },
  -- }}}

  -- {{{ Color theme
  { "folke/tokyonight.nvim",
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

  -- {{{ Comment
  { "numToStr/Comment.nvim",
    lazy = false,
  },
  -- }}}

  -- {{{ Devicons
  { "nvim-tree/nvim-web-devicons",
    event = "VeryLazy"
  },
  -- }}}

  -- {{{ CMP
  { "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "hrsh7th/cmp-buffer",
        event = "InsertEnter",
      },
      {
        "hrsh7th/cmp-cmdline",
        event = "InsertEnter",
      },
      {
        "hrsh7th/cmp-nvim-lsp",
        event = "InsertEnter",
      },
      {
        "hrsh7th/cmp-nvim-lsp-signature-help",
        event = "InsertEnter",
      },
      {
        "hrsh7th/cmp-path",
        event = "InsertEnter",
      },
    },
  },
  -- }}}

  -- {{{ DAP
  { "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap-python", -- Python
      "nvim-telescope/telescope-dap.nvim", -- Telescope
      "rcarriga/nvim-dap-ui", -- UI
      "theHamsta/nvim-dap-virtual-text", -- Virtual text
    },
  },
  -- }}}

  -- {{{ Greeter
  "goolord/alpha-nvim",
  -- }}}

  -- {{{ Git
  "lewis6991/gitsigns.nvim",
  -- }}}

  -- {{{ Harpoon
  { "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    }
  },
  -- }}}

  -- {{{ HEX
  "RaafatTurki/hex.nvim",
  -- }}}

  -- {{{ Indent lines
  { "lukas-reineke/indent-blankline.nvim",
    event = {
      "BufReadPre",
      "BufNewFile"
    },
    main = "ibl",
    opts = {}
  },
  -- }}}

  -- {{{ LSP
  { "neovim/nvim-lspconfig",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
  },
  -- }}}

  -- {{{ LSP (Mason)
  { "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "onsails/lspkind.nvim",
    },
  },
  -- }}}

  -- {{{ Lspsaga
  { "glepnir/lspsaga.nvim",
    event = "LspAttach"
  },
  -- }}}

  -- {{{ Markdown preview
  { "iamcco/markdown-preview.nvim",
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
  { "stevearc/oil.nvim",
    lazy = true
  },
  -- }}}

  -- {{{ Rust
  { "mrcjkb/rustaceanvim",
    version = "^3",
    ft = { "rust" },
  },
  --}}}

  -- {{{ Snippets
  { "L3MON4D3/LuaSnip",
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
  { "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
    }
  },
  -- }}}

  -- {{{ Toggleterm
  { "akinsho/toggleterm.nvim",
    --event = "VeryLazy",
    lazy = true,
    cmd = "Toggleterm",
    version = "*",
    config = true
  },
  -- }}}

  -- {{{ Treesitter
  { "nvim-treesitter/nvim-treesitter",
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
  "folke/trouble.nvim",
  -- }}}

  -- {{{ Which key
  { "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  -- }}}
})
-- }}}
