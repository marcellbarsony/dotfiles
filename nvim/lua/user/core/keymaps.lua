-- Keymaps
-- https://neovim.io/doc/user/map.html

-- Modes
--  n - normal_mode
--  i - insert_mode
--  v - visual_mode
--  x - visual_block_mode
--  t - term_mode
--  c - command_mode

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Leader
map("n", "<Bslash>", "", { desc = "LEADER" })
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Core
map("n", "<leader>wb", ":w!<CR>", { desc = "Write buffer" })
map("n", "<leader>wa", ":wa!<CR>", { desc = "Write all" })
map("n", "<leader>wq", ":wqa!<CR>", { desc = "Write all & Quit" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>r", ":source %<CR>", { desc = "Reload [TODO]" })

-- Alpha
map("n", "<leader>a", ":Alpha<CR>", { desc = "Alpha" })

-- Arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- Buffers
map("n", "<ESC>", "", { desc = "Unmap <C-[>" }) -- Unmap buffer prev
map("n", "<C-]>", ":bn<CR>", { desc = "Buffer [Next]" })
map("n", "<C-[>", ":bp<CR>", { desc = "Buffer [Prev]" }) -- TODO: broken, works with any other key than [
map("n", "<C-'>", ":b#<CR>", { desc = "Buffer [To last]" })
map("n", "<C-q>", ":bdelete<CR>", { desc = "Buffer [Delete]" })
--map("n", "<C-^>", ":_#<CR>", { desc = "Alternate file" }) -- :help alternate-file

-- Clipboard
map("n", "<leader>y", "\"+y", { desc = "Yank [Global]" })
map("v", "<leader>y", "\"+y", { desc = "Yank [Global]" })
map("n", "<leader>y", "\"+Y", { desc = "Yank [Global]" })
map("n", "<leader>p", "\"_dp", { desc = "paste" })

-- DAP
-- :h dap-api
-- :h dap-mappings
map("n", "<leader>5", ":lua require'dap'.continue()<CR>", { desc = "DAP [Continue]" })
map("n", "<leader>3", ":lua require'dap'.step_over()<CR>", { desc = "DAP [Step over]" })
map("n", "<leader>2", ":lua require'dap'.step_into()<CR>", { desc = "DAP [Step into]" })
map("n", "<leader>0", ":lua require'dap'.step_out()<CR>", { desc = "DAP [Step out]" })
map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { desc = "DAP [Break]" })
map("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { desc = "DAP [Break + condition]" })
map("n", "<leader>dp", ":lua require'dap'.set.breakpoint(nul, nul, vim.fn.input('Log point message: '))<CR>", { desc = "Breakpoint [log point msg]" })
map("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", { desc = "REPL" })
map("n", "<leader>dl", ":lua require'dap'.run_last()<CR>", { desc = "Run last" })
map("n", "<leader>dq", ":lua require('dap').disconnect()<CR>", { desc = "Quit"})

-- DAP-Python
-- h: dap-python
map("n", "<leader>dx", ":lua require('dap-python').test_class()<CR>", { desc = "Py test [Class]" })
map("n", "<leader>dy", ":lua require('dap-python').debug_selection()<CR>", { desc = "Py test [Selection]" })
map("n", "<leader>dz", ":lua require('dap-python').test_method()<CR>", { desc = "Py test [Method]" })

-- Gitsigns
map("n", "<leader>uu", ":Gitsigns toggle_signs<CR>:Gitsigns toggle_numhl<CR>:Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle" })
map("n", "<leader>us", ":Gitsigns toggle_signs<CR>", { desc = "Signs" })
map("n", "<leader>un", ":Gitsigns toggle_numhl<CR>", { desc = "Numhl" })
map("n", "<leader>ub", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Blame" })

-- Highlights
map("n", "<leader>hc", ":nohl<CR>", { desc = "Clear" })
map("n", "<leader>hr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace" })

-- Lines
-- https://vim.fandom.com/wiki/Moving_lines_up_or_down
map("n", "<leader>ib", "o<ESC>", { desc = "Line [Insert Below]" })
map("n", "<leader>ia", "O<ESC>", { desc = "Line [Insert Above]" })
map("n", "<J>", ":move .+1<CR>", { desc = "Line [Move Down]" })
map("n", "<K>", ":move .-2<CR>", { desc = "Line [Move Up]" })
map("x", "<J>", ":move '>+1<CR>gv=gv", { desc = "Block [Move Down]" })
map("x", "<K>", ":move '<-2<CR>gv=gv", { desc = "Block [Move Up]" })

-- LSP
map("n", "<leader>li", ":LspInfo<CR>", { desc = "Info" })
map("n", "<leader>lh", ":help lspconfig.txt<CR>", { desc = "Help" })
map("n", "<leader>ll", ":LspLog<CR>", { desc = "Log" })

-- LSP lines
map("n", "<leader>ld", require("lsp_lines").toggle, { desc = "LSP lines" })

-- LSP py-lsp
map("n", "<leader>va", ":PyLspActivateVenv<CR>", { desc = "Activate" })
map("n", "<leader>vc", ":PyLspCurrentVenv<CR>", { desc = "Current" })
map("n", "<leader>vd", ":PyLspDeactivateVenv<CR>", { desc = "Deactivate" })
map("n", "<leader>vf", ":PyLspFindVenvs<CR>", { desc = "Find" })
map("n", "<leader>vn", ":PyLspCreateVenv<CR>", { desc = "New" })
map("n", "<leader>vi", ":PyRun -m pip install -r requirements.txt<CR>", { desc = "Install dependencies" })

-- Lspsaga
map("n", "<leader>lf", ":Lspsaga lsp_finder<CR>", { desc = "Finder" })
map("n", "<leader>la", ":Lspsaga code_action<CR>", { desc = "Code actions"})
map("n", "<leader>lr", ":Lspsaga rename<CR>", { desc = "Rename"})
map("n", "<leader>lf", ":Lspsaga peek_definition<CR>", { desc = "Definition [Peek]" })
map("n", "<leader>lg", ":Lspsaga peek_type_definition<CR>", { desc = "Definition [Type]" })
map("n",         "gd", ":Lspsaga goto_definition<CR>", { desc = "Definition [Jump]" })
map("n", "<leader>lo", ":Lspsaga outline<CR>", { desc = "Outline" })
map("n", "<leader>lk", ":Lspsaga hover_doc<CR>", { desc = "Documentation" })
map("n", "<Leader>lci", ":Lspsaga incoming_calls<CR>", { desc = "Incoming"})
map("n", "<Leader>lco", ":Lspsaga outgoing_calls<CR>", { desc = "Outgoing"})
--map("n", "<leader>lk", ":Lspsaga hover_doc ++keep<CR>", { desc = "Documentation" })
--map("n", "<leader>ls", ":Lspsaga show_line_diagnostics<CR>", { desc = "Diagnostics [Line] "})
--map("n", "<leader>lb", ":Lspsaga show_buf_diagnostics<CR>", { desc = "Diagnostics [Buffer] "})
--map("n", "<leader>lt", ":Lspsaga open_floaterm<CR>", { desc = "Floaterm" })

-- Mason
map("n", "<leader>mc", ":checkhealth mason<CR>", { desc = "Health" })
map("n", "<leader>mh", ":h mason<CR>", { desc = "Help" })
map("n", "<leader>ml", ":MasonLog<CR>", { desc = "Log" })
map("n", "<leader>mm", ":Mason<CR>", { desc = "Mason" })
map("n", "<leader>mu", ":MasonUninstallAll<CR>", { desc = "Uninstall all" })

-- Navigation
-- Conflicts with cursor scrollof
-- map("n", "<C-d>", "<C-d>zz<CR>", { desc = "Page down" })
-- map("n", "<C-u>", "<C-u>zz<CR>", { desc = "Page up" })

-- Null-ls
map("n", "<leader>nl", ":NullLsLog<CR>", { desc = "Log" })
map("n", "<leader>ni", ":NullLsInfo<CR>", { desc = "Info" })
map("n", "<leader>nf", ":lua vim.lsp.buf.formatting()<CR>", { desc = "Format" })

-- Nvim-tree
map("n", "<leader>f", ":NvimTreeToggle<CR>", { desc = "Files [NvimTree]" })
--map("n", "tc", ":NvimTreeCollapse<CR>", { desc = "Collapse" })
--map("n", "<leader>x", ":NvimTreeFindFile<CR>", { desc = "Find file" })
--map("n", "<leader>t", ":Lex 30<CR>", { desc = "Netrw", silent = true })

-- Search
map("n", "*", "*N", { desc = "Find word" }) -- Fix * - don"t move to next match
map("n", "n", "nzzzv", { desc = "Search [Next]" }) -- Fix n: keep cursor in center
map("n", "N", "Nzzzv", { desc = "Search [Previous]" }) -- Fix N: keep cursor in center

-- Shell movements
map("i", "<C-A>", "<ESC>I", { desc = "Shell movement" })
map("i", "<C-E>", "<ESC>A", { desc = "Shell movement" })

-- Splits
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Vertical" })
map("n", "<leader>sh", ":split<CR>" , { desc = "Horizontal" })
map("n", "<leader>ss", "<C-w>x", { desc = "Swap" })
map("n", "<C-k>", "<C-w>k", { desc = "Split [Up]" }) -- Move up
map("n", "<C-j>", "<C-w>j", { desc = "Split [Down]" }) -- Move down
map("n", "<C-h>", "<C-w>h", { desc = "Split [Left]" }) -- Move left
map("n", "<C-l>", "<C-w>l", { desc = "Split [Right]" }) -- Move right
map("n", "<C-A-k>", ":resize -5<CR>", { desc = "Split [Hor -]" }) -- Decrease
map("n", "<C-A-j>", ":resize +5<CR>", { desc = "Split [Hor +]" }) -- Increase
map("n", "<C-A-h>", ":vertical resize -5<CR>", { desc = "Split [Ver +]" }) -- Increase
map("n", "<C-A-l>", ":vertical resize +5<CR>", { desc = "Split [Ver -]" }) -- Decrease

-- Telescope
-- https://github.com/nvim-telescope/telescope.nvim#vim-pickers
map("n", "<leader>tb", ":Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>td", ":Telescope diagnostics<CR>", { desc = "Diagnostics" })
map("n", "<leader>tg", ":Telescope live_grep<CR>", { desc = "Grep" })
map("n", "<leader>th", ":Telescope highlights<CR>", { desc = "Highlights" })
map("n", "<leader>tm", ":Telescope man_pages<CR>", { desc = "Man" })
map("n", "<leader>to", ":Telescope oldfiles<CR>", { desc = "History" })
map("n", "<leader>tp", ":Telescope pickers<CR>", { desc = "Pickers" })
map("n", "<leader>tr", ":Telescope registers<CR>", { desc = "Registers" })
map("n", "<leader>ts", ":Telescope search_history<CR>", { desc = "Search history" })
map("n", "<leader>tt", ":Telescope<CR>", { desc = "Telescope" })
map("n", "<leader>tx", ":Telescope treesitter<CR>", { desc = "Treesitter symbols" })
-- Commands
map("n", "<leader>tcc", ":Telescope commands<CR>", { desc = "Commands" })
map("n", "<leader>tch", ":Telescope command_history<CR>", { desc = "History" })
-- Files
map("n", "<leader>tfb", ":Telescope current_buffer_fuzzy_find<CR>", { desc = "Current buffer fuzzy find" })
map("n", "<leader>tff", ":Telescope find_files<CR>", { desc = "Find files" }) -- Current directory
-- Git
map("n", "<leader>tuc",":Telescope git_commits<CR>", { desc = "Commits" })
map("n", "<leader>tub",":Telescope git_branches<CR>", { desc = "Branches" })
map("n", "<leader>tuf",":Telescope git_files<CR>", { desc = "Files" })
map("n", "<leader>tus",":Telescope git_status<CR>", { desc = "Status" })
-- Vim
map("n", "<leader>tvk", ":Telescope keymaps<CR>", { desc = "Keymaps" })
map("n", "<leader>tvo", ":Telescope vim_options<CR>", { desc = "Options" })

-- Telescope-DAP
map("n", "<leader>dc", ":lua require'telescope'.extensions.dap.commands{}<CR>", { desc = "Commands"})
map("n", "<leader>dd", ":lua require'telescope'.extensions.dap.configurations{}<CR>", { desc = "Config" })
map("n", "<leader>db", ":lua require'telescope'.extensions.dap.list_breakpoints{}<CR>", { desc = "Breakpoints" })
map("n", "<leader>dv", ":lua require'telescope'.extensions.dap.variables{}<CR>", { desc = "Variables" })
map("n", "<leader>df", ":lua require'telescope'.extensions.dap.frames{}<CR>", { desc = "Frames" })

-- Undo & Redo
map("n", "<u>", ":undo<CR>", { desc = "Undo" }) -- Undo
map("n", "<C-r>", ":redo<CR>", { desc = "Redo" }) -- Redo

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
map("o", "A", ":<C-U>normal! mzggVG<CR>`z")
map("x", "A", ":<C-U>normal! ggVG<CR>")

-- Visual
map("v", "<", "<gv", { desc = "Indent [Left]" }) -- Indent left
map("v", ">", ">gv", { desc = "Indent [Left]" }) -- Indent right
map("v", "K", ":move '<-2<CR>gv-gv", { desc = "Move [Up]" }) -- Move up
map("v", "J", ":move '>+1<CR>gv-gv", { desc = "Move [Down]" }) -- Move down
