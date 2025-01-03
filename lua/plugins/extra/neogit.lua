return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    -- 'nvim-telescope/telescope.nvim',
    'ibhagwan/fzf-lua',
  },
  cmd = 'Neogit',
  keys = {
    { '<leader>ng', '<cmd>Neogit<CR>', desc = 'Open [N]eo[G]it' },
  },
  opts = {},
}
