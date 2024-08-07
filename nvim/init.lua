-- Lazy
require("plugins.lazy-nvim")

-- Colors
-- require("theme.catppucin")
require("theme.tokyonight")

-- DAP
require("dap.nvim-dap")
require("dap.nvim-dap-ui")
require("dap.nvim-dap-python")
require("dap.nvim-dap-vtxt")

-- CMP & Snipppet
require("plugins.nvim-cmp")
require("plugins.luasnip")

-- GIT
require("plugins.gitsigns")

-- Lang
require("lang.rustaceanvim")
require("lang.tsserver")

-- LSP
require("plugins.lspsaga")
require("plugins.trouble")

-- Mason
require("mason.mason")
require("mason.mason-lspconfig")
require("mason.mason-nvim-dap")

-- Navigation
require("plugins.alpha-nvim")
require("plugins.harpoon")
require("plugins.oil")
require("plugins.which-key")

-- Plugins
require("plugins.autopairs")
require("plugins.colorizer")
require("plugins.hex")
require("plugins.indent-blankline")
require("plugins.lualine")
require("plugins.toggleterm")

-- Telescope
require("plugins.telescope")

-- Treesitter
require("treesitter.treesitter")
require("treesitter.treesitter-context")
