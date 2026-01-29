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
  "prettier",
  "taplo",
  "rust_analyzer",
  "docker_compose_language_service",
  "dockerfile_language_server",
  "sql_formatter",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
