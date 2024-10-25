-- Colorscheme
-- h: colorscheme

-- Colors {{{
local colors = {
  bg = "NONE",
}
-- }}}

local function set_groups()
  local groups = {
    -- Base {{{
    Normal = { fg = colors.fg, bg = colors.bg },

  -- }}}
  }

  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

function colorscheme()
  vim.o.termguicolors = true
  vim.g.colors_name = "mytheme"

  set_groups()
end

colorscheme()
