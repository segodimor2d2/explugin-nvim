local M = {}

M.fntest = function()
	print("test my first plugin !!")
end

M.setup = function()
	vim.keymap.set("n", "<leader>pk", function()
		M.fntest()
	end, { desc = "EX-Plugin-Nvim" })
end

return M
