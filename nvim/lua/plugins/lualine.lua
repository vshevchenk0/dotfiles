require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		-- component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "fancy_branch" },
		lualine_b = {
			"fancy_diff",
			function()
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					if vim.api.nvim_buf_get_option(buf, "modified") then
						return "--Unsaved buffers--"
					end
				end
				return ""
			end,
		},
		lualine_c = {
			{
				"filename",
				file_status = false,
				path = 1,
			},
			{
				"fancy_diagnostics",
				sources = { "nvim_lsp" },
				symbols = {
					hint = "󰌵 ",
					info = "  ",
					warn = "  ",
					error = "  ",
				},
			},
		},
		lualine_x = { "fancy_lsp_servers" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = { "buffers" },
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "neo-tree" },
})
