local map = vim.keymap.set

require('gitsigns').setup({
--    signs = {
--        add = { text = '+' },
--        change = { text = '~' },
--        changedelete = { text = '=' },
--    },
    on_attach = function(buf)
        -- Navigation
        map('n', ']c', "&diff ? ']c' : '<CMD>Gitsigns next_hunk<CR>'", { buffer = buf, expr = true })
        map('n', '[c', "&diff ? '[c' : '<CMD>Gitsigns prev_hunk<CR>'", { buffer = buf, expr = true })

        -- Actions
        map({ 'n', 'v' }, '<leader>hr', '<CMD>Gitsigns reset_hunk<CR>', { buffer = buf })
        map({ 'n', 'v' }, '<leader>hs', '<CMD>Gitsigns stage_hunk<CR>')
        map('n', '<leader>hu', '<CMD>Gitsigns undo_stage_hunk<CR>', { buffer = buf })
        map('n', '<leader>hS', '<CMD>Gitsigns stage_buffer<CR>', { buffer = buf })
        map('n', '<leader>hR', '<CMD>Gitsigns reset_buffer<CR>', { buffer = buf })
        map('n', '<leader>hp', '<CMD>Gitsigns preview_hunk<CR>', { buffer = buf })
        map('n', '<leader>hd', '<CMD>Gitsigns diffthis<CR>', { buffer = buf })
        map('n', '<leader>hb', '<CMD>Gitsigns toggle_current_line_blame<CR>', { buffer = buf })
    end,
})
