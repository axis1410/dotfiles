return {
	"stevearc/oil.nvim",
	dependencies = {
		{ "nvim-mini/mini.icons", opts = {} },
	},
	lazy = false,
	config = function()
		local oil = require("oil")

		oil.setup({

			view_options = {
				show_hidden = true,
				is_hidden_file = function(name, bufnr)
					local m = name:match("^%.")
					return m ~= nil
				end,
				is_always_hidden = function(name, bufnr)
					return false
				end,
				natural_order = "fast",
				case_insensitive = false,
				sort = {
					{ "type", "asc" },
					{ "name", "asc" },
				},
			},

			preview_win = {
				update_on_cursor_moved = true,
				preview_method = "fast_scratch",
				disable_preview = function(_)
					return false
				end,
			},

			watch_for_changes = true,

			default_file_explorer = true,
			constrain_cursor = "editable",

			float = {
				preview_split = "right",
			},
		})

		vim.keymap.set("n", "<leader>e", function()
			oil.open()
		end, { desc = "Open Oil file explorer" })
	end,
}
