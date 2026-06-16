return {
  {
    "nvchad/base46",
    enabled = false,
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "nvzone/volt",
    enabled = false,
    lazy = true,
  },
  {
    "nvchad/ui",
    enabled = false,
    event = "UiEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvchad/base46",
      "nvzone/volt",
    },
    config = function()
      require "nvchad"
    end,
  },
}
