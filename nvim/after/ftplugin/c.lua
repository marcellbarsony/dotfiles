-- C lang
-- https://neovim.io/doc/user/syntax.html#ft-c-syntax

-- Keymaps {{{
-- Clang
vim.keymap.set("n", "<leader>cc",
  "<cmd>w<CR>" ..
  "<cmd>!clang % -o %:r<CR>",
  { desc = "Compile" }
)

vim.keymap.set("n", "<leader>cC",
  "<cmd>w<CR>" ..
  "<cmd>!clang % -o %:r && ./%:r<CR>",
  { desc = "Compile & Run" }
)

vim.keymap.set("n", "<leader>cr",
  "<cmd>w<CR>" ..
  "<cmd>!./%:r<CR>",
  { desc = "Run" }
)

-- Clang-format
-- https://clang.llvm.org/docs/ClangFormatStyleOptions.html
vim.keymap.set("n", "<leader>lf",
  "<cmd>%!clang-format " ..
  "-style=" ..
  "'{" ..
  "IndentWidth: 4," ..
  "ReflowComments: false," ..
  "}'" ..
  "<CR>" ..
  "<cmd>w<CR>",
  { desc = "Format [Clang]" }
)
-- }}}

-- LSP
vim.lsp.inlay_hint.enable()
