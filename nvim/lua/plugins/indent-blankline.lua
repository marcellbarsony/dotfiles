-- Indent Blankline
-- https://github.com/lukas-reineke/indent-blankline.nvim

-- Colors
-- rainbow-delimeters.nvim integration
-- https://github.com/lukas-reineke/indent-blankline.nvim#rainbow-delimitersnvim-integration
local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}

local hooks = require "ibl.hooks"

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#CBA6F7" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#CBA6F7" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#CBA6F7" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#CBA6F7" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#CBA6F7" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#CBA6F7" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#CBA6F7" })
end)

vim.g.rainbow_delimiters = {
  highlight = highlight
}

-- Config
-- :help ibl.config
require("ibl").setup {
  enabled = true,
  debounce = 100,
  -- indent = { char = "|" },
  whitespace = { highlight = { "Whitespace", "NonText" } },

  -- Scope
  -- :help ibl.config.scope
  scope = {
    enabled = true,
    exclude = {
      language = { "lua" }
    },
    show_start = false,
    show_end = false,
    injected_languages = false,
    highlight = highlight,
    priority = 500,
  },
}

-- Hooks
hooks.register(
  hooks.type.SCOPE_HIGHLIGHT,
  hooks.builtin.scope_highlight_from_extmark
)
