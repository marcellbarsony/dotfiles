-- py_lsp.nvim
-- https://github.com/HallerPatrick/py_lsp.nvim

require'py_lsp'.setup {
  host_python = "/usr/bin/python",
  default_venv_name = "venv"
}
