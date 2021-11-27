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
"set cursorcolumn
highlight CursorLine ctermbg=Yellow cterm=bold guibg=#101010
"highlight CursorColumn ctermbg=Yellow cterm=bold guibg=#2b2b2b

" Autocompletion
set wildmode=longest,list,full

" Fix splitting
set splitbelow splitright
