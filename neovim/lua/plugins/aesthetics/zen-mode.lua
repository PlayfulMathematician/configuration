return {
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		keys = {
			{ "<leader>z", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
		},
		opts = {
			window = {
				backdrop = 0.95,
				width = 0.6,
				height = 1,
				options = {
					signcolumn = "no",
					number = false,
					relativenumber = false,
					cursorline = false,
				},
			},
			plugins = {
				twilight = { enabled = true },
				gitsigns = { enabled = false },
				tmux = { enabled = false },
			},
		},
		config = function(_, opts)
			require("zen-mode").setup(opts)
		end,
	},
}
