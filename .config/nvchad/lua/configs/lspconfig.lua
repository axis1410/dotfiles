require("nvchad.configs.lspconfig").defaults()

-- LSP servers to enable (install these with :Mason or :MasonInstallAll)
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
