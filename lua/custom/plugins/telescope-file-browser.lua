return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
  keys = {
    -- { '<space>ob', '<cmd>Telescope file_browser<CR>', desc = '[O]pen file [B]rowser', noremap = true },
    { '<space>ob', '<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>', desc = '[O]pen file [B]rowser', noremap = true },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        file_browser = {
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
        },
      },
    }
    require('telescope').load_extension 'file_browser'
  end,
}
