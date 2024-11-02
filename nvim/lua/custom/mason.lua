-- Mason
-- https://github.com/williamboman/mason.nvim

return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "onsails/lspkind.nvim",
    },
    config = function ()
      local lspconfig = require("lspconfig")
      local mason = require("mason")
      local mason_dap = require("mason-nvim-dap")
      local mason_lspconfig = require("mason-lspconfig")

      -- Mason Setup {{{
      mason.setup({
        PATH = "prepend",

        log_level = vim.log.levels.INFO,

        max_concurrent_installers = 5,

        registries = {
          "github:mason-org/mason-registry",
        },

        providers = {
          "mason.providers.registry-api",
          "mason.providers.client",
        },

        github = {
          download_url_template = "https://github.com/%s/releases/download/%s/%s",
        },

        pip = {
          upgrade_pip = true,
          install_args = {},
        },

        ui = {
          check_outdated_packages_on_open = false,
          border = "none",
          width = 0.8,
          height = 0.8,
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          },
          keymaps = {
            toggle_package_expand = "<CR>",
            install_package = "i",
            update_package = "u",
            check_package_version = "v",
            update_all_packages = "U",
            check_outdated_packages = "C",
            uninstall_package = "x",
            cancel_installation = "<C-c>",
            apply_language_filter = "<C-f>",
            toggle_package_install_log = "<CR>",
            toggle_help = "g?",
          },
        },
      })
      -- }}}

      -- Mason LSP Config {{{
      mason_lspconfig.setup({
        -- Bootstrap LSP servers
        ---@type string[]
        ensure_installed = {
          "asm_lsp",       -- Assembly
          "bashls",        -- Bash
          "clangd",        -- C/C++
          "jsonls",        -- Json
          "lua_ls",        -- Lua
          "rust_analyzer", -- Rust
          "ts_ls",         -- TypeScript / JavaScript (tsserver)
          "pyright",       -- Python (npm required)
        },
        ---@type boolean
        automatic_installation = false,

        -- Handlers {{{
        -- `:h mason-lspconfig.setup_handlers()`
        handlers = {
          -- Default {{{
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,
          -- }}}

          -- Json {{{
          ["jsonls"] = function()
            lspconfig["jsonls"].setup({
              settings = {
                settings = {
                  json = {
                    validate = { enable = true },
                  },
                },
              },
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
                    enable = true,
                  },
                },
              },
            })
          end,
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
        },
        -- }}}
      })
      -- }}}

      -- Mason DAP {{{
      -- https://github.com/jay-babu/mason-nvim-dap.nvim
      mason_dap.setup({
        ensure_installed = {
          "python",      -- debugpy
          "codelldb",    -- rust
        },
        automatic_installation = true,
      })
      -- }}}
    end
  },
}
