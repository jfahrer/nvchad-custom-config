local cmpconfig = require "custom.configs.cmp"
local treesitter = require "custom.configs.treesitter"
local telescope = require "custom.configs.telescope"
local mason = require "custom.configs.mason"
local obsidian = require "custom.configs.obsidian"

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
    "nvim-telescope/telescope-live-grep-args.nvim",
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
    "christoomey/vim-tmux-runner",
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
    "zbirenbaum/copilot.lua",
    lazy = false,
    config = function()
      require("copilot").setup({})
    end,
  },

  {
    "yetone/avante.nvim",
    lazy = false,
    opts = {
      provider = "copilot",
      providers = {
        copilot = {}
      }
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "zbirenbaum/copilot.lua",
    }
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
  -- {
  --   "olexsmir/gopher.nvim",
  --   lazy = false,
  --   dependencies = { -- dependencies
  --     { "nvim-lua/plenary.nvim", lazy = false },
  --     { "mfussenegger/nvim-dap", lazy = false },
  --     { "nvim-treesitter/nvim-treesitter", lazy = false },
  --   },
  --   config = function()
  --     require "custom.configs.gopher"
  --   end,
  -- },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = false },
    },
    opts = obsidian.opts,
  },
}

return plugins
