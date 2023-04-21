vim.notify("start")
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
vim.notify("being called")
local lspconfig = require "lspconfig"
vim.notify("being 2")

local servers = { "html", "cssls", "solargraph"}

vim.notify("being here")
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
