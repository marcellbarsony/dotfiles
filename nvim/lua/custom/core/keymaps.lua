-- Keymaps
-- https://neovim.io/doc/user/map.html


-- Modes {{{
-- n - normal
-- i - insert
-- v - visual
-- x - visual block
-- t - term
-- c - command
-- }}}

-- Functions {{{
local function map(mode, key, cmd, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, key, cmd, options)
end
-- }}}

-- Leader {{{
map("n", "<Bslash>", "", { desc = "LEADER" })
-- }}}

-- Unmap {{{
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")
-- }}}

-- Buffers {{{
-- `:h buffer-hidden`
map("n", "<Tab>", "<cmd>bn<CR>", { desc = "Buffer [Next]" })
map("n", "<S-Tab>", "<cmd>bp<CR>", { desc = "Buffer [Prev]" })
map("n", "<C-^>", "<cmd>e #<CR>", { desc = "Alternate file" })
map("n", "<C-'>", "<cmd>b#<CR>", { desc = "Buffer [To last]" })
map("n", "<C-q>", "<cmd>bd<CR>", { desc = "Buffer [Delete]" })
-- }}}

-- Clipboard (Yank) {{{
map("n", "y", "\"+y", { desc = "Yank [Global]" })
map("v", "y", "\"+y", { desc = "Yank [Global]" })
map("x", "p", [["_dp]], { desc = "Paste [Global]" })
-- }}}

-- Delete {{{
map("n", "x", '"_x', { desc = "Delete" })
-- }}}

-- Highlights {{{
map("n", "<C-c>", "<cmd>nohlsearch<CR>", { desc = "Clear" })
map("n", "<leader>ls", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Substitute" })
-- }}}

-- Lazy {{{
map("n", "<leader>vll", "<cmd>Lazy<CR>", { desc = "Lazy" })
map("n", "<leader>vlc", "<cmd>Lazy check<CR>", { desc = "Check" })
map("n", "<leader>vlL", "<cmd>Lazy log<CR>", { desc = "Log" })
map("n", "<leader>vlr", "<cmd>Lazy restore<CR>", { desc = "Restore" })
map("n", "<leader>vlu", "<cmd>Lazy update<CR>", { desc = "Update" })
-- }}}

-- Lines {{{
-- Append
map("n", "J", "mzJ`z", { desc = "Append line below" })

-- Indent
map("v", "<", "<gv", { desc = "Indent [Left]" })
map("v", ">", ">gv", { desc = "Indent [Right]" })

-- Move
map("n", "K", ":move .-2<CR>gv=gv", { desc = "Move [Up]" })
map("n", "J", ":move .+1<CR>gv=gv", { desc = "Move [Down]" })
map("v", "K", ":move '<-2<CR>gv=gv", { desc = "Move [Up]" })
map("v", "J", ":move '>+1<CR>gv=gv", { desc = "Move [Down]" })
-- }}}

-- Macro {{{
map("n", "Q", "@qj", { desc = "Macro [Replay]" })
map("x", "Q", ":norm @qj<CR>", { desc = "Macro [Replay Block]" })
-- }}}

-- Search {{{
-- */#: Don't move to next match
map("n", "*", "*N", { desc = "Find word" })
map("n", "#", "#N", { desc = "Find word [Backwards]" })

-- n/N: Keep cursor in center
map("n", "n", "nzzzv", { desc = "Search [Next]" })
map("n", "N", "Nzzzv", { desc = "Search [Prev]" })
-- }}}

-- Splits {{{
-- Navigation
map("n", "<C-m>", "<C-w>h", { desc = "Split [Left]" })
map("n", "<C-n>", "<C-w>j", { desc = "Split [Up]" })
map("n", "<C-e>", "<C-w>k", { desc = "Split [Down]" })
map("n", "<C-i>", "<C-w>l", { desc = "Split [Right]" })

-- Resize
map("n", "<C-A-m>", "<cmd>vertical resize -5<CR>", { desc = "Split [Ver +]" })
map("n", "<C-A-n>", "<cmd>horizontal resize +5<CR>", { desc = "Split [Hor +]" })
map("n", "<C-A-e>", "<cmd>horizontal resize -5<CR>", { desc = "Split [Hor -]" })
map("n", "<C-A-i>", "<cmd>vertical resize +5<CR>", { desc = "Split [Ver -]" })

-- Transform
map("n", "<C-w>K", "<C-w>K", { desc = "Transform [V > H]" })
map("n", "<C-w>H", "<C-w>H", { desc = "Transform [H > V]" })
-- }}}

-- Undo & Redo {{{
map("n", "<u>", "<cmd>undo<CR>", { desc = "Undo" })
map("n", "<C-r>", "<cmd>redo<CR>", { desc = "Redo" })
-- }}}

-- Vim {{{
map("n", "<leader>vh", "<cmd>checkhealth<CR>", { desc = "Health" })
map("n", "<leader>vn", "<cmd>help news<CR>", { desc = "News" })

-- Spell
map("n", "<leader>vss", "<cmd>set spell!<CR>", { desc = "Spell" })
map("n", "<leader>vsm", "<cmd>mkspell! %<CR>", { desc = "Mkspell" })
-- }}}

-- VISUAL {{{
-- Sort
map("v", "<leader>sa", "<cmd>sort<CR>", { desc = "Alphabetical" })
map("v", "<leader>sc", "<cmd>sort i<CR>", { desc = "Case-sensitive" })
map("v", "<leader>sn", "<cmd>sort n<CR>", { desc = "Numerical" })
map("v", "<leader>sr", "<cmd>sort<CR>", { desc = "Reverse" })
-- }}}
