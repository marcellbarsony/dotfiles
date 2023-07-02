-- Lazy
require('user.plugins.lazy-nvim')

-- Nvim Core
require('user.core.autocmd')
require('user.core.colors')
require('user.core.keymaps')
require('user.core.lspconfig')
require('user.core.options')

-- DAP
require('user.dap.nvim-dap')
require('user.dap.nvim-dap-ui')
require('user.dap.nvim-dap-python')
require('user.dap.nvim-dap-vtxt')

-- Mason
require('user.mason.mason')
require('user.mason.mason-lspconfig')
require('user.mason.mason-null-ls')
require('user.mason.mason-nvim-dap')

-- Lang
require('user.lang.rust-tools')
require('user.lang.tsserver')

-- Plugins
require('user.plugins.alpha-nvim')
require('user.plugins.autopairs')
require('user.plugins.bufferline')
require('user.plugins.colorizer')
require('user.plugins.gitsigns')
require('user.plugins.indent-blankline')
require('user.plugins.lualine')
require('user.plugins.luasnip')
require('user.plugins.lsp_lines')
require('user.plugins.lspsaga')
require('user.plugins.null-ls')
require('user.plugins.nvim-cmp')
require('user.plugins.nvim-tree')
require('user.plugins.telescope')
require('user.plugins.treesitter')
require('user.plugins.which-key')

-- TODO
--require('user.plugins.nvim-ufo')
