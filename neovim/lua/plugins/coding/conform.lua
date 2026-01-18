return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = function()
      local lang = require("config.lang")
      return {
        formatters_by_ft = lang.formatters(),
        format_on_save = {
          timeout_ms = 1000,
          lsp_fallback = true,
        },
      }
    end,
    config = function(_, opts)
      require("conform").setup(opts)
      require("keymaps.format").setup()
    end,
  },
}
