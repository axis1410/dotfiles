return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  enabled = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local ok, db = pcall(require, "dashboard")
    if not ok then
      return
    end

    local has_devicons, devicons = pcall(require, "nvim-web-devicons")
    local uname = vim.loop.os_uname()
    local os_name = uname and uname.sysname or "Unknown"
    local v = vim.version()
    local version = (" v%d.%d.%d"):format(v.major, v.minor, v.patch)

    local function lazy_startup_summary()
      local ok, lazy_mod = pcall(require, "lazy")
      if not ok or type(lazy_mod) ~= "table" then
        return ""
      end

      local stats_fn = lazy_mod.stats
      if type(stats_fn) == "function" then
        local s = stats_fn()
        if type(s) == "table" then
          local count = tonumber(s.count) or tonumber(s.loaded) or 0
          local time = tonumber(s.startuptime) or tonumber(s.startup_time) or 0
          return ("%d plugins in %.2fms"):format(count, time)
        end
      end

      local ok_core, core = pcall(require, "lazy.core")
      if ok_core and core and type(core.stats) == "function" then
        local s = core.stats()
        local count = tonumber(s.count) or 0
        local time = tonumber(s.startuptime) or 0
        return ("%d plugins in %.2fms"):format(count, time)
      end

      return ""
    end

    local function diag_counts()
      local ok_diag, diag = pcall(vim.diagnostic.get, 0)
      if not ok_diag then
        return ""
      end
      local counts = { 0, 0, 0, 0 }
      for _, d in ipairs(vim.diagnostic.get(0)) do
        counts[d.severity] = counts[d.severity] + 1
      end
      local e = counts[vim.diagnostic.severity.ERROR] or 0
      local w = counts[vim.diagnostic.severity.WARN] or 0
      local h = counts[vim.diagnostic.severity.HINT] or 0
      local i = counts[vim.diagnostic.severity.INFO] or 0
      if e + w + h + i == 0 then
        return "No diagnostics"
      end
      return ("E:%d W:%d H:%d I:%d"):format(e, w, h, i)
    end

    local function recent_files(limit)
      limit = limit or 5
      local files = {}
      for _, f in ipairs(vim.v.oldfiles or {}) do
        if #files >= limit then
          break
        end
        if vim.fn.filereadable(f) == 1 and not f:match "COMMIT_EDITMSG" then
          table.insert(files, f)
        end
      end
      return files
    end

    local function mk_action(cmd)
      return function()
        vim.schedule(function()
          if type(cmd) == "function" then
            cmd()
          else
            vim.cmd(cmd)
          end
        end)
      end
    end

    local function fzf_or_telescope()
      if pcall(require, "telescope") then
        return {
          files = "Telescope find_files",
          live_grep = "Telescope live_grep",
          colors = "Telescope colorscheme",
          oldfiles = "Telescope oldfiles",
        }
      end
      return {
        files = "Fzf files",
        live_grep = "Fzf live_grep",
        colors = "Fzf colorschemes",
        oldfiles = "Fzf oldfiles",
      }
    end

    local pick = fzf_or_telescope()

    local center = {
      {
        icon = has_devicons and (devicons.get_icon("init.lua", "lua", { default = true }) .. " ") or " ",
        icon_hl = "GitSignsAdd",
        desc = "Find File",
        desc_hl = "Text",
        key = "f",
        key_hl = "GitSignsAdd",
        action = mk_action(pick.files),
      },
      {
        icon = " ",
        icon_hl = "GitSignsAdd",
        desc = "Find Text",
        desc_hl = "Text",
        key = "t",
        key_hl = "GitSignsAdd",
        action = mk_action(pick.live_grep),
      },
      -- {
      --   icon = " ",
      --   icon_hl = "GitSignsAdd",
      --   desc = "Change Theme",
      --   desc_hl = "Text",
      --   key = "c",
      --   key_hl = "GitSignsAdd",
      --   action = mk_action(pick.colors),
      -- },
      {
        icon = " ",
        icon_hl = "GitSignsAdd",
        desc = "Recent Files",
        desc_hl = "Text",
        key = "r",
        key_hl = "GitSignsAdd",
        action = mk_action(pick.oldfiles),
      },
      {
        icon = "󰗼 ",
        icon_hl = "GitSignsAdd",
        desc = "Quit",
        desc_hl = "Text",
        key = "q",
        key_hl = "GitSignsAdd",
        action = mk_action "qa",
      },
    }

    local files = recent_files(5)
    for i, f in ipairs(files) do
      table.insert(center, i, {
        icon = " ",
        icon_hl = "Title",
        desc = ("[%d] %s"):format(i, vim.fn.fnamemodify(f, ":~")),
        desc_hl = "Comment",
        key = tostring(i),
        key_hl = "Number",
        action = mk_action(function()
          vim.cmd.edit(vim.fn.fnameescape(f))
        end),
      })
    end

    local time = os.date "%H:%M"
    local footer_lines = {
      " " .. time .. " ",
      version .. " | " .. os_name,
      lazy_startup_summary(),
      diag_counts(),
      " Rip & Tear ",
    }

    db.setup {
      theme = "doom",
      config = {

        header = {
          "                              ",
          "                              ",
          "                              ",
          "                              ",
          "                              ",
          "                              ",
          "                              ",
          "                              ",
          "                              ",
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
          "⠀⠀⠀⠀⠟⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⣾⠀⠀⠀⠀⠀⠀⠻⠀   ",
          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          "                              ",
          "                              ",
          "                              ",
          "                              ",
          "                              ",
          "                              ",
          "                              ",
        },

        "                                                                          ",
        "                                                                          ",
        "                                                                          ",
        "                                                                          ",
        "                                                                          ",
        "                                                                          ",
        "                                                                          ",
        "                                                                          ",
        "                                                                          ",
        "                                                                          ",
        "                                                                          ",
        "                                                                          ",
        "                                                                          ",
        "                                                                          ",
        "                                                                          ",
        "                                                                          ",
        "▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄",
        "█░▄▄▀██░▄▄▄░██░▄▄▀██░▄▄▄██░▀██░██░▄▄▄░█▄░▄██░▄▄▄░██░▀██░█▄░▄██░▄▄▄░██░▄▀▄░",
        "█░▀▀░██▄▄▄▀▀██░█████░▄▄▄██░█░█░██▄▄▄▀▀██░███░███░██░█░█░██░███▄▄▄▀▀██░█░█░",
        "█░██░██░▀▀▀░██░▀▀▄██░▀▀▀██░██▄░██░▀▀▀░█▀░▀██░▀▀▀░██░██▄░█▀░▀██░▀▀▀░██░███░",
        "▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀",
        "                                                                          ",
        "                                                                          ",
        "                                                                          ",

        -- header = {
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"           ▄ ▄                   ",
        -- 	"       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
        -- 	"       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
        -- 	"    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
        -- 	"  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
        -- 	"  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
        -- 	"▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
        -- 	"█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
        -- 	"    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- 	"                                 ",
        -- },

        -- header = {
        -- 	[[                                                                              ]],
        -- 	[[                                                                              ]],
        -- 	[[                                                                              ]],
        -- 	[[                                                                              ]],
        -- 	[[                                                                              ]],
        -- 	[[                                                                              ]],
        -- 	[[=================     ===============     ===============   ========  ========]],
        -- 	[[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
        -- 	[[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
        -- 	[[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
        -- 	[[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
        -- 	[[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
        -- 	[[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
        -- 	[[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
        -- 	[[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
        -- 	[[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
        -- 	[[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
        -- 	[[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
        -- 	[[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
        -- 	[[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
        -- 	[[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
        -- 	[[||.=='    _-'                                                     `' |  /==.||]],
        -- 	[[=='    _-'                        N E O V I M                         \/   `==]],
        -- 	[[\   _-'                                                                `-_   /]],
        -- 	[[ `''                                                                      ``' ]],
        -- 	[[                                                                              ]],
        -- 	[[                                                                              ]],
        -- 	[[                                                                              ]],
        -- 	[[                                                                              ]],
        -- },

        center = center,
        footer = vim.tbl_filter(function(s)
          return s and s ~= ""
        end, footer_lines),
      },
    }

    local map = vim.keymap.set
    map("n", "f", function()
      vim.cmd(pick.files)
    end, { silent = true, buffer = 0 })
    map("n", "t", function()
      vim.cmd(pick.live_grep)
    end, { silent = true, buffer = 0 })
    map("n", "c", function()
      vim.cmd(pick.colors)
    end, { silent = true, buffer = 0 })
    map("n", "r", function()
      vim.cmd(pick.oldfiles)
    end, { silent = true, buffer = 0 })
    map("n", "q", function()
      vim.cmd "qa"
    end, { silent = true, buffer = 0 })

    vim.api.nvim_create_autocmd("User", {
      pattern = "DashboardReady",
      callback = function() end,
    })
  end,
}
