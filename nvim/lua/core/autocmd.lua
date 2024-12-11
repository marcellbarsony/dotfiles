-- Autocommands
-- `:h autocmd.txt`
-- `:h events`

local A = vim.api
local group = A.nvim_create_augroup("AuGroup", { clear = true })

-- Filetype [Custom] {{{
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
    [".*tmux.*conf$"] = "tmux",
  },
  filename = {
    ["yup.lock"] = "yaml",
  }
})
-- }}}

-- Filetype [Bindings] {{{
-- Hex
A.nvim_create_augroup("OutFileTypeKeybindings", { clear = true })
A.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = "OutFileTypeKeybindings",
  pattern = {
    "*.a", "*.app", "*.bin",
    "*.dll", "*.elf", "*.exe",
    "*.hex", "*.lib", "*.o",
    "*.out", "*.so"
  },
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>hd", "<cmd>HexDump<CR>", { desc = "Dump" })
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>ht", "<cmd>HexToggle<CR>", { desc = "Toggle" })
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>ha", "<cmd>HexAssemble<CR>", { desc = "Assemble" })
  end
})
-- }}}

-- Help {{{
A.nvim_create_autocmd("BufEnter", {
  desc = "Open help vertically",
  group = group,
  pattern = "*.txt",
  callback = function()
    if vim.bo.buftype == "help" then
      A.nvim_cmd({ cmd = "wincmd", args = { "L" } }, {})
      vim.keymap.set("n", "q", "<CMD>q<CR>", { buffer = 0 })
    end
  end
})
-- }}}

-- Yank {{{
A.nvim_create_autocmd("TextYankPost", {
  desc= "Highlight region on yank",
  group = group,
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end
})
-- }}}
