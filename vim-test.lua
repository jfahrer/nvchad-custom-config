local nvterm_runner = function(cmd)
  local nvterm = require("nvterm.terminal")
  nvterm.show("horizontal")
  nvterm.send(cmd, "horizontal")
end

vim.g["test#custom_strategies"] = { nvterm = nvterm_runner }
vim.g["test#strategy"] = {
  nearest = "nvterm",
  file = "nvterm",
  suite = "nvterm",
}
