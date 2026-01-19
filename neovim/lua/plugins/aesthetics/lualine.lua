local function word_count()
	local ft = vim.bo.filetype
	if ft ~= "tex" and ft ~= "org" and ft ~= "markdown" then
		return ""
	end

	local wc = vim.fn.wordcount()
	if wc.words == 0 then
		return ""
	end

	return "Words " .. wc.words
end

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "catppuccin",
				globalstatus = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = { "filename" },
				lualine_x = { "diagnostics", "filetype" },
				lualine_y = { word_count },
				lualine_z = { "location" },
			},
		},
	},
}
