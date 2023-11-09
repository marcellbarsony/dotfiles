-- Indent blankline
-- https://github.com/lukas-reineke/indent-blankline.nvim

-- rainbow-deliometers.nvim integration
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
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#C678DD" })
end)

vim.g.rainbow_delimiters = {
  highlight = highlight
}

require("ibl").setup {
  debounce = 200,
  scope = {
    highlight = highlight
  },
  --indent = { char = "|" },
  --whitespace = {
  --  highlight = {
  --    "Whitespace",
  --    "NonText"
  --  }
  --},
}

hooks.register(
  hooks.type.SCOPE_HIGHLIGHT,
  hooks.builtin.scope_highlight_from_extmark
)
