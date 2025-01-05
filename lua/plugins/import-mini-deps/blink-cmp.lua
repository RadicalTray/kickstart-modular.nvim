return {
  info = {
    source = 'saghen/blink.cmp' ,
    depends = { 'rafamadriz/friendly-snippets' },
    hooks = {
      post_checkout = function()
        vim.fn.system({'cargo', 'build', '--release'})
      end
    },
  },
  setup = function()
    require('blink.cmp').setup {
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
      sources = {
        default = { 'path', 'buffer' },
        cmdline = {},
      },
    }
  end
}
