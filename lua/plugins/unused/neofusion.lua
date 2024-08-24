return {
  'diegoulloao/neofusion.nvim',
  priority = 1000,
  init = function()
    require('neofusion').setup {
      ---@diagnostic disable-next-line: missing-fields
      italic = {
        strings = false,
      },
      transparent_mode = true,
    }

    vim.cmd.colorscheme 'neofusion'
  end,
}
