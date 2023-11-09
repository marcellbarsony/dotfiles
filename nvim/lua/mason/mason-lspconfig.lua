-- mason-lspconfig.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim

-- Lspconfig
-- https://github.com/williamboman/mason-lspconfig.nvim#configuration
require("mason-lspconfig").setup({
  -- Bootstrap lsp servers
  ensure_installed = {
    "lua_ls", -- Lua
    "rust_analyzer", -- Rust
    "tsserver", -- Typescript / Javascript
    -- "pyright", -- requires npm
  },
  automatic_installation = false,
  handlers = nil,
})
