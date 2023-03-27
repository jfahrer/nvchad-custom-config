-- First read our docs (completely) then check the example_config repo

local M = {}

M.ui = {
  theme = "one_light",
}

M.plugins = require("custom/plugins")

local mappings = require("custom/mappings")
M.mappings = mappings

require("custom/vim-test")

return M
