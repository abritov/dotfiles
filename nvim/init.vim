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


call plug#begin()
Plug 'tpope/vim-sensible'

Plug 'nvim-lua/plenary.nvim'
" keep this commit until telescope 0.2.0 will merge horizontal preview scroll
Plug 'nvim-telescope/telescope.nvim', { 'commit': '61a4a61' }

Plug 'kdheepak/lazygit.nvim'
Plug 'tpope/vim-fugitive'

Plug 'preservim/nerdtree'
Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }
Plug 'echasnovski/mini.diff', { 'branch': 'stable' }

Plug 'folke/which-key.nvim'
Plug 'lewis6991/gitsigns.nvim'

Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'

Plug 'wakatime/vim-wakatime'

Plug 'ThePrimeagen/harpoon', { 'branch': 'harpoon2' }

Plug 'vim-airline/vim-airline'
call plug#end()

" let g:polyglot#init#is_disabled = 1

syntax on
colorscheme onedark

" autocmd BufReadPost * silent! call mini#diff#setup()

let mapleader = " "

map <leader>/ :Rg!<CR>
map <leader>e :NERDTreeToggle<CR>
map <leader>bb :b#<CR>
map <M-[> :cprev<CR>
map <M-]> :cnext<CR>


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>/ <cmd>Telescope live_grep<cr>
nnoremap <leader>,  <cmd>Telescope buffers<cr>
nnoremap <leader>m <cmd>Telescope marks<cr>
nnoremap <silent> <Space><Space> <cmd>Telescope git_files<CR>
" lua <<EOF 
" vim.keymap.set('n', '<C-k>', require('telescope.actions').preview_scrolling_right, { desc = 'Scroll Right in Preview' })
" vim.keymap.set('n', '<C-f>', require('telescope.actions').preview_scrolling_left, { desc = 'Scroll Left in Preview' })
" EOF


nnoremap <silent> <Space>bd :bd<CR>

nnoremap <leader>gg <cmd>LazyGit<cr>

lua require('mini.diff').setup()
lua <<EOF 
  local harpoon = require("harpoon")
  harpoon:setup()
  vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
  vim.keymap.set("n", "<leader>d", function() harpoon:list():remove() end)
  vim.keymap.set("n", "<leader>n", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)  
  vim.keymap.set("n", "<C-[>", function() harpoon:list():prev() end)
  vim.keymap.set("n", "<C-]>", function() harpoon:list():next() end)
EOF

let g:airline_section_z = ''
