-- Python
-- https://neovim.io/doc/user/filetype.html#ft-python-plugin

-- LSP
vim.lsp.inlay_hint.enable()

-- DAP-Python
-- `:h dap-python`
vim.keymap.set("n", "<leader>cs", "<cmd>lua require('dap-python').debug_selection()<CR>", { desc = "Debug [Selection]" })
vim.keymap.set("n", "<leader>ct", "<cmd>lua require('dap-python').test_class()<CR>", { desc = "Test [Class]" })
vim.keymap.set("n", "<leader>cT", "<cmd>lua require('dap-python').test_method()<CR>", { desc = "Test [Method]" })

-- Keymaps
vim.keymap.set("n", "<leader>cr", "<cmd>!./%<CR>", { desc = "Run" })
