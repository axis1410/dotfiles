-- return {
-- 	"akinsho/bufferline.nvim",
-- 	dependencies = {
-- 		"moll/vim-bbye",
-- 		"nvim-tree/nvim-web-devicons",
-- 	},
-- 	config = function()
-- 		require("bufferline").setup({
-- 			options = {
-- 				mode = "buffers",
-- 				themable = true,
-- 				numbers = "none",
-- 				close_command = "Bdelete! %d",
-- 				buffer_close_icon = "✗",
-- 				close_icon = "✗",
-- 				path_components = 1,
-- 				modified_icon = "●",
-- 				left_trunc_marker = "",
-- 				right_trunc_marker = "",
-- 				max_name_length = 30,
-- 				max_prefix_length = 30,
-- 				tab_size = 21,
-- 				diagnostics = false,
-- 				diagnostics_update_in_insert = false,
-- 				color_icons = true,
-- 				show_buffer_icons = true,
-- 				show_buffer_close_icons = true,
-- 				show_close_icon = true,
-- 				persist_buffer_sort = true,
-- 				separator_style = { "│", "│" },
-- 				enforce_regular_tabs = true,
-- 				always_show_bufferline = true,
-- 				show_tab_indicators = false,
-- 				indicator = {
--
-- 					style = "none",
-- 				},
-- 				icon_pinned = "󰐃",
-- 				minimum_padding = 1,
-- 				maximum_padding = 5,
-- 				maximum_length = 15,
-- 				sort_by = "insert_at_end",
-- 			},
-- 			highlights = {
-- 				separator = {
-- 					fg = "#434C5E",
-- 				},
-- 				buffer_selected = {
-- 					bold = true,
-- 					italic = false,
-- 				},
-- 			},
-- 		})
-- 	end,
-- }

return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"moll/vim-bbye",
		"nvim-tree/nvim-web-devicons",
		"EdenEast/nightfox.nvim",
	},
	config = function()
		-- Fallback palette if nightfox can't be loaded
		local palette = {
			bg = "#161616",
			fg = "#f2f4f8",
			selection = "#2a2a2a",
			comment = "#6e6f70",
			red = "#ee5396",
			orange = "#3ddbd9",
			yellow = "#08bdba",
			green = "#25be6a",
			blue = "#78a9ff",
			purple = "#be95ff",
		}

		-- Try to get carbonfox colors from nightfox
		local ok, nightfox = pcall(require, "nightfox.palette")
		if ok and nightfox.carbonfox then
			palette = {
				bg = nightfox.carbonfox.bg0,
				fg = nightfox.carbonfox.fg0,
				selection = nightfox.carbonfox.bg3,
				comment = nightfox.carbonfox.comment,
				red = nightfox.carbonfox.red,
				orange = nightfox.carbonfox.orange,
				yellow = nightfox.carbonfox.yellow,
				green = nightfox.carbonfox.green,
				blue = nightfox.carbonfox.blue,
				purple = nightfox.carbonfox.magenta,
			}
		else
			-- Try alternate method
			ok, nightfox = pcall(require, "nightfox")
			if ok and nightfox.palettes and nightfox.palettes.carbonfox then
				palette = {
					bg = nightfox.palettes.carbonfox.bg0,
					fg = nightfox.palettes.carbonfox.fg0,
					selection = nightfox.palettes.carbonfox.bg3,
					comment = nightfox.palettes.carbonfox.comment,
					red = nightfox.palettes.carbonfox.red,
					orange = nightfox.palettes.carbonfox.orange,
					yellow = nightfox.palettes.carbonfox.yellow,
					green = nightfox.palettes.carbonfox.green,
					blue = nightfox.palettes.carbonfox.blue,
					purple = nightfox.palettes.carbonfox.magenta,
				}
			end
		end

		require("bufferline").setup({
			options = {
				mode = "buffers",
				themable = true,
				numbers = "none",
				close_command = "Bdelete! %d",
				right_mouse_command = "Bdelete! %d",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,
				buffer_close_icon = "󰅖",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 18,
				max_prefix_length = 15,
				tab_size = 18,
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = false,
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "center",
						separator = true,
					},
				},
				color_icons = true,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				separator_style = "slant",
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				sort_by = "insert_after_current",
			},
			highlights = {
				fill = {
					fg = palette.comment,
					bg = palette.bg,
				},
				background = {
					fg = palette.comment,
					bg = palette.bg,
				},
				tab = {
					fg = palette.comment,
					bg = palette.bg,
				},
				tab_selected = {
					fg = palette.fg,
					bg = palette.selection,
				},
				tab_close = {
					fg = palette.red,
					bg = palette.bg,
				},
				close_button = {
					fg = palette.comment,
					bg = palette.bg,
				},
				close_button_visible = {
					fg = palette.fg,
					bg = palette.bg,
				},
				close_button_selected = {
					fg = palette.red,
					bg = palette.selection,
				},
				buffer_visible = {
					fg = palette.fg,
					bg = palette.bg,
				},
				buffer_selected = {
					fg = palette.fg,
					bg = palette.selection,
					bold = true,
					italic = false,
				},
				diagnostic = {
					fg = palette.comment,
					bg = palette.bg,
				},
				diagnostic_visible = {
					fg = palette.comment,
					bg = palette.bg,
				},
				diagnostic_selected = {
					fg = palette.comment,
					bg = palette.selection,
				},
				info = {
					fg = palette.blue,
					bg = palette.bg,
				},
				info_visible = {
					fg = palette.blue,
					bg = palette.bg,
				},
				info_selected = {
					fg = palette.blue,
					bg = palette.selection,
				},
				warning = {
					fg = palette.yellow,
					bg = palette.bg,
				},
				warning_visible = {
					fg = palette.yellow,
					bg = palette.bg,
				},
				warning_selected = {
					fg = palette.yellow,
					bg = palette.selection,
				},
				error = {
					fg = palette.red,
					bg = palette.bg,
				},
				error_visible = {
					fg = palette.red,
					bg = palette.bg,
				},
				error_selected = {
					fg = palette.red,
					bg = palette.selection,
				},
				modified = {
					fg = palette.purple,
					bg = palette.bg,
				},
				modified_visible = {
					fg = palette.purple,
					bg = palette.bg,
				},
				modified_selected = {
					fg = palette.purple,
					bg = palette.selection,
				},
				separator = {
					fg = palette.bg,
					bg = palette.bg,
				},
				separator_visible = {
					fg = palette.bg,
					bg = palette.bg,
				},
				separator_selected = {
					fg = palette.bg,
					bg = palette.selection,
				},
				indicator_selected = {
					fg = palette.blue,
					bg = palette.selection,
				},
				pick = {
					fg = palette.green,
					bg = palette.bg,
					bold = true,
				},
				pick_visible = {
					fg = palette.green,
					bg = palette.bg,
					bold = true,
				},
				pick_selected = {
					fg = palette.green,
					bg = palette.selection,
					bold = true,
				},
			},
		})
	end,
}
