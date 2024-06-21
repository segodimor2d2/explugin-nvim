local M = {}

M.fntest = function()
	-- print("test my first plugin !!!")
	local getBuffer = vim.api.nvim_get_current_buf()

	local _, srow, scol = unpack(vim.fn.getpos("v"))
	local _, erow, ecol = unpack(vim.fn.getpos("."))
	local lini = -1
	local lfin = -1

	local lines = {}

	if vim.fn.mode() == "V" then
		if srow > erow then
			lini, lfin = erow, srow
		else
			lini, lfin = srow, erow
		end
		lines = vim.api.nvim_buf_get_lines(0, lini - 1, lfin, true)
	end

	-- Concatenate lines into a single string separated by '|'
	local result = table.concat(lines, ",")
	-- print(result)

	vim.api.nvim_buf_set_lines(getBuffer, (lini - 1), lfin, false, { result }) -- incerir na ultima linha
end

M.setup = function()
	vim.keymap.set("v", "<leader>pk", function()
		M.fntest()
	end, { desc = "EX-Plugin-Nvim" })
end

return M
