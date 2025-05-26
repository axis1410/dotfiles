return {
	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup({})
			vim.keymap.set("n", "<leader>dv", "<cmd>:DiffViewOpen<CR>")
			vim.keymap.set("n", "<leader>dc", "<cmd>:DiffViewClose<CR>")
		end,
	},
}
