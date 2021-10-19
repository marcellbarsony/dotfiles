" Leader key
let mapleader=" "

" Vertically center document - Insert mode
autocmd InsertEnter * norm zz

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Enable spell checking
map <leader>s :setlocal spell! spelllang=en_us<CR>

" Basic settings
set mouse=a
syntax on
set ignorecase
set smartcase
set encoding=utf-8
set number relativenumber

" Colors
"set termguicolors
"colorscheme codedark

" Tab settings
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

"set cursorline
"set cursorcolumn
"highlight CursorLine ctermbg=Yellow cterm=bold guibig=#2b2b2b
"highlight CursorColumn ctermbg=Yellow cterm=bold guibg=#2b2b2b

" Autocompletion
set wildmode=longest,list,full

" Fix splitting
set splitbelow splitright
