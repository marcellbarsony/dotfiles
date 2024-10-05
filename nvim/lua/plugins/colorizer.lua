-- Colorizer
-- https://github.com/NvChad/nvim-colorizer.lua

require("colorizer").setup {
  -- https://github.com/NvChad/nvim-colorizer.lua#customization
  filetypes = { "*" },
  user_default_options = {
    RGB = true,                                      -- #RGB hex codes
    RRGGBB = true,                                   -- #RRGGBB hex codes
    names = true,                                    -- "Name" codes like Blue or blue
    RRGGBBAA = false,                                -- #RRGGBBAA hex codes
    AARRGGBB = false,                                -- 0xAARRGGBB hex codes
    rgb_fn = false,                                  -- CSS rgb() and rgba() functions
    hsl_fn = false,                                  -- CSS hsl() and hsla() functions
    css = false,                                     -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = false,                                  -- Enable all CSS *functions*: rgb_fn, hsl_fn
    mode = "background",                             -- Display mode: background, foreground, virtualtext
    tailwind = false,                                -- Enable tailwind colors: true / false / normal / lsp / both
    sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
    virtualtext = "■",
    always_update = false,
  },
  buftypes = {},
}
