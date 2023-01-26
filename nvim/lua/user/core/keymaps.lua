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

-- Core
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

-- Splits
map('n', '<leader>sv', ':vsplit<CR>', { desc = 'Vertical' }) -- Split Vertical
map('n', '<leader>sh', ':split<CR>' , { desc = 'Horizontal' }) -- Split Horizontal
map('n', '<leader>sw', '<C-w>x', { desc = 'Swap' }) -- Split swap
map('n', '<C-k>', '<C-w>k', { desc = 'Split [Up]' }) -- Move up
map('n', '<C-j>', '<C-w>j', { desc = 'Split [Down]' }) -- Move down
map('n', '<C-h>', '<C-w>h', { desc = 'Split [Left]' }) -- Move left
map('n', '<C-l>', '<C-w>l', { desc = 'Split [Right]' }) -- Move right
map('n', '<C-A-k>', ':resize -2<CR>') -- Resize up
map('n', '<C-A-j>', ':resize +2<CR>') -- Resize down
map('n', '<C-A-h>', ':vertical resize -2<CR>') -- Resize left
map('n', '<C-A-l>', ':vertical resize +2<CR>') -- Resize right

-- Buffers
map('n', '<C-]>', ':bn<CR>', { desc = 'Buffer [Next]' }) -- Move to next
map('n', '<C-[>', ':bp<CR>', { desc = 'Buffer [Prev]' }) -- Move to prev
map('n', "<C-'>", ':b#<CR>', { desc = 'Buffer [To last]' }) -- Move to last
map('n', "<C-q>", ':bdelete<CR>', { desc = 'Buffer [Delete]' }) -- Move to last

-- DAP
-- :h dap-api
-- :h dap-mappings
map('n', '<leader>5', ":lua require'dap'.continue()<CR>", { desc = 'DAP [Continue]'} )
map('n', '<leader>3', ":lua require'dap'.step_over()<CR>", { desc = 'DAP [Step over]'} )
map('n', '<leader>2', ":lua require'dap'.step_into()<CR>", { desc = 'DAP [Step into]'} )
map('n', '<leader>0', ":lua require'dap'.step_out()<CR>", { desc = 'DAP [Step out]'} )
map('n', '<leader>b', ":lua require'dap'.toggle_breakpoint()<CR>", { desc = 'DAP [Breakpoint]'} )
map('n', '<leader>B', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { desc = '[DAP] Breakpoint condition'} )
map('n', '<leader>dp', ":lua require'dap'.set.breakpoint(nul, nul, vim.fn.input('Log point message: '))<CR>", { desc = 'Breakpoint log point msg' })
map('n', '<leader>dr', ":lua require'dap'.repl.open()<CR>", { desc = 'REPL' })
map('n', '<leader>dl', ":lua require'dap'.run_last()<CR>", { desc = 'Run last' })
map('n', '<leader>dm', ":lua require('dap-python').test_method()<CR>", { desc = 'Run method above'})

-- DAP-Python
-- h: dap-python
map('n', '<leader>dpm', ":lua require('dap-python').test_method()<CR>", { desc = 'Py test [Method]' })
map('n', '<leader>dpc', ":lua require('dap-python').test_class()<CR>", { desc = 'Py test [Class]' })
map('n', '<leader>dps', ":lua require('dap-python').debug_selection()<CR>", { desc = 'Py test [Selection]' })

-- File manager
--map('n', '<leader>t', ':Lex 30<CR>', { desc = 'Netrw', silent = true })
map('n', 't', ':NvimTreeToggle<CR>', { desc = 'NvimTree' })

-- Gitsigns
map('n', '<leader>uu', ':Gitsigns toggle_signs<CR>:Gitsigns toggle_numhl<CR>:Gitsigns toggle_current_line_blame<CR>', { desc = 'Toggle' })
map('n', '<leader>us', ':Gitsigns toggle_signs<CR>', { desc = 'Signs' })
map('n', '<leader>un', ':Gitsigns toggle_numhl<CR>', { desc = 'Numhl' })
map('n', '<leader>ub', ':Gitsigns toggle_current_line_blame<CR>', { desc = 'Blame' })

-- Lines
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<leader>ib', 'o<ESC>', { desc = 'Line [Insert Below]' })
map('n', '<leader>ia', 'O<ESC>', { desc = 'Line [Insert Above]' })
map('n', '<J>', ':move .+1<CR>', { desc = 'Line [Move Down]' })
map('n', '<K>', ':move .-2<CR>', { desc = 'Line [Move Up]' })
map('x', '<J>', ":move '>+1<CR>gv=gv", { desc = 'Block [Move Down]' })
map('x', '<K>', ":move '<-2<CR>gv=gv", { desc = 'Block [Move Up]' })

-- LSP
map('n', '<leader>li', ":LspInfo<CR>", { desc = 'LSP Info' })

-- LSP lines
map('n', '<leader>ld', require('lsp_lines').toggle, { desc = 'Diagnostics' })

-- LSP py-lsp
map('n', '<leader>vc', ":PyLspCurrentVenv<CR>", { desc = 'Current' })
map('n', '<leader>vn', ":PyLspCreateVenv venv<CR>", { desc = 'Create' })
map('n', '<leader>va', ":PyLspActivateVenv venv<CR>", { desc = 'Activate' })
map('n', '<leader>vd', ":PyLspDeactiveVenv<CR>", { desc = 'Deactivate' })
map('n', '<leader>vi', ":PyRun -m pip install -r requirements.txt<CR>", { desc = 'Install dependencies' })

-- Mason
map('n', '<leader>m', ":Mason<CR>", { desc = 'Mason' })

-- Null-ls
map('n', '<leader>nf', ":lua vim.lsp.buf.formatting()<CR>", { desc = 'Format' }) -- Formatting

-- Telescope
map('n', '<leader>tx', ":Telescope<CR>", { desc = 'Telescope' })
map('n', '<leader>tb', ":Telescope buffers<CR>", { desc = 'Buffers' })
map('n', '<leader>tc', ":Telescope commands<CR>", { desc = 'Commands' })
map('n', '<leader>td', ":Telescope diagnostics<CR>", { desc = 'Diagnostics' })
map('n', '<leader>tf', ":Telescope find_files<CR>", { desc = 'Find files' })
map('n', '<leader>tg', ":Telescope git_commits<CR>", { desc = 'Git commits' })
map('n', '<leader>th', ":Telescope highlights<CR>", { desc = 'Highlights' })
map('n', '<leader>tk', ":Telescope keymaps<CR>", { desc = 'Keymaps' })
map('n', '<leader>tl', ":Telescope live_grep<CR>", { desc = 'Live grep' })
map('n', '<leader>tm', ":Telescope man_pages<CR>", { desc = 'Man' })
map('n', '<leader>tn', ":Telescope git_status<CR>", { desc = 'Git status' })
map('n', '<leader>to', ":Telescope oldfiles<CR>", { desc = 'History' })
map('n', '<leader>tp', ":Telescope pickers<CR>", { desc = 'Pickers' })
map('n', '<leader>ts', ":Telescope search_history<CR>", { desc = 'Search history' })
map('n', '<leader>tt', ":Telescope treesitter<CR>", { desc = 'Treesitter' })
map('n', '<leader>tv', ":Telescope vim_options<CR>", { desc = 'Vim options' })

-- Telescope-DAP
map('n', '<leader>dc', ':lua require"telescope".extensions.dap.commands{}<CR>', { desc = 'Commands'})
map('n', '<leader>dd', ':lua require"telescope".extensions.dap.configurations{}<CR>', { desc = 'Config' })
map('n', '<leader>db', ':lua require"telescope".extensions.dap.list_breakpoints{}<CR>', { desc = 'Breakpoints' })
map('n', '<leader>dv', ':lua require"telescope".extensions.dap.variables{}<CR>', { desc = 'Variables' })
map('n', '<leader>df', ':lua require"telescope".extensions.dap.frames{}<CR>', { desc = 'Frames' })

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
