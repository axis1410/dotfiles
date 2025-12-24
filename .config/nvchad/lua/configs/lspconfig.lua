require("nvchad.configs.lspconfig").defaults()

local lsp = vim.lsp

local servers = {
  "ts_ls",
  "ruff",
  "html",
  "jinja_lsp",
  "basedpyright",
  "cssls",
  "dockerls",
  "sqlls",
  "terraformls",
  "yamlls",
  "tailwindcss",
  "rust_analyzer",
  "lua_ls",
}

lsp.config("ruff", {
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client == nil then
        return
      end
      if client.name == "ruff" then
        client.server_capabilities.hoverProvider = false
      end
    end,
    desc = "LSP: Disable hover capability from Ruff",
  }),

  init_options = {
    settings = {},
  },
})

lsp.config("basedpyright", {
  filetypes = { "python" },
  single_file_support = true,
  settings = {
    basedpyright = {
      analysis = {
        autoImportCompletions = true,
        typeCheckingMode = "off",
      },
    },
  },
})

vim.lsp.enable(servers)

