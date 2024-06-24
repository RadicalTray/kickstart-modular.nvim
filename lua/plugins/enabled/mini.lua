return {
  {
    'echasnovski/mini.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    version = false,
    config = function()
      require('mini.ai').setup {}
      require('mini.surround').setup {}
      require('mini.git').setup {}
      require('mini.diff').setup {
        view = {
          style = 'sign',
          signs = { add = '┃', change = '┃', delete = '_' },
        },
      }

      vim.keymap.set('n', '<leader>gh', MiniDiff.toggle_overlay, { desc = 'Toggle [G]it [H]unk overlay' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
