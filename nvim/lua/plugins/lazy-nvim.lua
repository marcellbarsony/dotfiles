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
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  -- Auto pair
  'windwp/nvim-autopairs',

  -- Bufferline
  'akinsho/bufferline.nvim',

  -- Color theme
  -- { 'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  -- },
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
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-path',
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

  -- HEX
  'RaafatTurki/hex.nvim',

  -- Indent lines
  { "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },

  -- LSP (Mason)
  'neovim/nvim-lspconfig',
  { 'williamboman/mason.nvim',
    build = ":MasonUpdate",
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'jay-babu/mason-nvim-dap.nvim',
      'onsails/lspkind.nvim',
    },
  },

  -- LSP Lines
  { url = 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' },

  -- LSP Saga
  'glepnir/lspsaga.nvim',

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

  -- Telescope
  { 'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    }
  },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
      'p00f/nvim-ts-rainbow'
    }
  },

  -- Which key
  'folke/which-key.nvim',
})
