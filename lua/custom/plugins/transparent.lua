return {
  'xiyaowong/transparent.nvim',
  lazy = false,
  opts = {
    extra_groups = { 'WinSeparator' },
    -- exclude_groups = { 'StatusLine', 'StatusLineNC' },
    --
    -- NOTE: The loading order of linefly and transparent.nvim matters ?????
    --       I don't know anymore, adding/removing clear_prefix doesn't instantly take effect after reboot
  },
  config = function(_, opts)
    require('transparent').setup(opts)

    -- make sure to clear_prefix of StatusLine, so it is transparent, but no highlights D:
    require('transparent').clear_prefix 'StatusLine'
    -- this seems to affects both StatusLine and StatusLineNC

    -- can also put this in options.lua maybe??
    vim.opt.fillchars = { vert = '⠀', eob = '⠀' }
    -- * NOT a space, it's U+2800 *
  end,
}
