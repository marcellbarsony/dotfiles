-- Tokyonight
-- https://github.com/folke/tokyonight.nvim

require("tokyonight").setup({
  style = "night", -- storm/moon/night/day
  light_style = "day",
  transparent = true,
  terminal_colors = true,
  styles = {
    -- `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = "transparent", -- dark
    floats = "transparent", -- dark
  },
  sidebars = { "qf", "help" },
  day_brightness = 0.5,
  hide_inactive_statusline = false,
  dim_inactive = true,
  lualine_bold = false,

  -- Overrides [Colors]
  ---@param colors ColorScheme
  on_colors = function(colors)
    colors.fg_gutter = "#BB9AF7"
  end,

  -- Overrides [Highlights]
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors)
    -- highlights.normal = {
    --   a = { bg = colors.red, fg = colors.black },
    -- }
  end,


})

vim.cmd[[colorscheme tokyonight]]
