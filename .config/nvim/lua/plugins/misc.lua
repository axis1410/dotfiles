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
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"sindrets/diffview.nvim",
	},
	{ "nvim-tree/nvim-web-devicons", opts = {} },
}
