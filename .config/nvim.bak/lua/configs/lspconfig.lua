require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "ruff",
  "pyright",
  "ts_ls",
  "gopls",
  "lua_ls",
  "taplo",
  "rust_analyzer",
  "docker_compose_language_service",
  "dockerfile_language_server",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
