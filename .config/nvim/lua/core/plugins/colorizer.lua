return {
	{
		"catgoose/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			filetypes = { "*" },
			user_default_options = {
				RGB = true,
				RRGGBB = true,
				RRGGBBAA = true,
				AARRGGBB = true,
				names = false,
				rgb_fn = true,
				hsl_fn = true,
				css = true,
				css_fn = true,
				tailwind = "both",
				tailwind_opts = {
					update_names = true,
				},
				mode = "virtualtext",
				virtualtext = "■",
				virtualtext_inline = "after",
				virtualtext_mode = "foreground",
				always_update = true,
			},
		},
	},
}
