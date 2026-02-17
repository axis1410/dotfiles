return {

  "xiyaowong/transparent.nvim",
  opts = {},
  enabled = false,
  config = function()
    local ts = require "transparent"
    ts.setup()

    vim.keymap.set("n", "<leader>tt", "<CMD>TransparentToggle<CR>", { desc = "Toggle Transparent Mode" })
  end,
}
