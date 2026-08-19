return {
  -- { "0xleodevv/oc-2.nvim", lazy = true, enabled = true },

  { "nickkadutskyi/jb.nvim", lazy = true, enabled = true },

  { "datsfilipe/vesper.nvim", enabled = true, lazy = true },

  {
    "catppuccin/nvim",
    enabled = true,
    name = "catppuccin",
    lazy = true,
    opts = {
      term_colors = true,
      no_italic = true,
      lsp_styles = {
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
          ok = { "undercurl" },
        },
      },
      auto_integrations = true,
    },
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = true,
    priority = 1000,
    opts = {
      styles = { italic = false },
      dim_inactive_windows = true,
      palette = {
        dawn = {
          -- no_bg = "#faf4ed",
          cursor_bg = "#998f97",
          cursor_fg = "#575279",
        },
        main = {
          -- no_bg = "#141415",
          cursor_bg = "#ffffff",
          cursor_fg = "#000000",
          -- gold = "#f6d5a7",
          -- foam = "#a1d1da",
          -- iris = "#d9c7ef",
          -- rose = "#ebbcba",
          -- pine = "#437e91",
        },
      },
      highlight_groups = {
        Cursor = { bg = "cursor_bg", fg = "cursor_fg" },
        Directory = { fg = "pine", bold = false },
      },

      before_highlight = function(group, highlight, _palette)
        if group:match "^DiagnosticVirtualText" and highlight.bg == nil then
          highlight.bg = highlight.fg
          highlight.blend = 10
        end
      end,
    },
  },

  { "deparr/tairiki.nvim", lazy = true, priority = 1000, enabled = true },

  {
    "vague-theme/vague.nvim",
    lazy = true,
    enabled = true,
    config = function()
      local v = require "vague"
      v.setup {
        transparent = false,
        bold = false,
        italic = false,
      }
    end,
  },

  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    enabled = false,
    config = function()
      require("github-theme").setup {
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
      }
    end,
  },

  {
    "ydkulks/cursor-dark.nvim",
    -- "axis1410/cursor-dark.nvim",
    lazy = true,
    enabled = true,
    priority = 1000,
    config = function()
      require("cursor-dark").setup {
        style = "dark-midnight",
        transparent = false,
        dashboard = true,
      }
    end,
  },

  {

    "Mofiqul/adwaita.nvim",
    lazy = true,
    enabled = false,
    priority = 1000,
    config = function()
      vim.g.adwaita_darker = false
    end,
  },

  {
    "sainnhe/gruvbox-material",
    lazy = true,
    enabled = true,
    priority = 1000,
    config = function()
      local g = vim.g
      -- 'hard', 'medium', 'soft' | default: 'medium'
      g.gruvbox_material_background = "soft"
      -- 'material', 'mix', 'original' | default: 'material'
      g.gruvbox_material_foreground = "material"
      -- 0, 1 | default: 0 — disable italic in Comment
      g.gruvbox_material_disable_italic_comment = 0
      -- 0, 1 | default: 0 — bold function names, like original gruvbox
      g.gruvbox_material_enable_bold = 1
      -- 0, 1 | default: 0 — requires a font with cursive italics
      g.gruvbox_material_enable_italic = 1
      -- '', 'auto', 'red', 'orange', 'yellow', 'green', 'aqua', 'blue', 'purple' | default: ''
      g.gruvbox_material_cursor = "aqua"
      -- 0, 1, 2 | default: 0 — 2 = more UI components transparent (e.g. statusline)
      g.gruvbox_material_transparent_background = 0
      -- 0, 1 | default: 0 — neovim only
      g.gruvbox_material_dim_inactive_windows = 1
      -- 'grey background', 'green background', 'blue background', 'red background', 'reverse' | default: 'grey background'
      g.gruvbox_material_visual = "blue background"
      -- 'grey', 'red', 'orange', 'yellow', 'green', 'aqua', 'blue', 'purple' | default: 'grey' — PmenuSel/WildMenu bg
      g.gruvbox_material_menu_selection_background = "grey"
      -- 'none', 'grey', 'linenr' | default: 'none' — sign/fold column bg
      g.gruvbox_material_sign_column_background = "none"
      -- 'none', 'colored' | default: 'none' — spell foreground
      g.gruvbox_material_spell_foreground = "none"
      -- 'low', 'high' | default: 'low' — line numbers, indent lines, etc.
      g.gruvbox_material_ui_contrast = "high"
      -- 0, 1 | default: 1 — show EndOfBuffer filler lines
      g.gruvbox_material_show_eob = 1
      -- 'bright', 'dim', 'blend' | default: 'bright' — floating window bg
      g.gruvbox_material_float_style = "bright"
      -- 0, 1 | default: 0 — highlight bg of diagnostic text, not just underline
      g.gruvbox_material_diagnostic_text_highlight = 1
      -- 0, 1 | default: 0 — highlight full diagnostic line
      g.gruvbox_material_diagnostic_line_highlight = 0
      -- 'grey', 'colored', 'highlighted' | default: 'grey' — diagnostic virtual text style
      g.gruvbox_material_diagnostic_virtual_text = "highlighted"
      -- 'grey background', 'high contrast background', 'bold', 'underline', 'italic'
      -- default: 'grey background' (or 'bold' in transparent mode) — current-word highlight plugins
      g.gruvbox_material_current_word = "grey background"
      -- 'none', 'dimmed' | default: 'none' — inlay hints bg
      g.gruvbox_material_inlay_hints_background = "none"
      -- 0, 1 | default: 0 — keep terminal's own :terminal colors instead of overriding them
      g.gruvbox_material_disable_terminal_colors = 0
      -- 'default', 'mix', 'original' | default: 'default' — statusline/airline/lightline/lualine style
      g.gruvbox_material_statusline_style = "default"
      -- 0, 1 | default: 0 — disable bold in lightline colorscheme
      g.gruvbox_material_lightline_disable_bold = 0
      -- 0, 1 | default: 0 — perf: load per-filetype/plugin syntax lazily via after/syntax,
      -- ~50% faster load (usually tens of ms; more on low-power machines)
      g.gruvbox_material_better_performance = 1
      -- Dictionary | default: {} — override palette entries, e.g. {bg0 = {"#1d2021", "234"}}
      g.gruvbox_material_colors_override = vim.empty_dict()
    end,
  },

  {
    "sainnhe/edge",
    lazy = true,
    enabled = true,
    priority = 1000,
    config = function()
      local g = vim.g
      -- 'default', 'aura', 'neon' | default: 'default'
      g.edge_style = "aura"
      -- 0, 1 | default: 0 — use dark grey foreground instead of white in dark variants
      g.edge_dim_foreground = 0
      -- 0, 1 | default: 0 — disable italic in Comment
      g.edge_disable_italic_comment = 0
      -- 0, 1 | default: 0 — requires a font with cursive italics
      g.edge_enable_italic = 1
      -- '', 'auto', 'red', 'yellow', 'green', 'cyan', 'blue', 'purple' | default: ''
      g.edge_cursor = "auto"
      -- 0, 1, 2 | default: 0 — 2 = more UI components transparent (e.g. statusline)
      g.edge_transparent_background = 0
      -- 0, 1 | default: 0 — neovim only
      g.edge_dim_inactive_windows = 0
      -- 'blue', 'green', 'purple' | default: 'blue' — PmenuSel/WildMenu bg
      g.edge_menu_selection_background = "blue"
      -- 'none', 'colored' | default: 'none' — spell foreground
      g.edge_spell_foreground = "none"
      -- 0, 1 | default: 1 — show EndOfBuffer filler lines
      g.edge_show_eob = 1
      -- 'bright', 'dim', 'blend' | default: 'bright' — floating window bg
      g.edge_float_style = "bright"
      -- 0, 1 | default: 0 — highlight bg of diagnostic text, not just underline
      g.edge_diagnostic_text_highlight = 1
      -- 0, 1 | default: 0 — highlight full diagnostic line
      g.edge_diagnostic_line_highlight = 0
      -- 'grey', 'colored', 'highlighted' | default: 'grey' — diagnostic virtual text style
      g.edge_diagnostic_virtual_text = "highlighted"
      -- 'grey background', 'high contrast background', 'bold', 'underline', 'italic'
      -- default: 'grey background' (or 'bold' in transparent mode) — current-word highlight plugins
      g.edge_current_word = "underline"
      -- 'none', 'dimmed' | default: 'none' — inlay hints bg
      g.edge_inlay_hints_background = "none"
      -- 0, 1 | default: 0 — keep terminal's own :terminal colors instead of overriding them
      g.edge_disable_terminal_colors = 0
      -- 0, 1 | default: 0 — disable bold in lightline colorscheme
      g.edge_lightline_disable_bold = 0
      -- 0, 1 | default: 0 — perf: load per-filetype/plugin syntax lazily via after/syntax,
      -- ~50% faster load (usually tens of ms; more on low-power machines)
      g.edge_better_performance = 1
      -- Dictionary | default: {} — override palette entries, e.g. {bg0 = {"#202020", "234"}}
      g.edge_colors_override = vim.empty_dict()
    end,
  },

  { "sainnhe/sonokai", lazy = true, enabled = false },
  { "folke/tokyonight.nvim", lazy = true, enabled = false },
  { "rebelot/kanagawa.nvim", lazy = true, enabled = false },
  { "pmouraguedes/neodarcula.nvim", lazy = true, priority = 1000, enabled = false },
  { "frenzyexists/aquarium-vim", lazy = true, priority = 1000, enabled = false },
  { "dgrco/quietink.nvim", lazy = false, priority = 1000, opts = {}, enabled = false },
  {
    "T-b-t-nchos/Aquavium.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    opts = {},
  },
}