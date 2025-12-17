-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "ashes",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = {
  load_on_startup = true,
  buttons = {
    { txt = "  Find File", keys = "ff", cmd = "FzfLua files" },
    { txt = "󰈚  Recent Files", keys = "fo", cmd = "FzfLua oldfiles" },
    { txt = "󰈭  Find Word", keys = "fw", cmd = "FzfLua live_grep_native" },
    { txt = "  Themes", keys = "th", cmd = "FzfLua colorschemes" },
    { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },
  },
}

M.ui = {
  tabufline = {
    enabled = true,
    lazyload = false,
  },
  cmp = {
    icons = true,
    icons_left = true,
    style = "flat_dark"
  }
}



return M
