require "nvchad.autocmds"

local conform_augroup = vim.api.nvim_create_augroup("ConformFormatOnSave", {})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = conform_augroup,
  pattern = "*",
  callback = function(args)
    local ok, conform = pcall(require, "conform")
    if not ok then
      return
    end
    conform.format({
      bufnr = args.buf,
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    })
  end,
})
