-- Unified picker abstraction. Enable telescope OR fzf-lua; this module routes to whichever is loaded.
local M = {}

local function is_telescope()
  return package.loaded["telescope"] ~= nil
end

local function is_fzf()
  return package.loaded["fzf-lua"] ~= nil
end

local function t()
  return require "telescope.builtin"
end

local function f()
  return require "fzf-lua"
end

function M.files()
  if is_telescope() then t().find_files()
  elseif is_fzf() then f().files() end
end

function M.grep()
  if is_telescope() then t().live_grep()
  elseif is_fzf() then f().live_grep_native() end
end

function M.grep_word()
  if is_telescope() then t().grep_string()
  elseif is_fzf() then f().grep_cword() end
end

function M.buffers()
  if is_telescope() then t().buffers()
  elseif is_fzf() then f().buffers() end
end

function M.help()
  if is_telescope() then t().help_tags()
  elseif is_fzf() then f().help_tags() end
end

function M.keymaps()
  if is_telescope() then t().keymaps()
  elseif is_fzf() then f().keymaps() end
end

function M.oldfiles()
  if is_telescope() then t().oldfiles()
  elseif is_fzf() then f().oldfiles() end
end

function M.pickers()
  if is_telescope() then t().builtin()
  elseif is_fzf() then f().builtin() end
end

function M.diagnostics()
  if is_telescope() then t().diagnostics { bufnr = 0 }
  elseif is_fzf() then f().diagnostics_document() end
end

function M.resume()
  if is_telescope() then t().resume()
  elseif is_fzf() then f().resume() end
end

function M.buf_lines()
  if is_telescope() then t().current_buffer_fuzzy_find()
  elseif is_fzf() then f().blines() end
end

function M.lsp_definitions()
  if is_telescope() then t().lsp_definitions()
  elseif is_fzf() then f().lsp_definitions() end
end

function M.lsp_references()
  if is_telescope() then t().lsp_references()
  elseif is_fzf() then f().lsp_references() end
end

function M.lsp_implementations()
  if is_telescope() then t().lsp_implementations()
  elseif is_fzf() then f().lsp_implementations() end
end

function M.lsp_type_definitions()
  if is_telescope() then t().lsp_type_definitions()
  elseif is_fzf() then f().lsp_typedefs() end
end

function M.lsp_document_symbols()
  if is_telescope() then t().lsp_document_symbols()
  elseif is_fzf() then f().lsp_document_symbols() end
end

function M.lsp_workspace_symbols(query)
  if is_telescope() then
    if query and query ~= "" then
      t().lsp_workspace_symbols { query = query }
    else
      t().lsp_dynamic_workspace_symbols()
    end
  elseif is_fzf() then
    if query and query ~= "" then
      f().lsp_workspace_symbols { lsp_query = query }
    else
      f().lsp_live_workspace_symbols()
    end
  end
end

function M.lsp_dynamic_workspace_symbols()
  if is_telescope() then t().lsp_dynamic_workspace_symbols()
  elseif is_fzf() then f().lsp_live_workspace_symbols() end
end

function M.colorschemes()
  local cs = require("colorscheme")
  if is_fzf() then
    f().colorschemes({
      winopts = {
        height = 0.55,
        width = 0.35,
        row = 0.5,
        col = 0.5,
        preview = { hidden = "hidden" },
      },
      actions = {
        ["default"] = function(selected)
          if selected and selected[1] then cs.set(selected[1]) end
        end,
      },
    })
  elseif is_telescope() then
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    t().colorscheme({
      enable_preview = true,
      previewer = false,
      attach_mappings = function(buf, _)
        actions.select_default:replace(function()
          actions.close(buf)
          local sel = action_state.get_selected_entry()
          if sel then cs.set(sel[1]) end
        end)
        return true
      end,
    })
  else
    vim.ui.select(cs.available(), { prompt = "Colorscheme" }, function(choice)
      if choice then cs.set(choice) end
    end)
  end
end

function M.setup_keymaps()
  local map = vim.keymap.set
  map("n", "<leader>fh", M.help,       { desc = "[S]earch [H]elp" })
  map("n", "<leader>fk", M.keymaps,    { desc = "[S]earch [K]eymaps" })
  map("n", "<leader>fo", M.oldfiles,   { desc = "Search [O]ld [F]iles" })
  map("n", "<leader>ff", M.files,      { desc = "[S]earch [F]iles" })
  map("n", "<leader>fs", M.pickers,    { desc = "[S]earch [S]elect Picker" })
  map("n", "<leader>fw", M.grep_word,  { desc = "[S]earch current [W]ord" })
  map("n", "<leader>fg", M.grep,       { desc = "[S]earch by [G]rep" })
  map("n", "<leader>fd", M.diagnostics,{ desc = "[S]earch [D]iagnostics" })
  map("n", "<leader>fr", M.resume,     { desc = "[S]earch [R]esume" })
  map("n", "<leader><leader>", M.buffers, { desc = "[ ] Find existing buffers" })
  map("n", "<leader>/",  M.buf_lines,  { desc = "[/] Fuzzily search in current buffer" })
  map("n", "<leader>th", M.colorschemes, { desc = "Switch colorscheme" })
end

return M
