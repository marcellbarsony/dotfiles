" Leader key
let mapleader=" "

" Autocompletion
set wildmode=longest,list,full

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

set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set guifont=Monaco:h11


" Center document vertically - Insert mode
autocmd InsertEnter * norm zz

" Colors
set termguicolors
"colorscheme codedark

" Cursor
set cursorline
set cursorcolumn
highlight CursorLine ctermbg=Yellow cterm=bold guibg=#191A2F
highlight CursorColumn ctermbg=Yellow cterm=bold guibg=#191A2F

:set guicursor=n-v-c:block,i-ci-ve:hor25,r-cr:hor20,o:hor50,a:blinkwait1000-blinkoff1000-blinkon1000-Cursor/lCursor

" Fix indenting in VB mode
vmap < <gv
vmap > >gv

" Fix splitting
set splitbelow splitright

" Highlight
highlight Comment cterm=italic
"highlight CursorLine ctermbg=Blue cterm=NONE
"highlight CursorLineNr ctermbg=Black cterm=bold ctermfg=Green
"highlight LineNR ctermbg=black cterm=bold ctermfg=Green

" Indentation
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Spell check
map <leader>s :setlocal spell! spelllang=en_us<CR>

" How to do 90% of what plugins do (with just Vim)
" https://www.youtube.com/watch?v=XA2WjJbmmoM
" Finding files
set path+=**
set wildmenu
" Tag jumping
command! MakeTags !ctags -R .
