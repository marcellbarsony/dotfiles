local A = vim.api
local num_au = A.nvim_create_augroup("NUMTOSTR", { clear = true })

-- {{{ Custom filetypes
vim.filetype.add({
    extension = {
        eslintrc = "json",
        prettierrc = "json",
        conf = "conf",
        mdx = "markdown",
        mjml = "html",
    },
    pattern = {
        [".*%.env.*"] = "sh",
        [".*ignore"] = "conf",
        -- [".*tmux.*conf$"] = "tmux",
    },
    filename = {
        ["yup.lock"] = "yaml",
    },
})
-- }}}

-- {{{ Open help vertically & `q` to exit
A.nvim_create_autocmd("BufEnter", {
    group = num_au,
    pattern = "*.txt",
    callback = function()
        if vim.bo.buftype == "help" then
            A.nvim_cmd({ cmd = "wincmd", args = { "L" } }, {})
            vim.keymap.set("n", "q", "<CMD>q<CR>", { buffer = 0 })
        end
    end,
})
-- }}}

-- {{{ Highlight region on Yank
A.nvim_create_autocmd("TextYankPost", {
    group = num_au,
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 120 })
    end,
})
-- }}}
