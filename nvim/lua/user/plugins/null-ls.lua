-- Null-ls.nvim
-- https://github.com/jose-elias-alvarez/null-ls.nvim

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.rustfmt,
        --null_ls.builtins.formatting.stylua,
        --null_ls.builtins.diagnostics.eslint,
        --null_ls.builtins.completion.spell,
    },
})

