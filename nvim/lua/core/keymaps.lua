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

-- Alpha
map("n", "<leader>pa", "<cmd>Alpha<CR>", { desc = "Alpha" })

-- Arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- Buffers
map("n", "<Tab>", "<cmd>bn<CR>", { desc = "Buffer [Next]" })
map("n", "<S-Tab>", "<cmd>bp<CR>", { desc = "Buffer [Prev]" })
map("n", "<C-'>", "<cmd>b#<CR>", { desc = "Buffer [To last]" })
map("n", "<C-q>", "<cmd>bdelete<CR>", { desc = "Buffer [Delete]" }) -- :bd!<CR>
map("n", "<C-^>", "<cmd>e #<CR>", { desc = "Alternate file" }) -- :help alternate-file

-- Clipboard
map("n", "y", "\"+y", { desc = "Yank [Global]" })
map("v", "y", "\"+y", { desc = "Yank [Global]" })
map("x", "p", [["_dp]], { desc = "Paste [Global]" })

-- DAP
-- :h dap-api
-- :h dap-mappings
map("n", "<leader>5", "<cmd>lua require'dap'.continue()<CR>", { desc = "DAP [Continue]" })
map("n", "<leader>3", "<cmd>lua require'dap'.step_over()<CR>", { desc = "DAP [Step over]" })
map("n", "<leader>2", "<cmd>lua require'dap'.step_into()<CR>", { desc = "DAP [Step into]" })
map("n", "<leader>0", "<cmd>lua require'dap'.step_out()<CR>", { desc = "DAP [Step out]" })
map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Breakpoint" })
map("n", "<leader>dc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { desc = "Breakpoint [Condition]" })
map("n", "<leader>dd", "<cmd>lua require'dap'.set.breakpoint(nul, nul, vim.fn.input('Log point message: '))<CR>", { desc = "Breakpoint [Log point msg]" })
map("n", "<leader>dq", "<cmd>lua require('dap').disconnect()<CR>", { desc = "Quit"})
map("n", "<leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Run last" })
map("n", "<leader>ds", "<cmd>lua require'dap'.repl.open()<CR>", { desc = "REPL" })

-- DAP-Python
-- h: dap-python
map("n", "<leader>dpc", "<cmd>lua require('dap-python').test_class()<CR>", { desc = "Class" })
map("n", "<leader>dps", "<cmd>lua require('dap-python').debug_selection()<CR>", { desc = "Selection" })
map("n", "<leader>dpm", "<cmd>lua require('dap-python').test_method()<CR>", { desc = "Method" })

-- Gitsigns
map("n", "<leader>gg", "<cmd>Gitsigns toggle_signs<CR>:Gitsigns toggle_numhl<CR>:Gitsigns toggle_current_line_blame<CR>", { desc = "Gitsigns" })
--map("n", "<leader>gs", "<cmd>Gitsigns toggle_signs<CR>", { desc = "Signs" })
--map("n", "<leader>gn", "<cmd>Gitsigns toggle_numhl<CR>", { desc = "Numhl" })
--map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Blame" })

-- Harpoon
map("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", { desc = "Add" })
map("n", "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "Toggle" })

-- Highlights
map("n", "<C-c>", "<cmd>nohl<CR>", { desc = "Clear" })
--map("n", "<leader>cr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[Highlight] Replace selected" })

-- Lazy
map("n", "<leader>pl", "<cmd>Lazy<CR>", { desc = "Lazy" })

-- Lines (Indent)
map("v", "<", "<gv", { desc = "Indent [Left]" })
map("v", ">", ">gv", { desc = "Indent [Left]" })

-- Lines (Misc)
map("n", "J", "mzJ`z", { desc = "Append line below" })

-- Lines (Move)
-- https://vim.fandom.com/wiki/Moving_lines_up_or_down
map("v", "K", ":move '<-2<CR>gv=gv", { desc = "Move [Up]" })
map("v", "J", ":move '>+1<CR>gv=gv", { desc = "Move [Down]" })
map("x", "K", ":move '<-2<CR>gv=gv", { desc = "Block [Move Up]" })
map("x", "J", ":move '>+1<CR>gv=gv", { desc = "Block [Move Down]" })
--map("n", "K", ":move .-2<CR>", { desc = "Line [Move Up]" })
--map("n", "J", ":move .+1<CR>", { desc = "Line [Move Down]" })

-- LSP Help
map("n", "<leader>lhi", "<cmd>LspInfo<CR>", { desc = "Info" })
map("n", "<leader>lhc", "<cmd>help lspconfig.txt<CR>", { desc = "Config" })
map("n", "<leader>lhr", "<cmd>help lsp-config<CR>", { desc = "Reference" })
map("n", "<leader>lhl", "<cmd>LspLog<CR>", { desc = "Log" })

-- Lspsaga
map("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", { desc = "Action" })
map("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", { desc = "Outline" })
map("n", "<leader>lp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek definition" })
map("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", { desc = "Rename" })
map("n", "<leader>lt", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Type" })
map("n", "<Leader>lw", "<cmd>Lspsaga winbar_toggle<CR>", { desc = "Winbar" })
--map("n",         "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Definition [Go-To]" })
--map("n", "<leader>lb", "<cmd>Lspsaga show_buf_diagnostics<CR>", { desc = "Diagnostics [Buffer] "})
--map("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Diagnostics" })
--map("n", "<leader>lk", "<cmd>Lspsaga hover_doc<CR>", { desc = "Documentation" })
--map("n", "<leader>lk", "<cmd>Lspsaga hover_doc ++keep<CR>", { desc = "Documentation" })
--map("n", "<Leader>lci", "<cmd>Lspsaga incoming_calls<CR>", { desc = "Incoming" })
--map("n", "<Leader>lco", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "Outgoing" })

-- Macro
map("n", "Q", "@qj", { desc = "Macro Replay" })
map("x", "Q", ":norm @qj<CR>", { desc = "Macro Replay [Block]" })

-- Mason
map("n", "<leader>pmc", "<cmd>checkhealth mason<CR>", { desc = "Health" })
map("n", "<leader>pmh", "<cmd>h mason<CR>", { desc = "Help" })
map("n", "<leader>pml", "<cmd>MasonLog<CR>", { desc = "Log" })
map("n", "<leader>pmm", "<cmd>Mason<CR>", { desc = "Mason" })
map("n", "<leader>pmu", "<cmd>MasonUninstallAll<CR>", { desc = "Uninstall all" })

-- Markdown
map("n", "<leader>lm", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Markdown" })
--map("n", "<leader>lm", "<cmd>MarkdownPreview<CR>", { desc = "Markdown Preview" })
--map("n", "<leader>lm", "<cmd>MarkdownPreviewStop<CR>", { desc = "Markdown Preiview Stop" })

-- Navigation
-- Conflicts with cursor scrolloff
map("n", "<C-d>", "<C-d>zz<CR>", { desc = "Page down" })
map("n", "<C-u>", "<C-u>zz<CR>", { desc = "Page up" })

-- Oil
map("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
map("n", "<leader>po", "<cmd>Oil<CR>", { desc = "Oil" })

-- Py-lsp
--map("n", "<leader>lva", "<cmd>PyLspActivateVenv<CR>", { desc = "Activate" })
--map("n", "<leader>lvc", "<cmd>PyLspCurrentVenv<CR>", { desc = "Current" })
--map("n", "<leader>lvd", "<cmd>PyLspDeactivateVenv<CR>", { desc = "Deactivate" })
--map("n", "<leader>lvf", "<cmd>PyLspFindVenvs<CR>", { desc = "Find" })
--map("n", "<leader>lvn", "<cmd>PyLspCreateVenv<CR>", { desc = "New" })
--map("n", "<leader>lvi", "<cmd>PyRun -m pip install -r requirements.txt<CR>", { desc = "Install dependencies" })

-- Rust (rustaceanvim)
local bufnr = vim.api.nvim_get_current_buf()
map("n", "<leader>ra", function() vim.cmd.RustLsp("codeAction") end, { silent = true, buffer = bufnr, desc = "Action" })
map("n", "<leader>rd", function() vim.cmd.RustLsp("debuggables") end, { desc = "Debuggables" })
map("n", "<leader>rh", "<cmd>checkhealth rustaceanvim<CR>", { desc = "Health" })
map("n", "<leader>rj", function() vim.cmd.RustLsp("joinLines") end, { desc = "Join lines" })
map("n", "<leader>rr", function() vim.cmd.RustLsp("runnables") end, { desc = "Runnables" })
--map("n", "<leader>rh", function() vim.cmd.RustLsp("hover", "actions") end, { desc = "Hover actions" })

-- Search
map("n", "*", "*N", { desc = "Find word" }) -- Fix *: don't move to next match
map("n", "#", "#N", { desc = "Find word" }) -- Fix #: don't move to next match
map("n", "n", "nzzzv", { desc = "Search [Next]" }) -- Fix n: keep cursor in center
map("n", "N", "Nzzzv", { desc = "Search [Previous]" }) -- Fix N: keep cursor in center

-- Shell movements
map("i", "<C-A>", "<ESC>I", { desc = "Jump EOL" })
map("i", "<C-E>", "<ESC>A", { desc = "Jump BOL" })

-- Splits (Ctrl + w)
map("n", "<C-k>", "<C-w>k", { desc = "Split [Up]" })
map("n", "<C-j>", "<C-w>j", { desc = "Split [Down]" })
map("n", "<C-h>", "<C-w>h", { desc = "Split [Left]" })
map("n", "<C-l>", "<C-w>l", { desc = "Split [Right]" })
map("n", "<C-A-k>", "<cmd>resize -5<CR>", { desc = "Split [Hor -]" })
map("n", "<C-A-j>", "<cmd>resize +5<CR>", { desc = "Split [Hor +]" })
map("n", "<C-A-h>", "<cmd>vertical resize -5<CR>", { desc = "Split [Ver +]" })
map("n", "<C-A-l>", "<cmd>vertical resize +5<CR>", { desc = "Split [Ver -]" })

-- Telescope
map("n", "<leader>tt", "<cmd>Telescope<CR>", { desc = "Telescope" })
map("n", "<leader>ta", "<cmd>Telescope autocommands<CR>", { desc = "Autocommands" })
map("n", "<leader>tb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>tc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Buffer [Fuzzy Current]" })
map("n", "<leader>td", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
map("n", "<leader>tf", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
map("n", "<leader>tj", "<cmd>Telescope jumplist<CR>", { desc = "Jumplist" })
map("n", "<leader>tm", "<cmd>Telescope man_pages<CR>", { desc = "Man" })
map("n", "<leader>ts", "<cmd>Telescope treesitter<CR>", { desc = "Symbols [Treesitter]" })

-- Telescope-DAP
map("n", "<leader>dtc", "<cmd>lua require'telescope'.extensions.dap.commands{}<CR>", { desc = "Commands" })
map("n", "<leader>dtd", "<cmd>lua require'telescope'.extensions.dap.configurations{}<CR>", { desc = "Config" })
map("n", "<leader>dtb", "<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<CR>", { desc = "Breakpoints" })
map("n", "<leader>dtv", "<cmd>lua require'telescope'.extensions.dap.variables{}<CR>", { desc = "Variables" })
map("n", "<leader>dtf", "<cmd>lua require'telescope'.extensions.dap.frames{}<CR>", { desc = "Frames" })

-- Telescope-Git
map("n", "<leader>gb","<cmd>Telescope git_branches<CR>", { desc = "Branches" })
map("n", "<leader>gc","<cmd>Telescope git_commits<CR>", { desc = "Commits" })
map("n", "<leader>gf","<cmd>Telescope git_files<CR>", { desc = "Files" })
map("n", "<leader>gs","<cmd>Telescope git_status<CR>", { desc = "Status" })

-- Telescope-Grep
map("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })

-- Telescope-History
map("n", "<leader>thc", "<cmd>Telescope command_history<CR>", { desc = "Command" })
map("n", "<leader>thf", "<cmd>Telescope oldfiles<CR>", { desc = "Files" })
map("n", "<leader>ths", "<cmd>Telescope search_history<CR>", { desc = "Search" })

-- Telescope-LSP
map("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", { desc = "Implementations" })
map("n", "<leader>ll", "<cmd>Telescope lsp_references<CR>", { desc = "LSP References" })

-- Telescope-LSP-Calls
map("n", "<leader>lui", "<cmd>Telescope lsp_incoming_calls<CR>", { desc = "Incoming" })
map("n", "<leader>luo", "<cmd>Telescope lsp_outgoing_calls<CR>", { desc = "Outgoing" })

-- Telescope-LSP-Symbols
map("n", "<leader>lss", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document" })
map("n", "<leader>lsw", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Workspace" })

-- Telescope-Vim
map("n", "<leader>tvc", "<cmd>Telescope commands<CR>", { desc = "Commands" })
map("n", "<leader>tvh", "<cmd>Telescope highlights<CR>", { desc = "Highlights" })
map("n", "<leader>tvk", "<cmd>Telescope keymaps<CR>", { desc = "Keymaps" })
map("n", "<leader>tvo", "<cmd>Telescope vim_options<CR>", { desc = "Options" })
map("n", "<leader>tvr", "<cmd>Telescope registers<CR>", { desc = "Registers" })

-- Undo & Redo
map("n", "<u>", "<cmd>undo<CR>", { desc = "Undo" }) -- Undo
map("n", "<C-r>", "<cmd>redo<CR>", { desc = "Redo" }) -- Redo
