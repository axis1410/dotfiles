require "nvchad.mappings"

local opts = { noremap = true, silent = true }
local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

map("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- map("n", "<C-d>", "<C-d>zz", opts)
-- map("n", "<C-u>", "<C-u>zz", opts)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

nomap({ "n", "x", "o" }, "s")
nomap({ "n", "x", "o" }, "S")

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

local ok_oil, oil = pcall(require, "oil")
if ok_oil then
  map("n", "<leader>e", function()
    oil.open(nil, { preview = {
      vertical = true,
    } })
  end, { desc = "Open Oil File Explorer" })
end

local ok_flash, flash = pcall(require, "flash")
if ok_flash then
  map({ "n", "x", "o" }, "s", function()
    flash.jump()
  end, { desc = "Flash" })

  map({ "n", "x", "o" }, "S", function()
    flash.treesitter()
  end, { desc = "Flash Treesitter" })

  map("o", "r", function()
    flash.remote()
  end, { desc = "Remote Flash" })

  map({ "o", "x" }, "R", function()
    flash.treesitter_search()
  end, { desc = "Treesitter Search" })

  map("c", "<C-s>", function()
    flash.toggle()
  end, { desc = "Toggle Flash Search" })
end

local ok_fzf, fzf = pcall(require, "fzf-lua")
if ok_fzf then
  map("n", "<leader>fh", function()
    fzf.help_tags()
  end, { desc = "[S]earch [H]elp" })

  map("n", "<leader>fk", function()
    fzf.keymaps()
  end, { desc = "[S]earch [K]eymaps" })

  map("n", "<leader>ff", function()
    fzf.files()
  end, { desc = "[S]earch [F]iles" })

  map("n", "<leader>fs", function()
    fzf.builtin()
  end, { desc = "[S]earch [S]elect FZF" })

  map("n", "<leader>fw", function()
    fzf.grep_cword()
  end, { desc = "[S]earch current [W]ord" })

  map("n", "<leader>fg", function()
    fzf.live_grep_native()
  end, { desc = "[S]earch by [G]rep" })

  map("n", "<leader>fd", function()
    fzf.diagnostics_document()
  end, { desc = "[S]earch [D]iagnostics" })

  map("n", "<leader>fr", function()
    fzf.resume()
  end, { desc = "[S]earch [R]esume" })

  map("n", "<leader>f.", function()
    fzf.oldfiles()
  end, { desc = '[S]earch Recent Files ("." for repeat)' })

  map("n", "<leader><leader>", function()
    fzf.buffers()
  end, { desc = "[ ] Find existing buffers" })

  map("n", "<leader>/", function()
    fzf.blines()
  end, { desc = "[/] Fuzzily search in current buffer" })

  map("n", "<leader>ca", function()
    fzf.lsp_code_actions()
  end, { desc = "[C]ode [A]ctions", silent = true })
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
nomap("n", "<leader>v")
nomap("n", "<leader>h")
nomap("n", "<C-N>")

-- Delete without yank
map({ "n", "v" }, "d", '"_d', opts)
map({ "n", "v" }, "D", '"_D', opts)

-- Change without yank
map({ "n", "v" }, "c", '"_c', opts)
map({ "n", "v" }, "C", '"_C', opts)

-- -- Cut (x/s) without yank
-- map({ "n", "v" }, "x", '"_x', opts)
-- map({ "n", "v" }, "X", '"_X', opts)

-- Visual mode delete/change
map("v", "p", '"_dP', opts) -- paste over selection without yanking it
