local plugins = {
  { "folke/which-key.nvim", enabled = false },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    enabled = false,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "echasnovski/mini.move",
    version = false,
    lazy = false,
    opts = function()
      return require "configs.mini_move"
    end,
  }
}

local nvim_plugins = {
  require "nvim_plugins.statusline",
  require "nvim_plugins.treesitter",
  require "nvim_plugins.gitsigns",
  require "nvim_plugins.flash",
  require "nvim_plugins.trouble",
  require "nvim_plugins.snacks",
  require "nvim_plugins.explorer",
  require "nvim_plugins.misc",
  require "nvim_plugins.tw",
  require "nvim_plugins.web-dev",
  require "nvim_plugins.noice",
  require "nvim_plugins.mini",
  require "nvim_plugins.tabout",
  require "nvim_plugins.lazygit",
  require "nvim_plugins.diffview",
  require "nvim_plugins.markdown",
  require "nvim_plugins.transparent",
  require "nvim_plugins.log_highlight",
  require "nvim_plugins.fzf",

  -- require "nvim_plugins.colorscheme",
  -- require "nvim_plugins.indentmini",
  -- require "nvim_plugins.indent-blankline",
  -- require "nvim_plugins.staline",
  -- require "nvim_plugins.autocomplete",
  -- require "nvim_plugins.plenary",
  -- require "nvim_plugins.harpoon",
  -- require "nvim_plugins.yazi",
  -- require "nvim_plugins.oil",
  -- require "nvim_plugins.incline",
  -- require "nvim_plugins.markdown-viewer",
  -- require "nvim_plugins.dashboard",
  -- require "nvim_plugins.neorg",
  -- require "nvim_plugins.telescope",
  -- require "nvim_plugins.motion",
}

for _, spec in ipairs(nvim_plugins) do
  table.insert(plugins, spec)
end

return plugins
