local utils = require("user.utils")

require("neogit").setup{
    integrations = {
        diffview = true
    },
}

require("gitsigns").setup({
	signs = {
		add = { text = "│" },
		change = { text = "│" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	preview_config = {
		border = "rounded",
		col = 1,
		relative = "cursor",
		row = 0,
		style = "minimal"
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
    map({ 'n', 'v' }, '<leader>cr', '<CMD>Gitsigns reset_hunk<CR>')
    map({ 'n', 'v' }, '<leader>cs', '<CMD>Gitsigns stage_hunk<CR>')
    map('n', '<leader>cu', '<CMD>Gitsigns undo_stage_hunk<CR>')
    map('n', '<leader>cS', '<CMD>Gitsigns stage_buffer<CR>')
    map('n', '<leader>cR', '<CMD>Gitsigns reset_buffer<CR>')
    map('n', '<leader>cp', '<CMD>Gitsigns preview_hunk<CR>')
    -- map('n', '<leader>hd', '<CMD>Gitsigns diffthis<CR>')
    map('n', '<leader>cb', '<CMD>Gitsigns blame_line<CR>')
    map('n', '<leader>cn', '<CMD>Neogit<CR>')
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

utils.keymap("n", "<leader>cd", "<cmd>DiffviewOpen<CR>")
utils.keymap("n", "<leader>cx", "<cmd>DiffviewClose<CR>")
utils.keymap("n", "<leader>cl", "<cmd>lua runLazyGit()<CR>")
