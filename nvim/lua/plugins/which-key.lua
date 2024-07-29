-- Which key
-- https://github.com/folke/which-key.nvim

local wk = require("which-key")

wk.add({
    { "[",          desc = "Previous" },
    { "]",          desc = "Next" },

    { "v",          desc = "VISUAL" },
    { "z",          desc = "Fold" },

    { "g",          group = "Go-To" },
    -- { "gd", desc = "Definition" },
    -- { "gi", desc = "Implementation" },
    -- { "gtd", desc = "Type" },

    { "v",          group = "VISUAL" },
    { "z",          group = "Fold" },


    { "<leader>d",  group = "DAP" },
    { "<leader>dp", group = "Py test" },
    { "<leader>dt", group = "Telescope" },

    { "<leader>g",  group = "GIT" },

    { "<leader>h",  group = "Harpoon" },

    { "<leader>l",  group = "LSP" },
    { "<leader>lh", desc = "Help" },
    { "<leader>ls", desc = "Symbols" },
    { "<leader>lu", desc = "Calls" },


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
