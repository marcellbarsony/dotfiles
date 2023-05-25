-- mason-lspconfig.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim


require("mason-lspconfig").setup({

  -- Bootstrap lsp servers
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    -- "pyright", -- Requires npm
  }

})
