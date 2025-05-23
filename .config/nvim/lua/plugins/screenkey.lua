return {
	{
		"tamton-aquib/keys.nvim",
		lazy = false,
		config = function()
			local keys = require("keys")
			keys.setup({})
			keys.toggle()
		end,
	},
}
