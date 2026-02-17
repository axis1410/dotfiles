return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "bash",
      "json",
      "yaml",
      "python",
      "javascript",
      "typescript",
    },
    auto_install = true,
    indent = {
      enable = true,
    },
  },
  config = function(_, opts)
    local ts = require("nvim-treesitter")

    local ensure_installed = vim.list_extend(vim.deepcopy(opts.ensure_installed or {}), {
      "toml",
      "html",
      "css",
      "go",
      "rust",
      "tsx",
      "jsx",
      "jinja",
    })

    vim.schedule(function()
      ts.install(ensure_installed)
    end)

    local group = vim.api.nvim_create_augroup("user_treesitter_start", { clear = true })
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "FileType" }, {
      group = group,
      callback = function(args)
        if vim.bo[args.buf].buftype ~= "" then
          return
        end

        pcall(vim.treesitter.start, args.buf)

        if opts.indent and opts.indent.enable then
          pcall(function()
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end)
        end
      end,
    })
  end,
}
