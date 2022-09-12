local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- insert blank line below/above
map('n', '<leader>o', 'o<ESC>')
map('n', '<leader>O', 'O<ESC>')

map('n', '<leader>x',
    function(bufnr)
        if vim.bo.modified then
            print 'save the file bruh'
        else
            bufnr = bufnr or vim.api.nvim_get_current_buf()
            vim.cmd('bp')
            vim.cmd('bd' .. bufnr)
        end
    end
)
map('n', '<leader>w', ':w<CR>')
map('n', '<Tab>', ':bn<CR>')
map('n', '<S-Tab>', ':bp<CR>')

map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- disable hl on esc
map('n', '<esc>', '<esc>:noh<CR><esc>')

-- move selected lines above/below
map('x', 'J', ":m '>+1<CR>gv=gv")
map('x', 'K', ":m '<-2<CR>gv=gv")
