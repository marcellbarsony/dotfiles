-- Which-key
-- https://github.com/folke/which-key.nvim

local wk = require("which-key")

-- {{{ Setup
wk.setup {
  -- {{{ Plugins
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
  -- }}}

  -- {{{ Operators
  operators = { gc = "Comments" },
  key_labels = {
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
  -- }}}

  -- {{{ Motions
  motions = {
    count = true,
  },
  -- }}}

  -- {{{ Icons
  icons = {
    breadcrumb = "󰄾",
    separator = "",
    group = "",
  },
  -- }}}

  -- {{{ Popup
  popup_mappings = {
    scroll_down = "<c-j>",
    scroll_up = "<c-k>",
  },
  -- }}}

  -- {{{ Window
  window = {
    border = "none",
    position = "bottom",
    margin = { 0, 0, 0, 0 },
    padding = { 1, 1, 1, 1 },
    winblend = 0
  },
  -- }}}

  -- {{{ Layout
  layout = {
    height = { min = 5, max = 50 },
    width = { min = 5, max = 50 },
    spacing = 3,
    align = "left",
  },
  -- }}}

  -- {{{ Options
  ignore_missing = false,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " },
  show_help = false,
  show_keys = true,
  triggers = "auto",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- }}}

  -- {{{ Disable
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
  -- }}}
}
-- }}}

-- {{{ Config
local opts = {
  mode = "n",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}
-- }}}

-- {{{ Mappings
local mappings = {
  ["["] = { name = "Previous" },
  ["]"] = { name = "Next" },
  g = {
    name = "Go-To",
    d = "Definition",
    D = "Declaration",
    i = "Implementation",
    t = "Type",
  },
  v = { name = "VISUAL" },
  z = { name = "Fold" },

  -- {{{ Leader
  ["<leader>"] = {
    name = "Leader",

    -- {{{ d
    d = {
      name = "DAP",
      p = { name = "Py test" },
      t = { name = "Telescope" },
    },
    -- }}}

    -- {{{ g
    g = { name = "GIT" },
    -- }}}

    -- {{{ h
    h = { name = "Harpoon" },
    -- }}}

    -- {{{ l
    l = {
      name = "LSP",
      a = "Action",
      f = "Format",
      k = "Documentation",
      -- r = "Rename",
      h = { name = "Help" },
      s = { name = "Symbols" },
      u = { name = "Calls" },
    },
    -- }}}

    -- {{{ p
    p = {
      name = "Plugins",
      m = { name = "Mason" },
      t = { name = "Treesitter" },
      x = { name = "Trouble" },
    },
    -- }}}

    -- {{{ r
    r = { name = "Rust" },
    -- }}}

    -- {{{ t
    t = {
      name = "Telescope",
      h = { name = "History" },
      -- Jymplist [TODO]
      v = { name = "Vim" },
    },
    -- }}}

  }
  -- }}}
}
-- }}}

wk.register(mappings, opts)
