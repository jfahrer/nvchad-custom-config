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
    ["<leader>x"] = "",
    ["<leader>wk"] = "",
    ["<leader>wK"] = "",
    ["<leader>wa"] = "",
    ["<leader>wl"] = "",
    ["<leader>wr"] = "",
    ["<C-c>"] = "",
    ["<C-s>"] = "",
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

    -- These don't work when repeating or counting
    ["[ "] = { "m'O<ESC>`'", "Add empty line above"},
    ["] "] = { "m'o<ESC>`'", "Add empty line above"},
  }
}

M.oil = {
  n = {
    ["-"] = { require("oil").open, "Open parent directory"}
  }
}

M.telescope = {
  n = {
    ["<leader><leader>"] = { "<CMD> Telescope find_files<CR>", "find files", opts = { nowait = true }}
  }
}

return M
