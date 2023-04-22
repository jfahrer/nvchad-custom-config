local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- for default config simply add a server to the table
local servers = { "html", "cssls", "bashls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.solargraph.setup {
  settings = {
    solargraph = {
      diagnostics = false,
    },
  },
  init_options = {
    formatting = false,
  },
}
