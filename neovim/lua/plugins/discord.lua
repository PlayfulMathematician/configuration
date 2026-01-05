local opts = require("config.discord")

return {
	{
		"andweeb/presence.nvim",
		event = "VeryLazy",
		opts = opts,
	},
}
