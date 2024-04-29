return {
  'xiyaowong/transparent.nvim',
  lazy = false,
  opts = {
    extra_groups = { 'WinSeparator' },
    -- exclude_groups = { 'StatusLine', 'StatusLineNC' },
    --
    -- NOTE: The loading order of linefly and transparent.nvim matters
  },
  config = function(_, opts)
    require('transparent').setup(opts)

    -- can also put this in options.lua maybe??
    vim.opt.fillchars = { vert = '⠀', eob = '⠀' }
    -- * NOT a whitespace, it's U+2800 *
  end,
}
