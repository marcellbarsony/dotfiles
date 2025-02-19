-- DAP Python
-- https://github.com/mfussenegger/nvim-dap-python

return {
  {
    "mfussenegger/nvim-dap-python",
    ft = { "python" },
    lazy = true,
    config = function()
      -- local debugpy = "python3"
      -- local debugpy = "~/.local/share/python/debugpy/bin/python"
      local debugpy = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(debugpy)

      -- Custom configuration {{{
      -- https://github.com/mfussenegger/nvim-dap-python?tab=readme-ov-file#custom-configuration
      -- https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
      -- table.insert(require("dap").configurations.python, {
      --   type = "python",
      --   request = "launch",
      --   name = "My custom launch configuration",
      --   program = "${file}"
      -- })
      -- }}}
    end
  }
}
