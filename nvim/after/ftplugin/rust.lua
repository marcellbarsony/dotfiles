-- Rust
-- https://neovim.io/doc/user/ft_rust.html#ft_rust.txt

-- Keymaps (Rustaceanvim) {{{
-- https://github.com/mrcjkb/rustaceanvim?tab=readme-ov-file#zap-quick-setup
local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<leader>ca",
  function()
    vim.cmd.RustLsp("codeAction")  -- grouping
    -- vim.lsp.buf.codeAction()  -- no grouping
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

vim.keymap.set("n", "<leader>cD",
  function()
    vim.cmd.RustLsp("openDocs")
  end,
  { silent = true, buffer = bufnr, desc = "Open docs" }
)

vim.keymap.set("n", "<leader>ce",
  function()
    vim.cmd.RustLsp("explainError")
  end,
  { silent = true, buffer = bufnr, desc = "Explain error" }
)

vim.keymap.set("n", "<leader>cE",
  function()
    vim.cmd.RustLsp("expandMacro")
  end,
  { silent = true, buffer = bufnr, desc = "Expand macro" }
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

vim.keymap.set("n", "<leader>cR",
  function()
    vim.cmd.RustLsp("relatedDiagnostics")
  end,
  { silent = true, buffer = bufnr, desc = "Related Diagnostics" }
)
-- }}}

-- LSP {{{
vim.lsp.inlay_hint.enable()
-- }}}
