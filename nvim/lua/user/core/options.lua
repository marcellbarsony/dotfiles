local options = {

  allowrevins = false,
  autochdir = true,
  backspace = 'indent,eol,start',
  binary = false,
  breakindent = true,
  browsedir = 'current',
  clipboard = '',


  -- Backup
  backup = false,
  backupcopy = 'auto',
  backupext = "~",
  backupdir = '/tmp/',
  writebackup = false,

  -- Buffer
  bufhidden = '',
  buflisted = true,
  buftype = '',

  -- Buffer split
  splitright = true,
  splitbelow = true,

  -- Cache
  undofile = true,
  swapfile = false,

  -- Colors
  background = 'dark',
  termguicolors = true,

  -- Command history
  history = 50,

  -- Command line
  cdhome = true,
  --o.cedit = 'CTRL-F',
  cmdheight = 2,

  -- Indentation
  autoindent = false,
  cindent = true,
  cinoptions = '',
  cinwords = 'if,else,while,do,for,switch',
  --o.cinscopecls = 'public,protected,private',
  smartindent = false,

  -- R/W
  autoread = true,
  autowrite = false,
  autowriteall = false,

  -- Decrease update time
  timeoutlen = 500, -- Which-key.nvim
  updatetime = 200,

  -- Line number
  number = true,
  numberwidth = 3,
  relativenumber = true,

  -- Number of screen lines to keep above and below the cursor
  scrolloff = 999,


  -- Editing experience
  expandtab = true,
  wrap = true,
  textwidth = 100,
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = -1, -- If negative, shiftwidth value is used
  list = true,
  listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂',
  --virtualedit = all,

  -- Makes neovim and host OS clipboard play nicely with each other
  clipboard = 'unnamedplus',

  -- Case insensitive searching UNLESS /C or capital in search
  ignorecase = true,
  smartcase = true,

  -- Statusline
  laststatus = 3, -- Global

}

vim.opt.shortmess:append "c"

-- Loop through options
for key, value in pairs(options) do
    vim.opt[key] = value
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
