-- Which-key
-- https://github.com/folke/which-key.nvim

require("which-key").setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 100, -- how many suggestions should be shown in the list?
    },
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
    margin = { 0, 0, 0, 0 },
    padding = { 1, 1, 1, 1 },
    winblend = 0
  },
  layout = {
    height = { min = 5, max = 50 },
    width = { min = 5, max = 50 },
    spacing = 3,
    align = "left",
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = false,
  show_keys = true,
  triggers = "auto",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
}

-- Config
local opts = {
  mode = "n",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local mappings = {
  ['['] = { name = "" },
  [']'] = { name = "" },
  g = { name = "Go-To" },
  v = { name = "VISUAL Mode" },
  o = { name = "LSPkind outline" },
  u = { name = "Undo" },
  z = { name = "Fold" },

  -- Leader
  ["<leader>"] = {
    name = "Leader",

    -- DAP
    d = {
      name = "DAP",
      p = { name = "Py test" },
      t = { name = "Telescope" },
    },

    -- Git
    g = { name = "GIT" },

    -- LSP
    l = {
      name = "LSP",
      h = { name = "Help" },
      m = { name = "Markdown" },
      r = {
        name = "Rust",
        a = { "Action [Hover]" },
        g = { "Action [Group]" },
      },
      s = { name = "Symbols" },
      u = { name = "Calls" },
    },

    -- Plugins
    p = {
      name = "Plugins",
      m = { name = "Mason" },
    },

    -- Telescope
    t = {
      name = "Telescope",
      h = { name = "History" },
      v = { name = "Vim" },
    },
  }
}

local wk = require("which-key")
wk.register(mappings, opts)
