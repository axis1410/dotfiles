-- return {
-- 	"akinsho/bufferline.nvim",
-- 	dependencies = {
-- 		"moll/vim-bbye",
-- 		"nvim-tree/nvim-web-devicons",
-- 	},
-- 	config = function()
-- 		local bufferline = require("bufferline")
--
-- 		bufferline.setup({
-- 			options = {
-- 				mode = "buffers",
-- 				-- separator_style = "slant",
-- 				diagnostics = "nvim_lsp",
-- 				color_icons = true,
-- 			},
-- 		})
-- 	end,
-- }

return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers", -- or "tabs"
				numbers = "ordinal", -- or "buffer_id" | "none"
				close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
				right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
				left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
				middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
				indicator = {
					style = "icon",
					icon = "▎",
				},
				buffer_close_icon = "",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = false,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				persist_buffer_sort = true,
				separator_style = "slant", -- "slant" | "thick" | "thin" | { 'any', 'any' }
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				sort_by = "id",
				color_icons = true,
			},
			highlights = require("catppuccin.groups.integrations.bufferline").get(), -- if you use catppuccin
		})
	end,
}
