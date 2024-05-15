return {
  'NeogitOrg/neogit',
  branch = 'nightly',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  cmd = 'Neogit',
  keys = {
    { '<leader>ng', '<cmd>Neogit<CR>', desc = 'Open [N]eo[G]it' },
  },
  config = true,
}
