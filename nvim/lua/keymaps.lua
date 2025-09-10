local k = require("user.utils").keymap
local history = require("user.history")

-- Delete weird builtin keymaps
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grn")

--Remap space as leader key
k("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = ","
k("i", "jj", "<Esc>")

-- save and quit
k("n", "<leader>w", ":wall<CR>")
-- k("n", "<leader>q", ":bd<CR>")
-- k("n", "<leader>Q", ":bd!<CR>")

-- clipboard
-- k("v", "y", '"+y')
-- k("v", "Y", '"+Y')
-- k("n", "<leader>cp", ":let @+=expand('%:p')<CR>")

-- search
-- k("v", "<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>')

-- insert blank line below/above
k('n', '<leader>o', 'o<ESC>')
k('n', '<leader>O', 'O<ESC>')

-- disable hl on esc
k('n', '<esc>', '<esc>:noh<CR><esc>')

k('n', '<leader>x',
   function()
		if vim.bo.modified then
			print 'save the file bruh'
		else
			local bufnr = vim.api.nvim_get_current_buf()
			local lastbuf = history.getlastbuf()
			if lastbuf == nil then
				return
			end
			vim.cmd('b ' .. lastbuf)
			history.bufdel(bufnr)
			vim.cmd('bd ' .. bufnr)
		end
    --    else
    --       local bufnr = vim.api.nvim_get_current_buf()
    --       local newbufnr = vim.api.nvim_get_current_buf()
    --       while newbufnr == bufnr do
    --          vim.cmd.normal(vim.api.nvim_replace_termcodes("<C-o>", true, false, true))
    --          newbufnr = vim.api.nvim_get_current_buf()
    --       end
    --       -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-o>", true, false, true), "n", false)
				--
		  -- -- prevbuf is set in autocommands.lua
		  -- -- if vim.b.prevbuf == nil then
			 -- -- vim.cmd('q')
		  -- -- end
		  -- -- vim.cmd('b ' .. vim.b.prevbuf)
    --        -- vim.cmd('wincmd l')
    --        -- if vim.bo.filetype == "neo-tree" then
    --        --    print 'neo-tree opened, switching buf'
    --        --    vim.cmd('bp')
    --        --    vim.cmd('wincmd l')
    --        -- end
    --       vim.cmd('bd ' .. bufnr)
    --    end
   end
)
k("n", "<leader>q", "<CMD>tabclose<CR>")
k("n", "<leader>p", "<C-^>", "Previous buffer")

-- visual mode niceties
k("v", "<", "<gv")
k("v", ">", ">gv")
k("v", "p", "pgvy")

-- move selected lines above/below
k('x', 'J', ":m '>+1<CR>gv=gv")
k('x', 'K', ":m '<-2<CR>gv=gv")

-- move view left/right
k("n", "H", "zh", "move view left")
k("n", "L", "zl", "move view right")

-- UI
k("n", "<leader>u", "", "UI")
k("n", "<leader>uw", function ()
  vim.o.wrap = not vim.o.wrap
end, "Toggle line wrap")
k("n", "<leader>uc", "<CMD>TSContext toggle<CR>", "Toggle TSContext (sticky lines)")
