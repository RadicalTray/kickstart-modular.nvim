return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  event = { 'BufReadPost', 'BufNewFile' }, -- does this break the plugin?
}
