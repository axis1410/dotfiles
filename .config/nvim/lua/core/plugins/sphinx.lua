return {
  {
    "stsewd/sphinx.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "python", "rst" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}

      if not vim.tbl_contains(opts.ensure_installed, "rst") then
        table.insert(opts.ensure_installed, "rst")
      end
    end,
  },
}
