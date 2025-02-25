return {
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
		opts = {
			duration_multiplire = 5,
			performance_mode = true,
			easing = "circular",
		},
	},
}
