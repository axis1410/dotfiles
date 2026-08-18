-- Custom outline.nvim provider for .env files (no LSP/treesitter parser exists for dotenv).
-- Lives at lua/outline/providers/env.lua so outline's require("outline/providers/env") resolves here.
local M = {
  name = 'env',
}

local utils = require('outline.utils')

---@param bufnr integer
---@return boolean ft_is_env
function M.supports_buffer(bufnr)
  local ft = utils.buf_get_option(bufnr, 'ft')
  return ft == 'env' or ft == 'dotenv'
end

---@return outline.ProviderSymbol[]
function M.handle_env()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local symbols = {}

  for line, value in ipairs(lines) do
    local key = value:match('^%s*export%s+([%w_]+)%s*=') or value:match('^%s*([%w_]+)%s*=')
    if key then
      symbols[#symbols + 1] = {
        kind = 14, -- LSP SymbolKind.Constant
        name = key,
        selectionRange = {
          start = { character = 0, line = line - 1 },
          ['end'] = { character = 0, line = line - 1 },
        },
        range = {
          start = { character = 0, line = line - 1 },
          ['end'] = { character = 0, line = line - 1 },
        },
        children = {},
      }
    end
  end

  return symbols
end

---@param on_symbols fun(symbols?:outline.ProviderSymbol[], opts?:table)
---@param opts table
function M.request_symbols(on_symbols, opts)
  on_symbols(M.handle_env(), opts)
end

return M
