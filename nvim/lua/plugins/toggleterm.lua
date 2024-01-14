-- Toggleterm
-- https://github.com/akinsho/toggleterm.nvim

require("toggleterm").setup{
  size = 20,
  direction = "float",
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  autochdir = false,
  highlights = {
    --Normal = {
    --  guibg = "<VALUE-HERE>",
    --},
    -- NormalFloat = {
    --  link = "Normal"
    -- },
    -- FloatBorder = {
    --   guifg = "Normal",
    --   guibg = "Normal",
    -- },
  },
}
