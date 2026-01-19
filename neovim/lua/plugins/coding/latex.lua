return {
	{
		"lervag/vimtex",
		ft = { "tex" },
		init = function()
			vim.g.vimtex_compiler_method = "latexmk"
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_syntax_enabled = false
			vim.g.vimtex_mappings_enabled = false
		end,
		keys = {
			{ "<leader>lc", "<cmd>VimtexCompile<CR>", desc = "LaTeX Compile" },
			{ "<leader>lv", "<cmd>VimtexView<CR>", desc = "LaTeX View PDF" },
			{ "<leader>le", "<cmd>VimtexErrors<CR>", desc = "LaTeX Errors" },
		},
	},
}
