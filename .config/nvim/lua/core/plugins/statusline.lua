return {
  {
    "echasnovski/mini.statusline",
    enabled = true,
    event = "BufEnter",
    dependencies = {
      "echasnovski/mini-git",
      "echasnovski/mini.diff",
      "echasnovski/mini.icons",
    },
    config = function()
      local statusline = require("mini.statusline")

      local function lsp_summary()
        local bufnr = vim.api.nvim_get_current_buf()
        local clients = vim.lsp.get_clients({ bufnr = bufnr })
        local names = {}
        for _, client in ipairs(clients) do
          names[#names + 1] = client.name
        end
        table.sort(names)
        if #names == 0 then return "" end
        return "LSP:" .. table.concat(names, ",")
      end

      local function filename_2parents()
        local name = vim.api.nvim_buf_get_name(0)
        if name == "" then return "[No Name]" end
        local parts = {}
        local p = name
        for _ = 1, 3 do
          local tail = vim.fn.fnamemodify(p, ":t")
          if tail == "" then break end
          table.insert(parts, 1, tail)
          p = vim.fn.fnamemodify(p, ":h")
        end
        local result = table.concat(parts, "/")
        if vim.bo.modified then result = result .. " ●" end
        if vim.bo.readonly then result = result .. " 🔒" end
        return result
      end

      local function location()
        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        return string.format("%d:%d", row, col + 1)
      end

      statusline.setup({
        content = {
          active = function()
            local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
            local git = statusline.section_git({ trunc_width = 40 })
            local filename = filename_2parents()
            local lsp = lsp_summary()
            local loc = location()

            return statusline.combine_groups({
              { hl = mode_hl,                  strings = { mode } },
              { hl = "MiniStatuslineDevinfo",   strings = { git } },
              "%<",
              { hl = "MiniStatuslineFilename",  strings = { filename } },
              "%=",
              { hl = "MiniStatuslineDevinfo",   strings = { lsp } },
              { hl = mode_hl,                   strings = { loc } },
            })
          end,
          inactive = function()
            local filename = filename_2parents()
            return statusline.combine_groups({
              { hl = "MiniStatuslineInactive", strings = { filename } },
            })
          end,
        },
        use_icons = true,
      })
    end,
  },
}
