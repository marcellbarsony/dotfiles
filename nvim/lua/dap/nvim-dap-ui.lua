-- Nvim DAP UI
-- https://github.com/rcarriga/nvim-dap-ui

-- {{{ Setup
-- :h dapui.setup()
require("dapui").setup({
    -- {{{ Controls
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
            terminate = "",
        },
    },
    -- }}}

    -- {{{ Element mappings
    element_mappings = {},
    -- }}}

    -- {{{ Expand lines
    expand_lines = vim.fn.has("nvim-0.7") == 0, --true
    -- }}}

    -- {{{ Floating
    floating = {
        border = "single",
        mappings = {
            close = { "q", "<Esc>" }
        }
    },
    -- }}}

    -- {{{ Force buffers
    force_buffers = true,
    -- }}}

    -- {{{ Icons
    icons = {
        expanded = "",
        collapsed = ">",     -- 
        current_frame = ">", -- 
    },
    -- }}}

    -- {{{ Layouts
    layouts = {
        {
            elements = {
                {
                    id = "scopes",
                    size = 0.55
                }, {
                id = "watches",
                size = 0.15
            }, {
                id = "stacks",
                size = 0.15
            }, {
                id = "breakpoints",
                size = 0.15
            }
            },
            position = "right",
            size = 0.3
        }, {
        elements = {
            {
                id = "console",
                size = 0.5
            }, {
            id = "repl",
            size = 0.5
        }
        },
        position = "bottom",
        size = 8
    }
    },
    -- }}}

    -- {{{ Mappings
    mappings = {
        edit = "e",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t"
    },
    -- }}}

    -- {{{ Render
    render = {
        indent = 1,
        max_value_lines = 100
    }
    -- }}}
})
-- }}}

-- {{{ Event listeners
local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open() -- Open DAP UI
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close() -- Terminate DAP UI
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close() -- Close DAP UI
end
-- }}}

-- {{{ [TODO] Neodev.nvim
-- It is highly recommended to use neodev.nvim to enable type checking for
-- nvim-dap-ui to get type checking, documentation and autocompletion for
-- all API functions.
--
-- >lua
--   require("neodev").setup({
--     library = { plugins = { "nvim-dap-ui" }, types = true },
--     ...
--   })
-- }}}
