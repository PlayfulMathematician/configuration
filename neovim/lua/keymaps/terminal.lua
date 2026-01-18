local M = {}

function M.setup()
	local map = vim.keymap.set
	local opts = { silent = true }

	map("n", "<leader>t", function()
		require("toggleterm").toggle()
	end, opts)

	map("t", "<Esc>", [[<C-\><C-n>]], opts)
end

return M
