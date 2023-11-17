-- lazy.nvim
-- https://github.com/folke/lazy.nvim

-- Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
-- vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  -- Auto pair
  'windwp/nvim-autopairs',

  -- Bufferline
  'akinsho/bufferline.nvim',

  -- Color theme
  { 'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
  },
  { "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  -- Colorizer
  'NvChad/nvim-colorizer.lua',

  -- Devicons
  { 'nvim-tree/nvim-web-devicons',
    lazy = true
  },

  -- CMP
  { 'hrsh7th/nvim-cmp',
    --event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },
  },

  -- DAP
  { 'mfussenegger/nvim-dap',
    dependencies = {
      'mfussenegger/nvim-dap-python', -- Python
      'nvim-telescope/telescope-dap.nvim', -- Telescope
      'rcarriga/nvim-dap-ui', -- UI
      'theHamsta/nvim-dap-virtual-text', -- Virtual text
    },
  },

  -- Greeter
  'goolord/alpha-nvim',

  -- Git
  'lewis6991/gitsigns.nvim',

  -- Harpoon
  'ThePrimeagen/harpoon',

  -- HEX
  'RaafatTurki/hex.nvim',

  -- Indent lines
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  -- LSP
  'neovim/nvim-lspconfig',
  { 'williamboman/mason.nvim',
    build = ":MasonUpdate",
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'jay-babu/mason-null-ls.nvim',
      'jay-babu/mason-nvim-dap.nvim',
      'onsails/lspkind.nvim',
    },
  },

  -- LSP Lines
  { url = 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' },

  -- LSP Saga
  'glepnir/lspsaga.nvim',

  -- Null-ls
  'jose-elias-alvarez/null-ls.nvim',

  -- Oil.nvim
  'stevearc/oil.nvim',

  -- Rust
  'simrat39/rust-tools.nvim',

  -- Snippets
  { 'L3MON4D3/LuaSnip',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
    },
  },

  -- Status line
  'nvim-lualine/lualine.nvim',
  -- 'glepnir/galaxyline.nvim'
  -- 'feline-nvim/feline.nvim'
  -- 'windwp/windline.nvim'

  -- Telescope
  { 'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim', -- Lua lib
      -- 'BurntSushi/ripgrep' -- Live grep
    }
  },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'p00f/nvim-ts-rainbow'
    }
  },

  -- Which key
  'folke/which-key.nvim',

})
