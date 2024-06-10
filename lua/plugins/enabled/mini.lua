return {
  {
    'echasnovski/mini.nvim',
    event = 'VeryLazy',
    version = false,
    config = function()
      require('mini.ai').setup {}
      require('mini.surround').setup {}
      require('mini.git').setup()
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
