call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-signify'
Plug 'bfrg/vim-cpp-modern'

call plug#end()


syntax on
set background=dark
set nu rnu
set ts=4 sw=4 sts=4 et
set autoindent
set lazyredraw
set mouse=a
set ttymouse=sgr
set nowrap
set laststatus=2
set showcmd
set cursorline
set updatetime=100
" show trailing spaces
set list
set listchars=trail:~
set hlsearch
set incsearch
set wildmenu

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

set t_Co=256
colorscheme gruvbox
