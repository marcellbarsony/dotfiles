-- Telescope.nvim
-- https://github.com/nvim-telescope/telescope.nvim
-- :h telescope.nvim

require("telescope").setup {
    -- {{{ Defaults
    defaults = {
        -- Border
        border = true,
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },

        -- Icons
        entry_prefix = " ",
        multi_icon = "+",
        prompt_prefix = "> ",
        selection_caret = ">",

        -- Mode
        initial_mode = "insert",

        -- Mappings
        mappings = {
            i = {
                ["<C-Down>"] = require("telescope.actions").cycle_history_next,
                ["<C-Up>"] = require("telescope.actions").cycle_history_prev,
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            }
        },

        -- Opacity
        winblend = 0,

        -- Strategies
        layout_strategy = "horizontal",
        scroll_strategy = "cycle",
        selection_strategy = "reset",
        sorting_strategy = "descending",

        -- Title
        dynamic_preview_title = true,
        prompt_title = false,
        results_title = false,

        -- Wrap
        wrap_results = false,
    },
    -- }}}

    -- {{{ Pickers
    pickers = {
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        find_files = {
            -- theme = "dropdown",
        }
    },
    -- }}}

    -- {{{ Extensions
    extensions = {
        -- extension_name = {
        --   extension_config_key = value,
        -- }
    }
    -- }}}
}
