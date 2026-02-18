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
    { "<leader>oll", "<cmd>Obsidian links<CR>", desc = "Links" },
    { "<leader>olb", "<cmd>Obsidian backlinks<CR>", desc = "Backlinks" },
    { "<leader>olf", "<cmd>Obsidian follow_link<CR>", desc = "Follow" },
    { "<leader>oc", "<cmd>Obsidian <CR>", desc = "Commands" },
    { "<leader>oi", "<cmd>Obsidian paste_img<CR>", desc = "Image" },
    { "<leader>oo", "<cmd>Obsidian open<CR>", desc = "Open" },
    { "<leader>ot", "<cmd>Obsidian toc<CR>", desc = "TOC" },
    -- { "<leader>oc", "<cmd>Obsidian check<CR>", desc = "Check" },
    -- }}}
  },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    -- Attachment
    -- https://github.com/obsidian-nvim/obsidian.nvim/wiki/Attachment
    attachments = {
      folder = "./src"
    },

    -- Completion
    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
      create_new = false,
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
