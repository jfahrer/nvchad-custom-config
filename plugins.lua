local cmpconfig = require "custom.configs.cmp"
local treesitter = require "custom.configs.treesitter"
local telescope = require "custom.configs.telescope"
local mason = require "custom.configs.mason"

---@type NvPluginSpec[]
local plugins = {
  {
    "hrsh7th/nvim-cmp",
    opts = cmpconfig.opts,
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
    lazy = false,
  },

  {
    "williamboman/mason.nvim",
    opts = mason.opts,
    lazy = false,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = treesitter.opts,
    lazy = false,
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        lazy = false,
      },
      {
        "RRethy/nvim-treesitter-endwise",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        lazy = false,
      },
      {
        "andymass/vim-matchup",
        setup = function() end,
        lazy = false,
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = telescope.opts,
    lazy = false,
  },

  {
    "echasnovski/mini.bracketed",
    config = function()
      require("mini.bracketed").setup()
    end,
    lazy = false,
  },
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end,
    lazy = false,
  },

  {
    "numToStr/Navigator.nvim",
    config = function()
      require("Navigator").setup()
    end,
    lazy = false,
  },

  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
    lazy = false,
  },

  { "tpope/vim-projectionist", lazy = false },
  { "rhysd/clever-f.vim", lazy = false },
  { "vim-test/vim-test", lazy = false },

  { "tpope/vim-fugitive", lazy = false },

  {
    "github/copilot.vim",
    lazy = false,
  },
  {
    "scalameta/nvim-metals",
    as = "metals",
    lazy = false,
    config = function()
      require "custom.configs.vim-metals"
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = false },
      { "mfussenegger/nvim-dap", lazy = false },
    },
  },
}

return plugins
