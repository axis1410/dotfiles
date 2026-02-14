return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  keys = {
    {
      "<leader>fh",
      function()
        require("fzf-lua").help_tags()
      end,
      desc = "[S]earch [H]elp",
    },
    {
      "<leader>fk",
      function()
        require("fzf-lua").keymaps()
      end,
      desc = "[S]earch [K]eymaps",
    },
    {
      "<leader>ff",
      function()
        require("fzf-lua").files()
      end,
      desc = "[S]earch [F]iles",
    },
    {
      "<leader>fs",
      function()
        require("fzf-lua").builtin()
      end,
      desc = "[S]earch [S]elect FZF",
    },
    {
      "<leader>fw",
      function()
        require("fzf-lua").grep_cword()
      end,
      desc = "[S]earch current [W]ord",
    },
    {
      "<leader>fg",
      function()
        require("fzf-lua").live_grep_native()
      end,
      desc = "[S]earch by [G]rep",
    },
    {
      "<leader>fd",
      function()
        require("fzf-lua").diagnostics_document()
      end,
      desc = "[S]earch [D]iagnostics",
    },
    {
      "<leader>fr",
      function()
        require("fzf-lua").resume()
      end,
      desc = "[S]earch [R]esume",
    },
    {
      "<leader>f.",
      function()
        require("fzf-lua").oldfiles()
      end,
      desc = '[S]earch Recent Files ("." for repeat)',
    },
    {
      "<leader><leader>",
      function()
        require("fzf-lua").buffers()
      end,
      desc = "[ ] Find existing buffers",
    },
    {
      "<leader>/",
      function()
        require("fzf-lua").blines()
      end,
      desc = "[/] Fuzzily search in current buffer",
    },
    {
      "<leader>th",
      function()
        local fzf = require("fzf-lua")
        local colorscheme = require("colorscheme")
        fzf.colorschemes({
          prompt = "Themes> ",
          actions = {
            ["default"] = function(selected)
              if not selected or not selected[1] then
                return
              end
              local name = selected[1]:match("^%s*(.-)%s*$")
              local ok = colorscheme.set(name)
              if not ok then
                vim.notify("Failed to set colorscheme: " .. name, vim.log.levels.ERROR)
              end
            end,
          },
        })
      end,
      desc = "Select Color Schemes"
    }
  },
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-mini/mini.nvim" },
  config = function()
    local fzf = require "fzf-lua"

    fzf.setup {
      defaults = {
        prompt = "  ",
        file_ignore_patterns = { "node_modules", "venv", ".git" },
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
          height = 0.60,
          width = 0.80,
          row = 0.35,
          col = 0.5,
          border = "rounded",

          preview = {
            layout = "vertical",    -- main option
            vertical = "right:50%", -- preview on right taking 50% space
          },
        },
      },
      buffers = {
        file_icons = true,
        color_icons = true,
        previewer = false,
        winopts = {
          height = 0.40,
          width = 0.60,
          row = 0.35,
          col = 0.5,
          border = "rounded",
        },
      },
      grep = {
        prompt = "Rg❯ ",
        file_ignore_patterns = { "node_modules", ".git", ".venv" },
        rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case --max-columns=512",
      },
      fzf_colors = {
        true,
      },
    }
  end,
}