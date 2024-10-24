return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  -- optional: provides snippets for the snippet source
  dependencies = 'rafamadriz/friendly-snippets',
  -- use a release tag to download pre-built binaries
  -- version = 'v0.*',
  -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
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
    },
  },
}
