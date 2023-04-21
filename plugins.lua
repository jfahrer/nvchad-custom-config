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
      ensure_installed = { "lua", "vim", "go", "ruby" },
      endwise = { enable = true }
    }
  },
  ["nvim-treesitter/nvim-treesitter-textobjects"] = {
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  },
  ["RRethy/nvim-treesitter-endwise"] = {
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  },
  ["nvim-telescope/telescope.nvim"] = { override_options = { extensions_list = { "fzf", "terms" }}},
  ["nvim-telescope/telescope-fzf-native.nvim"] = { run = "make" },

  ["vim-test/vim-test"] = {},

  ["neovim/nvim-lspconfig"] = {
    -- override_options = {
    --   config = function()
    --     require "plugins.configs.lspconfig"
    --     require "custom.configs.lspconfig"
    --     vim.notify("tescht")
    --   end,
    -- }
  },
}

return M
