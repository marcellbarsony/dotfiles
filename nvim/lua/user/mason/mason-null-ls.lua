-- mason-null-ls.nvim
-- https://github.com/jay-babu/mason-null-ls.nvim


-- Configuration
-- https://github.com/jay-babu/mason-null-ls.nvim#configuration
require("mason-null-ls").setup({
  ensure_installed = { 
    -- Rustfmt is now deprecated - should be installed with rustup
    -- "rustfmt",
  }
})
