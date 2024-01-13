-- Lualine
-- https://github.com/nvim-lualine/lualine.nvim

-- Macro-recording section
local function show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == "" then
    return ""
  else
    return "Recording @" .. recording_register
  end
end

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "palenight", -- auto / tokyonight
    component_separators = { left = "", right = ""},
    section_separators = { left = "", right = ""},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      {
        "buffers",
        show_filename_only = true,
        hide_filename_extension = false,
        show_modified_status = true,
        mode = 0,
        max_length = vim.o.columns * 2 / 3,
        filetype_names = {
          TelescopePrompt = "Telescope",
          dashboard = "Dashboard",
          packer = "Packer",
          fzf = "FZF",
          alpha = "Alpha"
        },
        use_mode_colors = false,
        -- buffers_color = {
        --   active = "lualine_{section}_normal",
        --   inactive = "lualine_{section}_inactive",
        -- },
        symbols = {
          modified = " ●",
          alternate_file = "",
          directory =  "",
        },
      },
      {
        "macro-recording",
        fmt = show_macro_recording,
      },
    },
    lualine_c = { "branch" , "diff", "diagnostics", "searchcount" },
    lualine_x = { "filetype", "encoding", "fileformat" },
    lualine_y = { "progress" },
    lualine_z = { "location" }
  },
  -- inactive_sections = {
  --   lualine_a = {},
  --   lualine_b = {},
  --   lualine_c = { "filename" },
  --   lualine_x = { "location" },
  --   lualine_y = {},
  --   lualine_z = {}
  -- },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
