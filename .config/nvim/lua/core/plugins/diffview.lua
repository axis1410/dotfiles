return {
  "sindrets/diffview.nvim",
  lazy = false,
  config = function()
    vim.keymap.set("n", "<leader>do", function()
      require("diffview").open()
    end, { desc = "Open Diffview" })

    vim.keymap.set("n", "<leader>dc", function()
      require("diffview").close()
    end, { desc = "Close Diffview" })
  end,
}
