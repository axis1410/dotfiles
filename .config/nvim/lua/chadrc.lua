local M = {}

M.base46 = {
  theme = "ashes",
  theme_toggle = { "ashes", "one_light" },
  transparency = false,
  integrations = {
    "blink",
    "diffview",
    "flash",
    "git",
    "notify",
    "trouble",
  },
}

M.ui = {
  cmp = {
    icons_left = false,
    style = "flat_dark",
    format_colors = { lsp = true, icon = "󱓻" },
  },
  -- telescope = { style = "bordered" },
  statusline = {
    enabled = true,
    theme = "minimal",
    separator_style = "round",
  },
  tabufline = {
    enabled = true,
    lazyload = true,
    bufwidth = 26,
  },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "                            ",
    "    ▄▄   ▄▄      ▄▄   ▄▄    ",
    "    ███▄███     ███▄ ███    ",
    "    ██▀█▀██     ██ █▄███    ",
    "    ██   ██     ██  ▀███    ",
    "    ▀▀   ▀▀     ▀▀   ▀▀▀    ",
    "                            ",
    "      󰕮  Dotfiles Desk      ",
    "                            ",
  },
  buttons = {
    { txt = "  Find File", keys = "Spc f f", cmd = "FzfLua files" },
    { txt = "󰈞  Live Grep", keys = "Spc f g", cmd = "FzfLua live_grep_native" },
    { txt = "  Recent Files", keys = "Spc f o", cmd = "FzfLua oldfiles" },
    { txt = "󰱼  Buffers", keys = "Spc Spc", cmd = "FzfLua buffers" },
    { txt = "  File Explorer", keys = "-", cmd = "Oil" },
    { txt = "󰏘  Themes", keys = "Spc t h", cmd = "lua require('nvchad.themes').open({ style = 'bordered' })" },
    { txt = "  Mappings", keys = "Spc c h", cmd = "NvCheatsheet" },
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
      content = "fit",
    },
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}

M.cheatsheet = {
  theme = "grid",
}

M.lsp = {
  signature = true,
}

M.colorify = {
  enabled = true,
  mode = "virtual",
  virt_text = "󱓻 ",
  highlight = { hex = true, lspvars = true },
}

return M
