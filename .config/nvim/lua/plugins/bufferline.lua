return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"moll/vim-bbye",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				mode = "buffers",
				-- separator_style = "slant",
				diagnostics = "nvim_lsp",
				color_icons = true,
			},
		})
	end,
}
