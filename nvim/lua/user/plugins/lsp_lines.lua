-- lsp_lines.nvim
-- https://git.sr.ht/~whynothugo/lsp_lines.nvim

require("lsp_lines").setup()

vim.diagnostic.config({
  -- lsp_lines toggle
  virtual_lines = true,
  virtual_lines = { only_current_line = false },
  -- redundancy
  virtual_text = false,
})
