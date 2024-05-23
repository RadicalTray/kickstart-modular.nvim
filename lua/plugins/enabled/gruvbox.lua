return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  init = function()
    require('gruvbox').setup {
      ---@diagnostic disable-next-line: missing-fields
      italic = {
        strings = false,
        folds = false,
      },
      contrast = 'hard',
    }
    vim.cmd.colorscheme 'gruvbox'
  end,
}
