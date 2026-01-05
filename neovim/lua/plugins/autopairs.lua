local opts = require("config.autopairs")

return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = opts,
  },
}
