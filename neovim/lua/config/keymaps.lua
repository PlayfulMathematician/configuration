local M = {}
local map = vim.keymap.set
local opts = { silent = true }

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("n", "<leader>bn", ":bnext<CR>", opts)
map("n", "<leader>bp", ":bprevious<CR>", opts)
map("n", "<leader>bd", ":bdelete<CR>", opts)

map("n", "<leader>f", function()
  require("conform").format({ async = true })
end, opts)

function M.lsp_on_attach(bufnr)
  local b = { buffer = bufnr, silent = true }

  map("n", "gd", vim.lsp.buf.definition, b)
  map("n", "gr", vim.lsp.buf.references, b)
  map("n", "K", vim.lsp.buf.hover, b)
  map("n", "gi", vim.lsp.buf.implementation, b)

  map("n", "<leader>rn", vim.lsp.buf.rename, b)
  map("n", "<leader>ca", vim.lsp.buf.code_action, b)

  map("n", "[d", vim.diagnostic.goto_prev, b)
  map("n", "]d", vim.diagnostic.goto_next, b)
end

vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>", { silent = true })
vim.keymap.set("n", "]h", function()
  require("gitsigns").next_hunk()
end, { silent = true })

vim.keymap.set("n", "[h", function()
  require("gitsigns").prev_hunk()
end, { silent = true })

vim.keymap.set("n", "<leader>hs", function()
  require("gitsigns").stage_hunk()
end, { silent = true })

vim.keymap.set("n", "<leader>hr", function()
  require("gitsigns").reset_hunk()
end, { silent = true })

vim.keymap.set("n", "<leader>hb", function()
  require("gitsigns").blame_line()
end, { silent = true })

vim.keymap.set("n", "q", "<nop>")
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true })
return M
