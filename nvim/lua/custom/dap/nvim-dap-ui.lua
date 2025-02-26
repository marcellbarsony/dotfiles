-- DAP UI
-- https://github.com/rcarriga/nvim-dap-ui
-- `:h dapui.setup()`

return {
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      require("dapui").setup({
        -- Controls {{{
        controls = {
          element = "repl",
          enabled = false,
          icons = {
            disconnect = "",
            pause = "",
            play = "",
            run_last = "",
            step_back = "",
            step_into = "",
            step_out = "",
            step_over = "",
            terminate = ""
          },
        },
        -- }}}

        -- Element mappings {{{
        element_mappings = {},
        -- }}}

        -- Expand lines {{{
        expand_lines = false,
        -- }}}

        -- Floating {{{
        floating = {
          border = "single",
          mappings = {
            close = { "q", "<Esc>" }
          }
        },
        -- }}}

        -- Force buffers {{{
        force_buffers = true,
        -- }}}

        -- Icons {{{
        icons = {
          collapsed = ">",
          current_frame = ">",
          expanded = ""
        },
        -- }}}

        -- Layouts {{{
        layouts = {
          {
            elements = {
              {
                id = "scopes",
                size = 0.4
              },
              {
                id = "watches",
                size = 0.2
              },
              {
                id = "stacks",
                size = 0.2
              },
              {
                id = "breakpoints",
                size = 0.2
              }
            },
            position = "right",
            size = 0.33
          },
          {
            elements = {
              {
                id = "console",
                size = 0.5
              },
              {
                id = "repl",
                size = 0.5
              }
            },
            position = "bottom",
            size = 9
          }
        },
        -- }}}

        -- Mappings {{{
        mappings = {
          edit = "e",
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          repl = "r",
          toggle = "t"
        },
        -- }}}

        -- Render {{{
        render = {
          indent = 1,
          max_value_lines = 100
        }
        -- }}}
      })

      -- Event listeners {{{
      local dap, dapui = require("dap"), require("dapui")

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      -- }}}
    end
  }
}
