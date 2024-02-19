local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
	preselect = cmp.PreselectMode.None,
    mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            -- select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    window = {
		completion = cmp.config.window.bordered({
			winhighlight = "Normal:Normal,FloatBorder:Normal"
		}),
        documentation = cmp.config.window.bordered({
			winhighlight = "Normal:Normal,FloatBorder:Normal"
		}),
    },
    experimental = {
        native_menu = false,
        ghost_text = false,
    },
	-- formatting = {
	-- 	fields = { "kind", "abbr", "menu" },
	-- },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "path" },
        { name = "buffer" },
    }),
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "cmdline" },
    }, {
        { name = "path" },
    }),
})

cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

require("lsp_signature").setup({
	floating_window = false,
	hint_prefix = " ",
})
