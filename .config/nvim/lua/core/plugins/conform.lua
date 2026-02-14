return {
  'stevearc/conform.nvim',
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff", "ruff_organize_imports", "ruff_format" },
      go = { "golines", "gofumpt", "goimports" },
      rust = { "rust_analyzer" },
      json = { "prettier" },
      yaml = { "prettier" },
      toml = { "taplo" },
      javascript = { "prettier" },
    },

    format_on_save = {
      timeout_ms = 2000,
      lsp_format = "fallback",
    },
  },
}