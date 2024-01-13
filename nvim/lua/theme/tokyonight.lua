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
  -- tokyonight.nvim/lua/tokyonight/colors.lua
  ---@param c ColorScheme
  on_colors = function(c)
    --c.fg_gutter = "#565F89"
  end,

  -- Overrides [Theme]
  -- tokyonight.nvim/lua/tokyonight/theme.lua
  ---@param hl Highlights
  ---@param c ColorScheme
  on_highlights = function(hl, c)
    local transparent = ""
    hl.IncSearch = { bg = c.magenta, fg = c.black } -- Search (current)
    hl.LineNr = { fg = c.magenta } -- Gutter line number
    hl.MatchParen = { fg = c.blue, bold = true } -- Matching parenthesis
    hl.MsgArea = { fg = c.magenta } -- Message and cmdline area
    hl.Pmenu = { bg = transparent } -- Popup menu
    hl.Search = { bg = c.blue7, fg = c.fg } -- Search
    hl.TreesitterContext = { bg = transparent } -- Treesitter context menu
  end,
})

vim.cmd[[colorscheme tokyonight]]
