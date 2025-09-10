require("neotest").setup({
  adapters = {
	 require("neotest-go")({
      experimental = {
        test_table = true,
      },
      args = { "-v", "-count=1", "-timeout=60s" }
    })
  },
  output = {
    enabled = true,
    open_on_run = true,
  },
  quickfix = {
    enabled = true,
  },
  output_panel = {
    enabled = true,
  },
})

local k = require("user.utils").keymap
k('n', '<leader>tr', ':lua require("neotest").run.run()<CR>')
k('n', '<leader>ts', ':lua require("neotest").run.stop()<CR>')
k('n', '<leader>tf', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
k('n', '<leader>to', ':lua require("neotest").output.open({ short = true, enter = true })<CR>')
k('n', '<leader>tS', ':lua require("neotest").summary.toggle()<CR>')
k('n', '<leader>td', ':lua require("neotest").diagnostic()<CR>')

require("coverage").setup()
