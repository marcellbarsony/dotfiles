-- Yazi.nvim
-- https://github.com/mikavilpas/yazi.nvim
-- `:h yazi.nvim`

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
        open_file_in_vertical_split = "<c-w>",
        open_file_in_horizontal_split = "<c-h>",
        open_file_in_tab = "<c-o>",
        grep_in_directory = "<c-s>",
        replace_in_directory = "<c-g>",
        cycle_open_buffers = "<tab>",
        copy_relative_path_to_selected_files = "<c-y>",
        send_to_quickfix_list = "<c-q>",
        change_working_directory = "<c-\\>",
      },
      floating_window_scaling_factor = 0.9,
      highlight_hovered_buffers_in_same_directory = true,
      yazi_floating_window_border = "none",
      yazi_floating_window_winblend = 0
    },
    init = function()
      vim.g.loaded_netrwPlugin = 1
    end
  }
}
