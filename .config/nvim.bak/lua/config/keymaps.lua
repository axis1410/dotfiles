local opts = { noremap = true, silent = true }

-- copies or yank to system clipboard
vim.keymap.set("n", "<leader>y", [["+y]], opts)

-- delete selection or line without yanking
vim.keymap.set("n", "dd", '"_dd', { desc = "delete line without yanking" })
vim.keymap.set("v", "dd", '"_d', { desc = "delete without yanking" })
vim.keymap.set("n", "diw", '"_diw', { desc = "delete inner word without yanking" })

-- delete all lines without yanking
vim.keymap.set("n", "<leader>d", 'gg0vg$"_d', { desc = "delete entire file's code without yanking" })

-- move selected lines up/down
vim.keymap.set("v", "j", ":m '>+1<cr>gv=gv", { desc = "move selected lines down" })
vim.keymap.set("v", "k", ":m '<-2<cr>gv=gv", { desc = "move selected lines up" })

-- cursor center when navigating
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

-- select all text (shorter alternative to ggVG)
vim.keymap.set("n", "<leader>sa", "ggVG", { desc = "select all text" })
