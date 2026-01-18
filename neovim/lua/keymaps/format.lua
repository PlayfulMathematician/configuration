local M = {}

function M.setup()
  vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true })
  end, { silent = true, desc = "Format buffer" })
end

return M
