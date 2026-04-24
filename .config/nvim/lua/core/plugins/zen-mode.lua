return {
  "folke/zen-mode.nvim",
  config = function()
    local z = require "zen-mode"

    z.setup {
      window = {
        backdrop = 0.75,
        width = 160,
      },
      options = {
        signcolumn = "yes",
        relativenumber = true,
        cursorline = true,
        cursorcolumn = true,
      },

      plugins = {
        todo = { enabled = true },
        gitsigns = { enabled = true },
      },
    }

    vim.keymap.set("n", "<leader>zz", "<cmd>ZenMode<CR>", { desc = "Toggle Zen Mode" })
  end,
}
