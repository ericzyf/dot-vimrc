let g:loaded_netrwPlugin=1
let g:loaded_netrw=1
let g:loaded_zipPlugin=1
let g:loaded_zip=1
let g:loaded_tarPlugin=1
let g:loaded_tar=1
let g:loaded_shada_plugin=1
let g:loaded_shada_autoload=1
let g:loaded_2html_plugin=1
let loaded_gzip=1

call plug#begin(stdpath('data') . '/plugged')
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'branch': '0.5-compat', 'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects', {'branch' : '0.5-compat'}
Plug 'mhinz/vim-signify'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'simrat39/symbols-outline.nvim'
call plug#end()

let g:fzf_layout={'down': '50%'}
let g:signify_sign_add='▌'
let g:signify_sign_change='▌'
let g:nvim_tree_auto_close=1
let g:nvim_tree_add_trailing=1

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "cpp"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      }
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  }
}

local nvim_lsp = require('lspconfig')
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'clangd' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 300,
    }
  }
end

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'disable';
  throttle_time = 50;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
  };
}

vim.g.symbols_outline = {
  highlight_hovered_item = false,
  auto_preview = false,
}
EOF

set statusline=%<▌%f\ %y\ %H%M%R%=%p%%\ %l:%v\ 
set termguicolors
colorscheme nightfly
set nowrap
set cursorline
set nu rnu
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
set ts=4 sw=4 sts=-1 et
set shiftround
set autoindent
set mouse=a
set list listchars=trail:·,tab:»·,eol:‸
set scrolloff=3
set clipboard+=unnamedplus
set matchpairs+=<:>
set updatetime=100
set shada=""
set completeopt=menuone,noselect
set splitright splitbelow
set confirm
set nohidden

let mapleader=' '
nnoremap <Leader>n :NvimTreeToggle<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>T :Tags<CR>
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>d :SignifyDiff<CR>
nnoremap <Leader>o :SymbolsOutline<CR>
nnoremap ; :
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
