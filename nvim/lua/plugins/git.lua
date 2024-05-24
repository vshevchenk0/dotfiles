local utils = require("user.utils")

local diffview = require("diffview")
diffview.setup({
  keymaps = {
    file_panel = {
      { "n", "q", diffview.close }
    }
  }
})

require("neogit").setup{
    integrations = {
        diffview = true
    },
}

require("gitsigns").setup({
	signs = {
		add = { text = "▌" },
		change = { text = "▌" },
		delete = { text = "▁" },
		topdelete = { text = "▔" },
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
    map({ 'n', 'v' }, '<leader>gr', '<CMD>Gitsigns reset_hunk<CR>')
    map({ 'n', 'v' }, '<leader>gs', '<CMD>Gitsigns stage_hunk<CR>')
    map('n', '<leader>gu', '<CMD>Gitsigns undo_stage_hunk<CR>')
    map('n', '<leader>gS', '<CMD>Gitsigns stage_buffer<CR>')
    map('n', '<leader>gR', '<CMD>Gitsigns reset_buffer<CR>')
    map('n', '<leader>gp', '<CMD>Gitsigns preview_hunk<CR>')
    -- map('n', '<leader>hd', '<CMD>Gitsigns diffthis<CR>')
    map('n', '<leader>gb', '<CMD>Gitsigns blame_line<CR>')
    map('n', '<leader>gn', '<CMD>Neogit<CR>')
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

utils.keymap("n", "<leader>gd", "<cmd>DiffviewOpen<CR>")
utils.keymap("n", "<leader>gx", "<cmd>DiffviewClose<CR>")
utils.keymap("n", "<leader>gl", "<cmd>lua runLazyGit()<CR>")
