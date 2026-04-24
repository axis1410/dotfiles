return {
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    keys = {
      {
        "<leader>gg",
        "<cmd>LazyGit<CR>",
        desc = "Open LazyGit",
      },
    },
    init = function()
      vim.g.lazygit_floating_window_winblend = 1
    end,
  },
}
