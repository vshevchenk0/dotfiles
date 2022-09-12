local g = vim.g
local o = vim.o
local cmd = vim.cmd

-- cmd('syntax on')
vim.api.nvim_command('filetype plugin indent on')

o.encoding = 'utf-8'

o.termguicolors = true
-- o.background = 'dark'

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200
o.laststatus = 2

o.scrolloff = 5

-- Better editor UI
o.number = true
-- o.relativenumber = true
o.signcolumn = 'yes'

-- Mouse support
o.mouse = 'a'

-- Better editing experience
o.hidden = true
o.expandtab = true
-- o.smarttab = true
-- o.cindent = true
o.smartindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4 -- If negative, shiftwidth value is used

-- add line lenght marker for selected filetypes
cmd([[autocmd FileType python,go setlocal cc=120]])
-- 2 spaces for selected filetypes
cmd([[
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2
]])

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = 'unnamedplus'

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true


-- Map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '

cmd([[ lan en_US.UTF-8 ]])
