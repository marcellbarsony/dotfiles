-- Yazi.nvim
-- https://github.com/folke/persistence.nvim
-- `:h persistence.nvim.txt`

---@type LazySpec
---@type YaziConfig | {}

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
    opts = {
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
        open_file_in_vertical_split = "<c-v>",
        open_file_in_horizontal_split = "<c-x>",
        open_file_in_tab = "<c-t>",
        grep_in_directory = "<c-s>",
        replace_in_directory = "<c-g>",
        cycle_open_buffers = "<tab>",
        copy_relative_path_to_selected_files = "<c-y>",
        send_to_quickfix_list = "<c-q>",
        change_working_directory = "<c-\\>",
      },
      yazi_floating_window_border = "single",
    },
    init = function()
      vim.g.loaded_netrwPlugin = 1
    end
  }
}
