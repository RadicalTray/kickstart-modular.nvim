return {
  {
    'bluz71/vim-moonfly-colors',
    name = 'moonfly',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'moonfly'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
