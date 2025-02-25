return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			explorer = { enabled = true },
			indent = { enabled = true },
			keys = {
				{
					"<leader><space>",
					function()
						Snacks.picker.smart()
					end,
					desc = "Smart Find Files",
				},
				{
					"<leader>gb",
					function()
						Snacks.picker.git_branches()
					end,
					desc = "Git Branches",
				},
				{
					"gd",
					function()
						Snacks.picker.lsp_definitions()
					end,
					desc = "Goto Definition",
				},
			},
		},
	},
}
