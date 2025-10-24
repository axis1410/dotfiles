local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set({ "n", "i", "s" }, "<C-f>", function()
  local ok, lsp = pcall(require, "noice.lsp")
  if ok and lsp.scroll(4) then
    return ""
  end
  if vim.api.nvim_get_mode().mode == "n" then
    return "<C-f>zz"
  end
  return "<C-f>"
end, { silent = true, expr = true, desc = "Scroll hover forward" })

vim.keymap.set({ "n", "i", "s" }, "<C-b>", function()
  local ok, lsp = pcall(require, "noice.lsp")
  if ok and lsp.scroll(-4) then
    return ""
  end
  if vim.api.nvim_get_mode().mode == "n" then
    return "<C-b>zz"
  end
  return "<C-b>"
end, { silent = true, expr = true, desc = "Scroll hover backward" })
vim.keymap.set("n", "}", "}zz", opts)
vim.keymap.set("n", "{", "{zz", opts)

vim.keymap.set("n", "<leader>y", [["+y]], { desc = "yank to system clipboard" })
vim.keymap.set("n", "<leader>sa", "ggVG", { desc = "Select All" })

vim.keymap.set("n", "dd", [["_dd]])

vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "d", '"_d', { noremap = true })
vim.keymap.set("n", "D", '"_D', { noremap = true })
vim.keymap.set("n", "x", '"_x', { noremap = true })
vim.keymap.set("n", "X", '"_X', { noremap = true })
vim.keymap.set("v", "d", '"_d', { noremap = true })
vim.keymap.set("v", "D", '"_D', { noremap = true })

vim.keymap.set("n", "<leader>d", "d", { noremap = true, desc = "Cut (delete to clipboard)" })
vim.keymap.set("v", "<leader>d", "d", { noremap = true, desc = "Cut (delete to clipboard)" })

-- Change in without yanking
vim.keymap.set("n", "ciw", '"_ciw', { desc = "Change in word (no yank)" })
vim.keymap.set("n", 'ci"', '"_ci"', { desc = "Change in quotes (no yank)" })
vim.keymap.set("n", "ci'", "\"_ci'", { desc = "Change in single quotes (no yank)" })

vim.keymap.set("n", "ci(", '"_ci(', { desc = "Change in parentheses (no yank)" })
vim.keymap.set("n", "ci)", '"_ci)', { desc = "Change in parentheses (no yank)" })

vim.keymap.set("n", "ci{", '"_ci{', { desc = "Change in braces (no yank)" })
vim.keymap.set("n", "ci}", '"_ci}', { desc = "Change in braces (no yank)" })

vim.keymap.set("n", "ci[", '"_ci[', { desc = "Change in brackets (no yank)" })
vim.keymap.set("n", "ci]", '"_ci]', { desc = "Change in brackets (no yank)" })

-- Delete in without yanking
vim.keymap.set("n", "diw", '"_diw', { desc = "Delete in word (no yank)" })
vim.keymap.set("n", 'di"', '"_di"', { desc = "Delete in quotes (no yank)" })
vim.keymap.set("n", "di'", "\"_di'", { desc = "Delete in single quotes (no yank)" })
vim.keymap.set("n", "di(", '"_di(', { desc = "Delete in parentheses (no yank)" })
vim.keymap.set("n", "di{", '"_di{', { desc = "Delete in braces (no yank)" })
vim.keymap.set("n", "di[", '"_di[', { desc = "Delete in brackets (no yank)" })

vim.keymap.set("v", "c", '"_c')

vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>bd", ":bdelete!<CR>", opts)
-- vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", opts)
