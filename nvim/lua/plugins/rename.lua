local k = require("user.utils").keymap
require("inc_rename").setup({
  cmd_name = "Rename",
})
k("n", "<leader>lr", ":Rename ")
