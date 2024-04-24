return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<space>ob', '<cmd>Telescope file_browser<CR>', desc = '[O]pen file [B]rowser', noremap = true },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        file_browser = {
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          cwd_to_path = true,
          follow_symlinks = true,
          hidden = { file_browser = true, folder_browser = true },
        },
      },
    }
    require('telescope').load_extension 'file_browser'
  end,
}
