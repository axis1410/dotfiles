return {

  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim", opts = {} },
    "SmiteshP/nvim-navic",
  },
  config = function()
    vim.diagnostic.config {
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      float = { source = "always" },
    }

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
      callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, event.buf)
        end

        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup("custom-lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("custom-lsp-detach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = "custom-lsp-highlight", buffer = event2.buf }
            end,
          })
        end

        local fzf = require "fzf-lua"
        map("gd", fzf.lsp_definitions, "[G]oto [D]efinition")
        map("gr", fzf.lsp_references, "[G]oto [R]eferences")
        map("gI", fzf.lsp_implementations, "[G]oto [I]mplementation")
        map("<leader>D", fzf.lsp_typedefs, "Type [D]efinition")
        map("<leader>ds", fzf.lsp_document_symbols, "[D]ocument [S]ymbols")
        map("<leader>ws", fzf.lsp_workspace_symbols, "[W]orkspace [S]ymbols")
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      end,
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = {
        "*.js",
        "*.jsx",
        "*.ts",
        "*.tsx",
        -- "*.json",
        "*.css",
        "*.scss",
        "*.html",
        "*.vue",
        "*.py",
        "*.go",
      },
      callback = function()
        vim.lsp.buf.format { async = false }
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    local servers = {
      gopls = {},
      ts_ls = {
        filetypes = {
          "ts",
          "tsx",
          "vue",
        },
      },
      pyright = {},
      ruff = {},
      html = { filetypes = { "html", "twig", "hbs" } },
      jinja_lsp = {
        filetypes = { "jinja", "html" },
      },
      cssls = {},
      dockerls = {},
      sqlls = {},
      terraformls = {},
      yamlls = {},
      -- tailwindcss = {
      --   filetypes = {
      --     "html",
      --     "jinja",
      --     "javascript",
      --     "typescript",
      --     "javascriptreact",
      --     "typescriptreact",
      --     "vue",
      --   },
      -- },
      rust_analyzer = {},

      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = {
                "${3rd}/luv/library",
                unpack(vim.api.nvim_get_runtime_file("", true)),
              },
            },
            diagnostics = {
              globals = {
                "vim",
                "require",
                "pcall",
                "ipairs",
                "pairs",
                "table",
                "string",
                "math",
                "os",
                "print",
                "type",
                "tostring",
                "tonumber",
                "error",
                "assert",
                "unpack",
                "select",
              },
              disable = {
                "missing-fields",
              },
            },
            format = {
              enable = false,
            },
          },
        },
      },
    }

    local tools = {
      "stylua",
      "ruff",
      "prettier",
      "mypy",
      "taplo",
      "pyright",
    }

    require("mason").setup()

    require("mason-tool-installer").setup {
      ensure_installed = tools,
    }

    require("mason-lspconfig").setup {
      ensure_installed = vim.tbl_keys(servers),
      automatic_installation = true,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}

          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    }
  end,
}
