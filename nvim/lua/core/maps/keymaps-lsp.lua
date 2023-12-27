-- Keymaps (LSP)
-- :h lspconfig
-- :h lspconfig-keybindings

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Help
map("n", "<leader>lhi", "<cmd>LspInfo<CR>", { desc = "Info" })
map("n", "<leader>lhc", "<cmd>help lspconfig.txt<CR>", { desc = "Config" })
map("n", "<leader>lhr", "<cmd>help lsp-config<CR>", { desc = "Reference" })
map("n", "<leader>lhl", "<cmd>LspLog<CR>", { desc = "Log" })

-- LSP Lines
map("n", "<leader>ll", require("lsp_lines").toggle, { desc = "LSP lines" })

-- Lspsaga
map("n",         "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Definition [Jump]" })
map("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", { desc = "Action"})
map("n", "<leader>lc", "<cmd>Lspsaga rename<CR>", { desc = "Rename"})
map("n", "<leader>ld", "<cmd>Lspsaga hover_doc<CR>", { desc = "Documentation" })
map("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", { desc = "Outline" })
map("n", "<leader>lp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek definition" })
map("n", "<leader>lt", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Type" })
map("n", "<Leader>lw", "<cmd>Lspsaga winbar_toggle<CR>", { desc = "Winbar"})
--map("n", "<leader>lb", "<cmd>Lspsaga show_buf_diagnostics<CR>", { desc = "Diagnostics [Buffer] "})
--map("n", "<leader>lk", "<cmd>Lspsaga hover_doc ++keep<CR>", { desc = "Documentation" })
--map("n", "<leader>ls", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Diagnostics [Line] "})
--map("n", "<leader>lt", "<cmd>Lspsaga open_floaterm<CR>", { desc = "Floaterm" })
--map("n", "<Leader>lci", "<cmd>Lspsaga incoming_calls<CR>", { desc = "Incoming"})
--map("n", "<Leader>lco", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "Outgoing"})

-- Telescope-LSP
map("n", "<leader>lv", "<cmd>Telescope lsp_references<CR>", { desc = "References" })
map("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", { desc = "Implementations" })
-- Telescope-LSP-Calls
map("n", "<leader>lui", "<cmd>Telescope lsp_incoming_calls<CR>", { desc = "Incoming" })
map("n", "<leader>luo", "<cmd>Telescope lsp_outgoing_calls<CR>", { desc = "Outgoing" })
-- Telescope-LSP-Symbols
map("n", "<leader>lss", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document" })
map("n", "<leader>lsw", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Workspace" })

-- Py-lsp
--map("n", "<leader>lva", "<cmd>PyLspActivateVenv<CR>", { desc = "Activate" })
--map("n", "<leader>lvc", "<cmd>PyLspCurrentVenv<CR>", { desc = "Current" })
--map("n", "<leader>lvd", "<cmd>PyLspDeactivateVenv<CR>", { desc = "Deactivate" })
--map("n", "<leader>lvf", "<cmd>PyLspFindVenvs<CR>", { desc = "Find" })
--map("n", "<leader>lvn", "<cmd>PyLspCreateVenv<CR>", { desc = "New" })
--map("n", "<leader>lvi", "<cmd>PyRun -m pip install -r requirements.txt<CR>", { desc = "Install dependencies" })
