-- Treesitter context
-- https://github.com/nvim-treesitter/nvim-treesitter-context
-- https://github.com/nvim-treesitter/nvim-treesitter-context#configuration

require'treesitter-context'.setup {
  enable = true,
  max_lines = 0,
  min_window_height = 0,
  line_numbers = true,
  multiline_threshold = 5,
  trim_scope = 'outer',
  mode = 'cursor',
  separator = nil,
  zindex = 20,
  on_attach = nil,
}
