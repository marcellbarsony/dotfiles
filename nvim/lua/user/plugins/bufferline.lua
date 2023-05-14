-- Bufferline
-- https://github.com/akinsho/bufferline.nvim
-- :h bufferline-configuration


require('bufferline').setup {
  options = {
    numbers = "none",

    -- Commands
    close_command = "bdelete! %d",          -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d",    -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",       -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,             -- can be a string | function, see "Mouse actions"

    -- Icons
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    indicator = "│",
    close_icon = "",
    --close_icon = '',
    buffer_close_icon = "",
    modified_icon = "●",
    left_trunc_marker = "",
    right_trunc_marker = "",

    -- Length
    max_name_length = 15,
    max_prefix_length = 15,                 -- prefix used when a buffer is de-duplicated
    tab_size = 20,

    -- Diagnostics
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    show_tab_indicators = false,

    -- Sidebar offset
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

    persist_buffer_sort = true,             -- whether or not custom sorted buffers should persist
    separator_style = "thin",               -- | "thick" | "thin" | { 'any', 'any' },

    -- Bufferline
    always_show_bufferline = false,
    enforce_regular_tabs = true,

    -- Sorting
    sort_by = "insert_at_end",

    },

  -- Highlights
  highlights = {
    fill = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    background = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },

    buffer_selected = {
      fg = {attribute='fg',highlight='TabLine'},
      bg = {attribute='bg',highlight='TabLine'},
      bold = true,
      italic = true
    },

    buffer_visible = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },

    close_button = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    close_button_visible = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    -- close_button_selected = {
    --   fg = {attribute='fg',highlight='TabLineSel'},
    --   bg ={attribute='bg',highlight='TabLineSel'}
    --   },

    tab_selected = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    tab = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    tab_close = {
      -- fg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
      fg = { attribute = "fg", highlight = "TabLineSel" },
      bg = { attribute = "bg", highlight = "Normal" },
    },

    duplicate_selected = {
      fg = { attribute = "fg", highlight = "TabLineSel" },
      bg = { attribute = "bg", highlight = "TabLineSel" },
      italic = true
    },
    duplicate_visible = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
      italic = true,
    },
    duplicate = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
      italic = false,
    },

    modified = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    modified_selected = {
      fg = { attribute = "fg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
    modified_visible = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },

    separator = {
      fg = { attribute = "bg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
    },
    separator_selected = {
      fg = { attribute = "bg", highlight = "Normal" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
     separator_visible = {
       fg = {attribute='bg',highlight='TabLine'},
       bg = {attribute='bg',highlight='TabLine'}
       },
    indicator_selected = {
      fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
      bg = { attribute = "bg", highlight = "Normal" },
    },
  },
}
