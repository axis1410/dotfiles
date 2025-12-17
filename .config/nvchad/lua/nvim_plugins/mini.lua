return {
  {
    "echasnovski/mini.bracketed",
    version = false,
    config = function()
      require("mini.bracketed").setup()
    end,
  },
  {
    "echasnovski/mini.move",
    version = false,
    config = function()
      require("mini.move").setup({
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
      })
    end,
  },

  -- {
  -- 	"echasnovski/mini.pairs",
  -- 	version = false,
  -- 	config = function()
  -- 		require("mini.pairs").setup()
  -- 	end,
  -- },

  -- {
  --   "echasnovski/mini.comment",
  --   version = false,
  --   config = function()
  --     require("mini.comment").setup()
  --   end,
  -- },

  -- {
  -- 	"echasnovski/mini.animate",
  -- 	event = "VeryLazy",
  -- 	config = function()
  -- 		require("mini.animate").setup({
  -- 			scroll = {
  -- 				enable = false,
  -- 			},
  -- 			cursor = {
  -- 				enable = false,
  -- 			},
  -- 			showkeys = {
  -- 				enable = true,
  -- 				timeout = 1000,
  -- 				width = 25,
  -- 				style = {
  -- 					position = "br",
  -- 					bg = "#1a1b26",
  -- 					fg = "#a9b1d6",
  -- 					border = "rounded",
  -- 				},
  -- 			},
  -- 		})
  -- 	end,
  -- },

  -- mini.surround configured via nvchad/lua/plugins/init.lua + configs/mini_surround.lua

  {
    "echasnovski/mini.bufremove",
    version = false,
    config = function()
      require("mini.bufremove").setup()
      vim.keymap.set("n", "<leader>bd", function()
        require("mini.bufremove").delete(0, false)
      end, { desc = "Delete buffer (keep window)" })

      vim.keymap.set("n", "<leader>bD", function()
        require("mini.bufremove").delete(0, true)
      end, { desc = "Force delete buffer" })
    end,
  },

  -- {
  -- 	"nvim-mini/mini.indentscope",
  -- 	version = false,
  -- 	config = function()
  -- 		require("mini.indentscope").setup()
  -- 	end,
  -- },
}
