return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
    opts = {
      rocks = { 'lua-curl', 'nvim-nio', 'mimetypes', 'xml2lua' },
    },
  },
  {
    'rest-nvim/rest.nvim',
    ft = 'http',
    keys = {
      {
        '<leader>rr.',
        '<cmd>Rest run<cr>',
        desc = '[R]un [R]est[.]',
      },
      {
        '<leader>rrl',
        '<cmd>Rest run last<cr>',
        desc = '[R]un [R]est [L]ast',
      },
    },
    dependencies = { 'luarocks.nvim' },
    config = function()
      ---@diagnostic disable-next-line: missing-parameter
      require('rest-nvim').setup()

      local telescope = require 'telescope'
      telescope.load_extension 'rest'
      vim.keymap.set('n', '<leader>rre', telescope.extensions.rest.select_env, {
        desc = '[R]un [R]est select [E]nvironment',
      })
    end,
  },
}
