local lsp = require('lspconfig')
local U = require('plugins.lsp.utils')

---Common perf related flags for all the LSP servers
local flags = {
    allow_incremental_sync = true,
    debounce_text_changes = 200,
}

---Common capabilities including lsp snippets and autocompletion
local capabilities = U.capabilities()

---Common `on_attach` function for LSP servers
---@param buf integer
local function on_attach(_, buf)
    U.mappings(buf)
end

-- Configuring native diagnostics
vim.diagnostic.config({
    virtual_text = {
        source = 'if_many',
    },
    float = {
        source = 'always',
    },
})

-- Lua
lsp.sumneko_lua.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            completion = {
                enable = true,
                showWord = 'Disable',
                keywordSnippet = 'Disable',
            },
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = { os.getenv('VIMRUNTIME') },
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

---List of the LSP server that don't need special configuration
local servers = {
    'gopls', -- Golang
    'pyright', -- Python
    'tsserver', -- Typescript
    'jsonls', -- Json
    'yamlls', -- YAML
}

for _, server in ipairs(servers) do
    lsp[server].setup({
        flags = flags,
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

vim.api.nvim_set_var("go_def_mode", "gopls")
vim.api.nvim_set_var("go_info_mode", "gopls")

-- TIP: Using `eslint_d` diagnostic from `null-ls` bcz it is way fasterrrrrrr.
-- Eslint
--[[ lsp.eslint.setup({
    flags = flags,
    capabilities = capabilities,
    on_attach = function(client, buf)
        U.mappings(buf)
    end,
    settings = {
        useESLintClass = true, -- Recommended for eslint >= 7
        run = 'onSave', -- Run `eslint` after save
    },
    -- NOTE: `root_dir` is required to fix the monorepo issue
    root_dir = require('lspconfig.util').find_git_ancestor,
}) ]]
