vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function(ev)
    if ev.match and ev.match ~= "" then
      local cs = require "colorscheme"
      cs.persist(ev.match)
    end
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "jb",
  callback = function()
    require("core.jb_palette").apply()
  end,
})

vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = function()
    if vim.g.colors_name == "jb" then
      require("core.jb_palette").apply()
    end
  end,
})

vim.filetype.add { extension = { mjml = "html" } }

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

-- vim.api.nvim_create_autocmd("BufWinEnter", {
--   callback = function(args)
--     vim.schedule(function()
--       if #vim.lsp.get_clients { bufnr = args.buf } == 0 then
--         vim.api.nvim_exec_autocmds("FileType", { buf = args.buf })
--       end
--     end)
--   end,
-- })
