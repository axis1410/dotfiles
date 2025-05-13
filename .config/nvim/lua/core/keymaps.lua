vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

vim.keymap.set("n", "x", '"_x', opts)

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

vim.keymap.set("n", "j", "jzz", opts)
vim.keymap.set("n", "k", "kzz", opts)

vim.keymap.set("n", "<C-f>", "<C-f>zz", opts)
vim.keymap.set("n", "<C-b>", "<C-b>zz", opts)

vim.keymap.set("n", "}", "}zz", opts)
vim.keymap.set("n", "{", "{zz", opts)

vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
-- vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
-- vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
-- vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", opts)
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts)

vim.keymap.set("n", "<leader>bd", ":bd<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>v", "<C-w>v", opts)
vim.keymap.set("n", "<leader>h", "<C-w>s", opts)
vim.keymap.set("n", "<leader>se", "<C-w>=", opts)
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts)

vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts)
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts)
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts)
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts)

vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("v", "p", '"_dP', opts)

vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous diagnostic message" })

vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next diagnostic message" })

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { desc = "Open Lazy", silent = true })

vim.keymap.set("n", "<leader>y", [["+y]], { desc = "yank to system clipboard" })

vim.keymap.set("n", "dd", [["_dd]])
vim.keymap.set("n", "<leader>dd", [["_dd]], { desc = "delete line without yanking" })
vim.keymap.set("v", "<leader>d", [["_d]], { desc = "delete selection without yanking" })
vim.keymap.set("n", "<leader>dw", '"_diw', { desc = "delete inner word without yanking" })

vim.keymap.set("n", "ciw", '"_ciw', { noremap = true })
vim.keymap.set("n", "diw", '"_diw', { noremap = true })

vim.keymap.set("n", "<leader>da", 'ggVG"_d', { desc = "Delete entire file's code without yanking", noremap = true })
vim.keymap.set("n", "<leader>sa", "ggVG", { desc = "select all text" })

vim.keymap.set("n", "<leader>dv", ":DiffviewOpen<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "diagnostics (Trouble)" })

local objects = { "w", '"', "'", "`", ")", "]", "}", ">", "b", "B", "}", "]", ")", ">", '"' }
for _, obj in ipairs(objects) do
	vim.keymap.set("n", "ci" .. obj, '"_ci' .. obj, { noremap = true, silent = true })
end

local inside_objects = { "w", '"', "'", "`", ")", "]", "}", ">", "b", "B" }
for _, obj in ipairs(inside_objects) do
	vim.keymap.set("n", "di" .. obj, '"_di' .. obj, { noremap = true, silent = true })
end

vim.keymap.set("n", "c", '"_c', { noremap = true })
vim.keymap.set("v", "c", '"_c', { noremap = true })

vim.keymap.set("n", "d", '"_d', { noremap = true })
vim.keymap.set("v", "d", '"_d', { noremap = true })

vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })

vim.keymap.set({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })

vim.keymap.set("o", "r", function()
	require("flash").remote()
end, { desc = "Remote Flash" })

vim.keymap.set({ "o", "x" }, "R", function()
	require("flash").treesitter_search()
end, { desc = "Treesitter Search" })

vim.keymap.set("c", "<C-s>", function()
	require("flash").toggle()
end, { desc = "Toggle Flash Search" })

vim.keymap.set("n", "<leader>cd", function()
	vim.diagnostic.open_float(0, { scope = "line" })
end, { desc = "Open Diagnostics" })
