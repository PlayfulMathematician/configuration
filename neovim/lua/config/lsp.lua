local M = {}
local lsp_keymaps = require("keymaps.lsp")

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.on_attach = function(_, bufnr)
	lsp_keymaps.on_attach(bufnr)
end

M.settings = {
	lua_ls = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					vim.fn.stdpath("data") .. "/lazy",
				},
			},
		},
	},
}

return M
