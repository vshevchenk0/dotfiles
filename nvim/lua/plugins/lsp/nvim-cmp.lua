local cmp = require('cmp')

local icons = {
    Text = '',
    Method = '',
    Function = '',
    Constructor = '',
    Field = 'ﰠ',
    Variable = '',
    Class = 'ﴯ',
    Interface = '',
    Module = '',
    Property = 'ﰠ',
    Unit = '塞',
    Value = '',
    Enum = '',
    Keyword = '',
    Snippet = '',
    Color = '',
    File = '',
    Reference = '',
    Folder = '',
    EnumMember = '',
    Constant = '',
    Struct = '',
    Event = '',
    Operator = '',
    TypeParameter = '',
}

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-e>'] = cmp.config.disable,
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's' }
        ),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { 'i', 's' }
        ),
    }),
    window = {
        completion = {
            border = 'rounded',
        },
        documentation = {
            border = 'rounded',
        },
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp', max_item_count = 10 },
        { name = 'path', max_item_count = 10 },
        { name = 'buffer', max_item_count = 10 },
    }),
    formatting = {
        format = function(_, item)
            -- Kind icons
            item.kind = string.format('%s %s', icons[item.kind], item.kind)
            return item
        end,
    },
})
