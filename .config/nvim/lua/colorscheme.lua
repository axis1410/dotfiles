local M = {}

local theme_file = vim.fn.stdpath "config" .. "/theme.lua"

local function write_theme(name)
  local file = io.open(theme_file, "w")
  if not file then
    return false
  end
  file:write(string.format("return { name = %q }\n", name))
  file:close()
  return true
end

function M.get_saved()
  local ok, data = pcall(dofile, theme_file)
  if not ok then
    return nil
  end
  if type(data) == "table" and type(data.name) == "string" then
    return data.name
  end
  return nil
end

-- Colors installed by lazy.nvim live under stdpath("data")/lazy/<plugin>/colors,
-- whether or not the plugin has been loaded onto &rtp yet. Scanning that
-- directly (rather than vim.fn.getcompletion, which only sees loaded plugins)
-- lets the picker list lazy-loaded colorschemes too.
local function scan_lazy_colorschemes()
  local root = vim.fn.stdpath "data" .. "/lazy"
  local map = {}
  local plugin_dirs = vim.fn.isdirectory(root) == 1 and vim.fn.readdir(root) or {}
  for _, plugin_dir in ipairs(plugin_dirs) do
    local colors_dir = root .. "/" .. plugin_dir .. "/colors"
    if vim.fn.isdirectory(colors_dir) == 1 then
      for _, f in ipairs(vim.fn.readdir(colors_dir)) do
        local name = f:gsub("%.lua$", ""):gsub("%.vim$", "")
        if name ~= "" then
          map[name] = plugin_dir
        end
      end
    end
  end
  return map
end

local rtp_ensured = false

-- Append every installed colorscheme plugin's dir to &rtp so `:colorscheme`
-- completion and live-preview (fzf-lua/telescope builtin pickers apply the
-- scheme as you move the cursor) can find lazy-loaded plugins' colors/ files.
-- This does NOT require() the plugin or run its config/setup — just makes
-- the raw colors file sourceable, so it's cheap and side-effect-free.
local function ensure_rtp(map)
  if rtp_ensured then
    return
  end
  local root = vim.fn.stdpath "data" .. "/lazy"
  local seen = {}
  for _, plugin_dir in pairs(map) do
    if not seen[plugin_dir] then
      seen[plugin_dir] = true
      vim.opt.rtp:append(root .. "/" .. plugin_dir)
    end
  end
  rtp_ensured = true
end

function M.available()
  local map = scan_lazy_colorschemes()
  ensure_rtp(map)
  local unique = {}
  for name in pairs(map) do
    unique[name] = true
  end
  for _, name in ipairs(vim.fn.getcompletion("", "color")) do
    if type(name) == "string" and name ~= "" then
      unique[name] = true
    end
  end
  local list = vim.tbl_keys(unique)
  table.sort(list)
  return list, map
end

function M.apply(name)
  if type(name) ~= "string" or name == "" then
    return false
  end
  local _, map = M.available()
  local plugin = map[name]
  if plugin and package.loaded["lazy"] then
    pcall(require("lazy").load, { plugins = { plugin } })
  end
  local ok = pcall(vim.cmd.colorscheme, name)
  return ok
end

function M.persist(name)
  return write_theme(name)
end

function M.set(name)
  if not M.apply(name) then
    return false
  end
  return write_theme(name)
end

function M.apply_saved()
  local saved = M.get_saved()
  if saved then
    if M.apply(saved) then
      return true
    end
    -- saved name failed (plugin not loaded yet) — schedule retry after plugins settle
    vim.schedule(function()
      if not M.apply(saved) then
        M.apply "default"
      end
    end)
    return false
  end
  -- no saved theme — apply default without persisting
  M.apply "default"
  return false
end

return M
