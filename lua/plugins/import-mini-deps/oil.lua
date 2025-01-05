return {
  info = {
    source = 'stevearc/oil.nvim'
  },
  setup = function()
    require('oil').setup {
      columns = {
        'icon',
        -- "permissions",
        -- "size",
        { 'mtime', highlight = 'NonText' },
      },
      experimental_watch_for_changes = true,
      view_options = {
        show_hidden = true,
      },
    }

    vim.api.nvim_set_keymap('n', '<leader>oo', '<cmd>Oil %:p:h<CR>', { desc = '[O]pen [O]il.nvim' })
  end
}
