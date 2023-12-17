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

-- Telescope
-- https://github.com/nvim-telescope/telescope.nvim#vim-pickers
map("n", "<leader>tt", "<cmd>Telescope<CR>", { desc = "Telescope" })
map("n", "<leader>tb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>tg", "<cmd>Telescope live_grep<CR>", { desc = "Grep" })
map("n", "<leader>tk", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
map("n", "<leader>tm", "<cmd>Telescope man_pages<CR>", { desc = "Man" })
map("n", "<leader>tx", "<cmd>Telescope treesitter<CR>", { desc = "Treesitter symbols" })
-- Telescope-Files
map("n", "<leader>tfb", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Find [Buffer]" })
map("n", "<leader>tff", "<cmd>Telescope find_files<CR>", { desc = "Find [Files]" }) -- Current directory
-- Telescope-Git
map("n", "<leader>tuc","<cmd>Telescope git_commits<CR>", { desc = "Commits" })
map("n", "<leader>tub","<cmd>Telescope git_branches<CR>", { desc = "Branches" })
map("n", "<leader>tuf","<cmd>Telescope git_files<CR>", { desc = "Files" })
map("n", "<leader>tus","<cmd>Telescope git_status<CR>", { desc = "Status" })
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

