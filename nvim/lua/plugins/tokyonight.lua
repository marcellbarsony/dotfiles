-- Tokyonight
-- https://github.com/folke/tokyonight.nvim
-- `:h tokyonight.nvim.txt`

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- Options {{{
      style = "night", -- storm/moon/night/day
      light_style = "day",
      transparent = true,
      terminal_colors = true,
      styles = {
        -- `:h nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "transparent", -- dark
        floats = "dark",   -- dark
      },
      sidebars = { "qf", "help" },
      day_brightness = 0.5,
      hide_inactive_statusline = false,
      dim_inactive = true,
      lualine_bold = false,
      -- }}}

      -- Overrides [Colors] {{{
      -- tokyonight.nvim/lua/tokyonight/colors.lua
      ---@param c ColorScheme
      on_colors = function(c)
        c.fg_gutter = "#565F89" -- #565F89 / #9D7CD8
      end,
      -- }}}

      -- Overrides [Highlights] {{{
      -- tokyonight.nvim/lua/tokyonight/theme.lua
      ---@param hl Highlights
      ---@param c ColorScheme
      on_highlights = function(hl, c)
        local transparent = ""
        hl.Folded = { fg = c.blue, bg = c.none }               -- Folds
        hl.IncSearch = { bg = c.magenta, fg = c.black }        -- Search (current)
        hl.LineNr = { fg = c.magenta }                         -- Gutter line number
        hl.MatchParen = { fg = c.magenta, bold = true }        -- Matching parenthesis
        hl.MsgArea = { fg = c.magenta }                        -- Message and cmdline area
        hl.Pmenu = { bg = transparent }                        -- Popup menu
        hl.Search = { bg = c.blue7, fg = c.fg }                -- Search
        hl.TreesitterContext = { bg = transparent }            -- Treesitter context menu
        hl.LspInlayHint = { bg = transparent, fg = c.comment } -- LSP Inlay hint
      end,
      -- }}}
    },
  },
}
