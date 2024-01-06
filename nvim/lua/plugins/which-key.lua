-- Which-key
-- https://github.com/folke/which-key.nvim

require("which-key").setup {
  plugins = {
    marks = true, -- '
    registers = true, -- "
    spelling = {
      enabled = false, -- z=
      suggestions = 20,
    },
    presets = {
      operators = true, -- c, d, v, y
      motions = true,
      text_objects = true,
      windows = true, -- <c-w>
      nav = true,
      z = true,
      g = true,
    },
  },
  operators = { gc = "Comments" },
  key_labels = {
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
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
    border = "none",
    position = "bottom",
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
  ignore_missing = false,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "},
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

    d = {
      name = "DAP",
      p = { name = "Py test" },
      t = { name = "Telescope" },
    },

    g = { name = "GIT" },

    l = {
      name = "LSP",
      h = { name = "Help" },
      m = { name = "Markdown" },
      r = { name = "Rust" },
      s = { name = "Symbols" },
      u = { name = "Calls" },
    },

    p = {
      name = "Plugins",
      m = { name = "Mason" },
    },

    t = {
      name = "Telescope",
      h = { name = "History" },
      v = { name = "Vim" },
    },
  }
}

local wk = require("which-key")
wk.register(mappings, opts)
