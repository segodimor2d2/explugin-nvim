local M = {}

M.fntest = function()
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

	local outTxt = "\n"
	outTxt = outTxt .. "Olá "
	outTxt = outTxt .. lines[1]
	outTxt = outTxt .. ", tudo bem?\n\n"
	outTxt = outTxt .. "Eu sou desenvolvedor FullStack com experiência "
	outTxt = outTxt .. lines[2]
	outTxt = outTxt .. "; e tenho interesse na vaga de "
	outTxt = outTxt .. lines[3]
	outTxt = outTxt .. "." .. "\n\neu gostaria de saber mais detalhes ^^!."
	outTxt = outTxt .. "\n\n"
	outTxt = outTxt .. "Atte. Sebastian"

	local outLines = vim.split(outTxt, "\n", true)

	vim.api.nvim_buf_set_lines(getBuffer, lfin, lfin, false, outLines)
end

M.setup = function()
	vim.keymap.set("v", "<leader>pk", function()
		M.fntest()
	end, { desc = "EX-Plugin-Nvim" })
end

return M
