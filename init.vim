"----BASIC----
language en_US.UTF-8
filetype plugin indent on
set encoding=utf-8
set nocompatible
set number relativenumber
set mouse=a
set hidden
set nobackup
set nowritebackup
set showcmd
set cmdheight=1
set updatetime=300
set laststatus=2
set noshowmode
set scrolloff=5
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
if (has("termguicolors"))
    set termguicolors
endif
syntax on

"----PLUGINS----
call plug#begin('~/.local/share/nvim/site/bundle')
Plug 'tpope/vim-fugitive'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'itchyny/lightline.vim'
call plug#end()

"----PLUGINS SETTINGS----
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE
let g:airline_powerline_fonts = 1
"let g:airline_section_z = "%l:%c"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:lightline = {
"      \ 'colorscheme': 'onedark',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"      \ },
"      \ 'component_function': {
"      \   'gitbranch': 'FugitiveHead'
"      \ },
"      \ }

"----BINDINGS & REMAPS----
nnoremap y "+y
nnoremap Y "+y$
vnoremap y "+y
vnoremap Y "+y$
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
