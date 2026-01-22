local M = {}

function M.setup()
	local map = vim.keymap.set
	map("n", "<leader>oa", "<cmd>Org agenda<CR>", { desc = "Org Agenda" })
	map("n", "<leader>oc", "<cmd>Org capture<CR>", { desc = "Org Capture" })
end

return M
