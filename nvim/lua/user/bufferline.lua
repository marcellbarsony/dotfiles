-- Bufferline

vim.opt.termguicolors = true
require('bufferline').setup {
  options = {
    numbers = "none",

    -- Commands
    close_command = "Bdelete! %d",          -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d",    -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",       -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,             -- can be a string | function, see "Mouse actions"

    -- Icons
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    indicator_icon = "▎",
    --indicator_icon = "│",
    close_icon = "",
    -- close_icon = '',
    buffer_close_icon = "",
    modified_icon = "●",
    left_trunc_marker = "",
    right_trunc_marker = "",

    -- Length
    max_name_length = 15,
    max_prefix_length = 15,                 -- prefix used when a buffer is de-duplicated
    tab_size = 25,

    -- Diagnostics
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    show_tab_indicators = false,

    -- Offset
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    persist_buffer_sort = true,             -- whether or not custom sorted buffers should persist
    separator_style = "thin",               -- | "thick" | "thin" | { 'any', 'any' },

    -- Bufferline
    always_show_bufferline = true,
    enforce_regular_tabs = true,


-- Highlights
    },
  highlights = {
    fill = {
      guifg = { attribute = "fg", highlight = "#ff0000" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    background = {
      guifg = { attribute = "fg", highlight = "#FF0000" },
      guibg = { attribute = "bg", highlight = "#FF0000" },
    },

    buffer_selected = {
      guifg = {attribute='fg',highlight='#ff0000'},
      guibg = {attribute='bg',highlight='#0000ff'},
      gui = 'none'
    },

    buffer_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },

    close_button = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    close_button_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    -- close_button_selected = {
    --   guifg = {attribute='fg',highlight='TabLineSel'},
    --   guibg ={attribute='bg',highlight='TabLineSel'}
    --   },

    tab_selected = {
      guifg = { attribute = "fg", highlight = "Normal" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
    tab = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    tab_close = {
      -- guifg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
      guifg = { attribute = "fg", highlight = "TabLineSel" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },

    duplicate_selected = {
      guifg = { attribute = "fg", highlight = "TabLineSel" },
      guibg = { attribute = "bg", highlight = "TabLineSel" },
      gui = "italic",
    },
    duplicate_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
      gui = "italic",
    },
    duplicate = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
      gui = "italic",
    },

    modified = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    modified_selected = {
      guifg = { attribute = "fg", highlight = "Normal" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
    modified_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },

    separator = {
      guifg = { attribute = "bg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    separator_selected = {
      guifg = { attribute = "bg", highlight = "Normal" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
     separator_visible = {
       guifg = {attribute='bg',highlight='TabLine'},
       guibg = {attribute='bg',highlight='TabLine'}
       },
    indicator_selected = {
      guifg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
  },
}
