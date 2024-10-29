-- Markdown
-- https://neovim.io/doc/user/filetype.html#ft-markdown-plugin

-- Options
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4

-- LSP
vim.lsp.inlay_hint.enable()

-- Keymaps
-- vim.keymap.set("n", "<leader>lm", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Markdown preview" })
-- vim.keymap.set("n", "<leader>lm", "<cmd>MarkdownPreview<CR>", { desc = "Markdown preview start" })
-- vim.keymap.set("n", "<leader>lm", "<cmd>MarkdownPreviewStop<CR>", { desc = "Markdown Preiview stop" })
