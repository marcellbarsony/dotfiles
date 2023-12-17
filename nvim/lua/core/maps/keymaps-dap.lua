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

-- Telescope-DAP
map("n", "<leader>dtc", "<cmd>lua require'telescope'.extensions.dap.commands{}<CR>", { desc = "Commands"})
map("n", "<leader>dtd", "<cmd>lua require'telescope'.extensions.dap.configurations{}<CR>", { desc = "Config" })
map("n", "<leader>dtb", "<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<CR>", { desc = "Breakpoints" })
map("n", "<leader>dtv", "<cmd>lua require'telescope'.extensions.dap.variables{}<CR>", { desc = "Variables" })
map("n", "<leader>dtf", "<cmd>lua require'telescope'.extensions.dap.frames{}<CR>", { desc = "Frames" })

-- DAP-Python
-- h: dap-python
map("n", "<leader>dx", "<cmd>lua require('dap-python').test_class()<CR>", { desc = "Py test [Class]" })
map("n", "<leader>dy", "<cmd>lua require('dap-python').debug_selection()<CR>", { desc = "Py test [Selection]" })
map("n", "<leader>dz", "<cmd>lua require('dap-python').test_method()<CR>", { desc = "Py test [Method]" })
