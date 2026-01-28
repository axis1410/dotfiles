require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "ruff",
  "pyright",
  "typescript_language_server",
  "gopls",
  "gofumpt",
  "goimports",
  "golines",
  "lua_ls",
  "rust_analyzer",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
