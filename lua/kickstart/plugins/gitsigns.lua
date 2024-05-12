return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
          untracked = { text = '┆' },
        },
      }

      vim.keymap.set('n', '<leader>tgb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = '[T]oggle [G]it [B]lame' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
