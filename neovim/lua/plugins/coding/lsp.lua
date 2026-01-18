return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lang = require("config.lang")
      local lsp = require("config.lsp")

      for _, server in ipairs(lang.lsp_servers()) do
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
