local lists = require("config.lists")

return {
  ensure_installed = lists.treesitter_parsers,
  highlight = { enable = true },
  indent = { enable = true },
}

