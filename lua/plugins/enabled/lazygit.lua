return {
  'kdheepak/lazygit.nvim',
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  -- optional for floating window border decoration
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'Open [L]azy[G]it' },
    -- { '', '<cmd>lua require("telescope").extensions.lazygit.lazygit()<cr>', desc = '' },
  },
  -- for opening git submodules with telescope and lazygit
  -- config = function()
  --   require('telescope').load_extension 'lazygit'
  -- end,
  --
  -- it also probably needs this autocmd for it to work properly with lazyloading
  -- autocmd BufEnter * :lua require('lazygit.utils').project_root_dir()
}
