-- Lazy
require("plugins.lazy-nvim")

-- Nvim Core
require("core.autocmd")
require("core.colors")
require("core.lspconfig")
require("core.options")
require("core.maps.keymaps")
require("core.maps.keymaps-lsp")
require("core.maps.keymaps-dap")
require("core.maps.keymaps-telescope")

-- DAP
require("dap.nvim-dap")
require("dap.nvim-dap-ui")
require("dap.nvim-dap-python")
require("dap.nvim-dap-vtxt")

-- Mason
require("mason.mason")
require("mason.mason-lspconfig")
require("mason.mason-nvim-dap")

-- CMP & Snipppet
require("plugins.nvim-cmp")
require("plugins.luasnip")

-- GIT
require("plugins.gitsigns")

-- Lang
require("lang.rust-tools")
require("lang.tsserver")

-- Navigation
require("plugins.alpha-nvim")
require("plugins.oil")
require("plugins.which-key")

-- Plugins
require("plugins.autopairs")
require("plugins.bufferline")
require("plugins.colorizer")
require("plugins.hex")
require("plugins.indent-blankline")
require("plugins.lualine")
require("plugins.lsp_lines")
require("plugins.lspsaga")

-- Telescope
require("plugins.telescope")

-- Treesitter
require("treesitter.treesitter")
require("treesitter.treesitter-context")
