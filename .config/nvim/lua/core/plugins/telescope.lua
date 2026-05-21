return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  event = "VeryLazy",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local telescope = require "telescope"
    local actions = require "telescope.actions"

    telescope.setup {
      defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
        multi_icon = " ",
        entry_prefix = "  ",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.45,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        border = true,
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        dynamic_preview_title = true,
        path_display = { "smart" },
        winblend = 0,
        set_env = { COLORTERM = "truecolor" },
        file_ignore_patterns = { "node_modules", "venv", ".git" },
        mappings = {
          i = {
            ["<Esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<C-s>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          file_ignore_patterns = { "node_modules", "venv", ".git" },
        },
        live_grep = {
          additional_args = {
            "--smart-case",
            "--max-columns=4096",
            "--glob=!**/.git/*",
            "--glob=!**/*.{mo,pot,po,csv}",
            "--glob=!**/*env/*",
            "--glob=!**/*venv/*",
            "--glob=!**/*.lock*",
          },
          file_ignore_patterns = { "node_modules", ".git", ".venv" },
        },
        grep_string = {
          additional_args = {
            "--smart-case",
            "--max-columns=4096",
            "--glob=!**/.git/*",
            "--glob=!**/*env/*",
            "--glob=!**/*venv/*",
          },
        },
        buffers = {
          sort_lastused = true,
          sort_mru = true,
          mappings = {
            i = { ["<C-d>"] = actions.delete_buffer },
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            width = 0.5,
            results_height = 15,
          },
        },
      },
    }

    telescope.load_extension "fzf"
    telescope.load_extension "ui-select"
    require("core.picker").setup_keymaps()
  end,
}