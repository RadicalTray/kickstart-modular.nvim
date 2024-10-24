return {
  'saghen/blink.cmp',
  lazy = false,
  dependencies = 'rafamadriz/friendly-snippets',
  build = 'cargo build --release',
  opts = {
    keymap = {
      show = '<c-space>',
      hide = '<c-e>',
      accept = '<c-y>',
      select_prev = '<c-p>',
      select_next = '<c-n>',
      show_documentation = {},
      hide_documentation = {},
      scroll_documentation_up = '<c-u>',
      scroll_documentation_down = '<c-d>',
      snippet_forward = '<c-l>',
      snippet_backward = '<c-h>',
    },
    fuzzy = {
      use_frecency = false,
    },
    highlight = {
      use_nvim_cmp_as_default = true,
    },
    nerd_font_variant = 'mono',
    sources = {
      completion = {
        enabled_providers = { 'path', 'buffer' },
      },
      providers = {
        buffer = {
          fallback_for = {},
        },
      },
    },
  },
}
