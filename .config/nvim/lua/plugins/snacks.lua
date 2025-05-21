return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		-- NOTE: Options
		opts = {
			indent = {},
			-- explorer = {
			-- 	enabled = true,
			-- 	layout = {
			-- 		cycle = true,
			-- 	},
			-- 	filters = { dotfiles = false, hide_gitignored = true },
			-- },
			input = {
				enabled = true,
				win = {
					relative = "cursor",
					backdrop = true,
				},
			},
			-- quickfile = {
			-- 	enabled = true,
			-- 	exclude = { "latex" },
			-- },
			-- -- HACK: read picker docs @ https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
			-- picker = {
			-- 	enabled = true,
			-- 	sources = {
			-- 		files = {
			-- 			hidden = true,
			-- 			follow = true,
			-- 		},
			-- 	},
			-- 	matchers = {
			-- 		frecency = true,
			-- 		cwd_bonus = false,
			-- 	},
			-- 	formatters = {
			-- 		file = {
			-- 			filename_first = false,
			-- 			filename_only = false,
			-- 			icon_width = 2,
			-- 		},
			-- 	},
			-- 	layout = {
			-- 		-- presets options : "default" , "ivy" , "ivy-split" , "telescope" , "vscode", "select" , "sidebar"
			-- 		-- override picker layout in keymaps function as a param below
			-- 		preset = "telescope",
			-- 		cycle = false,
			-- 	},
			-- 	layouts = {
			-- 		select = {
			-- 			preview = false,
			-- 			layout = {
			-- 				backdrop = true,
			-- 				width = 0.6,
			-- 				min_width = 80,
			-- 				height = 0.4,
			-- 				min_height = 10,
			-- 				box = "vertical",
			-- 				border = "rounded",
			-- 				title = "{title}",
			-- 				title_pos = "center",
			-- 				{ win = "input", height = 1, border = "bottom" },
			-- 				{ win = "list", border = "none" },
			-- 				{ win = "preview", title = "{preview}", width = 0.6, height = 0.4, border = "top" },
			-- 			},
			-- 		},
			-- 		telescope = {
			-- 			reverse = false, -- set to false for search bar to be on top
			-- 			layout = {
			-- 				box = "horizontal",
			-- 				backdrop = true,
			-- 				width = 0.8,
			-- 				height = 0.9,
			-- 				border = "none",
			-- 				{
			-- 					box = "vertical",
			-- 					{ win = "list", title = " Results ", title_pos = "center", border = "rounded" },
			-- 					{
			-- 						win = "input",
			-- 						height = 1,
			-- 						border = "rounded",
			-- 						title = "{title} {live} {flags}",
			-- 						title_pos = "center",
			-- 					},
			-- 				},
			-- 				{
			-- 					win = "preview",
			-- 					title = "{preview:Preview}",
			-- 					width = 0.50,
			-- 					border = "rounded",
			-- 					title_pos = "center",
			-- 				},
			-- 			},
			-- 		},
			-- 		vscode = {
			-- 			preview = false,
			-- 			layout = {
			-- 				backdrop = true,
			-- 				row = 1,
			-- 				width = 0.7,
			-- 				min_width = 80,
			-- 				height = 0.4,
			-- 				border = "none",
			-- 				box = "vertical",
			-- 				{
			-- 					win = "input",
			-- 					height = 1,
			-- 					border = "rounded",
			-- 					title = "{title} {live} {flags}",
			-- 					title_pos = "center",
			-- 				},
			-- 				{ win = "list", border = "hpad" },
			-- 				{ win = "preview", title = "{preview}", border = "rounded" },
			-- 			},
			-- 		},
			-- 		ivy = {
			-- 			layout = {
			-- 				box = "vertical",
			-- 				backdrop = false,
			-- 				width = 0,
			-- 				height = 0.4,
			-- 				position = "bottom",
			-- 				border = "top",
			-- 				title = " {title} {live} {flags}",
			-- 				title_pos = "left",
			-- 				{ win = "input", height = 1, border = "bottom" },
			-- 				{
			-- 					box = "horizontal",
			-- 					{ win = "list", border = "none" },
			-- 					{ win = "preview", title = "{preview}", width = 0.5, border = "left" },
			-- 				},
			-- 			},
			-- 		},
			-- 	},
			-- },
			image = {
				enabled = true,
				doc = {
					float = false,
					inline = true, -- false if you want show image on cursor hover
					max_width = 50,
					max_height = 30,
					wo = {
						wrap = true,
					},
				},
				convert = {
					notify = true,
				},
				img_dirs = {
					"img",
					"images",
					"assets",
					"static",
					"public",
					"media",
					"attachments",
					"sethVault",
					"~/Library",
					"~/Downloads",
				},
			},

			-- dashboard = {
			-- 	enabled = true,
			-- 	sections = {
			-- 		{ section = "header" },
			-- 		-- {
			-- 		-- 	pane = 2,
			-- 		-- 	section = "terminal",
			-- 		-- 	cmd = "colorscript -e square",
			-- 		-- 	height = 5,
			-- 		-- 	padding = 1,
			-- 		-- },
			-- 		{ section = "keys", gap = 1, padding = 1 },
			-- 		{
			-- 			pane = 2,
			-- 			icon = " ",
			-- 			title = "Recent Files",
			-- 			section = "recent_files",
			-- 			indent = 2,
			-- 			padding = 1,
			-- 		},
			-- 		{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
			-- 		{
			-- 			pane = 2,
			-- 			icon = " ",
			-- 			title = "Git Status",
			-- 			section = "terminal",
			-- 			enabled = function()
			-- 				return Snacks.git.get_root() ~= nil
			-- 			end,
			-- 			cmd = "git status --short --branch --renames",
			-- 			height = 5,
			-- 			padding = 1,
			-- 			ttl = 5 * 60,
			-- 			indent = 3,
			-- 		},
			-- 		{ section = "startup" },
			-- 	},
			-- },
			--
			-- dashboard = {
			-- 	enabled = true,
			-- 	sections = {
			-- 		{ section = "header" },
			-- 		{ section = "keys", gap = 1, padding = 1 },
			-- 		{ section = "startup" },
			-- 		{
			-- 			section = "terminal",
			-- 			cmd = "ascii-image-converter ~/.config/nvim/images/slayer_bw.jpg -C -c",
			-- 			random = 10,
			-- 			pane = 2,
			-- 			indent = 4,
			-- 			height = 30,
			-- 		},
			-- 	},
			-- },

			dashboard = {
				enabled = true,
				sections = {
					{
						title = "🔍  Recent Files",
						icon = "",
						section = "recent_files",
						max_items = 6,
						padding = 1,
						with_icon = true,
					},
					{
						title = "📂  Projects",
						icon = "",
						section = "projects",
						max_items = 4,
						padding = 1,
						with_icon = true,
					},
					{
						pane = 2,
						title = "⚡ Quick Actions",
						section = "keys",
						max_items = 5,
						padding = 1,
						with_icon = true,
						keys = {
							{ key = "ff", icon = "🔎", desc = "Find Files", action = "Telescope find_files" },
							{ key = "fg", icon = "📝", desc = "Live Grep", action = "Telescope live_grep" },
							{ key = "e", icon = "🌲", desc = "File Explorer", action = "Yazi" },
							{ key = "gg", icon = "📊", desc = "Git Status", action = "LazyGit" },
							{ key = "qq", icon = "🚪", desc = "Quit Neovim", action = "qa" },
						},
					},
					{
						pane = 2,
						title = "📊  Git Status",
						section = "terminal",
						enabled = function()
							return require("snacks").git and require("snacks").git.get_root() ~= nil
						end,
						cmd = "git status --short --branch",
						height = 6,
						padding = 1,
						ttl = 5 * 60,
					},
					{ section = "startup" },
				},
				options = {
					layout = {
						size = { width = 0.8, height = 0.8 },
						border = "rounded",
						backdrop = true,
					},
				},
			},
		},
		-- NOTE: Keymaps
		keys = {
			-- 	{
			-- 		"<leader>lg",
			-- 		function()
			-- 			require("snacks").lazygit()
			-- 		end,
			-- 		desc = "Lazygit",
			-- 	},
			-- 	{
			-- 		"<leader>gl",
			-- 		function()
			-- 			require("snacks").lazygit.log()
			-- 		end,
			-- 		desc = "Lazygit Logs",
			-- 	},
			-- {
			-- 	"<leader>e",
			-- 	function()
			-- 		require("snacks").explorer({ hidden = true })
			-- 	end,
			-- 	desc = "Open Snacks Explorer",
			-- },
			-- 	{
			-- 		"<leader>rN",
			-- 		function()
			-- 			require("snacks").rename.rename_file()
			-- 		end,
			-- 		desc = "Fast Rename Current File",
			-- 	},
			-- 	{
			-- 		"<leader>dB",
			-- 		function()
			-- 			require("snacks").bufdelete()
			-- 		end,
			-- 		desc = "Delete or Close Buffer  (Confirm)",
			-- 	},
			--
			-- 	-- Snacks Picker
			--
			-- 	-- {
			-- 	-- 	"<leader>pf",
			-- 	-- 	function()
			-- 	-- 		require("snacks").picker.files({
			-- 	-- 			finder = "files",
			-- 	-- 			format = "file",
			-- 	-- 			show_empty = true,
			-- 	-- 			hidden = true,
			-- 	-- 			ignored = false,
			-- 	-- 			follow = false,
			-- 	-- 			supports_live = true,
			-- 	-- 		})
			-- 	-- 	end,
			-- 	-- 	desc = "Find Files (Snacks Picker)",
			-- 	-- },
			--
			-- 	{
			-- 		"<leader>pc",
			-- 		function()
			-- 			require("snacks").picker.files({ cwd = vim.fn.stdpath("config") })
			-- 		end,
			-- 		desc = "Find Config File",
			-- 	},
			--
			-- 	-- {
			-- 	-- 	"<leader>ps",
			-- 	-- 	function()
			-- 	-- 		require("snacks").picker.grep({ layout = "telescope" })
			-- 	-- 	end,
			-- 	-- 	desc = "Grep word",
			-- 	-- },
			--
			-- 	{
			-- 		"<leader>pws",
			-- 		function()
			-- 			require("snacks").picker.grep_word()
			-- 		end,
			-- 		desc = "Search Visual selection or Word",
			-- 		mode = { "n", "x" },
			-- 	},
			-- 	{
			-- 		"<leader>pk",
			-- 		function()
			-- 			require("snacks").picker.keymaps({ layout = "ivy" })
			-- 		end,
			-- 		desc = "Search Keymaps (Snacks Picker)",
			-- 	},
			--
			-- 	-- Git Stuff
			-- 	{
			-- 		"<leader>gbr",
			-- 		function()
			-- 			require("snacks").picker.git_branches({ layout = "select" })
			-- 		end,
			-- 		desc = "Pick and Switch Git Branches",
			-- 	},
			--
			-- 	-- Other Utils
			-- 	-- {
			-- 	-- 	"<leader>th",
			-- 	-- 	function()
			-- 	-- 		require("snacks").picker.colorschemes({ layout = "telescope" })
			-- 	-- 	end,
			-- 	-- 	desc = "Pick Color Schemes",
			-- 	-- },
			-- 	{
			-- 		"<leader>vh",
			-- 		function()
			-- 			require("snacks").picker.help()
			-- 		end,
			-- 		desc = "Help Pages",
			-- 	},
		},
	},
}
