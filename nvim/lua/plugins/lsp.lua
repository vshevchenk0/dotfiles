local opts = { noremap = true, silent = true }
-- vim.cmd('highlight! link FloatBorder Normal')
-- vim.cmd('highlight! link NormalFloat Normal')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<leader>D", "<cmd>Telescope lsp_type_definitions<CR>", opts)
  buf_set_keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
  buf_set_keymap("n", "<leader>li", "", {
    noremap = true,
    silent = true,
    callback = function()
      local params = vim.lsp.util.make_range_params()
      params.context = {only = {"source.organizeImports"}}
      -- buf_request_sync defaults to a 1000ms timeout. Depending on your
      -- machine and codebase, you may want longer. Add an additional
      -- argument after params if you find that you have to write the file
      -- twice for changes to be saved.
      -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
      local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
      for cid, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
            vim.lsp.util.apply_workspace_edit(r.edit, enc)
          end
        end
      end
      vim.lsp.buf.format({async = false})
    end
  })
  -- buf_set_keymap("n", "<leader>lr", "<cmd>LspRestart<CR>", opts)
  buf_set_keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next({ float = false })<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ float = false })<CR>", opts)

  -- Auto formatting
  -- if client.server_capabilities.documentFormattingProvider and client.name ~= "sumneko_lua" then
  --   vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  --     buffer = bufnr,
  --     callback = function()
  --       vim.lsp.buf.format({
  --         filter = function(cli)
  --           return cli.name == client.name
  --         end,
  --       })
  --     end,
  --     group = group,
  --   })
  -- end
end

local on_attach_wo_semantic_tokens = function(client, bufnr)
	client.server_capabilities.semanticTokensProvider = nil
	on_attach(client, bufnr)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig")["gopls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    gopls = {
      buildFlags = { "-tags=integration" },
      gofumpt = true,
      codelenses = {
        gc_details = true,
        generate = true,
        run_govulncheck = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      analyses = {
        nilness = true,
        unusedparams = true,
        unusedvariable = true,
        unusedwrite = true,
        useany = true,
      },
      staticcheck = true,
      directoryFilters = { "-.git", "-node_modules" },
      semanticTokens = true,
	  noSemanticString = true,
    },
  },
})

require("lspconfig")["tsserver"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

require("lspconfig")["bashls"].setup({
  capabilities = capabilities,
  on_attach = on_attach_wo_semantic_tokens,
})

local runtime_path = vim.split(package.path, ";", {})
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
require("lspconfig")["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach_wo_semantic_tokens,
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          ".undodir",
        },
      },
      telemetry = { enable = false },
      completion = {
        callSnippet = "Replace",
      },
      hint = {
        enable = true,
      },
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

require("lspconfig")["yamlls"].setup({
  capabilities = capabilities,
  on_attach = on_attach_wo_semantic_tokens,
  settings = {
    yaml = {
      schemaStore = {
        url = "https://www.schemastore.org/api/json/catalog.json",
        enable = true,
      },
    },
  },
})

require("lspconfig")["jsonls"].setup({
  capabilities = capabilities,
  on_attach = on_attach_wo_semantic_tokens,
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  init_options = {
    provideFormatter = false, -- i use prettier
  },
})

require("lspconfig")["eslint"].setup({})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    -- null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.stylua,
    -- null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.prettier,
  },
  capabilities = capabilities,
  on_attach = on_attach_wo_semantic_tokens,
})

require("neodev").setup()

local function h(name) return vim.api.nvim_get_hl(0, { name = name }) end

-- hl-groups can have any name
vim.api.nvim_set_hl(0, 'SymbolUsageRounding', { fg = h('CursorLine').bg, italic = true })
vim.api.nvim_set_hl(0, 'SymbolUsageContent', { bg = h('CursorLine').bg, fg = h('Comment').fg, italic = true })
vim.api.nvim_set_hl(0, 'SymbolUsageRef', { fg = h('Function').fg, bg = h('CursorLine').bg, italic = true })
vim.api.nvim_set_hl(0, 'SymbolUsageDef', { fg = h('Type').fg, bg = h('CursorLine').bg, italic = true })
vim.api.nvim_set_hl(0, 'SymbolUsageImpl', { fg = h('@keyword').fg, bg = h('CursorLine').bg, italic = true })

local SymbolKind = vim.lsp.protocol.SymbolKind

require('symbol-usage').setup({
  vt_position = 'end_of_line',
  references = { enabled = false },
  implementation = { enabled = true },
  definition = { enabled = false },
  kinds = {
	-- SymbolKind.Function,
	SymbolKind.Method,
	SymbolKind.Struct,
	SymbolKind.Interface,
  }
})
