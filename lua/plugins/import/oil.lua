return {
  'stevearc/oil.nvim',
  cmd = 'Oil',
  event = 'VimEnter',
  keys = {
    { '<leader>oo', '<cmd>Oil %:p:h<CR>', { desc = '[O]pen [O]il.nvim' } },
  },
  dependencies = 'echasnovski/mini.nvim', -- for mini.icons (optional)
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
}
