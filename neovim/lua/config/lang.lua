local M = {}

M.lang = {
	lua = {
		lsp = "lua_ls",
		fmt = {
			{ name = "stylua", mason = true },
		},
		ts = { "lua" },
	},

	go = {
		lsp = "gopls",
		fmt = {
			{ name = "gofmt", mason = false }, -- comes with Go
		},
		ts = { "go" },
	},

	python = {
		lsp = "pyright",
		fmt = {
			{ name = "black", mason = true },
		},
		ts = { "python" },
	},

	javascript = {
		lsp = "ts_ls",
		fmt = {
			{ name = "prettier", mason = true },
		},
		ts = { "javascript" },
	},

	typescript = {
		lsp = "ts_ls",
		fmt = {
			{ name = "prettier", mason = true },
		},
		ts = { "typescript", "tsx" },
	},

	json = {
		fmt = {
			{ name = "prettier", mason = true },
		},
		ts = { "json" },
	},

	markdown = {
		lsp = "marksman",
		fmt = {
			{ name = "prettier", mason = true },
		},
		ts = { "markdown", "markdown_inline" },
	},

	c = {
		lsp = "clangd",
		fmt = {
			{ name = "clang-format", mason = true },
		},
		ts = { "c" },
	},

	cpp = {
		lsp = "clangd",
		fmt = {
			{ name = "clang-format", mason = true },
		},
		ts = { "cpp" },
	},

	bash = { ts = { "bash" } },
	vim = { ts = { "vim" } },
	org = { ts = { "org" } },
}

-- helpers -------------------------------------------------

local function uniq(list)
	local seen, out = {}, {}
	for _, v in ipairs(list) do
		if v and not seen[v] then
			seen[v] = true
			out[#out + 1] = v
		end
	end
	return out
end

function M.treesitter()
	local out = {}
	for _, cfg in pairs(M.lang) do
		for _, p in ipairs(cfg.ts or {}) do
			table.insert(out, p)
		end
	end
	return uniq(out)
end

function M.lsp_servers()
	local out = {}
	for _, cfg in pairs(M.lang) do
		if cfg.lsp then
			table.insert(out, cfg.lsp)
		end
	end
	return uniq(out)
end

function M.formatters()
	local by_ft = {}
	for ft, cfg in pairs(M.lang) do
		if cfg.fmt then
			by_ft[ft] = vim.tbl_map(function(f)
				return f.name
			end, cfg.fmt)
		end
	end
	return by_ft
end

function M.mason_tools()
	local tools = {}
	for _, cfg in pairs(M.lang) do
		for _, fmt in ipairs(cfg.fmt or {}) do
			if fmt.mason then
				table.insert(tools, fmt.name)
			end
		end
	end
	return uniq(tools)
end

return M
