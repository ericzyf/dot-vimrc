call plug#begin('~/.vim/plugged')

Plug 'jnurmine/Zenburn'

call plug#end()

syntax on
set nu rnu
set ts=4 sw=4 sts=4 et
set autoindent
set lazyredraw
set mouse=a
set nowrap
set laststatus=2
set showcmd
set cursorline

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

set t_Co=256
colorscheme zenburn
