-- Rust
-- https://neovim.io/doc/user/ft_rust.html#ft_rust.txt
-- vim.keymap.set("n", "<leader>cC", "<cmd>w<CR><cmd>!clang % -o %:r && ./%:r<CR>", { desc = "Compile & Run" })
-- vim.keymap.set("n", "<leader>cr", "<cmd>w<CR><cmd>!./%:r<CR>", { desc = "Run" })

-- Keymaps (Rustaceanvim) {{{
-- https://github.com/mrcjkb/rustaceanvim?tab=readme-ov-file#zap-quick-setup
local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<leader>rh",
  "<cmd>checkhealth rustaceanvim<CR>",
  { silent = true, buffer = bufnr, desc = "Health" }
)

vim.keymap.set("n", "<leader>ra",
  function()
    vim.cmd.RustLsp("codeAction") -- grouping
    -- vim.lsp.buf.codeAction()   -- no grouping
  end,
  { silent = true, buffer = bufnr, desc = "Code action" }
)

vim.keymap.set("n", "<leader>rd",
  function()
    vim.cmd.RustLsp("debuggables")
  end,
  { silent = true, buffer = bufnr, desc = "Debuggables" }
)

vim.keymap.set("n", "<leader>rh",
  function()
    vim.cmd.RustLsp("hover", "actions")
  end,
  { silent = true, buffer = bufnr, desc = "Hover actions" }
)

vim.keymap.set("n", "<leader>rj",
  function()
    vim.cmd.RustLsp("joinLines")
  end,
  { silent = true, buffer = bufnr, desc = "Join lines" }
)

vim.keymap.set("n", "<leader>rr",
  function()
    vim.cmd.RustLsp("runnables")
  end,
  { silent = true, buffer = bufnr, desc = "Runnables" }
)
-- }}}

-- LSP
vim.lsp.inlay_hint.enable()
