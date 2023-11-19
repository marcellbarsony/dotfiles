-- TypeScript & JavaScript Language Server
-- https://github.com/typescript-language-server/typescript-language-server
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver

local lspconfig = require'lspconfig'

lspconfig.tsserver.setup{
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    completions = {
      completeFunctionCalls = true
    }
  }
}
