local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = {'ruff'},
    go = {'golines', 'gofumpt', 'goimports'},
    rust = {'rust_analyzer'}
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2500,
    lsp_fallback = true,
  },
}

return options
