local bufhistory = {}

local function find_index(history, bufnr)
	for i, v in pairs(history) do
		if v == bufnr then
			return i
		end
	end
	return nil
end

function bufhistory.bufadd()
	local history = vim.g.bufhistory and vim.g.bufhistory or {}
	local bufnr = vim.api.nvim_get_current_buf()
	if vim.fn.buflisted(bufnr) ~= 1 or vim.bo.filetype == "oil" or vim.bo.filetype == "qf" then
		return
	end
	local idx = find_index(history, bufnr)
	if idx == nil then
		table.insert(history, bufnr)
	else
		table.remove(history, idx)
		table.insert(history, bufnr)
	end
	vim.g.bufhistory = history
end

function bufhistory.bufdel(bufnr)
	local history = vim.g.bufhistory
	if #history == 0 then
		return
	end
	local idx = find_index(history, bufnr)
	if idx ~= nil then
		table.remove(history, idx)
	end
	vim.g.bufhistory = history
end

function bufhistory.getlastbuf()
	local history = vim.g.bufhistory
	if #history == 0 then
		return nil
	end
	local len = #history
	if len == 1 then
		vim.notify("Reached last buffer")
		return nil
	end
	return history[len-1]
end

return bufhistory
