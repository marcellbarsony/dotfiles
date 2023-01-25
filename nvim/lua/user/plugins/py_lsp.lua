-- py_lsp.nvim
-- https://github.com/HallerPatrick/py_lsp.nvim

require'py_lsp'.setup {
  auto_source = true,
  language_server = "pyright",
  on_attach = nil,
  source_strategies = {"default", "poetry", "conda", "system"},
  capabilities = nil,
  host_python = nil
  --host_python = "/usr/bin/python"
}

