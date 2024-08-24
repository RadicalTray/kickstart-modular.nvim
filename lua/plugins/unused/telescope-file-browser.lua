return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
  event = 'VimEnter',
  keys = {
    { '<space>ob', '<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>', desc = '[O]pen file [B]rowser' },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        file_browser = {
          follow_symlinks = true,
          respect_gitignore = false,
          hijack_netrw = true,
        },
      },
    }
    require('telescope').load_extension 'file_browser'
  end,
}
