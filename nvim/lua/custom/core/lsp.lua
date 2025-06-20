-- LSP config
-- `:h lsp`

vim.lsp.enable({
  "clangd",
  "bashls",
  "luals",
  "pyright"
})

-- Diagnostics {{{
-- `:h vim.diagnostic`
-- `:h diagnostic-signs`
vim.diagnostic.config({
  float = {
    source = true,
    border = {
      { "", "FloatBorder" },  -- ┌
      { "", "FloatBorder" },  -- ─
      { "", "FloatBorder" },  -- ┐
      { "", "FloatBorder" },  -- │
      { "", "FloatBorder" },  -- ┘
      { "", "FloatBorder" },  -- ─
      { "", "FloatBorder" },  -- └
      { "", "FloatBorder" },  -- │
    }
  },
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "E",
      [vim.diagnostic.severity.WARN] = "W",
      [vim.diagnostic.severity.HINT] = "H",
      [vim.diagnostic.severity.INFO] = "I",
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticError",
      [vim.diagnostic.severity.WARN] = "DiagnosticWarning",
      [vim.diagnostic.severity.HINT] = "DiagnosticHint",
      [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
    },
  },
  underline = true,
  update_in_insert = false,
  virtual_lines = false,
  virtual_text = false
})
-- }}}

-- Floats {{{
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
