-- Indent blankline
-- https://github.com/lukas-reineke/indent-blankline.nvim

-- GUI FG
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#273344 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent2 guifg=#61AFEF gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent3 guifg=#61AFEF gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent4 guifg=#61AFEF gui=nocombine]]

-- GUI BG
--vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent3 guibg=#1a1a1a gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent4 guibg=#1a1a1a gui=nocombine]]

vim.opt.list = true

require("indent_blankline").setup {

    space_char_blankline = " ",
    --char = "",

    -- GUI FG
    char_highlight_list = {
        "IndentBlanklineIndent1",
        --"IndentBlanklineIndent2",
        --"IndentBlanklineIndent3",
        --"IndentBlanklineIndent4",
    },

    -- GUI BG
    --space_char_highlight_list = {
    --    "IndentBlanklineIndent1",
    --    "IndentBlanklineIndent2",
    --    "IndentBlanklineIndent4",
    --},
 
    show_trailing_blankline_indent = false,

}

