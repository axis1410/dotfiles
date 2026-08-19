-- Unified git UI abstraction. Enable neogit OR lazygit.nvim; this module routes <leader>gg to whichever is enabled.
local M = {}

local function plugin_enabled(name)
  local ok, lazy_config = pcall(require, "lazy.core.config")
  if not ok then
    return false
  end
  local plugin = lazy_config.plugins[name]
  if not plugin then
    return false
  end
  if plugin.enabled == nil then
    return true
  end
  if type(plugin.enabled) == "function" then
    return plugin.enabled()
  end
  return plugin.enabled
end

local function is_neogit()
  return plugin_enabled "neogit"
end

local function is_lazygit()
  return plugin_enabled "lazygit.nvim"
end

local function n()
  return require "neogit"
end

function M.open()
  if is_neogit() then
    n().open()
  elseif is_lazygit() then
    vim.cmd "LazyGit"
  end
end

function M.setup_keymaps()
  vim.keymap.set("n", "<leader>gg", M.open, { desc = "[G]it UI" })
end

return M
