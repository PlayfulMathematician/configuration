local lists = require("config.lists")
local lsp = require("config.lsp")

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      for _, server in ipairs(lists.lsp_servers) do
        local opts = {
          capabilities = lsp.capabilities,
          on_attach = lsp.on_attach,
        }

        if lsp.settings[server] then
          opts.settings = lsp.settings[server]
        end

        vim.lsp.config(server, opts)

        vim.lsp.enable(server)
      end
    end,
  },
}
