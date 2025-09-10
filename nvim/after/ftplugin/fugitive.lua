vim.keymap.set("n", "dt", ":Gtabedit <Plug><cfile><Bar>Gvdiffsplit<CR><C-w>lgg", {
    buffer = true,
})
