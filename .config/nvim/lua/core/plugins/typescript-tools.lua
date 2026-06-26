return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  ft = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
  opts = {
    settings = {
      separate_diagnostic_server = true,
      publish_diagnostic_on = "insert_leave",
      expose_as_code_action = { "fix_all", "add_missing_imports", "remove_unused" },
      complete_function_calls = false,
      tsserver_max_memory = "auto",
      code_lens = "off",
      jsx_close_tag = {
        enable = true,
        filetypes = { "javascriptreact", "typescriptreact" },
      },
    },
  },
}
