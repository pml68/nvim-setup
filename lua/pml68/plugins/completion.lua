return {
  {
    "saghen/blink.compat",
    version = "2.*",
    opts = {}
  },
  {
    "saghen/blink.cmp",
    lazy = false,
    version = "1.*",
    opts = {
      keymap = { preset = "default" },
      appearance = {
        nerd_font_variant = "normal",
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 150,
        },
      },
      sources = {
        default = { "lsp", "path", "vimtex", "buffer" },
        providers = {
          vimtex = {
            name = "vimtex",
            module = "blink.compat.source",
          },
        },
      },
      cmdline = { enabled = false },
      signature = { enabled = true },
    },
  },
}
