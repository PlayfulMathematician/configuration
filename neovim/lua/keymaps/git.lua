local M = {}

function M.setup()
	local map = vim.keymap.set
	local opts = { silent = true }

	map("n", "]h", function()
		require("gitsigns").next_hunk()
	end, opts)

	map("n", "[h", function()
		require("gitsigns").prev_hunk()
	end, opts)

	map("n", "<leader>hs", function()
		require("gitsigns").stage_hunk()
	end, opts)

	map("n", "<leader>hr", function()
		require("gitsigns").reset_hunk()
	end, opts)

	map("n", "<leader>hb", function()
		require("gitsigns").blame_line()
	end, opts)
end

return M
