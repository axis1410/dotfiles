return {
  'saghen/blink.cmp',
  event = "BufEnter",
  dependencies = {
    'rafamadriz/friendly-snippets',
    {
      'xzbdmw/colorful-menu.nvim',
      event = "BufEnter",
      config = function()
        require('colorful-menu').setup({
          ls = {
            fallback = true,
            fallback_extra_info_hl = '@comment',
          },
          fallback_highlight = '@variable',
          max_width = 60,
        })
      end,
    },
  },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
      preset = 'enter',
      ['<C-k>'] = false,
      ['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },

    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = {
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
      menu = {
        winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:Visual,Search:None",
        draw = {
          columns = {
            { "kind_icon" },
            { "label", gap = 1 },
            { "source_name" },
          },
          components = {
            label = {
              text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end,
            },
            source_name = {
              width = { fill = true, max = 20 },
              text = function(ctx)
                local source = ctx.source_name or ctx.source_id or ""
                local mapped = {
                  lsp = "LSP",
                  path = "PATH",
                  snippets = "SNIP",
                  buffer = "BUFFER",
                }
                local key = string.lower(source)
                source = mapped[key] or source:upper()
                return "[" .. source .. "]"
              end,
              highlight = "BlinkCmpSource",
            },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = {
        enabled = true,
      },
    },
    signature = {
      enabled = true,
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust" }
  },
  opts_extend = { "sources.default" }
}