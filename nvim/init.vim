" Leader key
let mapleader=" "

" Vertically center document - Insert mode
autocmd InsertEnter * norm zz

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Spell check
map <leader>s :setlocal spell! spelllang=en_us<CR>

" Basic settings
syntax on
set nocompatible
set mouse=a                     " Enable mouse
set ignorecase                  " Case sensitive matching
set smartcase                   " Smart case matching
set encoding=UTF-8              " Encodingi
set number relativenumber       " Relative numbers
set showmatch                   " Show matching brackets
set clipboard+=unnamedplus      " Use system keybard (unnamedplus/unnamed)

" Indentation
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Highlight
highlight Comment cterm=italic
"highlight CursorLine ctermbg=Blue cterm=NONE
"highlight CursorLineNr ctermbg=Black cterm=bold ctermfg=Green
"highlight LineNR ctermbg=black cterm=bold ctermfg=Green

" Colors
"set termguicolors
"colorscheme codedark

"set cursorline
"set cursorcolumn
"highlight CursorLine ctermbg=Yellow cterm=bold guibig=#2b2b2b
"highlight CursorColumn ctermbg=Yellow cterm=bold guibg=#2b2b2b

" Autocompletion
set wildmode=longest,list,full

" Fix splitting
set splitbelow splitright

" XDG Base Directory
set runtimepath^=$XDG_CONFIG_HOME/vim
set runtimepath+=$XDG_DATA_HOME/vim
set runtimepath+=$XDG_CONFIG_HOME/vim/after

set packpath^=$XDG_DATA_HOME/vim,$XDG_CONFIG_HOME/vim
set packpath+=$XDG_CONFIG_HOME/vim/after,$XDG_DATA_HOME/vim/after

let g:netrw_home = $XDG_DATA_HOME."/vim"
call mkdir($XDG_DATA_HOME."/vim/spell", 'p')
set viewdir=$XDG_DATA_HOME/vim/view | call mkdir(&viewdir, 'p')

set backupdir=$XDG_CACHE_HOME/vim/backup | call mkdir(&backupdir, 'p')
set directory=$XDG_CACHE_HOME/vim/swap   | call mkdir(&directory, 'p')
set undodir=$XDG_CACHE_HOME/vim/undo     | call mkdir(&undodir,   'p')

if !has('nvim') | set viminfofile=$XDG_STATE_HOME/vim/viminfo | endif
