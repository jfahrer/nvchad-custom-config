local M = {}

M.opts = {
  extensions_list = { "fzf", "terms", "live_grep_args" },
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = function()
            require("telescope-live-grep-args.actions").quote_prompt()
          end,
          ["<C-i>"] = function()
            require("telescope-live-grep-args.actions").quote_prompt { postfix = " --iglob " }
          end,
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    },
  },
}

return M
