return {
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    require('gitsigns').setup {}

    vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = 'Toggle [G]it [B]lame' })
    vim.keymap.set('n', '<leader>gh', '<cmd>Gitsigns preview_hunk_inline<CR>', { desc = 'Preview [G]it [H]unk' })
  end,
}
-- vim: ts=2 sts=2 sw=2 et
