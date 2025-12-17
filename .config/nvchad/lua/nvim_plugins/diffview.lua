return {
	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup({})
			vim.keymap.set("n", "<leader>dv", "<cmd>:DiffviewOpen<CR>")
			vim.keymap.set("n", "<leader>dc", "<cmd>:DiffviewClose<CR>")
		end,
	},
}
