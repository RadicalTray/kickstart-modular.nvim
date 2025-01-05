return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require('mini.icons').setup {}
    require('mini.extra').setup {}

    require('mini.pick').setup {
      window = {
        prompt_cursor = '_',
      },
    }

    require('mini.notify').setup {
      window = {
        config = {
          border = "none",
        },
        max_width_share = 0.5,
        winblend = 0,
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
