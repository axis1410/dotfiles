-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

-- save file without auto-formatting
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

vim.keymap.set("n", "j", "jzz", opts)
vim.keymap.set("n", "k", "kzz", opts)

vim.keymap.set("n", "<C-f>", "<C-f>zz", opts)
vim.keymap.set("n", "<C-b>", "<C-b>zz", opts)

vim.keymap.set("n", "}", "}zz", opts)
vim.keymap.set("n", "{", "{zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", opts) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Buffer keymaps
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { noremap = true, silent = true })

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Lazy
vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { desc = "Open Lazy", silent = true })

-- System clipboard integration
vim.keymap.set("n", "<leader>y", [["+y]], { desc = "yank to system clipboard" })

-- Delete operations without yanking
vim.keymap.set("n", "<leader>dd", [["_dd]], { desc = "delete line without yanking" }) -- Changed from 'dd' to '<leader>dd' to preserve default 'dd'
vim.keymap.set("v", "<leader>d", [["_d]], { desc = "delete selection without yanking" }) -- Changed from 'dd' to '<leader>d' in visual mode
vim.keymap.set("n", "<leader>dw", '"_diw', { desc = "delete inner word without yanking" }) -- Changed from 'diw' to '<leader>dw'

vim.keymap.set("n", "ciw", '"_ciw', { noremap = true })
vim.keymap.set("n", "diw", '"_diw', { noremap = true })

-- Delete all lines without yanking
vim.keymap.set("n", "<leader>da", 'ggVG"_d', { desc = "Delete entire file's code without yanking", noremap = true })

-- Move selected lines up/down

-- Move selected lines up/down
vim.keymap.set("v", "J", function()
	-- Get the current visual selection boundaries
	local start_line = vim.fn.line("'<")
	local end_line = vim.fn.line("'>")

	if start_line ~= 0 and end_line ~= 0 then
		vim.cmd(string.format("'<,'>move '>+1"))
		-- Reselect the moved lines
		vim.cmd("normal! gv")
	end
end, { desc = "move selected lines down", silent = true })

vim.keymap.set("v", "K", function()
	-- Get the current visual selection boundaries
	local start_line = vim.fn.line("'<")
	local end_line = vim.fn.line("'>")

	if start_line ~= 0 and end_line ~= 0 then
		vim.cmd(string.format("'<,'>move '<-2"))
		-- Reselect the moved lines
		vim.cmd("normal! gv")
	end
end, { desc = "move selected lines up", silent = true })

-- Select all text
vim.keymap.set("n", "<leader>sa", "ggVG", { desc = "select all text" })

-- Disable 's' from entering insert mode (since we use 's' for something else)
-- vim.keymap.set("n", "s", "<Nop>", opts)

-- Surround functionality
-- Usage:
-- Visual mode: select text then press S" or S) or S} etc
-- Normal mode: ys<motion><char> e.g. ysiw" to surround word with quotes
vim.keymap.set("v", 'S"', '<esc>`>a"<esc>`<i"<esc>', { desc = 'surround with "' })
vim.keymap.set("v", "S'", "<esc>`>a'<esc>`<i'<esc>", { desc = "surround with '" })
vim.keymap.set("v", "S`", "<esc>`>a`<esc>`<i`<esc>", { desc = "surround with `" })
vim.keymap.set("v", "S)", "<esc>`>a)<esc>`<i(<esc>", { desc = "surround with ()" })
vim.keymap.set("v", "S}", "<esc>`>a}<esc>`<i{<esc>", { desc = "surround with {}" })
vim.keymap.set("v", "S]", "<esc>`>a]<esc>`<i[<esc>", { desc = "surround with []" })
vim.keymap.set("v", "S>", "<esc>`>a><esc>`<i<<esc>", { desc = "surround with <>" })

-- Normal mode surround word
vim.keymap.set("n", 'ys"', 'ciw"<C-r>""<esc>', { desc = 'surround word with "' })
vim.keymap.set("n", "ys'", "ciw'<C-r>\"'<esc>", { desc = "surround word with '" })
vim.keymap.set("n", "ys`", 'ciw`<C-r>"`<esc>', { desc = "surround word with `" })
vim.keymap.set("n", "ys)", 'ciw(<C-r>")<esc>', { desc = "surround word with ()" })
vim.keymap.set("n", "ys}", 'ciw{<C-r>"}<esc>', { desc = "surround word with {}" })
vim.keymap.set("n", "ys]", 'ciw[<C-r>"]<esc>', { desc = "surround word with []" })
vim.keymap.set("n", "ys>", 'ciw<<C-r>">><esc>', { desc = "surround word with <>" })

-- Delete surroundings
vim.keymap.set("n", 'ds"', 'di"hPl2x', { desc = 'delete surrounding "' })
vim.keymap.set("n", "ds'", "di'hPl2x", { desc = "delete surrounding '" })
vim.keymap.set("n", "ds`", "di`hPl2x", { desc = "delete surrounding `" })
vim.keymap.set("n", "ds)", "di)hPl2x", { desc = "delete surrounding ()" })
vim.keymap.set("n", "ds}", "di}hPl2x", { desc = "delete surrounding {}" })
vim.keymap.set("n", "ds]", "di]hPl2x", { desc = "delete surrounding []" })
vim.keymap.set("n", "ds>", "di>hPl2x", { desc = "delete surrounding <>" })

-- Toggle Transparency
vim.keymap.set(
	"n",
	"<leader>tt",
	":TransparentToggle<CR>",
	{ desc = "Toggle Transparency", noremap = true, silent = true }
)

-- [S]earch and [R]eplace
vim.keymap.set("n", "<leader>sr", '<cmd>lua require("spectre").open()<CR>', {
	desc = "Open Spectre for search and replace",
})
vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})
vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file",
})

-- Map leader+dv to :DiffviewOpen
vim.keymap.set("n", "<leader>dv", ":DiffviewOpen<CR>", { noremap = true, silent = true })

-- Map leader+dc to :DiffviewClose
vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>", { noremap = true, silent = true })
