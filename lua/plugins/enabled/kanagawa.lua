return {
  'rebelot/kanagawa.nvim',
  priority = 1000,
  init = function()
    require('kanagawa').setup {
      transparent = true,
    }

    vim.cmd.colorscheme 'kanagawa-dragon'
  end,
}
