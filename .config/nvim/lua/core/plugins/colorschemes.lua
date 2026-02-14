return {

  { "catppuccin/nvim", lazy = false },

  { "rose-pine/neovim", lazy = false },

  { "sainnhe/sonokai", lazy = false },

  { "folke/tokyonight.nvim", lazy = false },

  { "rebelot/kanagawa.nvim", lazy = false },

  { "nickkadutskyi/jb.nvim", lazy = false },

  {
    "axis1410/cursor-dark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cursor-dark").setup {
        style = "dark-midnight",
        transparent = false,
        dashboard = true,
      }
    end,
  },
}
