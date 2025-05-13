return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},

		config = function()
			require("noice").setup({
				-- Reduce animation time for faster perceived speed
				messages = {
					-- Show fewer messages
					view = "notify",
					view_error = "notify",
					view_warn = "notify",
					view_history = "messages",
					view_search = "virtualtext",
				},
				-- Optimize LSP progress
				lsp = {
					-- Override markdown rendering so that cmp and other plugins use Treesitter
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
					progress = {
						enabled = true,
						-- Throttle progress updates to reduce overhead
						throttle = 1000 / 30, -- 30fps
					},
					-- Hide LSP signature help as it's handled by cmp-nvim-lsp-signature-help
					signature = {
						enabled = false,
					},
					hover = {
						enabled = true,
					},
				},
				-- Improve presets
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = true, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
				-- Configure notify integration for faster notifications
				notify = {
					-- Show notify messages in noice
					enabled = true,
					-- Display notifications in a transparent floating window
					view = "notify",
					-- Reduce animation time for notifications
					opts = {
						replace = true,
						stages = "fade", 
						timeout = 3000, -- 3 seconds instead of default 5
						fps = 60, -- Smoother animation
						top_down = true,
						max_width = 80,
						max_height = 10,
						render = "minimal",
					},
				},
				views = {
					cmdline_popup = {
						border = {
							style = "none",
							padding = { 1, 1 },
						},
						filter_options = {},
						win_options = {
							winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
						},
					},
					-- Center popups with reduced animation time
					popupmenu = {
						relative = "editor",
						position = { row = 8, col = "50%" },
						size = {
							width = 60,
							height = 10,
						},
						border = {
							style = "rounded",
							padding = { 0, 1 },
						},
						win_options = {
							winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
						},
					},
					-- Make notifications faster with minimal formatting
					notify = {
						replace = true,
						merge = true,
					},
				},
				routes = {
					-- Skip displaying certain messages
					{
						filter = {
							event = "msg_show",
							kind = "",
							find = "written",
						},
						opts = { skip = true },
					},
					{
						filter = {
							event = "msg_show",
							kind = "search_count",
						},
						opts = { skip = true },
					},
				},
				-- Enable noice by default
				enabled = true,
				-- Control performance settings
				performance = {
					throttle = 1000 / 60, -- Render at 60fps max
					max_render_fps = 60,
					max_notifications = 5,
				},
			})
			
			-- Configure nvim-notify for speed
			require("notify").setup({
				stages = "fade",
				timeout = 3000,
				max_width = 80,
				render = "minimal",
				fps = 60,
				background_colour = "#000000",
				icons = {
					ERROR = "",
					WARN = "",
					INFO = "",
					DEBUG = "",
					TRACE = "✎",
				},
			})
		end,
	},
}
