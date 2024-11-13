-- Python
-- https://neovim.io/doc/user/filetype.html#ft-python-plugin

-- LSP
vim.lsp.inlay_hint.enable()

-- DAP-Python
-- h: dap-python
vim.keymap.set("n", "<leader>pc", "<cmd>lua require('dap-python').test_class()<CR>", { desc = "Class" })
vim.keymap.set("n", "<leader>ps", "<cmd>lua require('dap-python').debug_selection()<CR>", { desc = "Selection" })
vim.keymap.set("n", "<leader>pm", "<cmd>lua require('dap-python').test_method()<CR>", { desc = "Method" })

-- Py-lsp
-- vim.keymap.set("n", "<leader>pa", "<cmd>PyLspActivateVenv<CR>", { desc = "Activate" })
-- vim.keymap.set("n", "<leader>pc", "<cmd>PyLspCurrentVenv<CR>", { desc = "Current" })
-- vim.keymap.set("n", "<leader>pf", "<cmd>PyLspFindVenvs<CR>", { desc = "Find" })
-- vim.keymap.set("n", "<leader>pn", "<cmd>PyLspCreateVenv<CR>", { desc = "New" })
-- vim.keymap.set("n", "<leader>pi", "<cmd>PyRun -m pip install -r requirements.txt<CR>", { desc = "Install dependencies" })
-- vim.keymap.set("n", "<leader>pt", "<cmd>PyLspDeactivateVenv<CR>", { desc = "Deactivate" })
