return {
  info = {
    source = 'otavioschwanck/arrow.nvim'
  },
  setup = function()
    require('arrow').setup {
      show_icons = true,
      leader_key = '<leader>b',
      buffer_leader_key = '<leader>B',
    }
  end,
}
