return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    event = "InsertEnter",
    dependencies = { "rafamadriz/friendly-snippets" },
    keys = {
      {
        "<C-l>",
        function()
          local luasnip = require "luasnip"
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          end
        end,
        mode = { "i", "s" },
        desc = "Snippet expand/jump",
      },
      {
        "<C-h>",
        function()
          local luasnip = require "luasnip"
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          end
        end,
        mode = { "i", "s" },
        desc = "Snippet jump back",
      },
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_lua").lazy_load {
        paths = { vim.fn.stdpath "config" .. "/lua/snippets" },
      }
    end,
  },
}
