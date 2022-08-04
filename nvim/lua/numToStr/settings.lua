local g = vim.g
local o = vim.o

o.allowrevins = false
o.autochdir = true
o.backspace = 'indent,eol,start'
o.binary = false
o.breakindent = true
o.browsedir = 'current'
o.clipboard = ''


-- Backup
o.backup = false
o.backupcopy = 'auto'
o.backupext = "~"
o.backupdir = '/tmp/'
o.writebackup = false

-- Buffer
o.bufhidden = ''
o.buflisted = true
o.buftype = ''

-- Colors
o.background = 'dark'
o.termguicolors = true

-- Command line
o.cdhome = true
--o.cedit = 'CTRL-F'
o.cmdheight = 2

-- Indentation
o.autoindent = false
o.cindent = true
o.cinoptions = ''
o.cinwords = 'if,else,while,do,for,switch'
--o.cinscopecls = 'public,protected,private'
o.smartindent = false

-- R/W
o.autoread = true
o.autowrite = false
o.autowriteall = false

















-- cmd('syntax on')
-- vim.api.nvim_command('filetype plugin indent on')

-- Do not save when switching buffers
-- o.hidden = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.number = true
o.numberwidth = 4
o.relativenumber = true
--o.signcolumn = 'yes'
--o.cursorline = true

-- Better editing experience
o.expandtab = true
-- o.smarttab = true
o.wrap = true
o.textwidth = 300
o.tabstop = 4
o.shiftwidth = 0
o.softtabstop = -1 -- If negative, shiftwidth value is used
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = 'unnamedplus'

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

o.undofile = true
o.swapfile = false
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

-- Command line history
o.history = 50

-- Buffer splitting
o.splitright = true
o.splitbelow = true

-- Preserve view while jumping
--o.jumpoptions = 'view'

-- BUG: this won't update the search count after pressing `n` or `N`
-- When running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen
-- o.lazyredraw = true

-- Better folds (don't fold by default)
-- o.foldmethod = 'indent'
-- o.foldlevelstart = 99
-- o.foldnestmax = 3
-- o.foldminlines = 1

-- Map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '


-- PLUGIN
-- examples for your init.lua

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
