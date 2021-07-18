call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-signify'
Plug 'bfrg/vim-cpp-modern'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

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
" show tabs, trailing spaces
set list listchars=trail:·,tab:»·
set hlsearch
set incsearch
set wildmenu
" status line
set statusline=%<▌%f\ %H%M%R%=%y\ %p%%\ %l:%c%V\ ≡\ 
set scrolloff=1
set tags=./tags;

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

set t_Co=256
colorscheme gruvbox
