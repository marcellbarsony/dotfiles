-- lspsaga
-- https://github.com/glepnir/lspsaga.nvim

local saga = require("lspsaga")

saga.setup({
  ui = {
    theme = "round",
    title = true,
    border = "single",
    winblend = 0,
    expand = "",
    collapse = "",
    preview = " ",
    code_action = "A",
    diagnostic = "D",
    incoming = " ",
    outgoing = " ",
    hover = ' ',
    kind = {},
  },
  beacon = {
    enable = true,
    frequency = 7,
  },
  move_in_saga = { prev = '<C-p>',next = '<C-n>'},
  diagnostic_header = { " ", " ", " ", "ﴞ " },
  preview_lines_above = 0,
  max_preview_lines = 10,
  code_action_icon = "A",
  code_action_num_shortcut = true,
  code_action_lightbulb = {
      enable = false,
      enable_in_insert = false,
      cache_code_action = true,
      sign = true,
      update_time = 250,
      sign_priority = 20,
      virtual_text = true,
  },
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
  rename = {
    quit = "<C-c>",
    exec = "<CR>",
    mark = "x",
    confirm = "<CR>",
    in_select = true,
  },
  symbol_in_winbar = {
      in_custom = false,
      enable = false, -- Toggle
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
    win_with = '',
    win_width = 30,
    auto_enter = true,
    auto_preview = true,
    virt_text = '┃',
    jump_key = 'o',
    auto_refresh = true,
    show_detail = true,
    auto_close = true,
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
map('n', '<leader>lf', '<cmd>Lspsaga lsp_finder<CR>') -- Lsp finder
map('n', '<leader>la', '<cmd>Lspsaga code_action<CR>') -- Code actions
map('n', '<leader>lr', '<cmd>Lspsaga rename<CR>') -- Rename variable
map('n', '<leader>lf', '<cmd>Lspsaga peek_definition<CR>') -- Definition (peek)
map('n',         'gd', '<cmd>Lspsaga goto_definition<CR>') -- Definition (jump)
map('n', '<leader>ls', '<cmd>Lspsaga show_line_diagnostics<CR>') -- Diagnostics (line)
map('n', '<leader>lb', '<cmd>Lspsaga show_buf_diagnostics<CR>') -- Diagnostics (buffer)
map('n', '<leader>lo', '<cmd>Lspsaga outline<CR>') -- Project outline
map('n', '<leader>lt', '<cmd>Lspsaga open_floaterm<CR>') -- Floating terminal
map('n', '<leader>lk', "<cmd>Lspsaga hover_doc ++keep<CR>") -- Documentation
map("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
map("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
