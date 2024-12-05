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

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Leader {{{
map("n", "<Bslash>", "", { desc = "LEADER" })
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"
-- }}}

-- Arrow keys {{{
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

-- DAP {{{
-- `:h dap-api`
-- `:h dap-mappings`
map("n", "<F1>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Continue" })
map("n", "<F2>", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Step over" })
map("n", "<F3>", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Step into" })
map("n", "<F4>", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Step out" })
map("n", "<F5>", "<cmd>lua require'dap'.step_back()<CR>", { desc = "Step back" })
map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Breakpoint" })
map("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { desc = "Breakpoint [Condition]" })
map("n", "<leader>dl", "<cmd>lua require'dap'.set.breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", { desc = "Log point" })
map("n", "<leader>dq", "<cmd>lua require('dap').disconnect({ terminateDebuggee = false })<CR>", { desc = "Quit" })
map("n", "<leader>dr", "<cmd>lua require'dap'.restart()<CR>", { desc = "Restart" })
map("n", "<leader>dR", "<cmd>lua require'dap'.repl.open()<CR>", { desc = "REPL" })
-- }}}

-- Delete {{{
map("n", "x", '"_x', { desc = "Delete" })
-- }}}

-- Gitsigns {{{
map("n", "<leader>gg", "<cmd>Gitsigns toggle_numhl<CR><cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Gitsigns" })

-- Actions
-- map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
-- map("n", "<leader>gs", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Stage hunk [Undo]" })
-- map("n", "<leader>gs", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
-- map("n", "<leader>gs", "<cmd>Gitsigns stage_buffer<CR>", { desc = "Stage buffer" })
-- map("n", "<leader>gs", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
-- map("n", "<leader>gs", "<cmd>Gitsigns diffthis<CR>", { desc = "Diffthis" })
-- map("n", "<leader>gs", "<cmd>Gitsigns toggle_deleted<CR>", { desc = "Toggle deleted" })

-- Navigation
-- map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
-- map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

-- Signs
-- map("n", "<leader>gs", "<cmd>Gitsigns toggle_signs<CR>", { desc = "Signs" })
-- map("n", "<leader>gn", "<cmd>Gitsigns toggle_numhl<CR>", { desc = "Numhl" })
-- map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Blame" })

-- Text object
map("x", "<leader>gh", "<cmd>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
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
map("n", "K", ":move .-2<CR>gv=gv", { desc = "Move [Up]", silent = true })
map("n", "J", ":move .+1<CR>gv=gv", { desc = "Move [Down]", silent = true })
map("v", "K", ":move '<-2<CR>gv=gv", { desc = "Move [Up]", silent = true })
map("v", "J", ":move '>+1<CR>gv=gv", { desc = "Move [Down]", silent = true })
-- }}}

-- LSP {{{
-- `:h lspconfig-keybindings`

-- Calls
-- map("n", "<leader>lci", vim.lsp.buf.incoming_calls, { buffer = args.buf, desc = "Incoming" }) -- Telescope
-- map("n", "<leader>lco", vim.lsp.buf.outgoing_calls, { buffer = args.buf, desc = "Outgoing" }) -- Telescope

-- Code action
map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "Action" })

-- Diagnostics
map("n", "<leader>lD", vim.diagnostic.open_float, { opts = opts, desc = "Diagnostics" })
map("n", "]d", vim.diagnostic.goto_next, { opts = opts, desc = "Next diagnostic" })     -- default map
map("n", "[d", vim.diagnostic.goto_prev, { opts = opts, desc = "Previous diagnostic" }) -- default map
-- map("n", "<leader>ll", vim.diagnostic.setloclist, { opts = opts, desc = "Set localist" })

-- Documentation
-- Default: nvim-lspconfig maps `K` to vim.lsp.buf.hover()
map("n", "<leader>ld", vim.lsp.buf.hover, { desc = "Documentation" })

-- Formatting
map("n", "<leader>lf", function() vim.lsp.buf.format { async = true } end, { desc = "Format" })

-- Go-To
map("n", "gd", vim.lsp.buf.definition, { desc = "Definition" })
-- map("n", "gt", vim.lsp.buf.type_definition, { desc = "Type definition" })
-- map("n", "gD", vim.lsp.buf.declaration, { desc = "Declaration" })
-- map("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation" })

-- Inlay hints
map("n", "<leader>li", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }, { bufnr = 0 })
end, { desc = "Inlay hints" })

-- References
-- map("n", "<leader>lx", vim.lsp.buf.references, { desc = "References" })
-- map("n", "<leader>lv", vim.lsp.buf.clear_references, { desc = "Clear references" })

-- Rename
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })

-- Signature help
map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })

-- Workspace folder
-- map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Workspace folder [Add]" })
-- map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Workspace folder [Remove]" })
-- map("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, {desc = "Workspace folder [List]" })

-- LSP Help
map("n", "<leader>lhi", "<cmd>LspInfo<CR>", { desc = "Info" })
map("n", "<leader>lhl", "<cmd>LspLog<CR>", { desc = "Log" })
-- }}}

-- Macro {{{
map("n", "Q", "@qj", { desc = "Macro [Replay]" })
map("x", "Q", ":norm @qj<CR>", { desc = "Macro [Replay Block]" })
-- }}}

-- Mason {{{
map("n", "<leader>vmm", "<cmd>Mason<CR>", { desc = "Mason" })
map("n", "<leader>vml", "<cmd>MasonLog<CR>", { desc = "Log" })
map("n", "<leader>vmu", "<cmd>MasonUpdate<CR>", { desc = "Update" })
map("n", "<leader>vmU", "<cmd>MasonUninstallAll<CR>", { desc = "Uninstall All" })
-- }}}

-- Navigation {{{
-- Conflicts with cursor scrolloff
-- map("n", "<C-d>", "<C-d>zz<CR>", { desc = "Page down" })
-- map("n", "<C-u>", "<C-u>zz<CR>", { desc = "Page up" })
-- }}}

-- Oil {{{
map("n", "-", "<cmd>Oil<CR>", { desc = "Oil" })
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

-- Telescope {{{
map("n", "<leader>tt", "<cmd>Telescope<CR>", { desc = "Telescope" })
map("n", "<leader>tb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>tc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Current Buffer" })
map("n", "<leader>td", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
map("n", "<leader>tf", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
map("n", "<leader>tg", "<cmd>Telescope live_grep<CR>", { desc = "Grep" })
map("n", "<leader>tG", "<cmd>Telescope live_grep<CR>", { desc = "Grep [String]" })
map("n", "<leader>to", "<cmd>Telescope oldfiles<CR>", { desc = "Old Files" })

-- DAP
map("n", "<leader>dd", "<cmd>lua require'telescope'.extensions.dap.configurations{}<CR>", { desc = "Debug" })
map("n", "<leader>dtc", "<cmd>lua require'telescope'.extensions.dap.commands{}<CR>", { desc = "Commands" })
map("n", "<leader>dtb", "<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<CR>", { desc = "Breakpoints" })
map("n", "<leader>dtv", "<cmd>lua require'telescope'.extensions.dap.variables{}<CR>", { desc = "Variables" })
map("n", "<leader>dtf", "<cmd>lua require'telescope'.extensions.dap.frames{}<CR>", { desc = "Frames" })

-- GIT
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Branches" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Commits" })
map("n", "<leader>gf", "<cmd>Telescope git_files<CR>", { desc = "Files" })
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Status" })

-- LSP
map("n", "<leader>lci", "<cmd>Telescope lsp_incoming_calls<CR>", { desc = "Incoming" })
map("n", "<leader>lco", "<cmd>Telescope lsp_outgoing_calls<CR>", { desc = "Outgoing" })
map("n", "<leader>lR", "<cmd>Telescope lsp_references<CR>", { desc = "References" })
map("n", "<leader>lSd", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document" })
map("n", "<leader>lSw", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Workspace" })

-- Treesitter
map("n", "<leader>vth", "<cmd>Telescope highlights<CR>", { desc = "Highlights" })
map("n", "<leader>vts", "<cmd>Telescope treesitter<CR>", { desc = "Symbols" })

-- Vim
map("n", "<leader>vta", "<cmd>Telescope autocommands<CR>", { desc = "Autocommands" })
map("n", "<leader>vtc", "<cmd>Telescope commands<CR>", { desc = "Commands" })
map("n", "<leader>vtj", "<cmd>Telescope jumplist<CR>", { desc = "Jumplist" })
map("n", "<leader>vtk", "<cmd>Telescope keymaps<CR>", { desc = "Keymaps" })
map("n", "<leader>vtm", "<cmd>Telescope man_pages<CR>", { desc = "Man pages" })
map("n", "<leader>vto", "<cmd>Telescope vim_options<CR>", { desc = "Options" })
map("n", "<leader>vtr", "<cmd>Telescope registers<CR>", { desc = "Registers" })
map("n", "<leader>vHc", "<cmd>Telescope command_history<CR>", { desc = "Command" })
map("n", "<leader>vHs", "<cmd>Telescope search_history<CR>", { desc = "Search" })
-- }}}

-- Treesitter {{{
map("n", "<leader>vTi", "<cmd>TSInstallInfo<CR>", { desc = "Info" })
map("n", "<leader>vTu", "<cmd>TSUpdateSync<CR>", { desc = "UpdateSync" })
map("n", "<leader>vTU", "<cmd>TSUninstall all<CR>", { desc = "Uninstall All" })

-- Inspect
map("n", "<leader>vTi", "<cmd>Inspect<CR>", { desc = "Inspect" })
map("n", "<leader>vTI", "<cmd>InspectTree<CR>", { desc = "Inspect [Tree]" })
-- }}}

-- Trouble {{{
map("n", "<leader>lt", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Trouble" })
map("n", "<leader>lb", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer" })
map("n", "<leader>lq", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix" })
-- map("n", "<leader>zs", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Symbols" })
-- map("n", "<leader>zl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", { desc = "LSP definitions" })
-- map("n", "<leader>zd", "<cmd>Trouble loclist toggle<CR>", { desc = "Location list" })
-- }}}

-- Undo & Redo {{{
map("n", "<u>", "<cmd>undo<CR>", { desc = "Undo" })
map("n", "<C-r>", "<cmd>redo<CR>", { desc = "Redo" })
-- }}}

-- VIM {{{
map("n", "<leader>vh", "<cmd>checkhealth<CR>", { desc = "Health" })
map("n", "<leader>vn", "<cmd>help news<CR>", { desc = "News" })
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
