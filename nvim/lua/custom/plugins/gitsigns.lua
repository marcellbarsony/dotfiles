-- Gitsigns
-- https://github.com/lewis6991/gitsigns.nvim
-- `:h gitsigns.txt`

return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    cmd = "Gitsigns",
    keys = {
      -- Keys {{{
      {
        "<leader>gg",
        "<cmd>Gitsigns toggle_signs<CR>" ..
        "<cmd>Gitsigns toggle_numhl<CR>" ..
        "<cmd>Gitsigns toggle_current_line_blame<CR>",
        desc = "Gitsigns"
      },
      { mode = { "o" }, "<leader>gh", "<cmd>Gitsigns select_hunk<CR>", desc = "Select hunk" },
      { mode = { "x" }, "<leader>gh", "<cmd>Gitsigns select_hunk<CR>", desc = "Select hunk" }

      -- Actions
      -- { "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage hunk" },
      -- { "<leader>gs", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Stage hunk [Undo]" },
      -- { "<leader>gs", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset hunk" },
      -- { "<leader>gs", "<cmd>Gitsigns stage_buffer<CR>", desc = "Stage buffer" },
      -- { "<leader>gs", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
      -- { "<leader>gs", "<cmd>Gitsigns diffthis<CR>", desc = "Diffthis" },
      -- { "<leader>gs", "<cmd>Gitsigns toggle_deleted<CR>", desc = "Toggle deleted" },

      -- Navigation
      -- { ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", expr=true },
      -- { '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", expr=true },

      -- Signs
      -- { "<leader>gs", "<cmd>Gitsigns toggle_signs<CR>", desc = "Signs" },
      -- { "<leader>gn", "<cmd>Gitsigns toggle_numhl<CR>", desc = "Numhl" },
      -- { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Blame" },
      -- }}}
    },
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
