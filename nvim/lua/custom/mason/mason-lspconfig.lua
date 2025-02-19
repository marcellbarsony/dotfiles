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
      local lspconfig = require("lspconfig")
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
          "rust_analyzer", -- Rust
          "ts_ls",         -- TypeScript / JavaScript (tsserver)
          "pyright"        -- Python (npm required)
        },
        ---@type boolean
        automatic_installation = true,

        -- Handlers
        -- `:h mason-lspconfig.setup_handlers()`
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities
            })
          end,

          -- clangd {{{
          ["clangd"] = function()
            lspconfig["clangd"].setup({
              -- cmd = {
              --   "clangd",
              --   "--fallback-style=webkit"
              -- }
            })
          end,
          -- }}}

          -- Json {{{
          ["jsonls"] = function()
            lspconfig["jsonls"].setup({
              settings = {
                settings = {
                  json = {
                    validate = { enable = true }
                  }
                }
              }
            })
          end,
          -- }}}

          -- Lua {{{
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              filetypes = { "lua" },
              settings = { -- custom settings for lua
                Lua = {
                  -- make the language server recognize "vim" global
                  diagnostics = { globals = { "vim", "require" } },
                  hint = {
                    enable = true
                  }
                }
              }
            })
          end,
          -- }}}

          -- Marksman {{{
          ["marksman"] = function()
            lspconfig["marksman"].setup({})
          end,
          -- }}}

          -- Rust {{{
          -- Prevent invoking `lspconfig.rust_analyzer`
          -- `:h rustaceanvim.mason`
          ['rust_analyzer'] = function() end,
          -- }}}

          -- TypeScript & JavaScript {{{
          -- https://github.com/typescript-language-server/typescript-language-server
          -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
          ["ts_ls"] = function()
            lspconfig.ts_ls.setup({
              on_attach = on_attach,
              flags = lsp_flags,
              settings = {
                completions = {
                  completeFunctionCalls = true
                }
              }
            })
          end,
          -- }}}
        }
      })
    end
  }
}
