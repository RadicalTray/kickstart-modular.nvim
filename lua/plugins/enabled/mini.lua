return {
  {
    'echasnovski/mini.nvim',
    event = 'VeryLazy',
    version = false,
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup { n_lines = 500 }
      require('mini.git').setup()
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
