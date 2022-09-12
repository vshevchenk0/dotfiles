require('nvim-tree').setup({
    hijack_cursor = true,
    diagnostics = {
        enable = true,
    },
    update_focused_file = {
        enable = true,
    },
    view = {
        adaptive_size = true,
    },
    filters = {
        custom = { '.git$', 'node_modules$', '^target$' },
    },
    git = {
        ignore = false,
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
    renderer = {
        icons = {
            show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = false,
            },
            glyphs = {
                default = '',
            },
        },
        indent_markers = {
            enable = true,
        },
    },
})

vim.keymap.set('n', '<C-n>', '<CMD>NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>e', '<CMD>NvimTreeFocus<CR>')
