return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  { import = "nvchad.blink.lazyspec" },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "ruff",
        "pyright",
        "prettier",
        "eslint",
        "typescript_language_server",
        "lua_ls",
        "goimports",
        "gofumpt",
        "golines",
        "rust_analyzer",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "go",
        "python",
        "typescript",
        "tsx",
        "jinja",
        "rust",
      },
    },
  },
}
