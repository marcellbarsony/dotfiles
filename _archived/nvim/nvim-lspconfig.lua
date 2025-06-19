-- Lspconfig
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion#nvim-cmp
-- https://github.com/neovim/nvim-lspconfig/wiki/Snippets#nvim-cmp-and-luasnip
-- `:h lsp-config`
-- `:h lspconfig-keybindings`

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    keys = {
      -- Keys {{{
      -- Code action
      { mode = { "n", "v" }, "<leader>la", vim.lsp.buf.code_action, desc = "Action" },

      -- Diagnostics
      { "<leader>lD", vim.diagnostic.open_float, opts = opts, desc = "Diagnostics" },
      { "]d", vim.diagnostic.goto_next, opts = opts, desc = "Next diagnostic" },  -- default map
      { "[d", vim.diagnostic.goto_prev, opts = opts, desc = "Previous diagnostic" },  -- default map
      -- { "<leader>ll", vim.diagnostic.setloclist, opts = opts, desc = "Set localist" },

      -- Documentation
      -- Default: nvim-lspconfig maps `K` to vim.lsp.buf.hover()
      { "<leader>ld", vim.lsp.buf.hover, desc = "Documentation" },

      -- Formatting
      { "<leader>lf", function() vim.lsp.buf.format { async = true } end, desc = "Format" },

      -- Go-To
      { "gd", vim.lsp.buf.definition, desc = "Definition" },
      -- { "gt", vim.lsp.buf.type_definition, desc = "Type definition" },
      -- { "gD", vim.lsp.buf.declaration, desc = "Declaration" },

      Inlay hints
      { "<leader>li", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }, { bufnr = 0 })
      end, desc = "Inlay hints" },

      -- Rename
      { "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },

      -- Signature help
      { "<leader>lk", vim.lsp.buf.signature_help, desc = "Signature help" },

      -- LSP Help
      { "<leader>lhi", "<cmd>LspInfo<CR>", desc = "Info" },
      { "<leader>lhl", "<cmd>LspLog<CR>", desc = "Log" },

      -- Calls
      -- { "<leader>lci", vim.lsp.buf.incoming_calls, buffer = args.buf, desc = "Incoming" }, -- Telescope
      -- { "<leader>lco", vim.lsp.buf.outgoing_calls, buffer = args.buf, desc = "Outgoing" }, -- Telescope

      -- References
      -- { "<leader>lx", vim.lsp.buf.references, desc = "References" },
      -- { "<leader>lv", vim.lsp.buf.clear_references, desc = "Clear references" },

      -- Workspace folder
      -- { "<leader>wa", vim.lsp.buf.add_workspace_folder, desc = "Workspace folder [Add]" },
      -- { "<leader>wr", vim.lsp.buf.remove_workspace_folder, desc = "Workspace folder [Remove]" },
      -- { "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, desc = "Workspace folder [List]" },
      -- }}}
    },
    config = function()
      -- Capabilities {{{
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- }}}

      -- LSP Servers {{{
      local lspconfig = require("lspconfig")

      local servers = {
        "asm_lsp",
        "bashls",
        "clangd",
        "lua_ls",
        "pyright"
      }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities
        }
      end
      -- }}}

      -- Diagnostics {{{
      -- `:h vim.diagnostic`
      -- `:h diagnostic-signs`
      -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#customizing-how-diagnostics-are-displayed
      -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#change-diagnostic-symbols-in-the-sign-column-gutter
      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

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
        { "", "FloatBorder" },  -- ┌
        { "", "FloatBorder" },  -- ─
        { "", "FloatBorder" },  -- ┐
        { "", "FloatBorder" },  -- │
        { "", "FloatBorder" },  -- ┘
        { "", "FloatBorder" },  -- ─
        { "", "FloatBorder" },  -- └
        { "", "FloatBorder" },  -- │
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
  }
}
