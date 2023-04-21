local nvterm_runner = function(cmd)
  local nvterm = require("nvterm.terminal")
  -- nvterm.show("horizontal")
  nvterm.send(cmd, "horizontal")
end

local exit_on_success = function(cmd)
  return cmd .. ' && exit'
end

vim.g["test#custom_strategies"] = { nvterm = nvterm_runner }
vim.g["test#strategy"] = {
  nearest = "nvterm",
  file = "nvterm",
  suite = "nvterm",
}
vim.g["test#custom_transformations"] = {exit_on_success =  exit_on_success }
-- vim.g["test#transformation"] = 'exit_on_success'
