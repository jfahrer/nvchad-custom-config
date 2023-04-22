local M = {}

M.opts = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "go",
    "ruby",
  },
  indent = {
    enable = false,
    -- disable = {
    --   "python"
    -- },
  },
  endwise = {
    enable = true,
  },
}

return M
