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
				cmdline = {
					enabled = true,
					view = "cmdline",
				},
				messages = {
					enabled = true,
				},
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				views = {
					mini = {
						position = {
							row = -2,
							col = "100%",
						},
					},
				},
				-- This is the key section that needs to be properly configured
				keys = {
					enabled = true,
					view = "popup",
					opts = { border = { style = "rounded" } },
					-- Try adding these specific configurations:
					prefix = "🔑 ", -- Add a prefix emoji for visibility
				},
				routes = {
					{
						filter = { event = "msg_show", kind = "", find = "written" },
						opts = { skip = true },
					},
				},
			})
		end,
	},
}
