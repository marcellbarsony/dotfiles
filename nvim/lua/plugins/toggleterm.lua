-- Toggleterm
-- https://github.com/akinsho/toggleterm.nvim

require("toggleterm").setup {
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.5
    end
  end,
  direction = "float",
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  autochdir = false,
  highlights = {
    -- Normal = {
    --     guibg = "<VALUE-HERE>",
    -- },
    -- NormalFloat = {
    --     link = "Normal"
    -- },
    -- FloatBorder = {
    --     guifg = "Normal",
    --     guibg = "Normal",
    -- },
  },
  float_opts = {
    winblend = 0,
  },
}
