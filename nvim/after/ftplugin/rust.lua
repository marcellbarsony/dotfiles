-- Rust
-- https://neovim.io/doc/user/ft_rust.html#ft_rust.txt

-- Keymaps (Rustaceanvim) {{{
-- https://github.com/mrcjkb/rustaceanvim?tab=readme-ov-file#zap-quick-setup
local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<leader>ca",
  function()
    vim.cmd.RustLsp("codeAction") -- grouping
    -- vim.lsp.buf.codeAction()   -- no grouping
  end,
  { silent = true, buffer = bufnr, desc = "Action" }
)

vim.keymap.set("n", "<leader>cb",
  "<cmd>w<CR>" ..
  "<cmd>!RUST_BACKTRACE=1 cargo run %<CR>",
  { desc = "Backtrace" }
)

vim.keymap.set("n", "<leader>cd",
  function()
    vim.cmd.RustLsp("debuggables")
  end,
  { silent = true, buffer = bufnr, desc = "Debuggables" }
)

vim.keymap.set("n", "<leader>ch",
  function()
    vim.cmd.RustLsp("hover", "actions")
  end,
  { silent = true, buffer = bufnr, desc = "Hover actions" }
)

vim.keymap.set("n", "<leader>cj",
  function()
    vim.cmd.RustLsp("joinLines")
  end,
  { silent = true, buffer = bufnr, desc = "Join lines" }
)

vim.keymap.set("n", "<leader>cr",
  function()
    vim.cmd.RustLsp("runnables")
  end,
  { silent = true, buffer = bufnr, desc = "Runnables" }
)
-- }}}

-- LSP
vim.lsp.inlay_hint.enable()
