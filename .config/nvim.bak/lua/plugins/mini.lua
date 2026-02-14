return {

  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    version = false,
    config = function()
      require("mini.surround").setup {
        mappings = {
          add = "<leader>sa",
          delete = "<leader>sd",
          find = "<leader>sf",
          find_left = "<leader>sF",
          highlight = "<leader>sh",
          replace = "<leader>sr",
          update_n_lines = "<leader>sn",
        },
      }
    end,
    opts = {
      mappings = {
        add = "<leader>sa",
        delete = "<leader>sd",
        find = "<leader>sf",
        find_left = "<leader>sF",
        highlight = "<leader>sh",
        replace = "<leader>sr",
        update_n_lines = "<leader>sn",
      },
    },
  },

  {
    "echasnovski/mini.bufremove",
    version = false,
    keys = {
      {
        "<leader>bd",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        desc = "Delete buffer",
      },
      {
        "<leader>bD",
        function()
          require("mini.bufremove").delete(0, true)
        end,
        desc = "Force delete buffer",
      },
    },
    config = function()
      require("mini.bufremove").setup()
    end,
  },

  {
    "echasnovski/mini.move",
    event = "VeryLazy",
    version = false,
    config = function()
      require("mini.move").setup {
        mappings = {
          left = "<S-h>",
          right = "<S-l>",
          up = "<S-k>",
          down = "<S-j>",
          line_left = "<S-h>",
          line_right = "<S-l>",
          line_down = "<S-j>",
          line_up = "<S-k>",
        },
      }
    end,
  },
}
