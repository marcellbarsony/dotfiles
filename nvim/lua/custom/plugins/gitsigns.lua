-- Gitsigns
-- `:h gitsigns.txt`
-- https://github.com/lewis6991/gitsigns.nvim

return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    cmd = "Gitsigns",
    opts = {
      -- Signs {{{
      signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' }
      },
      signs_staged = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' }
      },
      -- }}}

      signs_staged_enable = false,
      signcolumn          = false,
      numhl               = false,
      linehl              = false,
      word_diff           = false,

      watch_gitdir = {
        follow_files = true
      },

      -- Attach {{{
      auto_attach             = true,
      attach_to_untracked     = false,
      -- }}}

      -- Blame {{{
      current_line_blame = false,
      current_line_blame_formatter = "<author_time:%b-%d> - <summary>", -- Option: "<author>"
      current_line_blame_opts = {
        virt_text          = true,
        virt_text_pos      = "eol",
        delay              = 1000,
        ignore_whitespace  = false,
        virt_text_priority = 100
      },
      -- }}}

      sign_priority    = 6,
      update_debounce  = 100,
      status_formatter = nil,
      max_file_length  = 10000,

      preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1
      }
    }
  }
}
