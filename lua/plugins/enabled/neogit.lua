return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'sindrets/diffview.nvim',
      cmd = {
        'DiffviewOpen',
        'DiffviewClose',
        'DiffviewLog',
        'DiffviewFileHistory',
        'DiffviewFocusFiles',
        'DiffviewToggleFiles',
        'DiffviewRefresh',
      },
    },
    'nvim-telescope/telescope.nvim',
  },
  cmd = 'Neogit',
  keys = {
    { '<leader>ng', '<cmd>Neogit<CR>', desc = 'Open [N]eo[G]it' },
  },
  config = true,
}
