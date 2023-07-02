-- lspsaga
-- https://github.com/glepnir/lspsaga.nvim

local saga = require("lspsaga")


saga.setup({

  -- Default options
  -- https://github.com/nvimdev/lspsaga.nvim#default-options
  preview = {
    lines_above = 0,
    lines_below = 10,
  },
  scroll_preview = {
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  request_timeout = 2000,

  -- :Lspsaga lsp_finder
  -- https://github.com/nvimdev/lspsaga.nvim#lspsaga-lsp_finder
  finder = {
    max_height = 0.5,
    min_width = 30,
    force_max_height = false,
    keys = {
      jump_to = 'p',
      expand_or_jump = 'o',
      vsplit = 's',
      split = 'i',
      tabe = 't',
      tabnew = 'r',
      quit = { 'q', '<ESC>' },
      close_in_preview = '<ESC>',
    },
  },
  finder_request_timeout = 1500,

  -- :Lspsaga peek_definition
  -- https://github.com/nvimdev/lspsaga.nvim#lspsaga-peek_definition
  definition = {
    edit = "<C-c>o",
    vsplit = "<C-c>v",
    split = "<C-c>i",
    tabe = "<C-c>t",
    quit = "q",
  },


  -- :Lspsaga code_action
  -- https://github.com/nvimdev/lspsaga.nvim#lspsaga-code_action
  code_action = {
    num_shortcut = true,
    show_server_name = false,
    extend_gitsigns = true,
    keys = {
      -- string | table type
      quit = "q",
      exec = "<CR>",
    },
  },

  -- :Lspsaga lightbulb
  -- https://github.com/nvimdev/lspsaga.nvim#lspsaga-lightbulb
  lightbulb = {
    enable = false,
    enable_in_insert = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },

  -- :Lspasga hover_doc
  -- https://github.com/nvimdev/lspsaga.nvim#lspsaga-lightbulb
  hover = {
    max_width = 0.6,
    open_link = 'gx',
    open_browser = '!firefox',
  },

  -- :Lspsaga diagnostic_jump_next
  -- https://github.com/nvimdev/lspsaga.nvim#lspsaga-lightbulb
  diagnostic = {
    on_insert = false,
    on_insert_follow = false,
    insert_winblend = 0,
    show_code_action = true,
    show_source = true,
    jump_num_shortcut = true,
    max_width = 0.7,
    max_height = 0.6,
    max_show_width = 0.9,
    max_show_height = 0.6,
    text_hl_follow = true,
    border_follow = true,
    extend_relatedInformation = false,
    keys = {
      exec_action = 'o',
      quit = 'q',
      expand_or_jump = '<CR>',
      quit_in_show = { 'q', '<ESC>' },
    },
  },

  -- :Lspsaga rename
  -- https://github.com/nvimdev/lspsaga.nvim#lspsaga-rename
  rename = {
    quit = "<C-c>",
    exec = "<CR>",
    mark = "x",
    confirm = "<CR>",
    in_select = true,
  },

  -- :Lspsaga outline
  -- https://github.com/nvimdev/lspsaga.nvim#lspsaga-outline
  outline = {
    win_position = "right",
    win_with = "",
    win_width = 30,
    preview_width= 0.4,
    show_detail = true,
    auto_preview = true,
    auto_refresh = true,
    auto_close = true,
    auto_resize = false,
    custom_sort = nil,
    keys = {
      expand_or_jump = 'o',
      quit = "q",
    },
  },

  -- :Lspsaga incoming_calls / outgoing_calls
  -- https://github.com/nvimdev/lspsaga.nvim#lspsaga-incoming_calls--outgoing_calls
  callhierarchy = {
    show_detail = false,
    keys = {
      edit = "e",
      vsplit = "s",
      split = "i",
      tabe = "t",
      jump = "o",
      quit = "q",
      expand_collapse = "u",
    },
  },

  -- :Lspsaga symbols in winbar
  -- https://github.com/nvimdev/lspsaga.nvim#lspsaga-symbols-in-winbar
  symbol_in_winbar = {
    enable = false,
    separator = " ",
    ignore_patterns={},
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
  },

  -- :Lspsaga UI
  -- https://github.com/nvimdev/lspsaga.nvim#lspsaga-ui
  ui = {
    -- This option only works in Neovim 0.9
    title = true,
    -- Border type can be single, double, rounded, solid, shadow.
    border = "single",
    winblend = 0,
    expand = "",
    collapse = "",
    code_action = "💡",
    incoming = " ",
    outgoing = " ",
    hover = ' ',
    kind = {},
  },

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
--map('n', '<leader>ls', '<cmd>Lspsaga show_line_diagnostics<CR>') -- Diagnostics (line)
--map('n', '<leader>lb', '<cmd>Lspsaga show_buf_diagnostics<CR>') -- Diagnostics (buffer)
map('n', '<leader>lo', '<cmd>Lspsaga outline<CR>') -- Project outline
--map('n', '<leader>lt', '<cmd>Lspsaga open_floaterm<CR>') -- Floating terminal
map('n', '<leader>lk', "<cmd>Lspsaga hover_doc ++keep<CR>") -- Documentation
map("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
map("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
