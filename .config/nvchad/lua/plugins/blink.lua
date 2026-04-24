return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap = opts.keymap or {}
      opts.keymap["<C-s>"] = { "show_signature", "hide_signature", "fallback" }

      opts.completion = opts.completion or {}
      opts.completion.documentation = opts.completion.documentation or {}
      opts.completion.documentation.treesitter_highlighting = false

      opts.completion.menu = opts.completion.menu or {}
      opts.completion.menu.draw = opts.completion.menu.draw or {}
      opts.completion.menu.draw.treesitter = {}

      opts.signature = opts.signature or {}
      -- opts.signature.enabled = true
      opts.signature.window = opts.signature.window or {}
      opts.signature.window.treesitter_highlighting = false
    end,
  },
}
