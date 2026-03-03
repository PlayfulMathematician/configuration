local map = vim.keymap.set
local opts = { silent = true }
local close_tab = function()
	local current = vim.api.nvim_get_current_buf()
	local bufs = vim.fn.getbufinfo({ buflisted = 1 })
	if #bufs > 1 then
		vim.cmd.bprevious()
		vim.api.nvim_buf_delete(current, {})
	else
		vim.cmd.enew()
		vim.api.nvim_buf_delete(current, {})
	end
end

local keymap_deprecated = function(f, name, alternative, version)
	return function()
		vim.deprecate(name, alternative, version, "playfulconfig", false)
		f()
	end
end

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<leader>bn", ":bnext<CR>", opts)
map("n", "<leader>bp", ":bprevious<CR>", opts)
map("n", "q", "<nop>")

map(
	"n",
	"<S-h>",
	keymap_deprecated(function()
		vim.cmd.bprevious()
	end, "<S-h>", "<leader>bn", "v1.0"),
	opts
)

map(
	"n",
	"<S-l>",
	keymap_deprecated(function()
		vim.cmd.bnext()
	end, "<S-l>", "<leader>bn", "v1.0"),
	opts
)

map("n", "j", function()
	return vim.wo.wrap and "gj" or "j"
end, { expr = true, silent = true })

map("n", "k", function()
	return vim.wo.wrap and "gk" or "k"
end, { expr = true, silent = true })

map("n", "<leader>x", close_tab, { desc = "Close tab (use other buffer)" })
map("n", "<leader>bd", keymap_deprecated(close_tab, "<leader>bd", "<leader>x", "v1.0"), { desc = "Close tab (alias)" })
