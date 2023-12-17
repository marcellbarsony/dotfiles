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

-- Alpha
map("n", "<leader>pa", "<cmd>Alpha<CR>", { desc = "Alpha" })

-- Lazy
map("n", "<leader>pl", "<cmd>Lazy<CR>", { desc = "Lazy" })

-- Mason
map("n", "<leader>pmc", "<cmd>checkhealth mason<CR>", { desc = "Health" })
map("n", "<leader>pmh", "<cmd>h mason<CR>", { desc = "Help" })
map("n", "<leader>pml", "<cmd>MasonLog<CR>", { desc = "Log" })
map("n", "<leader>pmm", "<cmd>Mason<CR>", { desc = "Mason" })
map("n", "<leader>pmu", "<cmd>MasonUninstallAll<CR>", { desc = "Uninstall all" })

-- Oil
map("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
map("n", "<leader>po", "<cmd>Oil<CR>", { desc = "Oil" })
