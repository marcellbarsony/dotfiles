-- Python
-- https://neovim.io/doc/user/filetype.html#ft-python-plugin

-- LSP
vim.lsp.inlay_hint.enable()

-- DAP-Python
-- :h dap-python
vim.keymap.set("n", "<leader>ps", "<cmd>lua require('dap-python').debug_selection()<CR>", { desc = "Debug [Selection]" })
vim.keymap.set("n", "<leader>pt", "<cmd>lua require('dap-python').test_class()<CR>", { desc = "Test [Class]" })
vim.keymap.set("n", "<leader>pT", "<cmd>lua require('dap-python').test_method()<CR>", { desc = "Test [Method]" })

-- Keymaps
vim.keymap.set("n", "<leader>pr", "<cmd>!./%<CR>", { desc = "Run" })
