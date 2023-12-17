-- Keymaps (Telescope)

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Telescope
map("n", "<leader>td", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
map("n", "<leader>tt", "<cmd>Telescope<CR>", { desc = "Telescope" })
map("n", "<leader>tm", "<cmd>Telescope man_pages<CR>", { desc = "Man" })
map("n", "<leader>ts", "<cmd>Telescope treesitter<CR>", { desc = "Symbols [Treesitter]" })
-- Telescope-Buffers
map("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>bf", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Fuzzy Find" })
-- Telescope-Files
map("n", "<leader>tf", "<cmd>Telescope find_files<CR>", { desc = "Find Files" }) -- Current directory
-- Telescope-Git
map("n", "<leader>uc","<cmd>Telescope git_commits<CR>", { desc = "Commits" })
map("n", "<leader>ub","<cmd>Telescope git_branches<CR>", { desc = "Branches" })
map("n", "<leader>uf","<cmd>Telescope git_files<CR>", { desc = "Files" })
map("n", "<leader>us","<cmd>Telescope git_status<CR>", { desc = "Status" })
-- Telescope-Grep
map("n", "<leader>g", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
-- Telescope-History
map("n", "<leader>thf", "<cmd>Telescope oldfiles<CR>", { desc = "Files" })
map("n", "<leader>ths", "<cmd>Telescope search_history<CR>", { desc = "Search" })
map("n", "<leader>thc", "<cmd>Telescope command_history<CR>", { desc = "Command" })
-- Telescope-Vim
map("n", "<leader>tvc", "<cmd>Telescope commands<CR>", { desc = "Commands" })
map("n", "<leader>tvh", "<cmd>Telescope highlights<CR>", { desc = "Highlights" })
map("n", "<leader>tvk", "<cmd>Telescope keymaps<CR>", { desc = "Keymaps" })
map("n", "<leader>tvo", "<cmd>Telescope vim_options<CR>", { desc = "Options" })
map("n", "<leader>tvr", "<cmd>Telescope registers<CR>", { desc = "Registers" })
