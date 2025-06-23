-- Lualine
-- https://github.com/nvim-lualine/lualine.nvim
-- `:h lualine.txt`

-- Macro recording {{{
local function show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == "" then
    return ""
  else
    return "@" .. recording_register
  end
end
-- }}}

-- Theme {{{
local c = dofile(os.getenv("HOME") .. "/.cache/matugen/colors.lua")

local custom_theme = {
  normal = {
    a = { fg = c.fg, bg = c.bg, gui = "bold" },
    b = { fg = c.fg, bg = c.bg },
    c = { fg = c.fg, bg = c.bg },
  },
  insert = {
    a = { fg = c.fg, bg = c.bg, gui = "bold" },
    b = { fg = c.fg, bg = c.bg },
    c = { fg = c.fg, bg = c.bg },
  },
  visual = {
    a = { fg = c.fg, bg = c.bg, gui = "bold" },
    b = { fg = c.fg, bg = c.bg },
    c = { fg = c.fg, bg = c.bg },
  },
  replace = {
    a = { fg = c.fg, bg = c.bg, gui = "bold" },
    b = { fg = c.fg, bg = c.bg },
    c = { fg = c.fg, bg = c.bg },
  },
  command = {
    a = { fg = c.fg, bg = c.bg, gui = "bold" },
    b = { fg = c.fg, bg = c.bg },
    c = { fg = c.fg, bg = c.bg },
  },
  inactive = {
    a = { fg = c.fg, bg = c.bg, gui = "bold" },
    b = { fg = c.comment, bg = c.bg },
    c = { fg = c.fg, bg = c.bg },
  }
}
-- }}}

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- Options {{{
      options = {
        icons_enabled = true,
        theme = custom_theme, -- tokyonight
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
          refresh_time = 16,
          events = {
            'WinEnter',
            'BufEnter',
            'BufWritePost',
            'SessionLoadPost',
            'FileChangedShellPost',
            'VimResized',
            'Filetype',
            'CursorMoved',
            'CursorMovedI',
            'ModeChanged',
          },
        }
      },
      -- }}}

      -- Sections {{{
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          {
            "buffers",
            icons_enabled = false,
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
              alternate_file = "^",
              directory = ""
            }
          },
          {
            "macro-recording",
            fmt = show_macro_recording
          }
        },
        lualine_c = { "branch", "diff", "diagnostics", "searchcount" },
        lualine_x = { "filetype", "encoding", "fileformat" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
      },
      -- }}}

      -- Misc {{{
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
      -- }}}
    }
  }
}
