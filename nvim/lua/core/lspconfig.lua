-- nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig
-- :help lsp-config

-- LSP config
local lspconfig = require('lspconfig')

-- Additional capabilities by nvim-cmp
-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion#nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- LSP servers
local servers = {
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

-- KEYMAPS
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    -- Format
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = args.buf, desc = "Format" })

    -- Code Action
    --vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = args.buf, desc = "Action" })

    -- Calls
    --vim.keymap.set("n", "<leader>lci", vim.lsp.buf.incoming_calls, { buffer = args.buf, desc = "Incoming" })
    --vim.keymap.set("n", "<leader>lco", vim.lsp.buf.outgoing_calls, { buffer = args.buf, desc = "Outgoing" })

    -- Definition
    --vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { buffer = args.buf, desc = "Definition" })
    --vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, { buffer = args.buf, desc = "Type" })
    --vim.keymap.set("n", "<leader>le", vim.lsp.buf.declaration, { buffer = args.buf, desc = "Declaration" })

    -- Hover
    --vim.keymap.set("n", "<leader>li", vim.lsp.buf.hover, { buffer = args.buf, desc = "Info [Hover]" })

    -- Implementation
    --vim.keymap.set("n", "<leader>lk", vim.lsp.buf.implementation, { buffer = args.buf, desc = "Implementation" })

    -- Rename
    --vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = args.buf, desc = "Rename" })

    -- References
    --vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { buffer = args.buf, desc = "References" })
  end,
})

-- Diagnostics
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = false,
    update_in_insert = false,
    severity_sort = true,
    })

-- Signs
local signs = {
  Error = "󰬟",
  Warn = "",
  Hint = "󰌵",
  Info = ""
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {
    text = icon,
    texthl = hl,
    --numhl = hl
    })
end

-- UI Customization
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
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

local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
