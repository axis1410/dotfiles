return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  config = function()
    vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

    require("outline").setup {
      outline_window = {
        auto_jump = true,
        wrap = false,
        show_relative_numbers = true,
      },
    }
  end,
}
