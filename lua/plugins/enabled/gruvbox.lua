return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  init = function()
    require('gruvbox').setup {
      italic = {
        strings = false,
        folds = false,
      },
    }
    vim.cmd.colorscheme 'gruvbox'
  end,
}
