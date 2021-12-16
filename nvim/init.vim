" Leader key
let mapleader=" "

" Center document vertically - Insert mode
autocmd InsertEnter * norm zz

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Spell check
map <leader>s :setlocal spell! spelllang=en_us<CR>

" Basic settings
syntax enable
filetype plugin on
set nocompatible
set mouse=a                     " Enable mouse
set ignorecase                  " Case sensitive matching
set smartcase                   " Smart case matching
set encoding=UTF-8              " Encoding
set number relativenumber       " Relative numbers
set showmatch                   " Show matching brackets
set clipboard+=unnamedplus      " Use system clipboard (unnamedplus/unnamed)

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
set termguicolors
"colorscheme codedark

" Cursor
set cursorline
set cursorcolumn
highlight CursorLine ctermbg=Yellow cterm=bold guibg=#101010
highlight CursorColumn ctermbg=Yellow cterm=bold guibg=#0A0A0A

" Autocompletion
set wildmode=longest,list,full

" Fix splitting
set splitbelow splitright

" How to do 90% of what plugins do (with just Vim)
" https://www.youtube.com/watch?v=XA2WjJbmmoM
" Finding files
set path+=**
set wildmenu
" Tag jumping
command! MakeTags !ctags -R .
