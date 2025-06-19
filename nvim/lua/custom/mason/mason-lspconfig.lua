-- Mason-lspconfig
-- https://github.com/williamboman/mason-lspconfig.nvim

return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        -- Bootstrap LSP servers
        ---@type string[]
        ensure_installed = {
          "asm_lsp",       -- Assembly
          "bashls",        -- Bash
          "clangd",        -- C/C++
          "jsonls",        -- Json
          "lua_ls",        -- Lua
          "marksman",      -- Markdown
          "ts_ls",         -- TypeScript / JavaScript (tsserver)
          "pyright"        -- Python (npm required)
          -- "rust_analyzer", -- Rust (install via pacman/toolchain)
        },
        ---@type boolean
        automatic_installation = true,

        -- Handlers
        -- `:h mason-lspconfig.setup_handlers()`

        -- Rust {{{
        -- Prevent invoking `lspconfig.rust_analyzer`
        -- `:h rustaceanvim.mason`
        ['rust_analyzer'] = function() end,
        -- }}}
      })
    end
  }
}
