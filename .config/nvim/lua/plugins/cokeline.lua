return {
	{
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for v0.4.0+
			"nvim-tree/nvim-web-devicons", -- If you want devicons
			"stevearc/resession.nvim", -- Optional, for persistent history
		},
		config = function()
			local cokeline = require("cokeline")

			cokeline.setup({
				rendering = {
					max_buffer_width = 24,
				},
			})
		end,
	},
}
