-- First read our docs (completely) then check the example_config repo

local M = {}

M.ui = {
  theme = "one_light",
}

local mappings = require("custom/mappings")
M.mappings = mappings

M.plugins = require("custom/plugins")

return M
