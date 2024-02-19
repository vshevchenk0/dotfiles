require("toggleterm").setup({
	direction = "float",
	close_on_exit = true,
	on_open = function(term)
		vim.cmd("startinsert!")
	end,
})

local k = require("user.utils").keymap
k("n", "<A-i>", ":ToggleTerm<CR>")
k("t", "<A-i>", "<C-\\><C-n>:ToggleTerm<CR>")
