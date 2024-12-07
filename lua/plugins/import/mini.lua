return {
  'echasnovski/mini.nvim',
  event = 'VimEnter',
  version = false,
  config = function()
    require('mini.icons').setup {}

    require('mini.notify').setup {
      window = {
        -- Floating window config
        config = {
          border = "none",
        },

        -- Maximum window width as share (between 0 and 1) of available columns
        max_width_share = 0.382,

        -- Value of 'winblend' option
        winblend = 25,
      },
    }
    vim.notify = require('mini.notify').make_notify()

    require('mini.git').setup {}

    require('mini.diff').setup {
      view = {
        style = 'sign',
        signs = { add = '|', change = '|', delete = '_' },
      },
    }
    vim.keymap.set('n', '<leader>gh', MiniDiff.toggle_overlay, {
      desc = 'Toggle [G]it [H]unk overlay',
    })
  end,
}
-- vim: ts=2 sts=2 sw=2 et
