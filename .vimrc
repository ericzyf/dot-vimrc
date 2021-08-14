call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-signify'
Plug 'bfrg/vim-cpp-modern'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'

call plug#end()


syntax on
set encoding=utf-8
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
" show tabs, trailing spaces, eol
set list listchars=trail:·,tab:»·,eol:‸
set hlsearch
set incsearch
set wildmenu
" status line
set statusline=%<▌%f\ %H%M%R%=%y\ %p%%\ %l:%c%V\ ≡\ 
set scrolloff=3
set tags=./tags;
if has('unnamedplus')
  set clipboard=unnamedplus
endif
set backspace=indent,eol,start
set matchpairs+=<:>

" map <Leader> to <Space>
let mapleader=' '
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
nnoremap <Leader>` :bel terminal<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>bt :BTags<CR>
nnoremap <Leader>d :SignifyDiff<CR>
nnoremap <Leader>w :tabclose<CR>

set t_Co=256
colorscheme gruvbox
let &t_ut=''
let g:signify_sign_add='▌'
let g:signify_sign_change='█'

let g:ale_linters_explicit=1
let g:ale_linters={
  \ 'c': ['cc'],
  \ 'cpp': ['cc'],
  \ }
let g:ale_c_cc_options='-Wall -Wextra -pedantic'
let g:ale_cpp_cc_options='-std=c++11 -Wall -Wextra -pedantic'
