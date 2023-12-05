-- Bufferline
-- https://github.com/akinsho/bufferline.nvim
-- :h bufferline-configuration

local bufferline = require('bufferline')

bufferline.setup {
  options = {
    mode = "buffers",
    style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
    themable = true,

    -- Bufferline
    always_show_bufferline = false,
    enforce_regular_tabs = true,

    -- Commands
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,

    -- Diagnostics
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    show_tab_indicators = false,

    -- Icons
    indicator = {
        icon = '▎',
        style = 'none',
    },
    numbers = "none",
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    close_icon = "",
    buffer_close_icon = "",
    modified_icon = "●",
    left_trunc_marker = "",
    right_trunc_marker = "",

    -- Length
    max_name_length = 20,
    max_prefix_length = 5,
    show_duplicate_prefix = true,
    tab_size = 20,
    truncate_names = true,

    -- Sidebar
    offsets = {
      {
        filetype = "NvimTree",
        text = "NvimTree",
        highlight = "Directory",
        padding = 1,
      },
      {
        filetype = "packer",
        text = "Packer",
        highlight = "PanelHeading",
        padding = 1,
      }
    },

    -- Separator
    separator_style = {" ", " "},

    -- Sorting
    persist_buffer_sort = true,
    sort_by = "insert_at_end",
  },

  -- Highlights
  -- :h bufferline-highlights
  highlights = {
  };
}
