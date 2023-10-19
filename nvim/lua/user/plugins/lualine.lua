-- Lualine
-- https://github.com/nvim-lualine/lualine.nvim


require('lualine').setup {
  options = {

    -- Global config
    always_divide_middle = true,
    icons_enabled = true,
    ignore_focus = {},
    globalstatus = true,
    theme = 'palenight', --custom

    -- Disabled files
    -- https://github.com/nvim-lualine/lualine.nvim#disabling-lualine
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },

    -- Refresh
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },

    -- Sections
    -- sections = {
    --   lualine_a = {'mode'},
    --   lualine_b = {'branch', 'diff', 'diagnostics'},
    --   lualine_c = {'filename'},
    --   lualine_x = {'encoding', 'fileformat', 'filetype'},
    --   lualine_y = {'location'},
    --   lualine_z = {'progress'}
    -- },
    -- inactive_sections = {
    --   lualine_a = {},
    --   lualine_b = {},
    --   lualine_c = {'filename'},
    --   lualine_x = {'location'},
    --   lualine_y = {},
    --   lualine_z = {}
    -- },

    -- Separators
    -- https://github.com/nvim-lualine/lualine.nvim#separators
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },

  -- Tabline
  -- https://github.com/nvim-lualine/lualine.nvim#tabline
  tabline = {},

  -- Winbar
  -- https://github.com/nvim-lualine/lualine.nvim#winbar
  winbar = {},
  inactive_winbar = {},

  -- Extensions
  -- https://github.com/nvim-lualine/lualine.nvim#extensions
  extensions = {}
}
