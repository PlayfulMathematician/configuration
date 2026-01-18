local M = {}

function M.setup()
  vim.keymap.set(
    "n",
    "<leader>e",
    "<Cmd>Neotree toggle<CR>",
    { silent = true, desc = "Toggle file explorer" }
  )
end

return M
