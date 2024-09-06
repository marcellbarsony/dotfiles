-- https://github.com/tadmccorkle/markdown.nvim
-- :h markdown.configuration

require("markdown").setup({
  mappings = {
    inline_surround_toggle = "gs",
    inline_surround_toggle_line = "gss",
    inline_surround_delete = "ds",
    inline_surround_change = "cs",
    link_add = "gl",
    link_follow = "gx",
    go_curr_heading = "]c",
    go_parent_heading = "]p",
    go_next_heading = "]]",
    go_prev_heading = "[[",
  },
  inline_surround = {
    emphasis = {
      key = "i",
      txt = "*",
    },
    strong = {
      key = "b",
      txt = "**",
    },
    strikethrough = {
      key = "s",
      txt = "~~",
    },
    code = {
      key = "c",
      txt = "`",
    },
  },
  link = {
    paste = {
      enable = true,
    },
  },
  toc = {
    omit_heading = "toc omit heading",
    omit_section = "toc omit section",
    markers = { "-" },
  },
  hooks = {
    follow_link = nil,
  },
  on_attach = nil,
})
