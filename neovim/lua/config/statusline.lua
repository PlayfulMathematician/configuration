return {
	options = {
		theme = "catppuccin",
		globalstatus = true,
		component_separators = { left = "", right = "" },

		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode", "lsp_status" },
		lualine_b = { "branch", "diff" },
		lualine_c = { "filename" },
		lualine_x = { "diagnostics", "filetype" },
		lualine_y = {},
		lualine_z = { "location" },
	},
}
