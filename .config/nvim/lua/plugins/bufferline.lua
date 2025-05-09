return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				mode = "buffers",
				numbers = "ordinal",
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,
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
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or " ")
						s = s .. sym .. n
					end
					return s
				end,
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
				separator_style = "slant",
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				sort_by = "insert_after_current",
				color_icons = true,

				buffer_pickers = {
					letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
				},

				custom_areas = {
					right = function()
						local result = {}
						local pinned = 0
						for _, buf in ipairs(vim.t.bufs or {}) do
							if vim.fn.getbufvar(buf, "pinned", 0) == 1 then
								pinned = pinned + 1
							end
						end
						if pinned > 0 then
							table.insert(result, { text = " " .. pinned, fg = "#e0af68" })
						end
						return result
					end,
				},
			},
			highlights = (function()
				local ok, catppuccin = pcall(require, "catppuccin.groups.integrations.bufferline")
				if ok then
					return catppuccin.get()
				else
					return {}
				end
			end)(),
		})
	end,
}
