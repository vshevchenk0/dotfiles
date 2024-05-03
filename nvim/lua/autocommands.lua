local history = require "user.history"
-- trim whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.cmd([[
         keeppatterns %s/\s\+$//e
      ]])
  end,
  group = vim.api.nvim_create_augroup("TrimWhitespace", { clear = true }),
})

-- filetypes
local ftGroup = vim.api.nvim_create_augroup("filetype_group", { clear = false })
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "*/sites-enabled/*.conf", "nginx.conf" },
  command = "set filetype=nginx",
  group = ftGroup,
})
function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end


-- save bufnr before leaving for proper buf close behavior (use number instead of bp)
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufAdd" }, {
	callback = function ()
		history.bufadd()
	end
})
-- vim.api.nvim_create_autocmd("BufWipeout", {
-- 	callback = function ()
-- 		local bufnr = vim.api.nvim_get_current_buf()
-- 	end
-- })

-- TODO: autocmd to insert go package name on buf open

-- vim.api.nvim_create_autocmd({ "FileType", "ExitPre" }, {
--   pattern = { "*.ts", "*.js" },
--   command = "!eslint_d stop",
--   group = ftGroup,
-- })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*.yaml",
  command = "setlocal ts=2 sts=2 sw=2 expandtab",
  group = ftGroup,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*.bats",
  command = "set filetype=sh",
  group = ftGroup,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.brief" },
  command = "set filetype=brief",
  group = ftGroup,
})

vim.api.nvim_create_autocmd("VimEnter", {
  command = "Neotree filesystem show",
})

-- disable search hilight in insert mode
local hiGroup = vim.api.nvim_create_augroup("highlight_group", { clear = false })
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  group = hiGroup,
  command = "setlocal nohlsearch",
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  group = hiGroup,
  command = "setlocal hlsearch",
})

local formatGroup = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
vim.api.nvim_create_autocmd("BufWritePre", {
	-- buffer = vim.api.nvim_get_current_buf(),
  pattern = "*.go",
	group = formatGroup,
	callback = function()
    -- local bufnr = vim.api.nvim_get_current_buf()
		vim.lsp.buf.format({ bufnr = bufnr, async = async })
	end,
	desc = "[lsp] format on save",
})

-- imports formatting
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
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

-- switch to absolute line numbers in insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  callback = function()
    vim.opt.relativenumber = false
    vim.opt.cursorline = false
  end,
})

-- switch to relative line numbers in normal mode
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  callback = function()
    vim.opt.relativenumber = true
    vim.opt.cursorline = true
  end,
})

-- keymaps
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "diff" },
  callback = function()
    vim.cmd([[
		   nnoremap <silent> <buffer> q :close<CR>
			set nobuflisted
	   ]])
  end,
})
