-- Keymaps

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
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

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Nvim core
--map('n', '<leader>r', ':so %<CR>', { desc = 'Reload [BROKEN]'})
map('n', '<leader>w', ':w<CR>', { desc = 'Write'})
map('n', '<leader>ww', ':w<CR>', { desc = 'Write current'})
map('n', '<leader>wa', ':wall<CR>', { desc = 'Write all'})
map('n', '<leader>wq', ':wq<CR>', { desc = 'Quit' })
map('n', '<leader>q', ':q!<CR>', { desc = 'Quit' })
map('n', '<ESC>', '', { desc = 'Unmap <C-[>'})

-- Search
map('n', '*', '*N', { desc = 'Find word' }) -- Fix *: don't move to next match
map('n', '<leader>c', ':nohl<CR>', { desc = 'Nohl' }) -- Clear highlighting
--map('n', 'n', 'nzz') -- Fix n: keep cursor in center
--map('n', 'N', 'Nzz') -- Fix N: keep cursor in center

-- Buffers
map('n', '<C-]>', ':bn<CR>', { desc = 'Buffer [Next]' }) -- Move to next
map('n', '<C-[>', ':bp<CR>', { desc = 'Buffer [Prev]' }) -- Move to prev
map('n', "<C-'>", ':b#<CR>', { desc = 'Buffer [To last]' }) -- Move to last
map('n', "<C-q>", ':bdelete<CR>', { desc = 'Buffer [Delete]' }) -- Move to last

-- Splits
map('n', '<leader>sv', ':vsplit<CR>', { desc = 'Split [Vertical]' }) -- Split Vertical
map('n', '<leader>sh', ':split<CR>' , { desc = 'Split [Horizontal]' }) -- Split Horizontal
map('n', '<C-k>', '<C-w>k', { desc = 'Split [Up]' }) -- Move up
map('n', '<C-j>', '<C-w>j', { desc = 'Split [Down]' }) -- Move down
map('n', '<C-h>', '<C-w>h', { desc = 'Split [Left]' }) -- Move left
map('n', '<C-l>', '<C-w>l', { desc = 'Split [Right]' }) -- Move right
map('n', '<C-A-k>', ':resize -2<CR>') -- Resize up
map('n', '<C-A-j>', ':resize +2<CR>') -- Resize down
map('n', '<C-A-h>', ':vertical resize -2<CR>') -- Resize left
map('n', '<C-A-l>', ':vertical resize +2<CR>') -- Resize right

-- File manager
--map('n', '<leader>t', ':Lex 30<CR>', { desc = 'Netrw', silent = true })
map('n', '<leader>t', ':NvimTreeToggle<CR>', { desc = 'NvimTree' })

-- Gitsigns
map('n', '<leader>uu', ':Gitsigns toggle_signs<CR>:Gitsigns toggle_numhl<CR>', { desc = 'Toggle' })
map('n', '<leader>us', ':Gitsigns toggle_signs<CR>', { desc = 'Signs' })
map('n', '<leader>un', ':Gitsigns toggle_numhl<CR>', { desc = 'Numhl' })

-- Lines
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<leader>lb', 'o<ESC>', { desc = 'Line [Insert Below]' })
map('n', '<leader>la', 'O<ESC>', { desc = 'Line [Insert Above]' })
map('n', '<J>', ':move .+1<CR>', { desc = 'Line [Move Down]' })
map('n', '<K>', ':move .-2<CR>', { desc = 'Line [Move Up]' })
map('x', '<J>', ":move '>+1<CR>gv=gv", { desc = 'Block [Move Down]' })
map('x', '<K>', ":move '<-2<CR>gv=gv", { desc = 'Block [Move Up]' })

-- Lsp lines
map('n', '<leader>ld', require('lsp_lines').toggle, { desc = 'Diagnostics' })

-- DAP
-- :h dap-api
-- :h dap-mappings
map('n', '<leader>5', ":lua require'dap'.continue() <CR>", { desc = 'DAP [Continue]'} )
map('n', '<leader>3', ":lua require'dap'.step_over() <CR>", { desc = 'DAP [Step over]'} )
map('n', '<leader>2', ":lua require'dap'.step_into() <CR>", { desc = 'DAP [Step into]'} )
map('n', '<leader>0', ":lua require'dap'.step_out() <CR>", { desc = 'DAP [Step out]'} )
map('n', '<leader>b', ":lua require'dap'.toggle_breakpoint() <CR>", { desc = 'Breakpoint'} )
map('n', '<leader>B', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) <CR>", { desc = 'Set breakpoint'} )
map('n', '<leader>dr', ":lua require'dap'.repl.open()<CR>", { desc = 'Repl.Open' })
map('n', '<leader>dp', ":lua require'dap'.set.breakpoint(nul, nul, vim.fn.input('Log point message: '))<CR>", { desc = 'Set breakpoint with log point message' })

-- DAP-Python
-- h: dap-python
map('n', '<leader>dn', ":lua require('dap-python').test_method()<CR>", { desc = 'Py Test method' })
map('n', '<leader>df', ":lua require('dap-python').test_class()<CR>", { desc = 'Py Test class' })
map('n', '<leader>ds', ":lua require('dap-python').debug_selection()<CR>", { desc = 'Pyt debug selection' })

-- Shell movements
map('i', '<C-A>', '<ESC>I', { desc = 'Shell movement' })
map('i', '<C-E>', '<ESC>A', { desc = 'Shell movement' })

-- System-wide clipboard
map('n', '<leader>y', '\"+y', { desc = 'Yank' })
map('v', '<leader>y', '\"+y', { desc = 'Yank' })
map('n', '<leader>y', '\"+Y', { desc = 'Yank' })

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
