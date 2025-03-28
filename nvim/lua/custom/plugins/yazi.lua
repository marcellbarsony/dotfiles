-- Yazi.nvim
-- https://github.com/folke/persistence.nvim
-- `:h persistence.nvim.txt`

---@type LazySpec

return {
  {
    "mikavilpas/yazi.nvim",
    keys = {
      {
        "-",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Yazi",
      },
      {
        "<leader>yy",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Yazi",
      },
      {
        "<leader>yc",
        "<cmd>Yazi cwd<cr>",
        desc = "Open cwd",
      },
      {
        "<leader>yr",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume last",
      },
    },
    ---@type YaziConfig | {}
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },
    -- 👇 if you use `open_for_directories=true`, this is recommended
    init = function()
      -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
      -- vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end
  }
}
