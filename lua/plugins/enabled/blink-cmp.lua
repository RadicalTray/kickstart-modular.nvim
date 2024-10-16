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
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = true,
    },
    -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'normal',

    -- experimental auto-brackets support
    -- accept = { auto_brackets = { enabled = true } }

    -- experimental signature help support
    -- trigger = { signature_help = { enabled = true } }

    sources = {
      providers = {
        -- { 'blink.cmp.sources.lsp', name = 'LSP' },
        { 'blink.cmp.sources.path', name = 'Path', score_offset = 3 },
        -- { 'blink.cmp.sources.snippets', score_offset = -3 },
        { 'blink.cmp.sources.buffer', name = 'Buffer' },
      },
    },
  }
}
