-- Lualine
-- https://github.com/nvim-lualine/lualine.nvim

require('lualine').setup {
  options = {

    -- Global configuration
    always_divide_middle = true,
    ignore_focus = {},
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
    sections = {
      --lualine_a = {'mode'},
      --lualine_b = {'branch', 'diff', 'diagnostics'},
      --lualine_c = {'filename'},
      --lualine_x = {'encoding', 'fileformat', 'filetype'},
      --lualine_y = {'location'},
      --lualine_z = {'progress'}
    },
    inactive_sections = {
      --lualine_a = {},
      --lualine_b = {},
      --lualine_c = {'filename'},
      --lualine_x = {'location'},
      --lualine_y = {},
      --lualine_z = {}
    },

    -- Icons
    icons_enabled = true,

    -- Theme
    -- https://github.com/nvim-lualine/lualine.nvim#separators
    theme = 'ayu_dark', -- auto/tokyonight

    -- Separators
    -- https://github.com/nvim-lualine/lualine.nvim#separators
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},

    -- Disable lualine
    -- https://github.com/nvim-lualine/lualine.nvim#disabling-lualine
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
  },

  -- Tabline
  -- https://github.com/nvim-lualine/lualine.nvim#tabline
  tabline = {},

  -- Winbar
  -- https://github.com/nvim-lualine/lualine.nvim#winbar
  inactive_winbar = {},
  winbar = {},

  -- Extensions
  -- https://github.com/nvim-lualine/lualine.nvim#extensions
  extensions = {}
}
