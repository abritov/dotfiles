set number                     " Show current line number
set relativenumber             " Show relative line numbers
set hlsearch

" handle tab
set tabstop=2     "tab width
set shiftwidth=2  "indent size
set expandtab     "use space to instead the tab character
set smarttab

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set ttimeout
set ttimeoutlen=1
set ttyfast

" Use the system clipboard for all yanks and deletes
" if has("clipboard")
"     set clipboard=unnamedplus " Use the + register for all yank operations
" endif

" to remember file marks
set viminfo='1000,<50,s10,h,rA:,rB: 

filetype plugin indent on
filetype indent on
set autoindent
" set smartindent


" set nocompatible " for vim-polyglot
set termguicolors
syntax on

" let g:fzf_preview_command = 'bat --style=numbers --color=always --theme TwoDark'

let mapleader = " "
map <leader>/ :Rg!<CR>
map <leader>e :NERDTreeToggle<CR>
map <leader>, :Buffers!<CR>
map <leader>bb :b#<CR>
" map <leader>bd :bd<CR>

nnoremap <silent> <Space><Space> :GFiles!<CR>
nnoremap <silent> <Space>bd :bd<CR>

call plug#begin()

" List your plugins here
" Plug 'tpope/vim-sensible'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'

Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'


" Plug 'Shougo/deoplete.nvim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
Plug 'dense-analysis/ale' " lsp integration

call plug#end()

colorscheme onedark

" let g:deoplete#enable_at_startup = 1
let g:ale_completion_enabled = 1
