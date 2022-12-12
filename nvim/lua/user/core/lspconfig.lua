-- nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig
-- Dependencies:

-- Require servers
local nvim_lsp = require('lspconfig')
local servers = {
  'pyright',
  'pylsp',
  --'sumneko_lua',
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup{
    on_attach = on_attach,
    flags = lsp_flags,
  }
end

-- Attach servers

-- Diagnostics
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = false,
    update_in_insert = false,
    severity_sort = true,
    })

-- Diagnostics symbols
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {
    text = icon,
    texthl = hl,
    --numhl = hl
    })
end

