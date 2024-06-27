local options = {
	-- expandtab = true,
	tabstop = 4,
	shiftwidth = 4,
	softtabstop = 4,
	number = true,
	relativenumber = true,
	cursorline = true,
	completeopt = { "menu", "menuone", "noselect", "noinsert" },
	encoding = "utf-8",
	signcolumn = "yes",
	swapfile = false,
	autoindent = true,
	smartindent = true,
	scrolloff = 15,
	undofile = true,
	undodir = os.getenv("HOME") .. "/.config/nvim/.undodir",
	ignorecase = true,
	incsearch = true,
	ruler = true,
	wildmenu = true,
	colorcolumn = "120",
	foldmethod = "indent",
	foldnestmax = 3,
	foldminlines = 10,
	foldlevelstart = 999,
	backspace = { "indent", "eol", "start" },
	laststatus = 3,
	list = false,
	listchars = "eol:↲,tab:» ,trail:·,extends:<,precedes:>,conceal:┊,nbsp:␣",
	langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz",
  clipboard = 'unnamedplus',
  updatetime = 200,
  spell = true,
  spelllang="en"
}

-- 2 spaces for selected filetypes
vim.cmd([[
autocmd FileType javascript,json,lua,typescript,proto setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
]])

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd([[
	set termguicolors
	lan en_US.UTF-8
]])
