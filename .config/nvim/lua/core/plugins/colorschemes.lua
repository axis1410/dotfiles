return {

  { "catppuccin/nvim", lazy = false },

  { "rose-pine/neovim", lazy = false },

  { "sainnhe/sonokai", lazy = false },

  { "folke/tokyonight.nvim", lazy = false },

  { "rebelot/kanagawa.nvim", lazy = false },

  { "nickkadutskyi/jb.nvim", lazy = false },

  { "deparr/tairiki.nvim", lazy = false, priority = 1000 },

  { "pmouraguedes/neodarcula.nvim", lazy = false, priority = 1000 },

  -- { "frenzyexists/aquarium-vim", lazy = false, priority = 1000 },

  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    config = function()
      require("github-theme").setup {
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
      }
    end,
  },

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