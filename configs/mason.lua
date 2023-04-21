M = {}

M.opts = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "prettier",

    -- ruby
    "solargraph",
    "standardrb",

    -- shell
    "bashls",

    -- go
    "gopls",
  },
}

return M
