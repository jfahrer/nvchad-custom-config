local M = {}

local function unlearn()
  vim.notify("WRONG DUDE!!!")
end

local function count_buffers()
  local buffers = {}
  local len = 0
  local vim_fn = vim.fn
  local buflisted = vim_fn.buflisted

  for buffer = 1, vim_fn.bufnr('$') do
    if buflisted(buffer) ~= 1 then
      len = len + 1
      buffers[len] = buffer
    end
  end

  return buffers.len
end


M.disabled = {
  n = {
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

M.unlearn = {
  n = {
    ["<leader>w"] = { unlearn, "unlearn!"}
  }
}

M.general = {
  i = {
    ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }}
  },
  n = {
    ["s"] = { "<CMD> write<CR>", "Write current buffer", opts = { nowait = true }},
    ["S"] = { "<CMD> wall<CR>", "Write all buffers"},

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

    ["<leader>q"] = { "q", "Record macro", opts = { nowait = true }},
    ["<leader>Q"] = { "qqqqq", "Record recursive macro in q", opts = { nowait = true }},

    ["<C-q>"] = {
      function()
        local number_of_buffers = count_buffers()
        vim.cmd("copen")

        if count_buffers() == number_of_buffers then
          -- This doesn't currently work
          -- vim.cmd("cclose")
        end
      end,
      "Toggle quickfix"
    },

    ["<C-h>"] = { "<CMD>NavigatorLeft<CR>", "window left"},
    ["<C-j>"] = { "<CMD>NavigatorDown<CR>", "window down"},
    ["<C-k>"] = { "<CMD>NavigatorUp<CR>", "window up"},
    ["<C-l>"] = { "<CMD>NavigatorRight<CR>", "window right"},

    ["<C-c>"] = { "<CMD>nohlsearch<CR>", "Clear search highlight"},
  }
}

M.oil = {
  n = {
    ["-"] = { require("oil").open, "Open parent directory"}
  }
}

M.pairs = {
  n = {
    -- These don't work when repeating or counting
    ["[ "] = { "m'O<ESC>`'", "Add empty line above"},
    ["] "] = { "m'o<ESC>`'", "Add empty line above"},
    ["[e"] = { "<CMD> cnext<CR>"},
    ["]e"] = { "<CMD> cprevious<CR>"},
  }
}

M.telescope = {
  n = {
    ["<leader><leader>"] = { "<CMD> Telescope find_files<CR>", "find files"},
    ["<leader>fF"] = { "<CMD> Telescope find_files no_ignore=true hidden=true<CR>", "find files including gitignored"},
    ["<leader>fW"] = {
      function()
        vim.cmd("Telescope live_grep default_text=" .. vim.fn.expand("<cword>"))
      end, "live grep current word", opts = { nowait = true }},
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
