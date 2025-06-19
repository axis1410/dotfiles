return {
	"tamton-aquib/staline.nvim",
	config = function()
		require("stabline").setup({
			font_active = "none",
			stab_start = "  %#Identifier#  ",
			stab_bg = "none",
			stab_left = "",
			inactive_fg = "none",
			fg = "#95c561",
		})
	end,
}
