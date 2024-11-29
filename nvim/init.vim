set number                     " Show current line number
set relativenumber             " Show relative line numbers
set hlsearch

set tabstop=2     "tab width
set shiftwidth=2  "indent size
set expandtab     "use space to instead the tab character

filetype plugin indent on
filetype indent on
" set autoindent
set smartindent

set clipboard+=unnamedplus


set termguicolors

" to remember file marks
set viminfo='1000,<50,s10,h,rA:,rB: 


function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%{StatuslineGit()}
set statusline+=\ %f

call plug#begin()
Plug 'tpope/vim-sensible'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

Plug 'kdheepak/lazygit.nvim'

Plug 'preservim/nerdtree'
Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }
Plug 'echasnovski/mini.diff', { 'branch': 'stable' }

Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'

Plug 'wakatime/vim-wakatime'
call plug#end()

" let g:polyglot#init#is_disabled = 1

syntax on
colorscheme onedark

" autocmd BufReadPost * silent! call mini#diff#setup()

let mapleader = " "

map <leader>/ :Rg!<CR>
map <leader>e :NERDTreeToggle<CR>
map <leader>, :Buffers!<CR>
map <leader>bb :b#<CR>


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>/ <cmd>Telescope live_grep<cr>
nnoremap <leader>,  <cmd>Telescope buffers<cr>
nnoremap <leader>m <cmd>Telescope marks<cr>
nnoremap <silent> <Space><Space> <cmd>Telescope git_files<CR>

nnoremap <silent> <Space>bd :bd<CR>


nnoremap <leader>gg <cmd>LazyGit<cr>

lua require('mini.diff').setup()
