require("nvchad.configs.lspconfig").defaults()

local servers = {
  "ts_ls",
  "pyright",
  "ruff",
  "html",
  "jinja_lsp",
  "cssls",
  "dockerls",
  "sqlls",
  "terraformls",
  "yamlls",
  "tailwindcss",
  "rust_analyzer",
  "lua_ls",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
