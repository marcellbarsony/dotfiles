-- lspsaga
-- https://github.com/glepnir/lspsaga.nvim

local saga = require("lspsaga")

saga.init_lsp_saga({
  border_style = "single", -- Border style
  saga_winblend = 0, -- Opacity
  -- when cursor in saga window you config these to move
  move_in_saga = { prev = '<C-p>',next = '<C-n>'},
  -- Error, Warn, Info, Hint
  -- use emoji like
  -- { "🙀", "😿", "😾", "😺" }
  -- or
  -- { "😡", "😥", "😤", "😐" }
  -- and diagnostic_header can be a function type
  -- must return a string and when diagnostic_header
  -- is function type it will have a param `entry`
  -- entry is a table type has these filed
  -- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
  diagnostic_header = { " ", " ", " ", "ﴞ " },
  -- preview lines above of lsp_finder
  preview_lines_above = 0,
  -- preview lines of lsp_finder and definition preview
  max_preview_lines = 10,
  -- use emoji lightbulb in default
  code_action_icon = "A",
  -- if true can press number to execute the codeaction in codeaction window
  code_action_num_shortcut = true,
  -- same as nvim-lightbulb but async
  code_action_lightbulb = {
      enable = true,
      enable_in_insert = true,
      cache_code_action = true,
      sign = true,
      update_time = 300,
      sign_priority = 20,
      virtual_text = true,
  },
  -- finder icons
  finder_icons = {
    def = '  ',
    ref = '諭 ',
    link = '  ',
  },
  finder_request_timeout = 1500,
  finder_action_keys = {
      open = {'o', '<CR>'},
      vsplit = 's',
      split = 'i',
      tabe = 't',
      quit = {'q', '<ESC>'},
  },
  code_action_keys = {
      quit = 'q',
      exec = '<CR>',
  },
  definition_action_keys = {
    edit = '<C-c>o',
    vsplit = '<C-c>v',
    split = '<C-c>i',
    tabe = '<C-c>t',
    quit = 'q',
  },
  rename_action_quit = '<ESC>',
  rename_in_select = true,
  -- show symbols in winbar must nightly
  -- in_custom mean use lspsaga api to get symbols
  -- and set it to your custom winbar or some winbar plugins.
  -- if in_cusomt = true you must set in_enable to false
  symbol_in_winbar = {
      in_custom = false,
      enable = true,
      separator = '  ',
      show_file = true,
      -- define how to customize filename, eg: %:., %
      -- if not set, use default value `%:t`
      -- more information see `vim.fn.expand` or `expand`
      -- ## only valid after set `show_file = true`
      file_formatter = "%",
      click_support = false,
  },
  -- show outline
  show_outline = {
   win_position = 'right',
    --set special filetype win that outline window split.like NvimTree neotree
    -- defx, db_ui
    win_with = '',
    win_width = 30,
    auto_enter = true,
    auto_preview = true,
    virt_text = '┃',
    jump_key = 'o',
    -- auto refresh when change buffer
    auto_refresh = true,
  },
  -- custom lsp kind
  -- usage { Field = 'color code'} or {Field = {your icon, your color code}}
  custom_kind = {},
  -- if you don't use nvim-lspconfig you must pass your server name and
  -- the related filetypes into this table
  -- like server_filetype_map = { metals = { "sbt", "scala" } }
  server_filetype_map = {},
})

-- Mappings
local options = { noremap = true, silent = true }

local function map(m, k, v)
  vim.api.nvim_set_keymap(m, k, v, options )
end


-- lspsaga
map('n', '<leader>gh', '<cmd>Lspsaga lsp_finder<CR>') -- Lsp finder
map('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>') -- Code actions
map('n', '<leader>r', '<cmd>Lspsaga rename<CR>') -- Rename variable
map('n', '<leader>gd', '<cmd>Lspsaga peek_definition<CR>') -- Go to definition
--map('n', '<leader>cd', '<cmd>Lspsaga show_line_diagnostics<CR>') -- Diagnostics (line)
--map('n', '<leader>cd', '<cmd>Lspsaga show_cursor_diagnostics<CR>') -- Diagnostics (cursor)
map('n', '<leader>a', '<cmd>Lspsaga outline<CR>') -- Project outline
map('n', '<leader>k', '<cmd>Lspsaga hover_doc<CR>') -- Documentation
map('n', '<leader>z', '<cmd>Lspsaga open_floaterm<CR>') -- Floating terminal

