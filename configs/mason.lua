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
    "bash-language-server",

    -- go
    "gopls",

    -- ansible
    "ansible-language-server",
  },
}

return M
