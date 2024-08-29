-- Mason-nvim-dap
-- https://github.com/jay-babu/mason-nvim-dap.nvim

local dap = require("dap")

require("mason-nvim-dap").setup({
  ensure_installed = {
    "python",       -- debugpy
    "codelldb",     -- rust
  },
  automatic_installation = true,
  automatic_setup = false,
})
