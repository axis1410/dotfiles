return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  event = "VeryLazy",
  enabled = true,
  dependencies = {
    "nvim-lua/plenary.nvim",

    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },

  config = function()
    local telescope = require "telescope"

    telescope.setup {
      defaults = {
        file_ignore_patterns = { "node_modules", "venv", ".git" },
        mappings = {
          i = { ["<Esc>"] = require("telescope.actions").close },
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
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    }

    telescope.load_extension "fzf"
    require("core.picker").setup_keymaps()
  end,
}