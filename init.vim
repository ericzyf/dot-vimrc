call plug#begin(stdpath('data') . '/plugged')
Plug 'liuchengxu/space-vim-dark'
Plug 'bfrg/vim-cpp-modern'
Plug 'itchyny/lightline.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'mhinz/vim-signify'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

let g:fzf_layout={'down': '60%'}

lua << END
require'todo-comments'.setup()

local cmp = require'cmp'

cmp.setup({
  mapping = {
    ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace })
  },
  sources = cmp.config.sources({
    { name = 'buffer' },
  }, {
    { name = 'path' }
  })
})
END

let g:lightline = {
 \ 'colorscheme': 'darcula',
 \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
 \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }}
set termguicolors
set background=dark
colorscheme space-vim-dark
set cursorline
set noshowmode
set nowrap
set nu rnu
set ts=4 sw=4 sts=-1 et
set shiftround
set mouse=a
set list listchars=trail:·,tab:»·
set scrolloff=3
set matchpairs+=<:>
set updatetime=100
set splitright splitbelow
set confirm
set synmaxcol=300

hi LineNr guibg=NONE

let mapleader=' '
nnoremap <Leader>d :SignifyDiff<CR>
nnoremap <A-d> :SignifyHunkDiff<CR>
nnoremap <leader>f :Files<CR>
nnoremap ; :
nnoremap <BS> :noh<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <A-h> <C-w><
nnoremap <A-l> <C-w>>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
