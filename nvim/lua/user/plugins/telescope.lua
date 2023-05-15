-- Telescope.nvim
-- https://github.com/nvim-telescope/telescope.nvim
-- :h telescope.nvim

require('telescope').setup{
  defaults = {
    -- config_key = value,
    sorting_strategy = 'descending',
    selection_strategy = 'reset',
    scroll_strategy = 'cycle',
    wrap_results = false,
    prompt_prefix = '> ',
    selection_caret = '>',
    entry_prefix = ' ',
    multi_icon = '+',
    initial_mode = 'insert',
    border = true,
    --path_display = 'shorten',
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    dynamic_preview_title = true,
    results_title = false,
    mappings = {
      i = {
        ["<C-Down>"] = require('telescope.actions').cycle_history_next,
        ["<C-Up>"] = require('telescope.actions').cycle_history_prev,
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
      }
    }
  },
  pickers = {
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
  },
  extensions = {
    -- extension_name = {
    --   extension_config_key = value,
    -- }
  }
}
