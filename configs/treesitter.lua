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
    "scala",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  endwise = {
    enable = true,
  },
  matchup = {
    enable = true,
  },
}

return M
