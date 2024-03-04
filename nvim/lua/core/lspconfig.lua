-- nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig
-- :help lsp-config

-- LSP config & Additional capabilities (nvim-cmp)
-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion#nvim-cmp
-- https://github.com/neovim/nvim-lspconfig/wiki/Snippets#nvim-cmp-and-luasnip
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- {{{ LSP Servers
local servers = {
  "lua_ls",
  "pyright",
  "rust_analyzer",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
  }
end
-- }}}

-- {{{ Borders
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#borders
local border = {
  {"┌", "FloatBorder"},
  {"─", "FloatBorder"},
  {"┐", "FloatBorder"},
  {"│", "FloatBorder"},
  {"┘", "FloatBorder"},
  {"─", "FloatBorder"},
  {"└", "FloatBorder"},
  {"│", "FloatBorder"},
}
-- }}}

-- {{{ Float
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
-- vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]
-- }}}

-- {{{ Keymaps [Global]
-- :help vim.diagnostic.*
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { opts = opts, desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { opts = opts, desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { opts = opts, desc = "Diagnostics" })
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { opts = opts, desc = "Set localist" })

-- Calls
-- vim.keymap.set("n", "<leader>lci", vim.lsp.buf.incoming_calls, { buffer = args.buf, desc = "Incoming" })
-- vim.keymap.set("n", "<leader>lco", vim.lsp.buf.outgoing_calls, { buffer = args.buf, desc = "Outgoing" })

-- Codelens
-- vim.keymap.set("n", "<leader>lxx", vim.lsp.codelens.refresh, { buffer = args.buf, desc = "Codelens Refresh" })
-- vim.keymap.set("n", "<leader>lxr", vim.lsp.codelens.run, { buffer = args.buf, desc = "Codelens Run" })
-- vim.keymap.set("n", "<leader>lxc", vim.lsp.codelens.clear, { buffer = args.buf, desc = "Codelens Clear" })
-- vim.keymap.set("n", "<leader>lxc", vim.lsp.codelens.display, { buffer = bufnr, desc = "Codelens Clear" })
-- }}}

-- {{{ Keymaps [LSP]
-- :help vim.lsp.*
-- https://github.com/neovim/nvim-lspconfig#suggested-configuration
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc" -- Enable completion triggered by <c-x><c-o>
    local opts = { buffer = ev.buf }

    -- Code action
    -- vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)

    -- Documentation
    vim.keymap.set("n", "<leader>lk", vim.lsp.buf.hover, opts) -- !!!

    -- Go-to
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    -- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
    -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

    -- Format
    vim.keymap.set("n", "<leader>lf", function()
      vim.lsp.buf.format { async = true }
    end, opts)

    -- References
    -- vim.keymap.set("n", "<leader>lv", vim.lsp.buf.references, opts)

    -- Rename
    -- vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)

    -- Signature help
    -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

    -- Workspace folder
    -- vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set("n", "<leader>wl", function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)

  end,
})
-- }}}

-- {{{ Diagnostics
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

-- {{{ Diagnostics [Symbols]
-- :h diagnostic-signs
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#change-diagnostic-symbols-in-the-sign-column-gutter
-- local signs = { Error = "󰬟",   Warn = "", Hint = "", Info = "" }
-- local signs = { Error = "",   Warn = "", Hint = "", Info = "" }
local signs = { Error = "x",   Warn = "!", Hint = "", Info = "i" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {
    numhl = hl,
    -- text = icon,
    -- texthl = hl,
  })
end
-- }}}
