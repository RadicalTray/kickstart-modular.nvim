return {
  'EdenEast/nightfox.nvim',
  lazy = true,
  priority = 1000,
  config = function()
    require('nightfox').setup {
      options = {
        transparent = true,
      },
    }
    vim.cmd.colorscheme 'nightfox'
    vim.api.nvim_set_hl(0, 'Visual', { fg = '#bebebe', bg = '#6085b6' })
  end,
}
