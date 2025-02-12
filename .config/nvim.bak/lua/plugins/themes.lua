return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    opts = {
      code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },
      style = "darker", -- Choose from "dark", "darker", "cool", "deep", "warm", "warmer", (do not choose) "light"
      lualine = {
        transparent = true,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
    },
  },
  {
    "decaycs/decay.nvim",
    lazy = false,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
      -- colorscheme = "tokyonight-night",
      indentguides = false,
    },
  },
}
