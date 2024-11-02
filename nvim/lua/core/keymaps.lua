-- Keymaps
-- https://neovim.io/doc/user/map.html

-- Modes
-- n - normal
-- i - insert
-- v - visual
-- x - visual block
-- t - term
-- c - command

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

-- Alpha {{{
map("n", "<leader>xa", "<cmd>Alpha<CR>", { desc = "Alpha" })
-- }}}

-- Arrow keys {{{
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")
-- }}}

-- Buffers {{{
map("n", "<Tab>", "<cmd>bn<CR>", { desc = "Buffer [Next]" })
map("n", "<S-Tab>", "<cmd>bp<CR>", { desc = "Buffer [Prev]" })
map("n", "<C-^>", "<cmd>e #<CR>", { desc = "Alternate file" })      -- :help alternate-file
map("n", "<C-'>", "<cmd>b#<CR>", { desc = "Buffer [To last]" })
map("n", "<C-q>", "<cmd>bdelete<CR>", { desc = "Buffer [Delete]" }) -- :bd!<CR>
-- }}}

-- Clipboard (Yank) {{{
map("n", "y", "\"+y", { desc = "Yank [Global]" })
map("v", "y", "\"+y", { desc = "Yank [Global]" })
map("x", "p", [["_dp]], { desc = "Paste [Global]" })
-- }}}

-- DAP {{{
-- :h dap-api
-- :h dap-mappings
map("n", "<leader>d5", "<cmd>lua require'dap'.continue()<CR>", { desc = "DAP [Continue]" })
map("n", "<leader>d3", "<cmd>lua require'dap'.step_over()<CR>", { desc = "DAP [Step over]" })
map("n", "<leader>d2", "<cmd>lua require'dap'.step_into()<CR>", { desc = "DAP [Step into]" })
map("n", "<leader>d0", "<cmd>lua require'dap'.step_out()<CR>", { desc = "DAP [Step out]" })
map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Breakpoint" })
map("n", "<leader>dc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Breakpoint [Condition]" })
map("n", "<leader>dd", "<cmd>lua require'dap'.set.breakpoint(nul, nul, vim.fn.input('Log point message: '))<CR>",
  { desc = "Breakpoint [Log point msg]" })
map("n", "<leader>dq", "<cmd>lua require('dap').disconnect()<CR>", { desc = "Quit" })
map("n", "<leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Run last" })
map("n", "<leader>ds", "<cmd>lua require'dap'.repl.open()<CR>", { desc = "REPL" })
-- }}}

-- Gitsigns {{{
map("n", "<leader>gg",
  "<cmd>Gitsigns toggle_signs<CR><cmd>Gitsigns toggle_numhl<CR><cmd>Gitsigns toggle_current_line_blame<CR>",
  { desc = "Gitsigns" }
)
-- map("n", "<leader>gs", "<cmd>Gitsigns toggle_signs<CR>", { desc = "Signs" })
-- map("n", "<leader>gn", "<cmd>Gitsigns toggle_numhl<CR>", { desc = "Numhl" })
-- map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Blame" })

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

-- Text object
map("o", "<leader>gh", "<cmd>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
map("x", "<leader>gh", "<cmd>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
-- }}}

-- HEX {{{
map("n", "<leader>hd", "<cmd>HexDump<CR>", { desc = "Dump" })
map("n", "<leader>ht", "<cmd>HexToggle<CR>", { desc = "Toggle" })
map("n", "<leader>ha", "<cmd>HexAssemble<CR>", { desc = "Assemble" })
-- }}}

-- Highlights {{{
map("n", "<C-c>", "<cmd>nohl<CR>", { desc = "Clear" })
-- map("n", "<leader>cr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[Highlight] Replace selected" })
-- }}}

-- Lazy {{{
map("n", "<leader>xl", "<cmd>Lazy<CR>", { desc = "Lazy" })
-- }}}

-- Lines (Indent) {{{
map("v", "<", "<gv", { desc = "Indent [Left]" })
map("v", ">", ">gv", { desc = "Indent [Right]" })
-- }}}

-- Lines (Misc) {{{
map("n", "J", "mzJ`z", { desc = "Append line below" })
-- }}}

-- Lines (Move) {{{
-- https://vim.fandom.com/wiki/Moving_lines_up_or_down
map("v", "K", ":move '<-2<CR>gv=gv", { desc = "Move [Up]" })
map("v", "J", ":move '>+1<CR>gv=gv", { desc = "Move [Down]" })
map("x", "K", ":move '<-2<CR>gv=gv", { desc = "Block [Move Up]" })
map("x", "J", ":move '>+1<CR>gv=gv", { desc = "Block [Move Down]" })
-- map("n", "K", ":move .-2<CR>", { desc = "Line [Move Up]" })
-- map("n", "J", ":move .+1<CR>", { desc = "Line [Move Down]" })
-- }}}

-- LSP {{{
-- :h lspconfig-keybindings

-- Calls
-- map("n", "<leader>lci", vim.lsp.buf.incoming_calls, { buffer = args.buf, desc = "Incoming" })
-- map("n", "<leader>lco", vim.lsp.buf.outgoing_calls, { buffer = args.buf, desc = "Outgoing" })

-- Codelens
-- map("n", "<leader>lxx", vim.lsp.codelens.refresh, { buffer = args.buf, desc = "Codelens Refresh" })
-- map("n", "<leader>lxr", vim.lsp.codelens.run, { buffer = args.buf, desc = "Codelens Run" })
-- map("n", "<leader>lxc", vim.lsp.codelens.clear, { buffer = args.buf, desc = "Codelens Clear" })
-- map("n", "<leader>lxc", vim.lsp.codelens.display, { buffer = bufnr, desc = "Codelens Clear" })

-- Code action
map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "Action" })

-- Diagnostics
map("n", "<leader>ld", vim.diagnostic.open_float, { opts = opts, desc = "Diagnostics" })
-- map("n", "]d", vim.diagnostic.goto_next, { opts = opts, desc = "Next diagnostic" })     -- default map
-- map("n", "[d", vim.diagnostic.goto_prev, { opts = opts, desc = "Previous diagnostic" }) -- default map
-- map("n", "<leader>q", vim.diagnostic.setloclist, { opts = opts, desc = "Set localist" })

-- Documentation
-- nvim-lspconfig maps K to vim.lsp.buf.hover()
map("n", "<leader>lk", vim.lsp.buf.hover, { desc = "Documentation" })

-- Formatting
map("n", "<leader>lf", function()
  vim.lsp.buf.format { async = true }
end, { desc = "Format" })

-- Go-To
map("n", "gd", vim.lsp.buf.definition, { desc = "Definition" })
-- map("n", "gt", vim.lsp.buf.type_definition, { desc = "Type definition" })
-- map("n", "gD", vim.lsp.buf.declaration, { desc = "Declaration" })
-- map("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation" })

-- Inlay hints
map("n", "<leader>lv", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }, { bufnr = 0 })
end, { desc = "Inlay hints" })

-- References
map("n", "<leader>lx", vim.lsp.buf.references, { desc = "References" })
-- map("n", "<leader>lv", vim.lsp.buf.clear_references, { desc = "Clear references" })

-- Rename
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })

-- Signature help
-- map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })

-- Workspace folder
-- map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Workspace folder [Add]"})
-- map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Workspace folder [Remove]"})
-- map("n", "<leader>wl", function()
--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, opts)
-- }}}

-- LSP Help {{{
map("n", "<leader>lhc", "<cmd>help lspconfig.txt<CR>", { desc = "Config" })
map("n", "<leader>lhi", "<cmd>LspInfo<CR>", { desc = "Info" })
map("n", "<leader>lhl", "<cmd>LspLog<CR>", { desc = "Log" })
map("n", "<leader>lhr", "<cmd>help lsp-config<CR>", { desc = "Reference" })
-- }}}

-- Macro {{{
map("n", "Q", "@qj", { desc = "Macro [Replay]" })
map("x", "Q", ":norm @qj<CR>", { desc = "Macro [Replay Block]" })
-- }}}

-- Mason {{{
map("n", "<leader>xmc", "<cmd>checkhealth mason<CR>", { desc = "Health" })
map("n", "<leader>xmh", "<cmd>h mason<CR>", { desc = "Help" })
map("n", "<leader>xml", "<cmd>MasonLog<CR>", { desc = "Log" })
map("n", "<leader>xmm", "<cmd>Mason<CR>", { desc = "Mason" })
map("n", "<leader>xmu", "<cmd>MasonUninstallAll<CR>", { desc = "Uninstall all" })
-- }}}

-- Navigation {{{
-- Conflicts with cursor scrolloff
-- map("n", "<C-d>", "<C-d>zz<CR>", { desc = "Page down" })
-- map("n", "<C-u>", "<C-u>zz<CR>", { desc = "Page up" })
-- }}}

-- Oil {{{
map("n", "-", "<cmd>Oil<CR>", { desc = "Oil" })
map("n", "<leader>xo", "<cmd>Oil<CR>", { desc = "Oil" })
-- }}}

-- Search {{{
map("n", "*", "*N", { desc = "Find word" })             -- Fix *: don't move to next match
map("n", "#", "#N", { desc = "Find word [Backwards]" }) -- Fix #: don't move to next match
map("n", "n", "nzzzv", { desc = "Search [Next]" })      -- Fix n: keep cursor in center
map("n", "N", "Nzzzv", { desc = "Search [Prev]" })      -- Fix N: keep cursor in center
-- }}}

-- Shell movements {{{
map("i", "<C-A>", "<ESC>I", { desc = "Jump EOL" })
map("i", "<C-E>", "<ESC>A", { desc = "Jump BOL" })
-- }}}

-- Splits (Ctrl + w) {{{
map("n", "<C-m>", "<C-w>h", { desc = "Split [Left]" })
map("n", "<C-n>", "<C-w>j", { desc = "Split [Up]" })
map("n", "<C-e>", "<C-w>k", { desc = "Split [Down]" })
map("n", "<C-i>", "<C-w>l", { desc = "Split [Right]" })
map("n", "<C-A-m>", "<cmd>vertical resize -5<CR>", { desc = "Split [Ver +]" })
map("n", "<C-A-n>", "<cmd>resize +5<CR>", { desc = "Split [Hor +]" })
map("n", "<C-A-e>", "<cmd>resize -5<CR>", { desc = "Split [Hor -]" })
map("n", "<C-A-i>", "<cmd>vertical resize +5<CR>", { desc = "Split [Ver -]" })
-- }}}

-- Telescope {{{
map("n", "<leader>tt", "<cmd>Telescope<CR>", { desc = "Telescope" })
map("n", "<leader>ta", "<cmd>Telescope autocommands<CR>", { desc = "Autocommands" })
map("n", "<leader>tb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>tc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Buffer [Fuzzy current]" })
map("n", "<leader>td", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
map("n", "<leader>tf", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
map("n", "<leader>tj", "<cmd>Telescope jumplist<CR>", { desc = "Jumplist" })
map("n", "<leader>tr", "<cmd>Telescope registers<CR>", { desc = "Registers" })
map("n", "<leader>ts", "<cmd>Telescope treesitter<CR>", { desc = "Symbols [Treesitter]" })

-- Telescope - DAP
map("n", "<leader>dtc", "<cmd>lua require'telescope'.extensions.dap.commands{}<CR>", { desc = "Commands" })
map("n", "<leader>dtd", "<cmd>lua require'telescope'.extensions.dap.configurations{}<CR>", { desc = "Config" })
map("n", "<leader>dtb", "<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<CR>", { desc = "Breakpoints" })
map("n", "<leader>dtv", "<cmd>lua require'telescope'.extensions.dap.variables{}<CR>", { desc = "Variables" })
map("n", "<leader>dtf", "<cmd>lua require'telescope'.extensions.dap.frames{}<CR>", { desc = "Frames" })

-- Telescope - GIT
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Branches" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Commits" })
map("n", "<leader>gf", "<cmd>Telescope git_files<CR>", { desc = "Files" })
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Status" })

-- Telescope - Grep
map("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })

-- Telescope - History
map("n", "<leader>thc", "<cmd>Telescope command_history<CR>", { desc = "Command" })
map("n", "<leader>thf", "<cmd>Telescope oldfiles<CR>", { desc = "Files" })
map("n", "<leader>ths", "<cmd>Telescope search_history<CR>", { desc = "Search" })

-- Telescope - LSP
map("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", { desc = "Implementations" }) -- !!!
map("n", "<leader>ll", "<cmd>Telescope lsp_references<CR>", { desc = "LSP References" })

-- Telescope - LSP Calls
map("n", "<leader>lui", "<cmd>Telescope lsp_incoming_calls<CR>", { desc = "Incoming" })
map("n", "<leader>luo", "<cmd>Telescope lsp_outgoing_calls<CR>", { desc = "Outgoing" })

-- Telescope - LSP Symbols
map("n", "<leader>lsd", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document" })
map("n", "<leader>lsw", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Workspace" })

-- Telescope - Vim
map("n", "<leader>vtc", "<cmd>Telescope commands<CR>", { desc = "Commands" })
map("n", "<leader>vth", "<cmd>Telescope highlights<CR>", { desc = "Highlights" })
map("n", "<leader>vtk", "<cmd>Telescope keymaps<CR>", { desc = "Keymaps" })
map("n", "<leader>vtm", "<cmd>Telescope man_pages<CR>", { desc = "Man" })
map("n", "<leader>vto", "<cmd>Telescope vim_options<CR>", { desc = "Options" })
-- }}}

-- Treesitter (Neovim built-ins) {{{
map("n", "<leader>vii", "<cmd>Inspect<CR>", { desc = "Inspect" })
map("n", "<leader>vit", "<cmd>InspectTree<CR>", { desc = "Inspect [Tree]" })
-- }}}

-- Trouble {{{
map("n", "<leader>lt", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble" })
map("n", "<leader>lb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer" })
-- map("n", "<leader>zs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols" })
-- map("n", "<leader>zl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP definitions" })
-- map("n", "<leader>zd", "<cmd>Trouble loclist toggle<cr>", { desc = "Location list" })
-- map("n", "<leader>zq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix" })
-- }}}

-- Undo & Redo {{{
map("n", "<u>", "<cmd>undo<CR>", { desc = "Undo" })
map("n", "<C-r>", "<cmd>redo<CR>", { desc = "Redo" })
-- }}}

-- VIM {{{
map("n", "<leader>vj", "<cmd>jumps<CR>", { desc = "Jumps" })
map("n", "<leader>vd", "<cmd>sort n<CR>", { desc = "Sort %d" })
map("n", "<leader>vo", "<cmd>options<CR>", { desc = "Options" })
map("n", "<leader>vff", "<cmd>set foldenable!<CR>", { desc = "Fold" })
map("n", "<leader>vfc", "<cmd>set foldcolumn!<CR>", { desc = "Column" })
map("n", "<leader>vss", "<cmd>set spell!<CR>", { desc = "Spell" })
map("n", "<leader>vsm", "<cmd>mkspell! %<CR>", { desc = "Mkspell" })
-- }}}

-- Which Key {{{
map("n", "<leader>xw", "<cmd>WhichKey<CR>", { desc = "WhichKey" })
-- }}}
