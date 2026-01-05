local lists = require("config.lists")

return {
  { "williamboman/mason.nvim", build = ":MasonUpdate", config = true },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = lists.lsp_servers,
      automatic_installation = true,
    },
  },
}

