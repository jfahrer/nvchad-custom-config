local M = {}

local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- local function count_buffers()
--   local buffers = {}
--   local len = 0
--   local vim_fn = vim.fn
--   local buflisted = vim_fn.buflisted
--
--   for buffer = 1, vim_fn.bufnr('$') do
--     if buflisted(buffer) ~= 1 then
--       len = len + 1
--       buffers[len] = buffer
--     end
--   end
--
--   return buffers.len
-- end


M.disabled = {
  n = {
    ["<leader>tt"] = "",
    ["<leader>tk"] = "",
    ["<leader>th"] = "",
    ["<leader>td"] = "",
    ["<leader>q"] = "",
    ["<leader>n"] = "",
    ["<leader>rn"] = "",
    ["<leader>x"] = "",
    ["<leader>wk"] = "",
    ["<leader>wK"] = "",
    ["<leader>wa"] = "",
    ["<leader>wl"] = "",
    ["<leader>wr"] = "",
    ["<C-c>"] = "",
    ["<C-s>"] = "",
    ["]c"] = "",
    ["[c"] = "",
  }
}

M.general = {
  i = {
    ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }}
  },
  n = {
    ["s"] = { "<CMD> write<CR>", "Write current buffer"},
    ["S"] = { "<CMD> wall<CR>", "Write all buffers"},


    ["<leader>q"] = { "q", "Record macro", opts = { nowait = true }},
    ["<leader>Q"] = { "qqqqq", "Record recursive macro in q", opts = { nowait = true }},

    ["<C-q>"] = {
      function()
        vim.cmd("copen")
        -- local number_of_buffers = count_buffers()
        -- if count_buffers() == number_of_buffers then
        --   -- This doesn't currently work
        --   -- vim.cmd("cclose")
        -- end
      end,
      "Toggle quickfix"
    },

    ["<C-c>"] = { "<CMD>nohlsearch<CR>", "Clear search highlight"},
  }
}

M.buffer_and_window_management = {
  n = {
    ["<C-h>"] = { "<CMD>NavigatorLeft<CR>", "window left"},
    ["<C-j>"] = { "<CMD>NavigatorDown<CR>", "window down"},
    ["<C-k>"] = { "<CMD>NavigatorUp<CR>", "window up"},
    ["<C-l>"] = { "<CMD>NavigatorRight<CR>", "window right"},

    ["<leader>j"] = { "<C-w>j", "Jump to next window" },

    ["q"] = {
      function()
        if vim.fn.reg_recording() == "" then
          require("nvchad_ui.tabufline").close_buffer()
        else
          vim.cmd 'normal 1 q'
        end
      end,
      "close buffer"
    },
    ["Q"] = { "<CMD> close<CR>", "Close window"},

    ["<leader>o"] = {
      function()
        vim.cmd("only")
        require("nvchad_ui.tabufline").closeOtherBufs()
        vim.cmd("AV")
      end,
      "Vertical split for test and impl"
    },

    ["<leader>O"] = {
      function()
        vim.cmd("only")
        require("nvchad_ui.tabufline").closeOtherBufs()
      end,
      "Close all other buffers and windows"
    },

    -- [";v"] = {
    --   function()
    --     vim.cmd("vsplit")
    --   end,
    --   "Vertical split"
    -- },
    -- [";h"] = {
    --   function()
    --     vim.cmd("split")
    --   end,
    --   "Horizontal split"
    -- },

    ["<leader>a"] = {
      function()
        vim.cmd("A")
      end,
      "Alternate file"
    },

    -- Resizing of windows
    ["<Leader><Up>"] = {
      function()
        vim.api.nvim_win_set_height(0, math.floor(vim.fn.winheight(0) * 3/2))
      end,
      "Increase window height"
    },
    ["<Leader><Down>"] = {
      function()
        vim.api.nvim_win_set_height(0, math.floor(vim.fn.winheight(0) * 2/3))
      end,
      "Decrease window height"
    },
    ["<Leader><Right>"] = {
      function()
        vim.api.nvim_win_set_width(0, math.floor(vim.fn.winwidth(0) * 3/2))
      end,
      "Increase window width"
    },
    ["<Leader><Left>"] = {
      function()
        vim.api.nvim_win_set_width(0, math.floor(vim.fn.winwidth(0) * 2/3))
      end,
      "Decrease window width"
    },
    ["<leader>z"] = { "<C-w>_<C-w>|", "Zoom window" },
    ["<leader>Z"] = { "<C-w>=", "Balance windows" },
  },

  t = {
    ["<C-x>"] = { termcodes "<C-\\><C-N>", "escape terminal mode" },
    ["jk"] = { termcodes "<C-\\><C-N>", "escape terminal mode" },
    -- TODO: These should put the size of the window back into what it was before
    ["<C-h>"] = { "<CMD>NavigatorLeft<CR>", "window left"},
    ["<C-j>"] = { "<CMD>NavigatorDown<CR>", "window down"},
    ["<C-k>"] = { "<CMD>NavigatorUp<CR>", "window up"},
    ["<C-l>"] = { "<CMD>NavigatorRight<CR>", "window right"},
  },
}

M.test = {
  n = {
    [";s"] = {
      "<CMD> TestAll",
      "All suite"
    },
    [";f"] = {
      "<CMD> TestFile<CR>",
      "Test file"
    },
    [";d"] = {
      "<CMD> TestNearest<CR>",
      "Test nearest to curser"
    },
    [";;"] = {
      "<CMD> TestLast<CR>",
      "Re-run last test"
    },
    [";g"] = {
      "<CMD> TestVisit<CR>",
      "Visit last run test"
    }
  }
}

M.oil = {
  n = {
    ["-"] = {
      function()
        require("oil").open()
      end, "Open parent directory"
    }
  },
}

M.bracketed = {
  n = {
    -- These don't work when repeating or counting
    ["[ "] = { "m'O<ESC>`'", "Add empty line above"},
    ["] "] = { "m'o<ESC>`'", "Add empty line above"},
    ["[e"] = { "<CMD> cnewer<CR>"},
    ["]e"] = { "<CMD> colder<CR>"},
  }
}

M.telescope = {
  n = {
    ["<leader><leader>"] = { "<CMD> Telescope find_files<CR>", "find files"},
    ["<leader>fF"] = { "<CMD> Telescope find_files no_ignore=true hidden=true<CR>", "find files including gitignored"},
    ["<leader>fW"] = {
      function()
        vim.cmd("Telescope live_grep default_text=" .. vim.fn.expand("<cword>"))
      end, "live grep current word"
    },
    ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },
  }
}

M.toggles = {
  n = {
    ["<leader>tn"] = { "<CMD> set number!<CR>", "toggle line number"},
    ["<leader>tr"] = { "<CMD> set relativenumber!<CR>", "toggle relative number"},
    ["<leader>tt"] = {
      function()
        require("base46").toggle_theme()
      end,
      "toggle theme"
    },
    ["<leader>td"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
  }
}

M.copying = {
  n = {
    ["<leader>c"] = { '"+y', "copy to clipboard"},
    ["<leader>C"] = { "<CMD>%y+ <CR>", "copy buffer to clipboard"},
  },
  v = {
    ["<leader>c"] = { '"+y', "copy to clipboard"},
  }
}


return M
