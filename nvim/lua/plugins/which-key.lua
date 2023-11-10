-- Which-key
-- https://github.com/folke/which-key.nvim

--local config = function()
require("which-key").setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 100, -- how many suggestions should be shown in the list?
    },
  -- the presets plugin, adds help for a bunch of default keybindings in Neovim
  -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  motions = {
    count = true,
  },
  icons = {
    breadcrumb = "󰄾",
    separator = "",
    group = "",
  },
  popup_mappings = {
    scroll_down = '<c-j>',
    scroll_up = '<c-k>',
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 5, max = 50 }, -- min and max height of the columns
    width = { min = 5, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = false,
  show_keys = true,
  triggers = "auto",
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by deafult for Telescope
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
}

-- Config
local opts = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}


local mappings = {

  -- Normal mode
  ['['] = { name = "" },
  [']'] = { name = "" },
  g = { name = "Go-To" },
  v = { name = "VISUAL Mode" },
  y = { name = "Yank" },
  o = { name = "LSPkind outline" },
  u = { name = "Undo" },

  -- Leader
  ["<leader>"] = {

    name = "Leader",

    -- Buffer
    b = {
      name = "Buffer",
    },

    -- Debug
    d = {
      name = "DAP",
    },

    -- Highlight
    h = {
      name = "Highlight",
    },

    -- Insert Line
    i = {
      name = "Insert",
      a = { "Line [Above]" },
      b = { "Line [Below]" },
    },

    -- Lspsaga
    l = {
      name = "LSP",
      a = { "Code action" },
      --b = { "Diagnostics [Buffer]" },
      c = { "Calls" },
      d = { "Diagnostics [Line]" },
      f = { "Definition" },
      k = { "Documentation" },
      o = { "Outline" },
      r = { "Rename" },
      s = { "LSP Lines" },
      t = { "Terminal" },
    },

    -- Null-ls
    n = {
      name = "Null-ls",
    },

    -- Mason
    m = {
      name = "Mason",
    },

    -- Rust
    r = {
      name = "Rust",
      a = { "Action [Hover]" },
      g = { "Action [Group]" },
    },

    -- Telescope
    t = {
      name = "Telescope",
      d = { name = "DAP" },
      f = { name = "Find" },
      h = { name = "History" },
      v = { name = "Vim" },
      g = { name = "GIT" },
    },

    -- Gitsigns
    u = {
      name = "Gitsigns",
    },

    -- Venv (Python)
    v = {
      name = "PyVenv",
    },

    -- Write
    w = {
      name = "Write",
    },
  }
}

local wk = require("which-key")
wk.register(mappings, opts)
