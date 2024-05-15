return {
  'stevearc/oil.nvim',
  cmd = 'Oil',
  event = 'VimEnter',
  keys = {
    { '<leader>oo', '<cmd>Oil %:p:h<CR>', { desc = '[O]pen [O]il.nvim' } },
  },
  opts = {
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
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
