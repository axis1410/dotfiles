return {
	"DreamMaoMao/yazi.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- Ensure the plugin is loaded before being used
	lazy = false,
	priority = 100,
	keys = {
		{
			"<leader>e",
			"<cmd>Yazi<CR>",
			desc = "Open Yazi file manager",
		},
	},
}

