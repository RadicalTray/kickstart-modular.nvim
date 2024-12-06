return { ---@type LazySpec
  'mikavilpas/yazi.nvim',
  cmd = 'Yazi',
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
    floating_window_scaling_factor = 1,
    yazi_floating_window_border = 'none',
  },
}
