return {
  'saghen/blink.cmp',
  lazy = false,
  dependencies = 'rafamadriz/friendly-snippets',
  build = 'cargo build --release',
  opts = {
    keymap = {
      ['<c-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<c-e>'] = { 'hide' },
      ['<c-y>'] = { 'select_and_accept' },
      ['<c-p>'] = { 'select_prev', 'fallback' },
      ['<c-n>'] = { 'select_next', 'fallback' },
      ['<c-u>'] = { 'scroll_documentation_up', 'fallback' },
      ['<c-d>'] = { 'scroll_documentation_down', 'fallback' },
      ['<c-l>'] = { 'snippet_forward', 'fallback' },
      ['<c-h>'] = { 'snippet_backward', 'fallback' },
    },
    fuzzy = {
      use_frecency = false,
    },
    highlight = {
      use_nvim_cmp_as_default = true,
    },
    sources = {
      completion = {
        enabled_providers = { 'lsp', 'path', 'buffer' },
      },
    },
  },
}
