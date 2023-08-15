-- CUSTOM THEME
-- ~/.local/share/nvim/lazy/lualine.nvim/lua/lualine/themes

local colors = {
  black   = '#000000',
  maroon  = '#800000',
  green   = '#008000',
  olive   = '#808000',
  navy    = '#000080',
  purple  = '#800080',
  teal    = '#008080',
  silver  = '#c0c0c0',
  gray    = '#202020',
  red     = '#ff0000',
  lime    = '#00ff00',
  yellow  = '#ffff00',
  blue    = '#0000ff',
  fuchsia = '#ff00ff',
  aqua    = '#00ffff',
  white   = '#ffffff',
}

return {
  insert = {
    a = { fg = colors.white, bg = colors.purple, gui = 'bold' },
    b = { fg = colors.white, bg = colors.gray },
    c = { fg = colors.white, bg = colors.black },
  },
  normal = {
    a = { fg = colors.white, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.white, bg = colors.gray },
    c = { fg = colors.white, bg = colors.black },
  },
  inactive = {
    a = { fg = colors.white, bg = colors.black, gui = 'bold' },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white, bg = colors.black },
  },
  replace = {
    a = { fg = colors.white, bg = colors.black, gui = 'bold' },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white, bg = colors.black },
  },
  terminal = {
    a = { fg = colors.white, bg = colors.black, gui = 'bold' },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white, bg = colors.black },
  },
  visual = {
    a = { fg = colors.white, bg = colors.lime, gui = 'bold' },
    b = { fg = colors.white, bg = colors.gray },
    c = { fg = colors.white, bg = colors.black },
  },
}

