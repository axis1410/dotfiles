return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    chunk = {
      enable = true,
      delay = 10,
      duration = 100,
    },
    indent = {
      enable = true,
    },
    line_num = {
      enable = true,
      use_treesitter = true,
    },
    blank = {
      enable = false,
    },
  },
}