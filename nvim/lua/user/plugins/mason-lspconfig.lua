-- mason-lspconfig.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim


require("mason-lspconfig").setup({

  -- Bootstrap lsp servers
  ensure_installed = {
    "lua_ls", -- Lua
    "rust_analyzer", -- Rust
    "tsserver", -- typescript
    -- "pyright", -- Requires npm
  }

})
