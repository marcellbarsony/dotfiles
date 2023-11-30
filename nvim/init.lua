-- Lazy
require('plugins.lazy-nvim')

-- Nvim Core
require('core.autocmd')
require('core.colors')
require('core.keymaps')
require('core.lspconfig')
require('core.options')

-- DAP
require('dap.nvim-dap')
require('dap.nvim-dap-ui')
require('dap.nvim-dap-python')
require('dap.nvim-dap-vtxt')

-- Mason
require('mason.mason')
require('mason.mason-lspconfig')
require('mason.mason-null-ls')
require('mason.mason-nvim-dap')

-- Lang
require('lang.rust-tools')
require('lang.tsserver')

-- Plugins
require('plugins.alpha-nvim')
require('plugins.autopairs')
require('plugins.bufferline')
require('plugins.colorizer')
require('plugins.gitsigns')
require('plugins.hex')
require('plugins.indent-blankline')
require('plugins.lualine')
require('plugins.luasnip')
require('plugins.lsp_lines')
require('plugins.lspsaga')
require('plugins.null-ls')
require('plugins.nvim-cmp')
require('plugins.oil')
require('plugins.telescope')
require('plugins.which-key')

-- Treesitter
require('treesitter.treesitter')
require('treesitter.treesitter-context')
