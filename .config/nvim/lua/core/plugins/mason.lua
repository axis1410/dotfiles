local ensure_installed = {
  "stylua",
  "gopls",
  "ruff",
  "pyright",
  "prettier",
  "eslint_d",
  "typescript-language-server",
  "lua-language-server",
  "goimports",
  "gofumpt",
  "golines",
  "rust-analyzer",
  "taplo",
  "tailwindcss-language-server",
}

return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup {}
      local registry = require "mason-registry"
      registry.refresh(function(success)
        if not success then
          vim.notify("Mason registry update failed. Run :MasonUpdate then restart.", vim.log.levels.WARN)
        end
      end)
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = ensure_installed,
      start_delay = 8000,
      debounce_hours = 24,
      run_on_start = true,
    },
  },
}