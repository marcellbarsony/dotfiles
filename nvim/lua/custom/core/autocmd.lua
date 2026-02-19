-- Autocommands
-- `:h autocmd.txt`
-- `:h events`

local A = vim.api
local group = A.nvim_create_augroup("AuGroup", { clear = true })


-- Colorscheme {{{
vim.cmd("colorscheme theme")
A.nvim_create_autocmd("Signal", {
  desc = "Reload colorscheme on `SIGUSR1`",
  group = group,
  pattern = "SIGUSR1",
  command = "colorscheme theme",
})
-- }}}

-- Comments {{{
vim.api.nvim_create_autocmd("FileType", {
  desc = "Don't continue commenting on new line",
  group = vim.api.nvim_create_augroup("no_auto_comment", {}),
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})
-- }}}

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
    vim.bo.filetype = "binary"

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

-- Restore position {{{
vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Restore cursor position from previous session",
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
      -- defer centering slightly so it's applied after render
      vim.schedule(function()
        vim.cmd("normal! zz")
      end)
    end
  end,
})
-- }}}

-- Splits {{{
vim.api.nvim_create_autocmd("VimResized", {
  desc = "Resize splits automatically on window resize",
  command = "wincmd =",
})
-- }}}

-- Whitespace {{{
-- Remove trailing whitespace on save while preserving cursor position
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*' },
  callback = function()
    local save_cursor = vim.fn.getpos('.')
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos('.', save_cursor)
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

-- Inactive {{{

-- Highlight References {{{
-- vim.api.nvim_create_autocmd("CursorMoved", {
--   group = vim.api.nvim_create_augroup("LspReferenceHighlight", { clear = true }),
--   desc = "Highlight references under cursor",
--   callback = function()
--     -- Only if the cursor is not in INSERT mode
--     if vim.fn.mode() ~= "i" then
--       local clients = vim.lsp.get_clients({ bufnr = 0 })
--       local supports_highlight = false
--       for _, client in ipairs(clients) do
--         if client.server_capabilities.documentHighlightProvider then
--           supports_highlight = true
--           break -- Found a supporting client, no need to check others
--         end
--       end
--
--       -- Proceed on active LSP and supported feature
--       if supports_highlight then
--         vim.lsp.buf.clear_references()
--         vim.lsp.buf.document_highlight()
--       end
--     end
--   end,
-- })
--
-- -- Clear Highlights
-- vim.api.nvim_create_autocmd("CursorMovedI", {
--   group = "LspReferenceHighlight",
--   desc = "Clear highlights when entering INSERT mode",
--   callback = function()
--     vim.lsp.buf.clear_references()
--   end,
-- })
-- }}}

-- }}}
