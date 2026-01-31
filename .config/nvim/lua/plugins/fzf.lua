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
        previewer = false,
        color_icons = true,
        winopts = {
          height = 0.40,
          width = 0.60,
          row = 0.35,
          col = 0.5,
          border = "rounded",
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

    -- vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "[S]earch [H]elp" })
    -- vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "[S]earch [K]eymaps" })
    -- vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "[S]earch [F]iles" })
    -- vim.keymap.set("n", "<leader>fs", fzf.builtin, { desc = "[S]earch [S]elect FZF" })
    -- vim.keymap.set("n", "<leader>fw", fzf.grep_cword, { desc = "[S]earch current [W]ord" })
    -- vim.keymap.set("n", "<leader>fg", fzf.live_grep_native, { desc = "[S]earch by [G]rep" })
    -- vim.keymap.set("n", "<leader>fd", fzf.diagnostics_document, { desc = "[S]earch [D]iagnostics" })
    -- vim.keymap.set("n", "<leader>fr", fzf.resume, { desc = "[S]earch [R]esume" })
    -- vim.keymap.set("n", "<leader>f.", fzf.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    -- vim.keymap.set("n", "<leader><leader>", fzf.buffers, { desc = "[ ] Find existing buffers" })
    -- vim.keymap.set("n", "<leader>/", fzf.blines, { desc = "[/] Fuzzily search in current buffer" })
  end,
}
