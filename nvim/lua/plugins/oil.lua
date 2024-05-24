require("oil").setup({
  buf_options = {
    buflisted = false,
    bufhidden = "hide",
  },
  win_options = {
    signcolumn = "yes:2",
  },
})

require("oil-git-status").setup({})

vim.keymap.set("n", "<leader>p", "<CMD>Oil<CR>", { desc = "Open parent directory" })
