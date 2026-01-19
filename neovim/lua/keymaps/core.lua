local map = vim.keymap.set
local opts = { silent = true }

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<leader>bn", ":bnext<CR>", opts)
map("n", "<leader>bp", ":bprevious<CR>", opts)
-- doesn't work
-- i don't know how to use macros
map("n", "q", "<nop>")
map({ "n", "v" }, "d", '"_d', { noremap = true })
-- doesn't work

map("n", "<S-h>", ":bprevious<CR>", opts)
map("n", "<S-l>", ":bnext<CR>", opts)

map("n", "j", function()
	return vim.wo.wrap and "gj" or "j"
end, { expr = true, silent = true })

map("n", "k", function()
	return vim.wo.wrap and "gk" or "k"
end, { expr = true, silent = true })
local close_tab = function()
	local current = vim.api.nvim_get_current_buf()
	local bufs = vim.fn.getbufinfo({ buflisted = 1 })

	if #bufs > 1 then
		vim.cmd("bprevious")
		vim.api.nvim_buf_delete(current, {})
	else
		vim.cmd("enew")
		vim.api.nvim_buf_delete(current, {})
	end
end

map("n", "<leader>x", close_tab, { desc = "Close tab (use other buffer)" })
map("n", "<leader>bd", close_tab, { desc = "Close tab (alias)" })
--- todo: get insert mode to work
