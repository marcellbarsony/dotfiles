-- DAP
-- `:h dap.txt`
-- `:h dap-api`
-- `:h dap-mappings`
-- https://github.com/mfussenegger/nvim-dap/

return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-telescope/telescope-dap.nvim"
    },
    keys = {
      -- Controls {{{
      { "<F1>", function() require"dap".continue()  end, mode = "n", desc = "Continue"  },
      { "<F2>", function() require"dap".step_over() end, mode = "n", desc = "Step over" },
      { "<F3>", function() require"dap".step_into() end, mode = "n", desc = "Step into" },
      { "<F4>", function() require"dap".step_out()  end, mode = "n", desc = "Step out"  },
      { "<F5>", function() require"dap".step_back() end, mode = "n", desc = "Step back" },
      -- }}}
      -- Functions {{{
      { "<leader>db",
        function() require"dap".toggle_breakpoint() end,
        mode = "n", desc = "Breakpoint"
      },
      { "<leader>dB",
        function() require"dap".set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
        mode = "n", desc = "Breakpoint [Condition]"
      },
      { "<leader>dl",
        function() require"dap".set.breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
        mode = "n", desc = "Log point"
      },
      { "<leader>dr",
        function() require"dap".restart() end,
        mode = "n", desc = "Restart"
      },
      { "<leader>dR",
        function() require"dap".repl.open() end,
        mode = "n", desc = "REPL"
      },
      { "<leader>dt",
        function() require"dap".terminate() end,
        mode = "n", desc = "Terminate"
      },
      { "<leader>dq",
        function() require"dap".disconnect({ terminateDebuggee = false }) end,
        mode = "n", desc = "Quit"
      }
      -- }}}
    },
    config = function()
      -- Signs & Colors
      vim.cmd("highlight DapBreakpointNr guifg=#FFFFFF")
      vim.cmd("highlight DapBreakpointStop guibg=#222222")
      vim.cmd("highlight DapBreakpointReject guifg=#FF4400")

      vim.fn.sign_define("DapBreakpoint",          { text = "B", texthl = "", linehl = "",                  numhl = "DapBreakpointNr" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "C", texthl = "", linehl = "",                  numhl = "DapBreakpointNr" })
      vim.fn.sign_define("DapBreakpointRejected",  { text = "R", texthl = "", linehl = "",                  numhl = "DapBreakpointReject" })
      vim.fn.sign_define("DapLogPoint",            { text = "L", texthl = "", linehl = "",                  numhl = "DapBreakpointNr" })
      vim.fn.sign_define("DapStopped",             { text = "→", texthl = "", linehl = "DapBreakpointStop", numhl = "" })

      -- Adapter
      -- `:h dap-adapter`

      -- Client
      -- `:h dap.defaults`

      -- Debugee
      -- `:h dap-configuration`

      -- Terminal
      -- `h: dap-terminal`
    end
  }
}
