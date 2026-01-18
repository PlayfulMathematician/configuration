vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.wrap = false

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.opt.splitright = true
vim.opt.splitbelow = true

-- SSH clipboard support
if vim.env.SSH_TTY ~= nil then
	vim.g.clipboard = {
		name = "OSC 52",
		copy = {
			["+"] = function(lines)
				require("vim.ui.clipboard.osc52").copy("+")(lines)
			end,
			["*"] = function(lines)
				require("vim.ui.clipboard.osc52").copy("*")(lines)
			end,
		},
		paste = {
			["+"] = function()
				return require("vim.ui.clipboard.osc52").paste("+")()
			end,
			["*"] = function()
				return require("vim.ui.clipboard.osc52").paste("*")()
			end,
		},
	}
end
