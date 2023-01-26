-- Nvim DAP UI
-- https://github.com/rcarriga/nvim-dap-ui

require("dapui").setup({
  -- Icons
  icons = {
    expanded = "",
    collapsed = ">", -- 
    current_frame = ">", -- 
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
  expand_lines = vim.fn.has("nvim-0.7") == 0,
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.65 },
        { id = "breakpoints", size = 0.1 },
        { id = "stacks", size = 0.16 },
        { id = "watches", size = 0.09 },
      },
      size = 55, -- Width (columns)
      position = "right",
    },
    {
      elements = {
        "console",
        --"repl"
      },
      size = 0.1,
      position = "bottom",
    },
  },
  -- Controls
  controls = {
    enabled = false,
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
  -- Floating
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
