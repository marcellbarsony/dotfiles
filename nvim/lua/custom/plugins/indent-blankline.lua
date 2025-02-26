-- Indent blankline
-- https://github.com/lukas-reineke/indent-blankline.nvim
-- `:h indent-blankline.txt`

return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Colors {{{
      -- rainbow-delimeters.nvim integration
      -- https://github.com/lukas-reineke/indent-blankline.nvim#rainbow-delimitersnvim-integration
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan"
      }

      local hooks = require "ibl.hooks"

      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed",    { fg = "#FFFFFF" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#FFFFFF" })
        vim.api.nvim_set_hl(0, "RainbowBlue",   { fg = "#FFFFFF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FFFFFF" })
        vim.api.nvim_set_hl(0, "RainbowGreen",  { fg = "#FFFFFF" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#FFFFFF" })
        vim.api.nvim_set_hl(0, "RainbowCyan",   { fg = "#FFFFFF" })
      end)

      vim.g.rainbow_delimiters = {
        highlight = highlight
      }
      -- }}}

      -- Config {{{
      -- `:h ibl.config`
      require("ibl").setup {
        enabled = true,
        debounce = 100,
        indent = { char = "▏" },
        whitespace = { highlight = { "Whitespace", "NonText" } },

        -- Scope
        -- `:h ibl.config.scope`
        scope = {
          enabled = true,
          exclude = {
            -- language = { "lua" }
          },
          show_start = false,
          show_end = false,
          injected_languages = false,
          highlight = highlight,
          priority = 500
        },
      }
      -- }}}

      -- Hooks {{{
      hooks.register(
        hooks.type.SCOPE_HIGHLIGHT,
        hooks.builtin.scope_highlight_from_extmark
      )
      -- }}}
    end
  }
}
