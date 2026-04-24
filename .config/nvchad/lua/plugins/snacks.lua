return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    opts = {
      indent = {
        enabled = true,
      },

      input = {
        enabled = true,
        win = {
          relative = "cursor",
          backdrop = true,
        },
      },

        image = {
          enabled = false,
          doc = {
            float = false,
            inline = false,
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

      picker = {
        enabled = true,
        sources = {
          files = {
            hidden = true,
            follow = true,
          },
        },
        matchers = {
          frecency = true,
          cwd_bonus = false,
        },
        formatters = {
          file = {
            filename_first = false,
            filename_only = false,
            icon_width = 2,
          },
        },
        layout = {
          -- presets options : "default" , "ivy" , "ivy-split" , "telescope" , "vscode", "select" , "sidebar"
          -- override picker layout in keymaps function as a param below
          preset = "select",
          cycle = true,
        },
        layouts = {
          select = {
            preview = false,
            layout = {
              backdrop = true,
              width = 0.6,
              min_width = 80,
              height = 0.4,
              min_height = 10,
              box = "vertical",
              border = "rounded",
              title = "{title}",
              title_pos = "center",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
              { win = "preview", title = "{preview}", width = 0.6, height = 0.4, border = "top" },
            },
          },
          telescope = {
            reverse = false, -- set to false for search bar to be on top
            layout = {
              box = "horizontal",
              backdrop = true,
              width = 0.8,
              height = 0.9,
              border = "none",
              {
                box = "vertical",
                { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
                {
                  win = "input",
                  height = 1,
                  border = "rounded",
                  title = "{title} {live} {flags}",
                  title_pos = "center",
                },
              },
              {
                win = "preview",
                title = "{preview:Preview}",
                width = 0.50,
                border = "rounded",
                title_pos = "center",
              },
            },
          },
          vscode = {
            preview = false,
            layout = {
              backdrop = true,
              row = 1,
              width = 0.7,
              min_width = 80,
              height = 0.4,
              border = "none",
              box = "vertical",
              {
                win = "input",
                height = 1,
                border = "rounded",
                title = "{title} {live} {flags}",
                title_pos = "center",
              },
              { win = "list", border = "hpad" },
              { win = "preview", title = "{preview}", border = "rounded" },
            },
          },
          ivy = {
            layout = {
              box = "vertical",
              backdrop = false,
              width = 0,
              height = 0.4,
              position = "bottom",
              border = "top",
              title = " {title} {live} {flags}",
              title_pos = "left",
              { win = "input", height = 1, border = "bottom" },
              {
                box = "horizontal",
                { win = "list", border = "none" },
                { win = "preview", title = "{preview}", width = 0.5, border = "left" },
              },
            },
          },
        },
      },

      dashboard = {
        enabled = false,

        header = {
          "⠀⠀⠁⠀⠀⠀⠀⠀⠀⡠⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          "⠀⠀⠠⠀⠀⠀⠀⣠⣾⡇⠀⠀⠀⠀⢀⡄⠀⠀⠀⠀⢸⣷⣄⠀⠀⠀⠀⠀⠀⠀",
          "⠀⠀⠀⠀⠀⣠⣾⡏⢸⡇⠀⠀⠀⡀⢸⡇⢀⠀⠀⠀⢸⡇⢹⣷⣄⠀⠀⠀⠀⠀",
          "⠀⠀⠀⣠⣾⣯⣸⡇⢸⡇⠀⠸⣤⢻⣼⣇⡿⣠⠆⠀⢸⡇⢸⣇⣽⣷⣄⠀⠀⠀",
          "⠀⣠⡾⠋⣿⠈⢻⣧⣸⡇⠀⠀⣻⣾⠿⠿⣧⣟⠀⠀⢸⣧⣼⡟⠁⣿⠙⢷⣄⠀",
          "⡾⠋⠀⠀⣿⠀⢸⡏⢻⣧⡀⣼⠋⠀⠀⠀⠀⠙⣧⢀⣼⡟⢹⡇⠀⣿⠀⠀⠙⢷",
          "⠀⠀⠀⠀⣿⠀⢸⡇⢸⡏⠻⣿⡀⠀⠀⠀⠀⢀⣿⡟⢹⡇⢸⡇⠀⣿⠀⠀⠀⠀",
          "⠀⠀⠀⠀⣿⠀⢸⡇⢸⡇⠀⣿⠻⣦⡀⢀⣴⠟⣽⠀⢸⡇⢸⡇⠀⣿⠀⠀⠀⠀",
          "⠀⠀⠀⠀⣿⠀⢸⡇⢸⡇⠀⣿⠀⢈⣿⣿⡁⠀⢿⡀⢸⡇⢸⡇⠀⣿⠀⠀⠀⠀",
          "⠀⠀⠀⠀⣿⠀⠸⠋⢸⡇⠀⣿⣴⠟⠁⠈⠻⣦⣿⠄⢸⡇⠘⠇⠀⣿⠀⠀⠀⠀",
          "⠀⠀⠀⠀⣿⠀⠀⠀⢸⣇⣴⣿⠁⠀⠀⠀⠀⠈⣿⣧⣸⡇⠀⠀⠀⣿⠀⠀⠀⠀",
          "⠀⠀⠀⠀⣿⠀⠀⠀⢸⠟⠁⣿⠀⠀⠀⠀⠀⠀⢾⠈⠻⡇⠀⠀⠀⣿⠀⠀⠀⠀",
          "⠀⠀⠀⠀⠟⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⣾⠀⠀⠀⠀⠀⠀⠻⠀",
          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        },
        -- [[
        -- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
        -- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
        -- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
        -- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
        -- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
        -- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],

        sections = {

          { section = "header", padding = 1 },
          { section = "keys", gap = 1, padding = 1 },
          {
            title = "🔍  Recent Files",
            icon = "",
            gap = 1,
            section = "recent_files",
            max_items = 5,
            padding = 1,
            with_icon = true,
          },
          -- {
          -- 	pane = 2,
          -- 	title = "⚡ Quick Actions",
          -- 	section = "keys",
          -- 	max_items = 5,
          -- 	padding = 1,
          -- 	with_icon = true,
          -- 	keys = {
          -- 		{ key = "ff", icon = "🔎", desc = "Find Files", action = "Fzf files" },
          -- 		{ key = "fg", icon = "📝", desc = "Live Grep", action = "Telescope live_grep" },
          -- 		{ key = "e", icon = "🌲", desc = "File Explorer", action = "Yazi" },
          -- 		{ key = "gg", icon = "📊", desc = "Git Status", action = "LazyGit" },
          -- 		{ key = "qq", icon = "🚪", desc = "Quit Neovim", action = "qa" },
          -- 	},
          -- },
          -- {
          -- 	pane = 2,
          -- 	title = "📊  Git Status",
          -- 	section = "terminal",
          -- 	enabled = function()
          -- 		return require("snacks").git and require("snacks").git.get_root() ~= nil
          -- 	end,
          -- 	cmd = "git status --short --branch",
          -- 	height = 6,
          -- 	padding = 1,
          -- 	ttl = 5 * 60,
          -- },
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

    keys = {},
  },
}
