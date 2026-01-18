return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false, -- load immediately
    opts = function()
      local lang = require("config.lang")
      return {
        ensure_installed = lang.treesitter(),
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },
}
