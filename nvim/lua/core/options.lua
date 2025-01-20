-- Options
-- `:options`
-- https://neovim.io/doc/user/options.html
-- https://neovim.io/doc/user/quickref.html

local options = {
  -- 1. Important {{{
  -- }}}

  -- 2. Moving around - Searching - Patterns {{{
  autochdir = false,
  cdhome = true,
  guicursor = "n:block,i:hor1", -- "n:blinkwait700-blinkoff400-blinkon250",
  ignorecase = true,
  smartcase = true,
  -- }}}

  -- 3. Tags {{{
  -- }}}

  -- 4. Displaying text {{{
  breakindent = true,
  conceallevel = 0,
  cmdheight = 0,
  fillchars = "stlnc:_,horiz: ,horizup:┴,horizdown:┬,vert:│,vertleft:┤,vertright:├,verthoriz:┼,fold: ,foldopen:,foldclose:,foldsep:│,diff:-,msgsep: ,eob: ,lastline:@",
  hlsearch = true,

  -- Gutter (number)
  number = true,
  numberwidth = 2,
  relativenumber = true,

  -- List
  list = true,
  listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂",

  -- Scroll
  scrolloff = 100,
  sidescrolloff = 3,

  -- Wrap
  wrap = false,
  wrapmargin = 0,
  -- }}}

  -- 5. Syntax - Highlighting - Spelling {{{
  background = "dark",
  spell = false,
  spelllang = "en",

  -- Highlighting
  cursorcolumn = false,
  cursorline = false,
  -- }}}

  -- 6. Multiple windows (Split) {{{
  splitbelow = true,
  splitright = true,
  laststatus = 3,
  -- }}}

  -- 7. Multiple tab pages {{{
  showtabline = 1,
  -- }}}

  -- 8. Terminal {{{
  -- }}}

  -- 9. Using the mouse {{{
  -- }}}

  -- 10. Messages and info {{{
  confirm = true,
  more = true,
  showmode = false,
  -- }}}

  -- 11. Selecting text {{{
  clipboard = "unnamedplus",
  -- }}}

  -- 12. Editing text {{{
  backspace = "indent,eol,start",
  textwidth = 80,
  undofile = true,
  -- }}}

  -- 13. Tabs - Indenting {{{
  -- Tabs
  autoindent = false,
  expandtab = true,
  shiftwidth = 4,
  softtabstop = -1,
  tabstop = 4,

  -- Indenting
  smartindent = false,

  -- C-indent
  cindent = true,
  cinoptions = "",
  cinwords = "if,else,while,do,for,switch",
  -- }}}

  -- 14. Folding {{{
  foldenable = true,
  foldcolumn = "0", -- auto
  foldlevelstart = 0,
  foldmethod = "marker",
  foldtext =
    [[ substitute(getline(v:foldstart), '{{{', '', 'g').'...' ]], -- }}}
    -- substitute(string, pattern, replacement, flags)
  -- }}}

  -- 15. Diff mode {{{
  -- }}}

  -- 16. Mapping {{{
  timeoutlen = 250,   -- which-key.nvim
  updatetime = 200,
  -- }}}

  -- 17. Reading and Writing files {{{
  -- R/W
  autoread = true,
  autowrite = false,
  autowriteall = false,

  -- Backup
  backup = false,
  backupcopy = "auto",
  backupext = "~",
  backupdir = "/tmp/",
  writebackup = false,

  -- Binary
  binary = false,
  -- }}}

  -- 18. The swap file {{{
  swapfile = false,
  -- }}}

  -- 19. Command line editing {{{
  history = 50,
  -- }}}

  -- 20. Executing external commands {{{
  -- }}}

  -- 21. Running make and jumping to errors (quickfix) {{{
  -- }}}

  -- 22. Language specific {{{
  allowrevins = false,
  -- }}}

  -- 23. Multi-byte characters {{{
  fileencoding = "utf-8",
  -- }}}

  -- 24. Various {{{
  signcolumn = "no",   -- auto / number / yes:1 / no
  -- statuscolumn = "%=%{v:relnum?v:relnum:v:lnum}",
  -- virtualedit = all,

  -- Buffer
  bufhidden = "",
  buflisted = true,
  buftype = "",
  -- }}}
}

vim.opt.shortmess:append "c"

for key, value in pairs(options) do
  vim.opt[key] = value
end
