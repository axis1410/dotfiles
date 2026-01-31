require "nvchad.mappings"

local opts = { noremap = true, silent = true }
local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

-- map("n", "<C-d>", "<C-d>zz", opts)
-- map("n", "<C-u>", "<C-u>zz", opts)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>tt", function()
  require("base46").toggle_transparency()
end)

map("n", "<leader>e", function()
  require("lazy").load { plugins = { "oil.nvim" } }
  require("oil").open()
end, { desc = "Open Oil file explorer" })

local ok_zen, zen = pcall(require, "zen-mode")
if ok_zen then
  map("n", "<leader>zz", function()
    zen.toggle {
      window = {
        width = 0.80,
      },
    }
  end, opts)
end

map("i", "<C-Space>", function()
  require("cmp").complete()
end, { desc = "Trigger completion" })

map("i", "<C-Space>", function()
  require("blink.cmp").complete()
end, { desc = "Blink: trigger completion" })

nomap("n", "<leader>n")
nomap("n", "<leader>rn")
nomap("n", "<leader>fz")
nomap("n", "<leader>fb")
nomap("n", "<leader>fa")
nomap("n", "<leader>cm")
nomap("n", "<leader>x")
