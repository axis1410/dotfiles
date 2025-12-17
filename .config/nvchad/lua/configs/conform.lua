local options = {
  lazy=false,
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    vue = { "prettier" },
    css = { "prettier" },
    html = { "djlint", "prettier" },
    jinja = { "djlint" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    go = { "golines", "gofumpt", "goimports" },
    python = { "ruff", "ruff_organize_imports", "ruff_format" },
    lua = { "stylua" },
    toml = { "taplo" },
  },
  format_on_save = {
    lsp_format = "fallback",
    async = false,
    timeout_ms = 500,
  },
}

return options
