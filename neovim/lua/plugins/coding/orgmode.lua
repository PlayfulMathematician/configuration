return {
	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			org_agenda_files = { "~/stuff_bin/documents/braindump/*" },
			org_default_notes_file = "~/stuff_bin/documents/braindump/index.org",
		},
		config = function(_, opts)
			require("orgmode").setup(opts)
			require("keymaps.org").setup()
		end,
	},
}
