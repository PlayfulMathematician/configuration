return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			current_line_blame = false,
		},
		config = function(_, opts)
			require("gitsigns").setup(opts)
			require("keymaps.git").setup()
		end,
	},
}
