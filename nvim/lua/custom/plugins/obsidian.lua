-- Obsidian.nvim
-- https://github.com/obsidian-nvim/obsidian.nvim

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  ft = "markdown",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    -- Completion
    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
      create_new = true,
    },

    -- Legacy commands
    legacy_commands = false,

    -- UI
    ui = {
      enable = false
    },

    -- Workspaces
    workspaces = {
      {
        name = "personal",
        path = "~/tmp/git/obsidian/"
      }
    }
  }
}
