local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

require('telescope').setup({
    defaults = {
        initial_mode = 'insert',
        sorting_strategy = 'ascending',
        layout_config = {
            prompt_position = 'top',
        },
        file_ignore_patterns = { 'node_modules', 'vendor', '.git' },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        },
    },
})

keymap('n', '<leader>ff', ':Telescope find_files hidden=true<CR>', opts)
keymap('n', '<leader>fg', ':Telescope git_files<CR>', opts)
keymap('n', '<leader>of', ':Telescope oldfiles<CR>', opts)
keymap('n', '<leader>lg', ':Telescope live_grep<CR>', opts)
keymap('n', '<leader>fb', ':Telescope buffers<CR>', opts)
keymap('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
keymap('n', '<leader>ft', ':Telescope treesitter<CR>', opts)
keymap('n', '<leader>fc', ':Telescope commands<CR>', opts)
keymap('n', '<leader>fr', ':Telescope resume<CR>', opts)
