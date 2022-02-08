call plug#begin(stdpath('data') . '/plugged')
Plug 'EdenEast/nightfox.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'lewis6991/gitsigns.nvim'
call plug#end()

let g:fzf_layout={'down': '55%'}

lua << END
require'todo-comments'.setup()
require'lualine'.setup()
require'gitsigns'.setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "cpp"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  }
}

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

set termguicolors
set background=dark
colorscheme nightfox
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

let mapleader=' '
nnoremap ]c :Gitsigns next_hunk<CR>
nnoremap [c :Gitsigns prev_hunk<CR>
nnoremap <Leader>d :Gitsigns diffthis<CR>
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
