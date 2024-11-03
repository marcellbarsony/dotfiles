-- DAP
-- https://github.com/mfussenegger/nvim-dap/
-- `:h dap.txt`

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-telescope/telescope-dap.nvim",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      -- Adapter
      -- :h dap-adapter

      -- Client
      -- :h dap.defaults

      -- Debugee
      -- :h dap-configuration

      -- Signs
      vim.cmd("highlight DapBreakpointNr guifg=#FFFFFF")
      vim.cmd("highlight DapBreakpointStop guifg=#FF9900")
      vim.cmd("highlight DapBreakpointReject guifg=#FF4400")

      vim.fn.sign_define("DapBreakpoint", { text = "B", texthl = "", linehl = "", numhl = "DapBreakpointNr" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "C", texthl = "", linehl = "", numhl = "DapBreakpointNr" })
      vim.fn.sign_define("DapLogPoint", { text = "L", texthl = "", linehl = "", numhl = "DapBreakpointNr" })
      vim.fn.sign_define("DapStopped", { text = "→", texthl = "", linehl = "", numhl = "DapBreakpointStop" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "R", texthl = "", linehl = "", numhl = "DapBreakpointReject" })

      -- Terminal
      -- h: dap-terminal
    end
  },
}
