local k = require("user.utils").keymap
k("n", "<leader>c", function()
	if (vim.bo.filetype == 'neo-tree') then
		vim.cmd('wincmd l')
	else
		vim.cmd("Neotree git_status focus")
	end
end)
-- k("n", "<leader>vb", ":Neotree buffers float<CR>")
k("n", "<leader>e", ":Neotree filesystem float<CR>")
k("n", "<leader>vc", ":Neotree close<CR>")

-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

-- Own functions to change source which skip buffers source since its always open
-- local function prev_source(state)
--   if state.name == "filesystem" then
--     require("neo-tree.command").execute({
--       source = "git_status",
--       position = state.current_position,
--       action = "focus",
--     })
--   else
--     require("neo-tree.command").execute({
--       source = "filesystem",
--       position = state.current_position,
--       action = "focus",
--     })
--   end
-- end
--
-- local function next_source(state)
--   if state.name == "filesystem" then
--     require("neo-tree.command").execute({
--       source = "git_status",
--       position = state.current_position,
--       action = "focus",
--     })
--   else
--     require("neo-tree.command").execute({
--       source = "filesystem",
--       position = state.current_position,
--       action = "focus",
--     })
--   end
-- end

require("neo-tree").setup({
	close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
	sort_case_insensitive = false,                                  -- used when sorting files and directories in the tree
	sort_function = nil,                                            -- use a custom function for sorting files and directories in the tree

	sources = {
		"git_status",
		"filesystem",
		-- "buffers",
	},

	default_source = "git_status",

	source_selector = {
		winbar = false,
		statusline = true,
	},

	default_component_configs = {
		container = {
			enable_character_fade = true,
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			default = "*",
			highlight = "NeoTreeFileIcon",
			folder_empty = "󰜌",
			folder_empty_open = "󰜌",
		},
		modified = {
			symbol = "[+]",
			highlight = "NeoTreeModified",
		},
		name = {
			trailing_slash = true,
			use_git_status_colors = true,
			highlight = "NeoTreeFileName",
		},
		git_status = {
			symbols = {
				added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
				modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
				deleted = "✖", -- this can only be used in the git_status source
				untracked = "",
				ignored = "",
				staged = "",
				conflict = "",
				renamed = "󰁕",
				unstaged = "✗",
			},
		},
	},

	window = {
		position = "left",
		width = 43,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
		mappings = {
			["<space>"] = {
				"toggle_node",
				nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
			},
			["<2-LeftMouse>"] = "open",
			["<cr>"] = "open",
			["o"] = "open",
			["<esc>"] = "revert_preview",
			["P"] = { "toggle_preview", config = { use_float = true } },
			["l"] = "focus_preview",
			["S"] = "open_split",
			["s"] = "open_vsplit",
			["t"] = "open_tabnew",
			["w"] = "open_with_window_picker",
			["C"] = "close_node",
			["z"] = "close_all_nodes",
			["a"] = {
				"add",
				config = {
					show_path = "none", -- "none", "relative", "absolute"
				},
			},
			["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
			["d"] = "delete",
			["r"] = "rename",
			["y"] = "copy_to_clipboard",
			["x"] = "cut_to_clipboard",
			["p"] = "paste_from_clipboard",
			["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
			["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
			["q"] = "close_window",
			["R"] = "refresh",
			["?"] = "show_help",
			-- Own functions to change source which skip buffers source since its always open
			-- ["<"] = prev_source,
			-- [">"] = next_source
			["<"] = "prev_source",
			[">"] = "next_source"
		},
	},

	filesystem = {
		filtered_items = {
			visible = false, -- when true, they will just be displayed differently than normal items
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_hidden = false, -- only works on Windows for hidden files/directories
			hide_by_name = {
				"node_modules"
			},
			hide_by_pattern = { -- uses glob style patterns
				--"*.meta",
				--"*/src/*/tsconfig.json",
			},
			always_show = { -- remains visible even if other settings would normally hide it
				--".gitignored",
			},
			never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
				--".DS_Store",
				--"thumbs.db"
			},
			never_show_by_pattern = { -- uses glob style patterns
				--".null-ls_*",
			},
		},
		follow_current_file = {
			enabled = true, -- This will find and focus the file in the active buffer every
		},
		-- time the current file is changed while the tree is open.
		group_empty_dirs = false,         -- when true, empty folders will be grouped together
		hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
		-- in whatever position is specified in window.position
		-- "open_current",  -- netrw disabled, opening a directory opens within the
		-- window like netrw would, regardless of window.position
		-- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
		use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
		-- instead of relying on nvim autocmd events.
		window = {
			mappings = {
				["<bs>"] = "navigate_up",
				["."] = "set_root",
				["H"] = "toggle_hidden",
				["/"] = "fuzzy_finder",
				["D"] = "fuzzy_finder_directory",
				["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
				-- ["D"] = "fuzzy_sorter_directory",
				["f"] = "filter_on_submit",
				["<c-x>"] = "clear_filter",
				["[g"] = "prev_git_modified",
				["]g"] = "next_git_modified",
			},
			fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
				["<down>"] = "move_cursor_down",
				["<C-n>"] = "move_cursor_down",
				["<up>"] = "move_cursor_up",
				["<C-p>"] = "move_cursor_up",
			},
		},

		commands = {}, -- Add a custom command or override a global one using the same function name
	},

	buffers = {
		follow_current_file = {
			enabled = true, -- This will find and focus the file in the active buffer every
		},
		-- time the current file is changed while the tree is open.
		group_empty_dirs = true, -- when true, empty folders will be grouped together
		show_unloaded = true,
		window = {
			position = "left",
			-- width = 43,
			mappings = {
				["bd"] = "buffer_delete",
				["<bs>"] = "navigate_up",
				["."] = "set_root",
			},
		},
	},

	git_status = {
    follow_current_file = {
      enabled = true,
    },
		window = {
			position = "left",
			mappings = {
				["A"] = "git_add_all",
				["gu"] = "git_unstage_file",
				["ga"] = "git_add_file",
				["gr"] = "git_revert_file",
				["gc"] = "git_commit",
				["gp"] = "git_push",
				["gg"] = "git_commit_and_push",
			},
		},
	},
})
