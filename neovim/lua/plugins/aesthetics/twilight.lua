return {
	{
		"folke/twilight.nvim",
		cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
		keys = {
			{ "<leader>tw", "<cmd>Twilight<CR>", desc = "Toggle Twilight" },
		},
		opts = {
			dimming = {
				alpha = 0.25,
			},
			context = 10,
			treesitter = true,
			expand = {
				"function",
				"method",
				"table",
				"if_statement",
				"while_statement",
				"for_statement",
				"org_headline",
			},
		},
	},
}
