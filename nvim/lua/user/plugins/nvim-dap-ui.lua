-- Nvim DAP UI
-- https://github.com/rcarriga/nvim-dap-ui

require("dapui").setup({
  -- Icons
  icons = {
    expanded = "",
    collapsed = "",
    current_frame = ""
  },
  -- Mappings
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Override mappings for specific elements
  element_mappings = {
    -- Example:
    -- stacks = {
    --   open = "<CR>",
    --   expand = "o",
    -- }
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7") == 0,
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.65 },
        { id = "breakpoints", size = 0.15 },
        { id = "stacks", size = 0.15 },
        { id = "watches", size = 0.15 },
      },
      size = 55, -- Width (columns)
      position = "right",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.20, -- % of total lines
      position = "bottom",
    },
  },
  controls = {
    -- Requires nvim 0.8 or higher
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "",
      terminate = "",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})

-- Event listeners
local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open() -- Open with DAP
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close() -- Close when DAP terminated
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close() -- Close on exit
end