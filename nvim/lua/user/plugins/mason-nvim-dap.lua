-- Mason-nvim-dap
-- jay-babu/mason-nvim-dap.nvim

local dap = require("dap")

require("mason-nvim-dap").setup({
  ensure_installed = { "python" },
  automatic_installation = true,
	automatic_setup = false,
})


-- Automatic setup handlers
require 'mason-nvim-dap'.setup_handlers {
    function(source_name)
      -- all sources with no handler get passed here


      -- Keep original functionality of `automatic_setup = true`
      require('mason-nvim-dap.automatic_setup')(source_name)
    end,
    python = function(source_name)
        dap.adapters.python = {
	        type = "executable",
	        command = "/usr/bin/python3",
	        args = {
		        "-m",
		        "debugpy.adapter",
	        },
        }

        dap.configurations.python = {
	        {
		        type = "python",
		        request = "launch",
		        name = "Launch file",
		        program = "${file}",
	        },
        }
    end,
}
