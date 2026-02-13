-- Obsidian.nvim
-- https://github.com/obsidian-nvim/obsidian.nvim

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  cmd = "Obsidian",
  ft = "markdown",
  keys = {
    -- Keys {{{
    { "<leader>ob", "<cmd>Obsidian backlinks<CR>", desc = "Backlinks" },
    { "<leader>ol", "<cmd>Obsidian links<CR>", desc = "Links" },
    { "<leader>ot", "<cmd>Obsidian toc<CR>", desc = "TOC" },
    { "<leader>oc", "<cmd>Obsidian check<CR>", desc = "Check" },
    { "<leader>of", "<cmd>Obsidian follow_link<CR>", desc = "Follow Link" },
    -- }}}
  },
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
