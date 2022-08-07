local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true, silent = true } )
end

-- Modes
-- normal_mode = "n"
-- insert_mode = "i"
-- visual_mode = "v"
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",

-- Leader
-- vim.g.mapleader = ','
-- vim.g.maplocalleader = ','

-- Nvim core
map('n', '<leader>r', ':so %<CR>')                  -- Reload
map('n', '<C-Q>', ':q<CR>')                         -- Quit
map('n', '<leader>e', ':Lex 30<cr>')                -- Netrw

-- Search
map('n', '*', '*N')                                 -- Fix *: don't move to next match
map('n', 'n', 'nzz')                                -- Fix n: keep cursor in center
map('n', 'N', 'Nzz')                                -- Fix N: keep cursor in center
map('n', '<leader>c', ':nohl<CR>')                  -- Clear highlighting

-- Buffers
map('n', '<leader>s', ':update<CR>')                -- Save current
map('n', '<leader>S', ':wall<CR>')                  -- Save all
map('n', '<leader>[', ':bp<CR>')                    -- Move to previous
map('n', '<leader>]', ':bn<CR>')                    -- Move to next
map('n', "''", ':b#<CR>')                           -- Move to last

-- Splits
map('n', '<C-\\>', ':vsplit<CR>')                   -- Split Vertical
map('n', '<A-\\>', ':split<CR>')                    -- Split Horizontal
map('n', '<C-h>', '<C-w>h')                         -- Move left
map('n', '<C-j>', '<C-w>j')                         -- Move down
map('n', '<C-k>', '<C-w>k')                         -- Move up
map('n', '<C-l>', '<C-w>l')                         -- Move right
map('n', '<A-t>', ':resize -2<CR>' )                -- Resize up
map('n', '<A-y>', ':resize +2<CR>')                 -- Resize down
map('n', '<A-i>', ':vertical resize +2<CR>')        -- Resize right
map('n', '<A-u>', ':vertical resize -2<CR>')        -- Resize left

-- Lines
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<leader>o', 'o<ESC>')                     -- Insert below current line
map('n', '<leader>O', 'O<ESC>')                     -- Insert above current line
map('n', '<C-J>', ':move .+1<CR>')                  -- Move Down
map('n', '<C-K>', ':move .-2<CR>')                  -- Move Up
map('x', '<C-J>', ":move '>+1<CR>gv=gv")            -- Move Down
map('x', '<C-K>', ":move '<-2<CR>gv=gv")            -- Move Up

-- Shell movements
map('i', '<C-E>', '<ESC>A')
map('i', '<C-A>', '<ESC>I')

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
map('o', 'A', ':<C-U>normal! mzggVG<CR>`z')
map('x', 'A', ':<C-U>normal! ggVG<CR>')

-- INSERT --
map('i', 'qq', '<Esc>')                             -- Escape

-- VISUAL --
map('v', "<", '<gv')                                -- Indent left
map('v', ">", '>gv')                                -- Indent right
map("x", "K", ":move '<-2<CR>gv-gv")                -- Move block up
map("x", "J", ":move '>+1<CR>gv-gv")                -- Move block down
