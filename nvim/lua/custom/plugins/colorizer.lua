-- Colorizer
-- https://github.com/catgoose/nvim-colorizer.lua
-- `:h colorizer`

return {
  {
    "catgoose/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    keys = {
      { "<leader>vcc", "<cmd>ColorizerToggle<CR>", desc = "Colorizer" }
    },
    opts = {
      filetypes = { "*.css" },
      lazy_load = true,
      user_default_options = {
        names = true,
        names_opts = {
          lowercase = true,
          camelcase = true,
          uppercase = false,
          strip_digits = false

        },
        names_custom = false,
        RGB = true,
        RGBA = true,
        RRGGBB = true,
        RRGGBBAA = false,
        AARRGGBB = false,
        rgb_fn = false,
        hsl_fn = false,
        css = false,
        css_fn = false,
        tailwind = "lsp",
        tailwind_opts = {
          update_names = false,
        },
        sass = { enable = false, parsers = { "css" } },
        mode = "virtualtext",
        virtualtext = "■",
        virtualtext_inline = false,
        virtualtext_mode = "foreground",
        always_update = false,
        hooks = {
          do_lines_parse = false
        }
      },
      buftypes = {}
    }
  }
}
