local M = {}

M.lsp_servers = {
  "lua_ls",
  "clangd",
  "pyright",
  "gopls",
  "ts_ls",
  "marksman"
}

M.formatters = {
  "stylua",
  "gofmt",
  "black",
  "prettier",
  "clang-format",

}

M.treesitter_parsers = {
  "lua",
  "c",
  "cpp",
  "go",
  "python",
  "javascript",
  "typescript",
  "json",
  "bash",
  "markdown",
  "vim",
  "markdown_inline"
}

return M
