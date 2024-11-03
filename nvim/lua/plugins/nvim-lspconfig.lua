-- Lspconfig additional capabilities
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion#nvim-cmp
-- https://github.com/neovim/nvim-lspconfig/wiki/Snippets#nvim-cmp-and-luasnip
-- `:h lsp-config`

return {
  {
    "neovim/nvim-lspconfig",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      -- LSP Servers {{{
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local servers = {
        "asm_lsp",
        "bashls",
        "clangd",
        "lua_ls",
        "pyright",
      }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          on_attach = on_attach,
          capabilities = capabilities,
          flags = lsp_flags,
        }
      end
      -- }}}

      -- Diagnostics {{{
      -- :help vim.diagnostic
      -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#customizing-how-diagnostics-are-displayed
      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
      -- }}}

      -- Diagnostics [Signs] {{{
      -- :h diagnostic-signs
      -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#change-diagnostic-symbols-in-the-sign-column-gutter
      local signs = { Error = "x", Warn = "!", Hint = "", Info = "i" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, {
          numhl = hl,
          -- text = icon,
          -- texthl = hl,
        })
      end
      -- }}}

      -- Floats {{{
      -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#borders
      local border = {
        { "┌", "FloatBorder" },
        { "─", "FloatBorder" },
        { "┐", "FloatBorder" },
        { "│", "FloatBorder" },
        { "┘", "FloatBorder" },
        { "─", "FloatBorder" },
        { "└", "FloatBorder" },
        { "│", "FloatBorder" },
      }

      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or border
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end

      vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white ]]
      -- vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
      -- vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]
      -- }}}
    end
  },
}
