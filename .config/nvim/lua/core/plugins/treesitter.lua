return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "bash",
      "json",
      "yaml",
      "python",
      "javascript",
      "typescript",
    },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
  config = function()
    local ensure_installed = {
      "lua",
      "python",
      "yaml",
      "toml",
      "json",
      "javascript",
      "typescript",
      "html",
      "css",
      "go",
      "rust",
      "tsx",
      "jsx",
      "jinja",
    }

    vim.schedule(function()
      require("nvim-treesitter").install(ensure_installed)
    end)
  end,
}
