return {
	"chikko80/error-lens.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("error-lens").setup({
			enabled = true,

			virtual_text = {
				enabled = true,
				text = " ",
			},

			line_highlight = true,

			number_highlight = true,

			show_in_insert_mode = false,

			only_current_line = false,

			highlights = {
				error = "ErrorLensError",
				warning = "ErrorLensWarning",
				info = "ErrorLensInfo",
				hint = "ErrorLensHint",
			},
		})

		vim.cmd([[
            highlight ErrorLensError guifg=#F44747 gui=bold
            highlight ErrorLensWarning guifg=#FF8800 gui=bold
            highlight ErrorLensInfo guifg=#4FC1FF gui=bold
            highlight ErrorLensHint guifg=#10B981 gui=bold
        ]])
	end,
}
