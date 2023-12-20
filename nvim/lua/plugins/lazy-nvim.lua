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
  { "windwp/nvim-autopairs",
    event = "InsertEnter"
  },

  -- Color theme
  { "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  -- { "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  -- },

  -- Colorizer
  "NvChad/nvim-colorizer.lua",

  -- Comment
  { "numToStr/Comment.nvim",
      lazy = false,
  },

  -- Devicons
  { "nvim-tree/nvim-web-devicons",
    lazy = true
  },

  -- CMP
  { "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path",
    },
  },

  -- DAP
  { "mfussenegger/nvim-dap",
    event = "VeryLazy",
    --lazy = true,
    dependencies = {
      "mfussenegger/nvim-dap-python", -- Python
      "nvim-telescope/telescope-dap.nvim", -- Telescope
      "rcarriga/nvim-dap-ui", -- UI
      "theHamsta/nvim-dap-virtual-text", -- Virtual text
    },
  },

  -- Greeter
  { "goolord/alpha-nvim",
    lazy = "true"
  },

  -- Git
  { "lewis6991/gitsigns.nvim",
    event = {"BufReadPre", "BufNewFile"}
  },

  -- HEX
  "RaafatTurki/hex.nvim",

  -- Indent lines
  { "lukas-reineke/indent-blankline.nvim",
    event = {"BufReadPre", "BufNewFile"},
    main = "ibl",
    opts = {}
  },

  -- LSP
  "neovim/nvim-lspconfig",

  -- LSP (Mason)
  { "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "onsails/lspkind.nvim",
    },
  },

  -- LSP Lines
  { url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "LspAttach"
  },

  -- Lspsaga
  { "glepnir/lspsaga.nvim",
    event = "LspAttach"
  },

  -- Markdown preview
  { "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- Oil.nvim
  { "stevearc/oil.nvim",
    event = "VeryLazy"
  },

  -- Rust
  { "simrat39/rust-tools.nvim",
    ft = "rust"
  },

  -- Snippets
  { "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
    },
  },

  -- Status line
  { "nvim-lualine/lualine.nvim",
    event = {"BufReadPre", "BufNewFile"}
  },

  -- Telescope
  { "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
    }
  },

  -- amongst your other plugins
  { "akinsho/toggleterm.nvim",
    version = "*",
    config = true
  },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
      "p00f/nvim-ts-rainbow"
    }
  },

  -- Which key
  { "folke/which-key.nvim",
    lazy = true
  },
})
