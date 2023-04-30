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
map('n', '<leader>w', ':wall<CR>', { desc = 'Write all'})
map('n', '<leader>wq', ':waq<CR>', { desc = 'Write & Quit' })
map('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
map('n', '<leader>r', ':source %<CR>', { desc = 'Reload [TODO]'})
--map('n', '<ESC>', '', { desc = 'Unmap <C-[>'})

-- Search
map('n', '*', '*N', { desc = 'Find word' }) -- Fix *: don't move to next match
map('n', '<leader>c', ':nohl<CR>', { desc = 'Nohl' }) -- Clear highlighting
--map('n', 'n', 'nzz') -- Fix n: keep cursor in center
--map('n', 'N', 'Nzz') -- Fix N: keep cursor in center

-- Splits
map('n', '<leader>sv', ':vsplit<CR>', { desc = 'Vertical' })
map('n', '<leader>sh', ':split<CR>' , { desc = 'Horizontal' })
map('n', '<leader>sw', '<C-w>x', { desc = 'Swap' })
map('n', '<C-k>', '<C-w>k', { desc = 'Split [Up]' }) -- Move up
map('n', '<C-j>', '<C-w>j', { desc = 'Split [Down]' }) -- Move down
map('n', '<C-h>', '<C-w>h', { desc = 'Split [Left]' }) -- Move left
map('n', '<C-l>', '<C-w>l', { desc = 'Split [Right]' }) -- Move right
map('n', '<C-A-k>', ':resize -5<CR>') -- Up
map('n', '<C-A-j>', ':resize +5<CR>') -- Down
map('n', '<C-A-h>', ':vertical resize -5<CR>') -- Left
map('n', '<C-A-l>', ':vertical resize +5<CR>') -- Right

-- Buffers
map('n', '<C-]>', ':bn<CR>', { desc = 'Buffer [Next]' }) -- Move to next
map('n', '<C-[>', ':bp<CR>', { desc = 'Buffer [Prev]' }) -- Move to prev
map('n', "<C-'>", ':b#<CR>', { desc = 'Buffer [To last]' }) -- Move to last
map('n', "<C-q>", ':bdelete<CR>', { desc = 'Buffer [Delete]' }) -- Move to last
--map('n', "<C-^>", ':_#<CR>', { desc = 'Alternate file' }) -- :help alternate-file

-- Undo & Redo
map('n', "<u>", ':undo<CR>', { desc = 'Undo' }) -- Undo
map('n', "<C-r>", ':redo<CR>', { desc = 'Redo' }) -- Redo

-- DAP
-- :h dap-api
-- :h dap-mappings
map('n', '<leader>5', ":lua require'dap'.continue()<CR>", { desc = 'DAP [Continue]'} )
map('n', '<leader>3', ":lua require'dap'.step_over()<CR>", { desc = 'DAP [Step over]'} )
map('n', '<leader>2', ":lua require'dap'.step_into()<CR>", { desc = 'DAP [Step into]'} )
map('n', '<leader>0', ":lua require'dap'.step_out()<CR>", { desc = 'DAP [Step out]'} )
map('n', '<leader>b', ":lua require'dap'.toggle_breakpoint()<CR>", { desc = 'DAP [Breakpoint]'} )
map('n', '<leader>B', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { desc = 'DAP [Breakpoint [Condition]'} )
map('n', '<leader>dp', ":lua require'dap'.set.breakpoint(nul, nul, vim.fn.input('Log point message: '))<CR>", { desc = 'Breakpoint [log point msg]' })
map('n', '<leader>dr', ":lua require'dap'.repl.open()<CR>", { desc = 'REPL' })
map('n', '<leader>dl', ":lua require'dap'.run_last()<CR>", { desc = 'Run last' })
map('n', '<leader>dq', ":lua require('dap').disconnect()<CR>", { desc = 'Quit'})

-- DAP-Python
-- h: dap-python
map('n', '<leader>dx', ":lua require('dap-python').test_class()<CR>", { desc = 'Py test [Class]' })
map('n', '<leader>dy', ":lua require('dap-python').debug_selection()<CR>", { desc = 'Py test [Selection]' })
map('n', '<leader>dz', ":lua require('dap-python').test_method()<CR>", { desc = 'Py test [Method]' })

-- Nvim-tree
map('n', 't', ':NvimTreeToggle<CR>', { desc = 'NvimTree' })
-- map('n', 'tc', ':NvimTreeCollapse<CR>', { desc = 'Collapse' })
-- map('n', 'tf', ':NvimTreeFindFile<CR>', { desc = 'Find file' })
-- map('n', '<leader>t', ':Lex 30<CR>', { desc = 'Netrw', silent = true })

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
map('n', '<leader>li', ":LspInfo<CR>", { desc = 'Info' })
map('n', '<leader>ll', ":LspLog<CR>", { desc = 'Log' })

-- LSP lines
map('n', '<leader>ld', require('lsp_lines').toggle, { desc = 'Diagnostics' })

-- LSP py-lsp (venv)
map('n', '<leader>va', ":PyLspActivateVenv .venv<CR>", { desc = 'Activate' })
map('n', '<leader>vc', ":PyLspCurrentVenv<CR>", { desc = 'Current' })
map('n', '<leader>vd', ":PyLspDeactivateVenv<CR>", { desc = 'Deactivate' })
map('n', '<leader>vf', ":PyLspFindVenvs<CR>", { desc = 'Find' })
map('n', '<leader>vn', ":PyLspCreateVenv .venv<CR>", { desc = 'New' })
map('n', '<leader>vi', ":PyRun -m pip install -r requirements.txt<CR>", { desc = 'Install dependencies' })

-- Mason
map('n', '<leader>mm', ":Mason<CR>", { desc = 'Mason' })
map('n', '<leader>ml', ":MasonLog<CR>", { desc = 'Log' })

-- Null-ls
map('n', '<leader>nl', ":NullLsLog<CR>", { desc = 'Log' })
map('n', '<leader>ni', ":NullLsInfo<CR>", { desc = 'Info' })
map('n', '<leader>nf', ":lua vim.lsp.buf.formatting()<CR>", { desc = 'Format' })

-- Packer
map('n', '<leader>pc', ":PackerCompile<CR>", { desc = 'Compil' })
map('n', '<leader>pi', ":PackerInstall<CR>", { desc = 'Install' })
map('n', '<leader>ps', ":PackerSync<CR>", { desc = 'Sync' })
map('n', '<leader>pS', ":PackerStatus<CR>", { desc = 'Status' })
map('n', '<leader>pu', ":PackerUpdate<CR>", { desc = 'Update' })

-- Shell movements
map('i', '<C-A>', '<ESC>I', { desc = 'Shell movement' })
map('i', '<C-E>', '<ESC>A', { desc = 'Shell movement' })

-- System-wide clipboard
map('n', '<leader>y', '\"+y', { desc = 'Yank' })
map('v', '<leader>y', '\"+y', { desc = 'Yank' })
map('n', '<leader>y', '\"+Y', { desc = 'Yank' })

-- Telescope
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
map('n', '<leader>tt', ":Telescope<CR>", { desc = 'Telescope' })
map('n', '<leader>tx', ":Telescope treesitter<CR>", { desc = 'Treesitter symbols' })
map('n', '<leader>tv', ":Telescope vim_options<CR>", { desc = 'Vim options' })

-- Telescope-DAP
map('n', '<leader>dc', ':lua require"telescope".extensions.dap.commands{}<CR>', { desc = 'Commands'})
map('n', '<leader>dd', ':lua require"telescope".extensions.dap.configurations{}<CR>', { desc = 'Config' })
map('n', '<leader>db', ':lua require"telescope".extensions.dap.list_breakpoints{}<CR>', { desc = 'Breakpoints' })
map('n', '<leader>dv', ':lua require"telescope".extensions.dap.variables{}<CR>', { desc = 'Variables' })
map('n', '<leader>df', ':lua require"telescope".extensions.dap.frames{}<CR>', { desc = 'Frames' })


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
