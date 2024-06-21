local M = {}

M.fntest = function()
  -- print("test my first plugin !!!")
  local getBuffer = vim.api.nvim_get_current_buf()

	vim.api.nvim_buf_set_lines(getBuffer , 8, 9, false,
    { "aqui um novo texto"}) -- incerir na ultima linha
end

M.setup = function()
  vim.keymap.set("n", "<leader>pk", function()
		M.fntest()
	end, { desc = "EX-Plugin-Nvim" })
end

return M

