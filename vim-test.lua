local nvterm_runner = function(cmd)
  local nvterm = require "nvterm.terminal"
  -- nvterm.show("horizontal")
  nvterm.send(cmd, "horizontal")
end

local vim_tmux_runner = function(cmd)
  vim.cmd "VtrOpenRunner"
  vim.cmd("VtrSendCommandToRunner " .. cmd)
end

local exit_on_success = function(cmd)
  return cmd .. " && exit"
end

vim.g["test#custom_strategies"] = {
  nvterm = nvterm_runner,
  vtr = vim_tmux_runner,
}
vim.g["test#strategy"] = {
  nearest = "vtr",
  file = "vtr",
  suite = "vtr",
}
vim.g["test#custom_transformations"] = { exit_on_success = exit_on_success }
-- vim.g["test#transformation"] = 'exit_on_success'
