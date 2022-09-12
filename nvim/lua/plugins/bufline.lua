require('bufferline').setup({
	options = {
		diagnostics = "nvim_lsp",
        show_tab_indicators = true,
        offsets = {
            {
                filetype = 'NvimTree',
                text = '',
                highlight = 'Directory',
                text_align = 'left'
            }
        }
	},
})
