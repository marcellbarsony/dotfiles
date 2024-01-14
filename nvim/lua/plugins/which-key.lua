-- Which-key
-- https://github.com/folke/which-key.nvim

local wk = require("which-key")

wk.setup {
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
    scroll_down = "<c-j>",
    scroll_up = "<c-k>",
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
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " },
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

  ["<leader>"] = {
    name = "Leader",

    d = {
      name = "DAP",
      p = { name = "Py test" },
      t = { name = "Telescope" },
    },

    g = { name = "GIT" },

    h = { name = "Harpoon" },

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

    p = {
      name = "Plugins",
      m = { name = "Mason" },
      t = { name = "Treesitter" },
      x = { name = "Trouble" },
    },

    r = { name = "Rust" },

    t = {
      name = "Telescope",
      h = { name = "History" },
      v = { name = "Vim" },
    },

  }
}

wk.register(mappings, opts)
