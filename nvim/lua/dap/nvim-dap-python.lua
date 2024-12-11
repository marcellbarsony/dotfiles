-- DAP Python
-- https://github.com/mfussenegger/nvim-dap-python

return {
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      local debugpy = '~/.local/share/python/debugpy/bin/python'
      require('dap-python').setup(debugpy)
    end
  }
}
