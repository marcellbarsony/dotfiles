local options = { noremap = true, silent = true }

local function map(m, k, v)
  vim.api.nvim_set_keymap(m, k, v, options )
end

-- Modes
--  normal_mode = "n"
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x",
--  term_mode = "t",
--  command_mode = "c",

-- Leader
map("n", "<Bslash>", "")
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"
--map("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>")
--map("n", "<C-i>", "<C-i>")

-- Nvim core
map('n', '<leader>r', ':so %<CR>') -- Reload
map('n', '<leader>w', ':w<CR>') -- Save current
map('n', '<leader>W', ':wall<CR>') -- Save all
map('n', '<leader>wq', ':wq<CR>') -- Save & Quit
map('n', '<leader>q', ':q!<CR>') -- Quit
map('n', '<ESC>', '') -- Unmap <C-[> in normal mode

-- Search
map('n', '*', '*N') -- Fix *: don't move to next match
map('n', '<leader>c', ':nohl<CR>') -- Clear highlighting
--map('n', 'n', 'nzz') -- Fix n: keep cursor in center
--map('n', 'N', 'Nzz') -- Fix N: keep cursor in center

-- Buffers
map('n', '<C-]>', ':bn<CR>') -- Move to next
map('n', '<C-[>', ':bp<CR>') -- Move to prev
map('n', "<C-'>", ':b#<CR>') -- Move to last

-- Splits
map('n', '<leader>v', ':vsplit<CR>') -- Split Vertical
map('n', '<leader>h', ':split<CR>') -- Split Horizontal
map('n', '<C-k>', '<C-w>k') -- Move up
map('n', '<C-j>', '<C-w>j') -- Move down
map('n', '<C-h>', '<C-w>h') -- Move left
map('n', '<C-l>', '<C-w>l') -- Move right
--map('n', '<C-K', ':resize -2<CR>') -- Resize up
--map('n', '<C-J>', ':resize +2<CR>') -- Resize down
--map('n', '<C-H>', ':vertical resize -2<CR>') -- Resize left
--map('n', '<C-J>', ':vertical resize +2<CR>') -- Resize right

-- File manager
--map('n', '<leader>t', ':Lex 30<CR>') -- Toggle Netrw
map('n', '<leader>t', ':NvimTreeToggle<CR>') -- Toggle Nvim-tree.lua

-- Lines
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<leader>o', 'o<ESC>') -- Insert below current line
map('n', '<leader>O', 'O<ESC>') -- Insert above current line
map('n', '<J>', ':move .+1<CR>') -- Move Down
map('n', '<K>', ':move .-2<CR>') -- Move Up
map('x', '<J>', ":move '>+1<CR>gv=gv") -- Move Down
map('x', '<K>', ":move '<-2<CR>gv=gv") -- Move Up

-- Shell movements
map('i', '<C-A>', '<ESC>I')
map('i', '<C-E>', '<ESC>A')

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
map('o', 'A', ':<C-U>normal! mzggVG<CR>`z')
map('x', 'A', ':<C-U>normal! ggVG<CR>')

-- VISUAL --
map('v', '<', '<gv') -- Indent left
map('v', '>', '>gv') -- Indent right
map('x', 'K', ":move '<-2<CR>gv-gv") -- Move block up
map('x', 'J', ":move '>+1<CR>gv-gv") -- Move block down
