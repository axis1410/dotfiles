return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"moll/vim-bbye",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				themable = true,
				numbers = "none",
				close_command = "Bdelete! %d",
				buffer_close_icon = "✗",
				close_icon = "✗",
				path_components = 1,
				modified_icon = "●",
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 30,
				max_prefix_length = 30,
				tab_size = 18,
				diagnostics = false,
				diagnostics_update_in_insert = false,
				color_icons = true,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				persist_buffer_sort = true,
				separator_style = { "│", "│" },
				enforce_regular_tabs = true,
				always_show_bufferline = true,
				show_tab_indicators = false,
				indicator = {
					style = "none",
					-- style = "icon",
					-- icon = "▎",
				},
				icon_pinned = "󰐃",
				padding = 1,
				minimum_padding = 5,
				maximum_padding = 10,
				maximum_length = 30,
				sort_by = "insert_at_end",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true,
					},
				},
			},
			highlights = {
				fill = {
					fg = { attribute = "fg", highlight = "Normal" },
					bg = { attribute = "bg", highlight = "StatusLineNC" },
				},
				background = {
					fg = { attribute = "fg", highlight = "Normal" },
					bg = { attribute = "bg", highlight = "StatusLine" },
				},
				buffer_visible = {
					fg = { attribute = "fg", highlight = "Normal" },
					bg = { attribute = "bg", highlight = "Normal" },
				},
				buffer_selected = {
					fg = { attribute = "fg", highlight = "Normal" },
					bg = { attribute = "bg", highlight = "Normal" },
					bold = true,
					italic = false,
				},
				separator = {
					fg = { attribute = "bg", highlight = "Normal" },
					bg = { attribute = "bg", highlight = "StatusLine" },
				},
				separator_selected = {
					fg = { attribute = "fg", highlight = "Special" },
					bg = { attribute = "bg", highlight = "Normal" },
				},
				separator_visible = {
					fg = { attribute = "fg", highlight = "Normal" },
					bg = { attribute = "bg", highlight = "StatusLineNC" },
				},
				modified = {
					fg = { attribute = "fg", highlight = "String" },
				},
				modified_selected = {
					fg = { attribute = "fg", highlight = "String" },
				},
				duplicate = {
					fg = { attribute = "fg", highlight = "Comment" },
					italic = true,
				},
			},
		})
	end,
}
