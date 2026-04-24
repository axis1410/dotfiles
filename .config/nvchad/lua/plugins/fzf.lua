return {
  "ibhagwan/fzf-lua",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-mini/mini.nvim" },
  config = function()
    local fzf = require "fzf-lua"
    local builtin_previewer = require("fzf-lua.previewer.builtin").buffer_or_file

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
            border = "rounded",
            layout = "flex",
            flex = "column",
            vertical = "right:55%",
            horizontal = "down:45%",
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
        file_icons = "mini",
        hidden = true,
        git_icons = true,
        file_ignore_patterns = { "node_modules", "venv" },
        previewer = true,
        color_icons = true,
        winopts = {
          height = 0.8,
          width = 0.9,
          row = 0.5,
          col = 0.5,
          border = "rounded",
          preview = {
            layout = "flex",
            flex = "column",
            vertical = "right:55%",
            horizontal = "down:45%",
          },
        },
      },
      buffers = {
        file_icons = true,
        color_icons = true,
        previewer = false,
        winopts = {
          height = 0.5,
          width = 0.75,
          row = 0.5,
          col = 0.5,
          border = "rounded",
        },
      },
      grep = {
        prompt = "Rg❯ ",
        previewer = {
          _ctor = builtin_previewer,
          syntax = true,
          treesitter = {
            enabled = false,
          },
          render_markdown = {
            enabled = false,
          },
          snacks_image = {
            enabled = false,
            render_inline = false,
          },
        },
        file_ignore_patterns = { "node_modules", ".git", ".venv" },
        rg_opts = table.concat({
          "--column",
          "--line-number",
          "--no-heading",
          "--color=always",
          "--smart-case",
          "--max-columns=4096",
          "--glob '!**/.git/*'",
          "--glob '!**/*.{mo,pot,po}'",
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

    vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "[S]earch [K]eymaps" })
    vim.keymap.set("n", "<leader>fo", fzf.oldfiles, { desc = "Search [O]ld [F]iles" })
    vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>fs", fzf.builtin, { desc = "[S]earch [S]elect FZF" })
    vim.keymap.set("n", "<leader>fw", fzf.grep_cword, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>fg", fzf.live_grep_native, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>fd", fzf.diagnostics_document, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader>fr", fzf.resume, { desc = "[S]earch [R]esume" })
    vim.keymap.set("n", "<leader>f.", fzf.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set("n", "<leader><leader>", fzf.buffers, { desc = "[ ] Find existing buffers" })
    vim.keymap.set("n", "<leader>/", fzf.blines, { desc = "[/] Fuzzily search in current buffer" })
  end,
}
