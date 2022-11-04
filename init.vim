call plug#begin(stdpath('data') . '/plugged')
Plug 'srcery-colors/srcery-vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'mhinz/vim-signify'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'stevearc/aerial.nvim'
call plug#end()

let g:fzf_layout={'down': '50%'}

lua << END
require'todo-comments'.setup()
require'lualine'.setup {
  sections = {
    lualine_c = {
      {'filename', path = 1}
    }
  }
}


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

require'aerial'.setup({
  default_direction = "prefer_left"
})
END

set termguicolors
set background=dark
colorscheme srcery
set noshowmode
set nowrap
set cursorline
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
nnoremap <Leader>a :AerialToggle!<CR>
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
