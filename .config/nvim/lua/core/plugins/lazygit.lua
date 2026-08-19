-- nvim v0.8.0
return {
  "kdheepak/lazygit.nvim",
  enabled = false,
  lazy = true,
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  init = function()
    if vim.v.servername == "" then
      vim.fn.serverstart()
    end

    vim.env.NVIM = vim.v.servername
    vim.env.NVIM_LISTEN_ADDRESS = vim.v.servername
    vim.g.lazygit_floating_window_winblend = 1
    vim.g.lazygit_use_custom_config_file_path = 1
    vim.g.lazygit_config_file_path = vim.fn.expand "~/.config/lazygit/config.yml"
  end,
}