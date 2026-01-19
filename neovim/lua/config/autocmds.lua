local group = vim.api.nvim_create_augroup("WritingMode", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = { "tex", "org", "markdown" },
	callback = function()
		require("wrapping").soft_wrap_mode()
	end,
})
