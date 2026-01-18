local M = {}

function M.on_attach(bufnr)
  local map = vim.keymap.set
  local opts = { buffer = bufnr, silent = true }

  map("n", "gd", vim.lsp.buf.definition, opts)
  map("n", "gr", vim.lsp.buf.references, opts)
  map("n", "gi", vim.lsp.buf.implementation, opts)
  map("n", "K", vim.lsp.buf.hover, opts)

  map("n", "<leader>rn", vim.lsp.buf.rename, opts)
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  map("n", "[d", vim.diagnostic.goto_prev, opts)
  map("n", "]d", vim.diagnostic.goto_next, opts)
end

return M
