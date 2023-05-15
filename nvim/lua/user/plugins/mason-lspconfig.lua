-- mason-lspconfig.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim


require("mason-lspconfig").setup({

  -- Bootstrap lsp servers
  ensure_installed = { "pylsp", "lua_ls", "rust_analyzer" }

})
