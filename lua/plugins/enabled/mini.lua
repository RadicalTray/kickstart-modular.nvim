return {
  {
    'echasnovski/mini.nvim',
    event = 'VeryLazy',
    version = false,
    config = function()
      require('mini.ai').setup {}
      require('mini.surround').setup {}

      require('mini.git').setup {}

      vim.keymap.set('n', '<leader>gl', '<cmd>Git log<CR>', {
        desc = 'Open [G]it [L]og',
      })
      vim.keymap.set('n', '<leader>gla', '<cmd>Git log --all<CR>', {
        desc = 'Open [G]it [L]og [A]ll',
      })
      vim.keymap.set('n', '<leader>glg', '<cmd>Git log --graph<CR>', {
        desc = 'Open [G]it [L]og [G]raph',
      })
      vim.keymap.set('n', '<leader>glga', '<cmd>Git log --graph --all<CR>', {
        desc = 'Open [G]it [L]og [G]raph [A]ll',
      })
      vim.keymap.set('n', '<leader>glo', '<cmd>Git log --oneline<CR>', {
        desc = 'Open [G]it [L]og [O]neline',
      })
      vim.keymap.set('n', '<leader>gloa', '<cmd>Git log --oneline --all<CR>', {
        desc = 'Open [G]it [L]og [O]neline [A]ll',
      })
      vim.keymap.set('n', '<leader>glog', '<cmd>Git log --oneline --graph<CR>', {
        desc = 'Open [G]it [L]og [O]neline [G]raph',
      })
      vim.keymap.set('n', '<leader>gloga', '<cmd>Git log --oneline --graph --all<CR>', {
        desc = 'Open [G]it [L]og [O]neline [G]raph [A]ll',
      })

      require('mini.diff').setup {
        view = {
          style = 'sign',
          signs = { add = '┃', change = '┃', delete = '_' },
        },
      }

      vim.keymap.set('n', '<leader>gh', MiniDiff.toggle_overlay, {
        desc = 'Toggle [G]it [H]unk overlay',
      })

      require('mini.visits').setup {}
      vim.keymap.set('n', '<a-h>', function()
        MiniVisits.iterate_paths('backward', nil, { wrap = true })
      end, {
        desc = 'Go to previous path',
      })
      vim.keymap.set('n', '<a-l>', function()
        MiniVisits.iterate_paths('forward', nil, { wrap = true })
      end, {
        desc = 'Go to next path',
      })
      vim.keymap.set('n', '<leader>sp', MiniVisits.select_path, {
        desc = '[S]earch visited [P]aths',
      })
      vim.keymap.set('n', '<leader>rp', MiniVisits.remove_path, {
        desc = '[R]emove [P]ath',
      })

      vim.keymap.set('n', '<leader>al', MiniVisits.add_label, {
        desc = '[A]dd [L]abel',
      })
      vim.keymap.set('n', '<leader>rl', MiniVisits.remove_label, {
        desc = '[R]emove [L]abel',
      })
      vim.keymap.set('n', '<leader>sl', MiniVisits.select_label, {
        desc = '[S]earch [L]abels',
      })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
