-- Options
-- https://neovim.io/doc/user/options.html
-- https://neovim.io/doc/user/quickref.html

local options = {

  allowrevins = false,
  autochdir = true,
  backspace = 'indent,eol,start',
  binary = false,
  breakindent = true,
  browsedir = 'current',
  conceallevel = 0,
  list = true,
  listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂',
  more=true,
  showtabline = 1,
  shiftwidth = 2,
  textwidth = 100,
  --virtualedit = all,
  wrap = false,

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

  -- Case sensitivity
  ignorecase = true,
  smartcase = true,

  -- Clipboard
  clipboard = 'unnamedplus',

  -- Colors
  background = 'dark',
  termguicolors = true,

  -- Command history
  history = 50,

  -- Command line
  cdhome = true,
  --o.cedit = 'CTRL-F',
  cmdheight = 0,

  -- Cursor
  cursorcolumn = false,
  cursorline = false,
  scrolloff = 10,
  sidescrolloff = 8,

  -- Encoding
  fileencoding = 'utf-8',

  -- Fold
  foldmethod = 'manual',
  foldexpr = 'nvim_treesitter#foldexpr()',
  -- foldcolumn = '1', -- '0' is not bad
  -- foldlevel = 99, -- Using ufo provider need a large value, feel free to decrease the value
  -- foldlevelstart = 99,
  -- foldenable = true,

  -- Highlight
  hlsearch = true,

  -- Indentation
  autoindent = false,
  cindent = true,
  cinoptions = '',
  cinwords = 'if,else,while,do,for,switch',
  --o.cinscopecls = 'public,protected,private',
  smartindent = false,

  -- Line number
  number = true,
  numberwidth = 2,
  relativenumber = true,
  signcolumn = 'yes',

  -- Mode
  showmode = false,

  -- R/W
  autoread = true,
  autowrite = false,
  autowriteall = false,

  -- Statusline
  laststatus = 3,

  -- Tab
  expandtab = true,
  softtabstop = -1,
  tabstop = 2,

  -- Update
  timeoutlen = 250, -- which-key.nvim
  updatetime = 200,

}

vim.opt.shortmess:append "c"

-- Loop through options
for key, value in pairs(options) do
    vim.opt[key] = value
end

-- Netrw
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1
