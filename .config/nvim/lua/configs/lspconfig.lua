-- Load NvChad defaults (lua_ls, keymaps, etc.)
local nvlsp = require("nvchad.configs.lspconfig")
nvlsp.defaults()

-- Common options reused across servers
local common = {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- Declarative server configs
vim.lsp.config.html = common
vim.lsp.config.cssls = common
vim.lsp.config.bashls = common

-- Enable servers
vim.lsp.enable {
  "html",
  "cssls",
  "bashls",
}
