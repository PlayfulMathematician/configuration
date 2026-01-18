return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = function()
      local lang = require("config.lang")
      return {
        ensure_installed = lang.lsp_servers(),
        automatic_installation = true,
      }
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = function()
      local lang = require("config.lang")
      return {
        ensure_installed = lang.mason_tools(),
        run_on_start = true,
      }
    end,
  },
}
