return {
  "nvim-pack/nvim-spectre",
  lazy = false,
  build = "bash ./build.sh",

  config = function()
    vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
      desc = "Toggle Spectre",
    })
  end,
}
