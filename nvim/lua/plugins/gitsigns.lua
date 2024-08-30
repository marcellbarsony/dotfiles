-- Gitsigns
-- https://github.com/lewis6991/gitsigns.nvim

require("gitsigns").setup {
  -- signs                        = {
  --   add = { hl = "GitSignsAdd", text = "|", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
  --   change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  --   delete = { hl = "GitSignsDelete", text = ">", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
  --   topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
  --   changedelete = { hl = "GitSignsChange", text = "|>", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  -- },

  signs_staged_enable          = true,
  signcolumn                   = false,
  numhl                        = false,
  linehl                       = false,
  word_diff                    = false,

  watch_gitdir                 = {
    follow_files = true
  },

  auto_attach                  = true,
  attach_to_untracked          = false,
  current_line_blame           = false,
  current_line_blame_opts      = {
    virt_text = true,
    virt_text_pos = "eol",
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },

  current_line_blame_formatter = "<author_time:%b-%d> - <summary>", -- Option: "<author>"
  sign_priority                = 6,
  update_debounce              = 100,
  status_formatter             = nil,
  max_file_length              = 10000,

  -- Options passwd to nvim_open_win
  preview_config               = {
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1
  },
}
