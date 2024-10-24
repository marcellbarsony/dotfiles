-- https://github.com/nyoom-engineering/oxocarbon.nvim

vim.opt.background = "dark" -- dark/light

vim.cmd("colorscheme oxocarbon")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
