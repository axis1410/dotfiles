require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map({ "n", "i", "s" }, "<C-f>", function()
  local ok, lsp = pcall(require, "noice.lsp")
  if ok and lsp.scroll(4) then
    return ""
  end
  if vim.api.nvim_get_mode().mode == "n" then
    return "<C-f>zz"
  end
  return "<C-f>"
end, { silent = true, expr = true, desc = "Scroll hover forward" })

map({ "n", "i", "s" }, "<C-b>", function()
  local ok, lsp = pcall(require, "noice.lsp")
  if ok and lsp.scroll(-4) then
    return ""
  end
  if vim.api.nvim_get_mode().mode == "n" then
    return "<C-b>zz"
  end
  return "<C-b>"
end, { silent = true, expr = true, desc = "Scroll hover backward" })
map("n", "}", "}zz", opts)
map("n", "{", "{zz", opts)
map("n", "<leader>y", [["+y]], { desc = "yank to system clipboard" })
map("n", "dd", [["_dd]])
map("i", "jj", "<Esc>")
map("n", "d", '"_d', { noremap = true })
map("n", "D", '"_D', { noremap = true })
map("n", "x", '"_x', { noremap = true })
map("n", "X", '"_X', { noremap = true })
map("v", "d", '"_d', { noremap = true })
map("v", "D", '"_D', { noremap = true })
map("n", "<leader>d", "d", { noremap = true, desc = "Cut (delete to clipboard)" })
map("v", "<leader>d", "d", { noremap = true, desc = "Cut (delete to clipboard)" })

map("n", "ciw", '"_ciw', { desc = "Change in word (no yank)" })
map("n", 'ci"', '"_ci"', { desc = "Change in quotes (no yank)" })
map("n", "ci'", "\"_ci'", { desc = "Change in single quotes (no yank)" })
map("n", "ci(", '"_ci(', { desc = "Change in parentheses (no yank)" })
map("n", "ci)", '"_ci)', { desc = "Change in parentheses (no yank)" })
map("n", "ci{", '"_ci{', { desc = "Change in braces (no yank)" })
map("n", "ci}", '"_ci}', { desc = "Change in braces (no yank)" })
map("n", "ci[", '"_ci[', { desc = "Change in brackets (no yank)" })
map("n", "ci]", '"_ci]', { desc = "Change in brackets (no yank)" })

map("n", "diw", '"_diw', { desc = "Delete in word (no yank)" })
map("n", 'di"', '"_di"', { desc = "Delete in quotes (no yank)" })
map("n", "di'", "\"_di'", { desc = "Delete in single quotes (no yank)" })
map("n", "di(", '"_di(', { desc = "Delete in parentheses (no yank)" })
map("n", "di{", '"_di{', { desc = "Delete in braces (no yank)" })
map("n", "di[", '"_di[', { desc = "Delete in brackets (no yank)" })
map("v", "c", '"_c')
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)

local ok_oil, oil = pcall(require, "oil")
if ok_oil then
  map("n", "<leader>e", oil.open, { desc = "Open Oil file explorer" })
end

local ok_fzf, fzf = pcall(require, "fzf-lua")
if ok_fzf then
  map("n", "<leader>fh", fzf.help_tags, { desc = "[S]earch [H]elp" })
  map("n", "<leader>fk", fzf.keymaps, { desc = "[S]earch [K]eymaps" })
  map("n", "<leader>ff", fzf.files, { desc = "[S]earch [F]iles" })
  map("n", "<leader>fs", fzf.builtin, { desc = "[S]earch [S]elect FZF" })
  map("n", "<leader>fw", fzf.grep_cword, { desc = "[S]earch current [W]ord" })
  map("n", "<leader>fg", fzf.live_grep_native, { desc = "[S]earch by [G]rep" })
  map("n", "<leader>fd", fzf.diagnostics_document, { desc = "[S]earch [D]iagnostics" })
  map("n", "<leader>fr", fzf.resume, { desc = "[S]earch [R]esume" })
  map("n", "<leader>f.", fzf.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
  map("n", "<leader><leader>", fzf.buffers, { desc = "[ ] Find existing buffers" })
  map("n", "<leader>/", fzf.blines, { desc = "[/] Fuzzily search in current buffer" })
end

map("n", "<leader>bd", function() require("mini.bufremove").delete(0, false) end, {desc="Delete Buffer (keep window)"})
map("n", "<leader>bD", function() require("mini.bufremove").delete(0, true) end, {desc="Delete Buffer (keep window)"})
