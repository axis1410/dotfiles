vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }
local map = vim.keymap.set
-- local nomap = vim.keymap.del

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
