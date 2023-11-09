-- nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig

-- Additional capabilities by nvim-cmp
-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')

-- Language servers
local servers = {
  'lua_ls',
  'pyright',
  --'pylsp',
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
  }
end

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
