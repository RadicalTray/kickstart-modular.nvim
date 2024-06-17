return {
  'bluz71/vim-moonfly-colors',
  name = 'moonfly',
  priority = 1000,
  init = function()
    vim.g.moonflyTransparent = true
    vim.cmd.colorscheme 'moonfly'
  end,
}
