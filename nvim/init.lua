-- Lazy
require('user.plugins.lazy-nvim')

-- Core
require('user.core.autocmd')
require('user.core.colors')
require('user.core.keymaps')
require('user.core.lspconfig')
require('user.core.options')

-- CMP
require('user.plugins.nvim-cmp')

-- DAP
require('user.plugins.nvim-dap')
require('user.plugins.nvim-dap-ui')
require('user.plugins.nvim-dap-python')
require('user.plugins.nvim-dap-vtxt')

-- Git
require('user.plugins.gitsigns')

-- Greeter
require('user.plugins.alpha-nvim')

-- LSP setup
require('user.plugins.mason')
require('user.plugins.mason-lspconfig')
require('user.plugins.mason-nvim-dap')

-- LSP tools
require('user.plugins.lsp_lines')
require('user.plugins.lspsaga')
require('user.plugins.py_lsp')

-- Plugins
require('user.plugins.autopairs')
require('user.plugins.bufferline')
require('user.plugins.colorizer')
require('user.plugins.indent-blankline')
require('user.plugins.lualine')
require('user.plugins.nvim-tree')
require('user.plugins.telescope')
require('user.plugins.treesitter')
require('user.plugins.which-key')

-- Snippet
require('user.plugins.luasnip')

-- TODO
--require('user.plugins.null-ls')
