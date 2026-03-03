-- neovim/lua/plugins/aesthetics/image.lua
if vim.g.neovide then
	return {}
end

return {
	{
		"3rd/image.nvim",
		build = false,
		opts = {
			processor = "magick_cli",
		},
	},
}
