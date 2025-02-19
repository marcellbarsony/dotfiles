-- Colorizer
-- `:h colorizer`
-- https://github.com/catgoose/nvim-colorizer.lua

return {
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = { "*.css" },
      lazy_load = true,
      user_default_options = {
        names = true,                                    -- Named codes like Blue or blue
        names_opts = {                                   -- options for mutating/filtering names.
          lowercase = true,                              -- name:lower(), highlight `blue` and `red`
          camelcase = true,                              -- name, highlight `Blue` and `Red`
          uppercase = false,                             -- name:upper(), highlight `BLUE` and `RED`
          strip_digits = false                           -- ignore names with digits
                                                         -- (highlight `blue` and `red`, but not `blue3` and `red4`)
        },
        names_custom = false,                            -- Custom names: table|function|false|nil
        RGB = true,                                      -- #RGB hex codes
        RGBA = true,                                     -- #RGBA hex codes
        RRGGBB = true,                                   -- #RRGGBB hex codes
        RRGGBBAA = false,                                -- #RRGGBBAA hex codes
        AARRGGBB = false,                                -- 0xAARRGGBB hex codes
        rgb_fn = false,                                  -- CSS rgb() and rgba() functions
        hsl_fn = false,                                  -- CSS hsl() and hsla() functions
        css = false,                                     -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false,                                  -- Enable all CSS *functions*: rgb_fn, hsl_fn
        tailwind = "lsp",                                -- Enable tailwind colors: true|false|normal|lsp|both
        tailwind_opts = {                                -- Options for highlighting tailwind names
          update_names = false,                          -- When using tailwind = 'both', update tailwind names from LSP results
        },
        sass = { enable = false, parsers = { "css" } },  -- Enable sass colors
        mode = "virtualtext",                            -- Display mode: background, foreground, virtualtext
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
