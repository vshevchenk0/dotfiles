language en_US.UTF-8
filetype plugin indent on
set encoding=utf-8
set nocompatible
set number relativenumber
call plug#begin('~/.local/share/nvim/site/bundle')
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
call plug#end()
set mouse=a
set hidden
set nobackup
set nowritebackup
set showcmd
set cmdheight=1
set updatetime=300
set laststatus=2
set noshowmode
if (has("termguicolors"))
  set termguicolors
endif
syntax on
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE
let g:lightline = {
	\ 'colorscheme': 'onedark',
	\ }
nnoremap y "+y
nnoremap Y "+y$
vnoremap y "+y
vnoremap Y "+y$
