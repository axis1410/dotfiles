return {
	{

		"christoomey/vim-tmux-navigator",
	},
	{

		"tpope/vim-sleuth",
	},
	{

		"tpope/vim-fugitive",
	},
	{

		"tpope/vim-rhubarb",
	},
	{

		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({
				render = "virtual",
				enable_tailwind = true,
			})
		end,
	},
	-- {
	-- 	"norcalli/nvim-colorizer.lua",
	-- 	config = function()
	-- 		require("colorizer").setup()
	-- 	end,
	-- },
	{
		"sindrets/diffview.nvim",
	},
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		config = function()
			require("todo-comments").setup({})
			vim.keymap.set("n", "<leader>td", ":TodoFzfLua keywords=TODO,FIX<CR>", { noremap = true })
		end,
	},
	{
		"refractalize/oil-git-status.nvim",

		dependencies = {
			"stevearc/oil.nvim",
		},

		config = true,
	},
}
