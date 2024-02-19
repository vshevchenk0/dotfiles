local utils = require("user.utils")

require("neogit").setup{}

require("gitsigns").setup({
	signs = {
		add = { text = "│" },
		change = { text = "│" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		-- map("n", "<leader>gb", ":Gitsigns blame_line<CR>")
    map({ 'n', 'v' }, '<leader>hr', '<CMD>Gitsigns reset_hunk<CR>')
    map({ 'n', 'v' }, '<leader>hs', '<CMD>Gitsigns stage_hunk<CR>')
    map('n', '<leader>hu', '<CMD>Gitsigns undo_stage_hunk<CR>')
    map('n', '<leader>hS', '<CMD>Gitsigns stage_buffer<CR>')
    map('n', '<leader>hR', '<CMD>Gitsigns reset_buffer<CR>')
    map('n', '<leader>hp', '<CMD>Gitsigns preview_hunk<CR>')
    map('n', '<leader>hd', '<CMD>Gitsigns diffthis<CR>')
    map('n', '<leader>hb', '<CMD>Gitsigns blame_line<CR>')
    map('n', '<leader>hn', '<CMD>Neogit<CR>')
	end,
})

function runLazyGit()
	local Terminal = require("toggleterm.terminal").Terminal
	local run = Terminal:new({
		cmd = "lazygit",
		hidden = true,
		direction = "float",
		close_on_exit = true,
	})

	run:toggle()
end

utils.keymap("n", "<leader>gl", "<cmd>lua runLazyGit()<CR>")
