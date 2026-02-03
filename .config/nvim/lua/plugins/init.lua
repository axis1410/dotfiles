local specs = require "configs.plugin_specs"

return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- { import = "nvchad.blink.lazyspec" },
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {
      ensure_installed = specs.mason_tools,
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = specs.mason_tools,
      run_on_start = true,
      start_delay = 3000,
      debounce_hours = 24,
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      vim.schedule(function()
        require("nvim-treesitter").install(specs.treesitter_parsers)
      end)
    end,
  },
}
