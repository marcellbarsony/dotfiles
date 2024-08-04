-- Which key
-- https://github.com/folke/which-key.nvim

local wk = require("which-key")

-- {{{ Config
wk.setup {
    ---@type false | "classic" | "modern" | "helix"
    preset = "classic",
    ---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
    delay = function(ctx)
        return ctx.plugin and 0 or 200
    end,
    ---@param mapping wk.Mapping
    filter = function(mapping)
        -- example to exclude mappings without a description
        -- return mapping.desc and mapping.desc ~= ""
        return true
    end,
    ---@type wk.Spec
    spec = {},
    notify = true, -- Show mapping warnings
    ---@type wk.Spec
    triggers = {
        { "<auto>", mode = "nxsot" },
    },
    -- Start hidden and wait for a key to be pressed before showing the popup
    -- Only used by enabled xo mapping modes.
    ---@param ctx { mode: string, operator: string }
    defer = function(ctx)
        return ctx.mode == "V" or ctx.mode == "<C-V>"
    end,
    plugins = {
        marks = true,     -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
            enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
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
    win = {
        no_overlap = true, -- don't allow the popup to overlap with the cursor
        -- width = 1,
        height = { min = 5, max = 25 },
        -- col = 0,
        -- row = math.huge,
        -- border = "none",
        padding = { 1, 3 }, -- { top/bottom, right/left }
        title = false,
        title_pos = "center",
        zindex = 1000,
        -- Additional vim.wo and vim.bo options
        bo = {},
        wo = {
            winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        },
    },
    layout = {
        width = { min = 10, max = 30 }, -- min and max width of the columns
        spacing = 3,                    -- spacing between columns
    },
    keys = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>",   -- binding to scroll up inside the popup
    },
    ---@type (string|wk.Sorter)[]
    sort = { "group", "local", "order", "alphanum", "mod", "lower", "icase" },
    ---@type number|fun(node: wk.Node):boolean?
    expand = 0, -- expand groups when <= n mappings
    -- expand = function(node)
    --   return not node.desc -- expand all nodes without a description
    -- end,
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
    show_help = false, -- show a help message in the command line for using WhichKey
    show_keys = true,  -- show the currently pressed key and its label as a message in the command line
    triggers = true,   -- automatically setup triggers
    disable = {
        -- disable WhichKey for certain buf types and file types.
        ft = {},
        bt = {},
    },
    debug = false, -- enable wk.log in the current directory
}
-- }}}

-- {{{ Keymaps
wk.add({
    { "[",          desc = "Previous" },
    { "]",          desc = "Next" },

    { "v",          desc = "VISUAL" },
    { "z",          desc = "Fold" },

    { "g",          group = "Go-To" },
    -- { "gd", desc = "Definition" },
    -- { "gi", desc = "Implementation" },
    -- { "gtd", desc = "Type" },

    { "<leader>d",  group = "DAP" },
    { "<leader>dt", group = "Telescope" },

    { "<leader>g",  group = "GIT" },

    { "<leader>h",  group = "Harpoon" },

    { "<leader>l",  group = "LSP" },
    { "<leader>lh", desc = "Help" },
    { "<leader>ls", desc = "Symbols" },
    { "<leader>lu", desc = "Calls" },

    { "<leader>p",  group = "Python" },
    { "<leader>pd",  group = "DAP" },

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
})
-- }}}
