-- Keymaps
local options = { noremap = true, silent = true }

local function map(m, k, v, d)
  vim.keymap.set(m, k, v, d, options)
end

-- Modes
--  normal_mode = "n"
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x",
--  term_mode = "t",
--  command_mode = "c",

-- Leader
map("n", "<Bslash>", "", { desc = 'LEADER'})
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"
--map("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>")
--map("n", "<C-i>", "<C-i>")

-- Nvim core
map('n', '<leader>r', ':so %<CR>', { desc = 'Reload [BROKEN]'}) -- Reload
map('n', '<leader>w', ':w<CR>', { desc = 'Write'}) -- Save current
map('n', '<leader>W', ':wall<CR>', { desc = 'Write all'}) -- Save all
map('n', '<leader>wq', ':wq<CR>', { desc = 'Write & Quit'}) -- Save & Quit
map('n', '<leader>q', ':q!<CR>', { desc = 'Quit'}) -- Quit
--map('n', '<ESC>', '', { desc = 'Unmap <C-[>'}) -- Unmap <C-[> in normal mode

-- Search
map('n', '*', '*N', { desc = 'FIX' }) -- Fix *: don't move to next match
map('n', '<leader>c', ':nohl<CR>', { desc = 'Highlight [Clear]' }) -- Clear highlighting
--map('n', 'n', 'nzz') -- Fix n: keep cursor in center
--map('n', 'N', 'Nzz') -- Fix N: keep cursor in center

-- Buffers
map('n', '<C-]>', ':bn<CR>', { desc = 'Buffer [Next]' }) -- Move to next
map('n', '<C-[>', ':bp<CR>', { desc = 'Buffer [Prev]' }) -- Move to prev
map('n', "<C-'>", ':b#<CR>', { desc = 'Buffer [To last]' }) -- Move to last
map('n', "<C-q>", ':bdelete<CR>', { desc = 'Buffer [Delete]' }) -- Move to last

-- Splits
map('n', '<leader>v', ':vsplit<CR>', { desc = 'Split [Vertical]' }) -- Split Vertical
map('n', '<leader>h', ':split<CR>' , { desc = 'Split [Horizontal]' }) -- Split Horizontal
map('n', '<C-k>', '<C-w>k', { desc = 'Split [Up]' }) -- Move up
map('n', '<C-j>', '<C-w>j', { desc = 'Split [Down]' }) -- Move down
map('n', '<C-h>', '<C-w>h', { desc = 'Split [Left]' }) -- Move left
map('n', '<C-l>', '<C-w>l', { desc = 'Split [Right]' }) -- Move right
--map('n', '<C-K', ':resize -2<CR>') -- Resize up
--map('n', '<C-J>', ':resize +2<CR>') -- Resize down
--map('n', '<C-H>', ':vertical resize -2<CR>') -- Resize left
--map('n', '<C-J>', ':vertical resize +2<CR>') -- Resize right

-- File manager
--map('n', '<leader>t', ':Lex 30<CR>') -- Toggle Netrw
map('n', '<leader>t', ':NvimTreeToggle<CR>', { desc = 'NvimTree' }) -- Toggle Nvim-tree.lua

-- Lines
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<leader>o', 'o<ESC>', { desc = 'Line [Insert Below]' })
map('n', '<leader>O', 'O<ESC>', { desc = 'Line [Insert Above]' })
map('n', '<J>', ':move .+1<CR>', { desc = 'Line [Move Down]' })
map('n', '<K>', ':move .-2<CR>', { desc = 'Line [Move Up]' })
map('x', '<J>', ":move '>+1<CR>gv=gv", { desc = 'Block [Move Down]' })
map('x', '<K>', ":move '<-2<CR>gv=gv", { desc = 'Block [Move Up]' })

-- Shell movements
map('i', '<C-A>', '<ESC>I', { desc = 'Shell movement' })
map('i', '<C-E>', '<ESC>A', { desc = 'Shell movement' })

-- System-wide clipboard
map('n', '<leader>y', '\"+y', { desc = 'Yank [Global]' })
map('v', '<leader>y', '\"+y', { desc = 'Yank [Global]' })
map('n', '<leader>y', '\"+Y', { desc = 'Yank [Global]' })

-- Replace highlighted word
--map('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
map('o', 'A', ':<C-U>normal! mzggVG<CR>`z')
map('x', 'A', ':<C-U>normal! ggVG<CR>')

-- VISUAL --
map('v', '<', '<gv') -- Indent left
map('v', '>', '>gv') -- Indent right
map('x', 'K', ":move '<-2<CR>gv-gv") -- Move block up
map('x', 'J', ":move '>+1<CR>gv-gv") -- Move block down
