vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<C-f>", "<C-f>zz", opts)
vim.keymap.set("n", "<C-b>", "<C-b>zz", opts)
vim.keymap.set("n", "}", "}zz", opts)
vim.keymap.set("n", "{", "{zz", opts)

vim.keymap.set("n", "<leader>y", [["+y]], { desc = "yank to system clipboard" })
vim.keymap.set("n", "<leader>sa", "ggVG", { desc = "Select All" })

vim.keymap.set("n", "dd", [["_dd]])

vim.keymap.set("i", "jj", "<Esc>")

local objects = { "w", '"', "'", "`", ")", "]", "}", ">", "b", "B", "}", "]", ")", ">", '"' }
for _, obj in ipairs(objects) do
	vim.keymap.set("n", "ci" .. obj, '"_ci' .. obj, { noremap = true, silent = true })
end

local inside_objects = { "w", '"', "'", "`", ")", "]", "}", ">", "b", "B" }
for _, obj in ipairs(inside_objects) do
	vim.keymap.set("n", "di" .. obj, '"_di' .. obj, { noremap = true, silent = true })
end

vim.keymap.set("n", "d", '"_d', { noremap = true })
vim.keymap.set("n", "D", '"_D', { noremap = true })
vim.keymap.set("n", "x", '"_x', { noremap = true })
vim.keymap.set("n", "X", '"_X', { noremap = true })
vim.keymap.set("v", "d", '"_d', { noremap = true })
vim.keymap.set("v", "D", '"_D', { noremap = true })
vim.keymap.set("v", "x", '"_x', { noremap = true })
vim.keymap.set("v", "X", '"_X', { noremap = true })

vim.keymap.set("n", "<leader>d", "d", { noremap = true, desc = "Cut (delete to clipboard)" })
vim.keymap.set("v", "<leader>d", "d", { noremap = true, desc = "Cut (delete to clipboard)" })
