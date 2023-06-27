-- Lazy
require('user.plugins.lazy-nvim')

-- Nvim Core
require('user.core.autocmd')
require('user.core.colors')
require('user.core.keymaps')
require('user.core.lspconfig')
require('user.core.options')

-- Buffer
require('user.plugins.bufferline')

-- CMP
require('user.plugins.nvim-cmp')

-- DAP
require('user.dap.nvim-dap')
require('user.dap.nvim-dap-ui')
require('user.dap.nvim-dap-python')
--require('user.dap.nvim-dap-vtxt')

-- File explorer
require('user.plugins.nvim-tree')

-- Git
require('user.plugins.gitsigns')

-- Greeter
require('user.plugins.alpha-nvim')

-- LSP setup (mason)
require('user.lsp.lsp_lines')
require('user.lsp.lspsaga')
require('user.lsp.mason')
require('user.lsp.mason-lspconfig')
require('user.lsp.mason-nvim-dap')
require('user.lsp.tsserver')

-- Plugins
require('user.plugins.autopairs')
require('user.plugins.colorizer')
require('user.plugins.indent-blankline')
require('user.plugins.telescope')
require('user.plugins.treesitter')
require('user.plugins.which-key')

-- Snippet
require('user.plugins.luasnip')

-- Statusline
require('user.plugins.lualine')

-- Rust
-- require('user.plugins.rust-tools')

-- TODO
--require('user.plugins.null-ls')
--require('user.plugins.nvim-ufo')
