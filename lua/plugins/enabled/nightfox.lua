return {
  'EdenEast/nightfox.nvim',
  priority = 1000,
  init = function()
    require('nightfox').setup {
      options = {
        transparent = true,
      },
    }
    vim.cmd.colorscheme 'carbonfox'
  end,
}
