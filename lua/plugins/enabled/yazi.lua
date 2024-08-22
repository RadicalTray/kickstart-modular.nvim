return { ---@type LazySpec
  'mikavilpas/yazi.nvim',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>y.',
      '<cmd>Yazi<cr>',
      desc = 'Open yazi at the current file',
    },
    {
      '<leader>yz',
      '<cmd>Yazi cwd<cr>',
      desc = 'Open yazi in the current working directory',
    },
    {
      '<leader>yr',
      '<cmd>Yazi toggle<cr>',
      desc = 'Resume the last yazi session',
    },
  },
  ---@type YaziConfig
  opts = {
    open_for_directories = false,
    open_multiple_tabs = true,
    keymaps = {
      show_help = '<f1>',
    },
  },
}
