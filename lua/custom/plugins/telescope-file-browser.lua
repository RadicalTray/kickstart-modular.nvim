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
          cwd_to_path = true,
          follow_symlinks = true, -- why is this not true by default? does this break something?
          respect_gitignore = false,
          hijack_netrw = true,
        },
      },
    }
    require('telescope').load_extension 'file_browser'
  end,
}
