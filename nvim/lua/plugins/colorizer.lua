-- nvim-colorizer
-- https://github.com/NvChad/nvim-colorizer.lua

require("colorizer").setup {
  -- Default options
  -- https://github.com/NvChad/nvim-colorizer.lua#customization
  filetypes = { "*" },
  user_default_options = {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    names = true, -- "Name" codes like Blue or blue
    RRGGBBAA = false, -- #RRGGBBAA hex codes
    AARRGGBB = false, -- 0xAARRGGBB hex codes
    rgb_fn = false, -- CSS rgb() and rgba() functions
    hsl_fn = false, -- CSS hsl() and hsla() functions
    css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    mode = "background", -- Display mode: background, foreground, virtualtext
    tailwind = false, -- Enable tailwind colors: true / false / normal / lsp / both
    sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
    virtualtext = "■",
    always_update = false,
  },
  -- all the sub-options of filetypes apply to buftypes
  buftypes = {},
}

-- Attaches to every FileType mode
require 'colorizer'.setup()

-- Attach to certain Filetypes, add special configuration for `html`
-- Use `background` for everything else.
require 'colorizer'.setup {
  filetypes = {
    'css',
    'javascript',
    html = { mode = 'foreground'; }
  },
}

-- Use the `default_options` as the second parameter, which uses
-- `foreground` for every mode. This is the inverse of the previous
-- setup configuration.
require 'colorizer'.setup {
  filetypes = {
    'css',
    'javascript',
    html = { mode = 'foreground'; }
  },
  user_default_options = { mode = "background", },
}

-- Use the `default_options` as the second parameter, which uses
-- `foreground` for every mode. This is the inverse of the previous
-- setup configuration.
require 'colorizer'.setup {
  filetypes = {
    '*'; -- Highlight all files, but customize some others.
    css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
    html = { names = false; } -- Disable parsing "names" like Blue or Gray
  },
}

-- Exclude some filetypes from highlighting by using `!`
require 'colorizer'.setup {
  filetypes = {
    '*'; -- Highlight all files, but customize some others.
    '!vim'; -- Exclude vim from highlighting.
  -- Exclusion Only makes sense if '*' is specified!
  },
}

-- Alwyas update the color values in cmp_docs even if it not focused
require 'colorizer'.setup {
  filetypes = {
    '*'; -- Highlight all files, but customize some others.
    cmp_docs = {always_update = true}
  },
}
