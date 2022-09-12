require'nvim-treesitter.configs'.setup {
  ensure_installed = {
		'bash',
		'dockerfile',
		'go',
		'javascript',
		'json',
		'lua',
		'typescript',
		'python',
        'markdown',
        'markdown_inline',
	},

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
