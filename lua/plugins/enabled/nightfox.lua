return {
  'EdenEast/nightfox.nvim',
  priority = 1000,
  init = function()
    require('nightfox').setup {
      options = {
        transparent = true,
      },
    }
    vim.cmd.colorscheme 'nightfox'
    vim.api.nvim_set_hl(0, 'Visual', { fg = '#bebebe', bg = '#6085b6' })
  end,
}
