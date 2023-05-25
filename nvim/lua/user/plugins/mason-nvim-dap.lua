-- Mason-nvim-dap
-- jay-babu/mason-nvim-dap.nvim

local dap = require("dap")

require("mason-nvim-dap").setup({
  ensure_installed = {
    "python",
    "codelldb",
  },
  automatic_installation = true,
	automatic_setup = false,
})
