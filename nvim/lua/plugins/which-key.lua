-- Which-key
-- https://github.com/folke/which-key.nvim
-- https://github.com/folke/which-key.nvim/blob/main/lua/which-key/config.lua

local wk = require("which-key")

-- Config {{{
wk.setup {

  -- Preset {{{
  ---@type false | "classic" | "modern" | "helix"
  preset = "helix",
  -- }}}

  -- Popup delay {{{
  ---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
  delay = function(ctx)
    return ctx.plugin and 0 or 200
  end,
  -- }}}

  -- Filter {{{
  ---@param mapping wk.Mapping
  filter = function(mapping)
    -- example to exclude mappings without a description
    -- return mapping.desc and mapping.desc ~= ""
    return true
  end,
  -- }}}

  -- Spec {{{
  ---@type wk.Spec
  spec = {},
  notify = true, -- Show mapping warnings
  -- }}}

  -- Triggers {{{
  ---@type wk.Spec
  triggers = {
    { "<auto>", mode = "nxsot" },
  },
  -- }}}

  -- Hidden start {{{
  -- Start hidden and wait for a key to be pressed before showing the popup
  -- Only used by enabled xo mapping modes.
  ---@param ctx { mode: string, operator: string }
  defer = function(ctx)
    return ctx.mode == "V" or ctx.mode == "<C-V>"
  end,
  -- }}}

  -- Plugins {{{
  plugins = {
    marks = true,     -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 50, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true,    -- adds help for operators like d, y, ...
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,      -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = true,            -- bindings for folds, spelling and others prefixed with z
      g = true,            -- bindings for prefixed with g
    },
  },
  -- }}}

  -- Window {{{
  win = {
    no_overlap = true, -- don't allow the popup to overlap with the cursor
    -- width = 1,
    -- height = { min = 5, max = 25 },
    -- col = 0,
    -- row = math.huge,
    -- border = "none",
    padding = { 2, 2 }, -- { top/bottom, right/left }
    title = false,
    title_pos = "center",
    zindex = 1000,
    -- Additional vim.wo and vim.bo options
    bo = {},
    wo = {
      winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    },
  },
  -- }}}

  -- Layout {{{
  layout = {
    width = { min = 20, max = 30 }, -- min and max width of the columns
    spacing = 3,                    -- spacing between columns
  },
  -- }}}

  -- Keys {{{
  keys = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>",   -- binding to scroll up inside the popup
  },
  -- }}}

  -- Sort {{{
  ---@type (string|wk.Sorter)[]
  sort = { "group", "local", "order", "alphanum", "mod", "lower", "icase" },
  -- }}}

  -- Expand {{{
  ---@type number|fun(node: wk.Node):boolean?
  expand = 0, -- expand groups when <= n mappings
  -- expand = function(node)
  --   return not node.desc -- expand all nodes without a description
  -- end,
  -- }}}

  -- Replace {{{
  ---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
  replace = {
    key = {
      function(key)
        return require("which-key.view").format(key)
      end,
      -- { "<Space>", "SPC" },
    },
    desc = {
      { "<Plug>%((.*)%)", "%1" },
      { "^%+",            "" },
      { "<[cC]md>",       "" },
      { "<[cC][rR]>",     "" },
      { "<[sS]ilent>",    "" },
      { "^lua%s+",        "" },
      { "^call%s+",       "" },
      { "^:%s*",          "" },
    },
  },
  -- }}}

  -- Icons {{{
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "", -- symbol prepended to a group
    ellipsis = "…",
    mappings = false,
    --- See `lua/which-key/icons.lua` for more details
    --- Set to `false` to disable keymap icons
    ---@type wk.IconRule[]|false
    rules = {},
    -- use the highlights from mini.icons
    -- When `false`, it will use `WhichKeyIcon` instead
    colors = true,
    -- used by key format
    keys = {
      Up = " ",
      Down = " ",
      Left = " ",
      Right = " ",
      C = "󰘴 ",
      M = "󰘵 ",
      S = "󰘶 ",
      CR = "󰌑 ",
      Esc = "󱊷 ",
      ScrollWheelDown = "󱕐 ",
      ScrollWheelUp = "󱕑 ",
      NL = "󰌑 ",
      BS = "⌫",
      Space = "󱁐 ",
      Tab = "󰌒 ",
    },
  },
  -- }}}

  -- Misc options {{{
  show_help = false, -- show a help message in the command line for using WhichKey
  show_keys = true,  -- show the currently pressed key and its label as a message in the command line
  triggers = true,   -- automatically setup triggers
  disable = {
    -- disable WhichKey for certain buf types and file types.
    ft = {},
    bt = {},
  },
  debug = false, -- enable wk.log in the current directory
  -- }}}
}
-- }}}

-- Keymaps {{{
wk.add({
  -- ] {{{
  { "]",          desc = "Next" },
  { "]m",         desc = "Method [Start]" },
  { "]M",         desc = "Method [End]" },
  { "]d",         desc = "Diagnostic" },
  { "]s",         desc = "Mispelled word" },
  { "]%",         desc = "Unmatched group" },
  -- }}}

  -- [ {{{
  { "[",          desc = "Previous" },
  { "[m",         desc = "Method [Start]" },
  { "[M",         desc = "Method [End]" },
  { "[d",         desc = "Diagnostic" },
  { "[s",         desc = "Mispelled word" },
  { "[%",         desc = "Unmatched group" },
  -- }}}

  -- a-z {{{
  { "b",          desc = "Word [Previous]" },
  { "B",          desc = "Word [PREVIOUS]" },
  { "e",          desc = "Word [End]" },
  { "E",          desc = "Word [END]" },
  { "f",          desc = "Char [Next]" },
  { "F",          desc = "Char [Previous]" },
  { "G",          desc = "Bottom" },
  { "H",          desc = "Home" },
  { "K",          desc = "Documentation" },
  { "L",          desc = "Last line" },
  { "M",          desc = "Middle line" },
  { "v",          desc = "VISUAL" },
  { "V",          desc = "VISUAL Line" },
  { "w",          desc = "Word [Next]" },
  { "W",          desc = "Word [NEXT]" },
  -- }}}

  -- g {{{
  { "g",          group = "GO-TO" },
  { "ge",         desc = "Word [Previous end]" },
  { "gf",         desc = "File" },
  { "gg",         desc = "Top" },
  { "gi",         desc = "Insert [Last]" },
  { "gt",         desc = "Tab page [Next]" },
  { "gT",         desc = "Tab page [Previous]" },
  { "gv",         desc = "Visual selection" },
  { "gx",         desc = "Open URL" },
  { "g'",         desc = "Marks" },
  { "g`",         desc = "Marks" },
  { "g~",         desc = "Case [Toggle]" },
  { "g%",         desc = "Result [Cycle backward]" },

  { "gc",         group = "Comment" },
  { "gcc",        desc = "Toggle [Line]" },
  -- }}}

  -- z {{{
  { "z",          desc = "Fold" },
  { "za",         desc = "Toggle" },
  { "zA",         desc = "Toggle all [Cursor]" },
  { "zc",         desc = "Close [Cursor]" },
  { "zC",         desc = "Close all [Cursor]" },
  { "zd",         desc = "Delete [Cursor]" },
  { "zD",         desc = "Delete all [Cursor]" },
  { "zE",         desc = "Delete all [File]" },
  { "zg",         desc = "Spelling [Add word]" },
  { "zH",         desc = "Move left" },
  { "zL",         desc = "Move right" },
  { "zo",         desc = "Open" },
  { "zO",         desc = "Open [All]" },
  { "zR",         desc = "Open [All]" },
  { "zw",         desc = "Spelling [Mark as misspelled]" },
  { "zz",         desc = "Center line" },
  -- }}}

  -- C-w {{{
  { "<C-w>",      group = "WINDOW"},
  { "<C-w>d",     desc = "Documentation [Float]"},
  { "<C-w>q",     desc = "Quit window"},
  { "<C-w>h",     desc = "Go to [Left]"},
  { "<C-w>j",     desc = "Go to [Down]"},
  { "<C-w>k",     desc = "Go to [Up]"},
  { "<C-w>l",     desc = "Go to [Right]"},
  { "<C-w>o",     desc = "Close others"},
  { "<C-w>s",     desc = "Split [Horizontal]"},
  { "<C-w>T",     desc = "New tab [Break]"},
  { "<C-w>v",     desc = "Split [Vertical]"},
  { "<C-w>+",     desc = "Height [Increase]"},
  { "<C-w>-",     desc = "Height [Decrease]"},
  { "<C-w>>",     desc = "Width [Increase]"},
  { "<C-w><",     desc = "Width [Decrease]"},
  { "<C-w>_",     desc = "Height [Max]"},
  { "<C-w>|",     desc = "Width [Max]"},
  -- }}}

  -- Leader {{{
  { "<leader>b",  group = "Harpoon" },

  { "<leader>d",  group = "DAP" },
  { "<leader>dt", group = "Telescope" },

  { "<leader>g",  group = "GIT" },

  { "<leader>h",  group = "HEX" },

  { "<leader>l",  group = "LSP" },
  { "<leader>lh", desc = "Help" },
  { "<leader>ls", desc = "Symbols" },
  { "<leader>lu", desc = "Calls" },

  { "<leader>p",  group = "Python" },
  { "<leader>pd", group = "DAP" },

  { "<leader>r",  group = "Rust" },

  { "<leader>t",  group = "Telescope" },
  { "<leader>th", desc = "History" },

  { "<leader>v",  group = "VIM" },
  { "<leader>vf", desc = "Fold" },
  { "<leader>vi", desc = "Treesitter" },
  { "<leader>vs", desc = "Spell" },
  { "<leader>vt", desc = "Telescope" },

  { "<leader>x",  group = "Plugins" },
  { "<leader>xm", desc = "Mason" },
  { "<leader>xx", desc = "Trouble" },
  -- }}}
})
-- }}}
