-- Null-ls.nvim

-- Setup
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.black,
    },
})
