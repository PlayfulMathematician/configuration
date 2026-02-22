-- neovim/init.lua
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("config.filetype")
require("config.options")
require("config.lazy")
require("config.autocmds")
require("keymaps")
