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

  local outlines = {}
  table.insert(outlines, "")
  table.insert(outlines, "olá " .. lines[1] .. ", tudo bem?")
  table.insert(outlines, "")
  table.insert(outlines, "")
  table.insert(outlines,
    "Eu sou desenvolvedor full stack com experiência "
    .. lines[2]
    .. "; e tenho interesse na vaga de "
    .. lines[3])
  table.insert(outlines, "")
  table.insert(outlines, "")
  table.insert(outlines, "eu gostaria de saber mais detslhes!.")
  table.insert(outlines, "")
  table.insert(outlines, "")
  table.insert(outlines, "Atte. Sebastian")

	vim.api.nvim_buf_set_lines(getBuffer, lfin, lfin, false, outlines)
end

M.setup = function()
	vim.keymap.set("v", "<leader>pk", function()
		M.fntest()
	end, { desc = "EXPluginNvim" })
end

return M
