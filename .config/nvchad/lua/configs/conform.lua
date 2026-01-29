local options = {
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
    sql = { "sql_formatter" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2000,
    lsp_fallback = true,
  },
}

return options
