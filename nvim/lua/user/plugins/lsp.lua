-- LSP config

-- Require servers
local nvim_lsp = require('lspconfig')
local servers = { 'pyright' }

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup{}
end

-- Attach servers

