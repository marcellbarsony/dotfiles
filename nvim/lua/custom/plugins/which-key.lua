-- Which-key
-- https://github.com/folke/which-key.nvim
-- https://github.com/folke/which-key.nvim/blob/main/lua/which-key/config.lua
-- `:h which-key.nvim.txt`

return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    -- Options {{{
    opts = {
      -- Preset {{{
      ---@type false | "classic" | "modern" | "helix"
      preset = "classic",
      -- }}}

      -- Popup delay {{{
      ---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
      delay = function(ctx)
        return ctx.plugin and 0 or 250
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

      -- Spec (Keymaps) {{{
      --- You can add any mappings here, or use `require('which-key').add()` later
      ---@type wk.Spec
      spec = {},
      -- }}}

      -- Warning {{{
      -- show a warning when issues were detected with your mappings
      notify = true,
      -- }}}

      -- Triggers {{{
      -- Which-key automatically sets up triggers for your mappings.
      -- But you can disable this and setup the triggers manually.
      -- Check the docs for more info.
      ---@type wk.Spec
      triggers = {
        { "<auto>", mode = "nxso" },
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
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = true, -- adds help for operators like d, y, ...
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      -- }}}

      -- Window {{{
      ---@type wk.Win.opts
      win = {
        no_overlap = true,
        -- width = 1,
        height = { min = 5, max = 50 },
        col = 1,
        -- row = math.huge,
        -- border = "none",
        padding = { 2, 2 }, -- window padding [top/bottom, right/left]
        title = false,
        title_pos = "center",
        zindex = 1000,
        -- Additional vim.wo and vim.bo options
        bo = {},
        wo = {
          winblend = 0, -- 0-100
        },
      },
      -- }}}

      -- Layout {{{
      layout = {
        width = { min = 20 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
      },
      -- }}}

      -- Keys {{{
      keys = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
      },
      -- }}}

      -- Sort {{{
      ---@type (string|wk.Sorter)[]
      --- Mappings are sorted using configured sorters and natural sort of the keys
      --- Available sorters:
      --- * local: buffer-local mappings first
      --- * order: order of the items (Used by plugins like marks / registers)
      --- * group: groups last
      --- * alphanum: alpha-numerical first
      --- * mod: special modifier keys last
      --- * manual: the order the mappings were added
      --- * case: lower-case first
      sort = { "alphanum","group", "local", "order", "mod" },
      -- }}}

      -- Expand {{{
      ---@type number|fun(node: wk.Node):boolean?
      expand = 0, -- expand groups when <= n mappings
      -- expand = function(node)
      --   return not node.desc -- expand all nodes without a description
      -- end,
      -- }}}

      -- Labels {{{
      -- Functions/Lua Patterns for formatting the labels
      ---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
      replace = {
        key = {
          function(key)
            return require("which-key.view").format(key)
          end,
          -- { "<Space>", "SPC" },
        },
        desc = {
          { "<Plug>%(?(.*)%)?", "%1" },
          { "^%+", "" },
          { "<[cC]md>", "" },
          { "<[cC][rR]>", "" },
          { "<[sS]ilent>", "" },
          { "^lua%s+", "" },
          { "^call%s+", "" },
          { "^:%s*", "" },
        },
      },
      -- }}}

      -- Icons {{{
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "",
        ellipsis = "…",
        mappings = false,
        ---@type wk.IconRule[]|false
        rules = {},
        colors = true,
        keys = {
          Up = " ",
          Down = " ",
          Left = " ",
          Right = " ",
          C = "󰘴 ",
          M = "󰘵 ",
          D = "󰘳 ",
          S = "󰘶 ",
          CR = "󰌑 ",
          Esc = "󱊷 ",
          ScrollWheelDown = "󱕐 ",
          ScrollWheelUp = "󱕑 ",
          NL = "󰌑 ",
          BS = "󰁮",
          Space = "󱁐 ",
          Tab = "󰌒 ",
          F1 = "󱊫",
          F2 = "󱊬",
          F3 = "󱊭",
          F4 = "󱊮",
          F5 = "󱊯",
          F6 = "󱊰",
          F7 = "󱊱",
          F8 = "󱊲",
          F9 = "󱊳",
          F10 = "󱊴",
          F11 = "󱊵",
          F12 = "󱊶",
        },
      },
      -- }}}

      -- Misc options {{{
      show_help = false,
      show_keys = true,
      disable = {
        ft = {}, -- file type
        bt = {}, -- buffer type
      },
      debug = false,
      -- }}}
    },
    -- }}}
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)

      wk.add({
        -- ] {{{
        { "]",  group = "NEXT" },
        { "]c", desc = "Current section" },
        { "]d", desc = "Diagnostic" },
        { "]m", desc = "Method [Start]" },
        { "]M", desc = "Method [End]" },
        { "]p", desc = "Parent section" },
        { "]s", desc = "Mispelled word" },
        { "]%", desc = "Unmatched group" },
        { "]]", desc = "Section" },
        { "](", desc = "(" },
        { "]<", desc = "<" },
        { "]{", desc = "{" },
        { "\\s", desc = "Sort", mode = { "v" } },
        -- }}}

        -- [ {{{
        { "[",  group = "PREVIOUS" },
        { "[c", desc = "Current section" },
        { "[d", desc = "Diagnostic" },
        { "[m", desc = "Method [Start]" },
        { "[M", desc = "Method [End]" },
        { "[s", desc = "Mispelled word" },
        { "[%", desc = "Unmatched group" },
        { "[[", desc = "Section" },
        { "[(", desc = "(" },
        { "[<", desc = "<" },
        { "[{", desc = "{" },
        -- }}}

        -- Symbols {{{
        { "<", group = "INDENT LEFT" },
        { "/", group = "Search [Forward]" },
        { "?", group = "Search [Backward]" },
        { "'", desc = "MARKS" },
        { "`", desc = "MARKS" },
        { '"', desc = "REGISTERS" },
        { '$', desc = "EOL" },
        { '^', desc = "BOL" },
        { ';', desc = "Search repeat [Forward]" },
        { ',', desc = "Search repeat [Backward]" },
        { "&", desc = "Substitute [Repeat last]" },
        { "}", desc = "Empty line [Next]" },
        { "{", desc = "Empty line [Prev]" },
        { "~", desc = "Case [Toggle]" },
        -- }}}

        -- a-z {{{
        { "b", desc = "Word [Prev]" },
        { "B", desc = "Word [PREV]" },
        { "e", desc = "Word [End]" },
        { "E", desc = "Word [END]" },
        { "f", desc = "Char [Next]" },
        { "F", desc = "Char [Prev]" },
        { "G", desc = "Bottom" },
        { "H", desc = "Home" },
        { "J", desc = "Append line [Below]" },
        { "K", desc = "Documentation" },
        { "L", desc = "Last line" },
        { "M", desc = "Middle line" },
        { "t", desc = "Move to [Next char]" },
        { "T", desc = "Move to [Prev char]" },
        -- { "v", desc = "VISUAL" },
        -- { "V", desc = "VISUAL Line" },
        { "w", desc = "Word [Next]" },
        { "W", desc = "Word [NEXT]" },
        -- }}}

        -- c (TODO) {{{
        -- }}}

        -- d (TODO) {{{
        -- }}}

        -- g {{{
        { "g",   group = "GO-TO" },
        { "ge",  desc = "Word [Previous end]" },
        { "gf",  desc = "File" },
        { "gg",  desc = "Top" },
        { "gi",  desc = "Insert [Last]" },
        { "gt",  desc = "Tab page [Next]" },
        { "gT",  desc = "Tab page [Prev]" },
        { "gv",  desc = "Visual selection" },
        { "gx",  desc = "Open URL" },
        { "g'",  desc = "Marks" },
        { "g`",  desc = "Marks" },
        { "g~",  desc = "Case [Toggle]" },
        { "g%",  desc = "Result [Cycle backward]" },

        { "gc",  group = "Comment" },
        { "gcc", desc = "Toggle [Line]" },
        -- }}}

        -- v (TODO) {{{
        -- { "v",  desc = "VISUAL" },

        { "<leader>g", group = "Git", mode = { "v" } },
        { "<leader>l", group = "LSP", mode = { "v" } },
        { "<leader>s", group = "Sort", mode = { "v" } },

        { "g", desc= "Text modification", mode = { "v" } },
        { "gc", desc= "Comment", mode = { "v" } },
        { "ge", desc= "End of word [Prev]", mode = { "v" } },
        { "gx", desc= "Open", mode = { "v" } },

        { "z", desc= "Fold", mode = { "v" } },
        { "z=", desc= "Spell suggestions", mode = { "v" } },
        -- }}}

        -- y (TODO) {{{
        { "Y", desc = "Yank [Line]" },
        -- }}}

        -- z {{{
        { "z",  desc = "FOLD" },
        { "za", desc = "Toggle" },
        { "zA", desc = "Toggle all [Cursor]" },
        { "zc", desc = "Close [Cursor]" },
        { "zC", desc = "Close all [Cursor]" },
        { "zd", desc = "Delete [Cursor]" },
        { "zD", desc = "Delete all [Cursor]" },
        { "zE", desc = "Delete all [File]" },
        { "zg", desc = "Spelling [Add word]" },
        { "zH", desc = "Move left" },
        { "zL", desc = "Move right" },
        { "zM", desc = "Close all" },
        { "zo", desc = "Open" },
        { "zO", desc = "Open [All]" },
        { "zR", desc = "Open [All]" },
        { "zw", desc = "Spelling [Mark as misspelled]" },
        { "zz", desc = "Center line" },
        { "z=", group = "Spelling" },
        -- }}}

        -- C-w {{{
        { "<C-w>",  group = "WINDOW"},
        { "<C-w>d", desc = "Documentation [Float]"},
        { "<C-w>q", desc = "Quit window"},
        { "<C-w>h", desc = "Move [Left]"},
        { "<C-w>j", desc = "Move [Down]"},
        { "<C-w>k", desc = "Move [Up]"},
        { "<C-w>l", desc = "Move [Right]"},
        { "<C-w>o", desc = "Close others"},
        { "<C-w>s", desc = "Split [Horizontal]"},
        { "<C-w>T", desc = "New tab [Break]"},
        { "<C-w>v", desc = "Split [Vertical]"},
        { "<C-w>w", desc = "Switch"},
        { "<C-w>x", desc = "Swap"},
        { "<C-w>+", desc = "Height [Increase]"},
        { "<C-w>-", desc = "Height [Decrease]"},
        { "<C-w>>", desc = "Width [Increase]"},
        { "<C-w><", desc = "Width [Decrease]"},
        { "<C-w>_", desc = "Height [Max]"},
        { "<C-w>|", desc = "Width [Max]"},
        -- }}}

        -- Leader {{{
        -- Code
        { "<leader>c",  group = "Code" },

        -- DAP
        { "<leader>d",  group = "DAP" },
        { "<leader>dt", group = "Telescope" },

        -- GIT
        { "<leader>g",  group = "Git" },

        -- HEX
        { "<leader>h",  group = "HEX" },

        -- LSP
        { "<leader>l",  group = "LSP" },
        { "<leader>lc", desc = "Calls" },
        { "<leader>lh", desc = "Help" },
        { "<leader>lS", group = "Symbols" },

        -- Session
        { "<leader>s",  group = "Session" },

        -- Telescope
        { "<leader>t",  group = "Telescope" },

        -- Vim
        { "<leader>v",  group = "Vim" },
        { "<leader>vH", desc = "History" },
        { "<leader>vl", desc = "Lazy" },
        { "<leader>vm", desc = "Mason" },
        { "<leader>vs", desc = "Spell" },
        { "<leader>vt", desc = "Telescope" },
        { "<leader>vT", desc = "Treesitter" }
        -- }}}
      })
    end
  }
}
