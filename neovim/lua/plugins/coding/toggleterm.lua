return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		event = "VeryLazy",
		opts = {
			direction = "horizontal", -- buffer-based
			size = 20,
			open_mapping = nil,
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)
			require("keymaps.terminal").setup()
		end,
	},
}
