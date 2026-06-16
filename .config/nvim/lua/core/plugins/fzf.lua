return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  event = "VeryLazy",
  enabled = true,
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-mini/mini.nvim" },
  config = function()
    local fzf = require "fzf-lua"

    fzf.setup {
      defaults = {
        prompt = "    ",
        file_ignore_patterns = { "node_modules", "venv", ".git" },
        winopts = {
          height = 0.84,
          width = 0.9,
          row = 0.5,
          col = 0.5,
          border = "rounded",
          preview = {
            border = [[rounded]],
            layout = [[flex]],
            flex = [[row]],
            vertical = [[right:55%]],
            horizontal = [[down:45%]],
          },
        },
      },
      keymap = {
        builtin = {
          ["<C-k>"] = "preview-page-up",
          ["<C-j>"] = "preview-page-down",
          ["<C-l>"] = "select",
        },
      },
      files = {
        file_icons = false,
        hidden = true,
        git_icons = true,
        file_ignore_patterns = { [[node_modules]], [[venv]] },
        color_icons = true,

        winopts = {
          height = 0.84,
          width = 0.9,
          row = 0.5,
          col = 0.5,
          border = "rounded",
          preview = {
            border = "rounded",
            layout = "vertical",
            vertical = "right:50%",
          },
        },
      },
      buffers = {
        file_icons = true,
        color_icons = true,
        winopts = {
          height = 0.84,
          width = 0.9,
          row = 0.5,
          col = 0.5,
          border = "rounded",
          preview = {
            border = "rounded",
            layout = "vertical",
            vertical = "right:50%",
          },
        },
      },
      grep = {
        prompt = "Rg❯ ",
        file_ignore_patterns = { "node_modules", ".git", ".venv" },
        rg_opts = table.concat({
          "--column",
          "--line-number",
          "--no-heading",
          "--color=always",
          "--smart-case",
          "--max-columns=4096",
          "--glob '!**/.git/*'",
          "--glob '!**/*.{mo,pot,po,csv}'",
          "--glob '!**/*env/*'",
          "--glob '!**/*venv/*'",
          "--glob '!**/*.lock*'",
          "-e",
        }, " "),
        git_icons = true,
      },
      fzf_colors = {
        true,
      },
      fzf_opts = {
        ["--layout"] = "default",
        ["--info"] = "right",
        ["--pointer"] = "▌",
        ["--marker"] = "●",
        ["--cycle"] = "",
      },
      hls = {
        border = "FloatBorder",
        title = "Title",
        preview_title = "Title",
        cursorline = "CursorLine",
        cursorlinenr = "CursorLineNr",
        search = "IncSearch",
      },
    }

    require("core.picker").setup_keymaps()
  end,
}