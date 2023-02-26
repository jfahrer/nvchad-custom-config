local M = {
  ["echasnovski/mini.bracketed"] = {},
  ["kylechui/nvim-surround"] = {},
  ["tpope/vim-projectionist"] = {},

  ["numToStr/Navigator.nvim"] = {}, -- Navigation across tmux panes
  ["stevearc/oil.nvim"] = {}, -- vim-vinegar style file browser
  ["rhysd/clever-f.vim"] = {}, -- repeat motions with f,F,t,T

  ["folke/which-key.nvim"] = { disable = false },
  ["nvim-tree/nvim-tree.lua"] = { disable = true },

  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = {
      ensure_installed = { "lua", "vim", "go", "ruby" }
    }
  },
  ["nvim-treesitter/nvim-treesitter-textobjects"] = {
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  },

  ["vim-test/vim-test"] = {},
}

return M
