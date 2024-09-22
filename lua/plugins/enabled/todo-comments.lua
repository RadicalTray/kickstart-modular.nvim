-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  event = { 'BufReadPost', 'BufNewFile', 'FileType' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
}
-- vim: ts=2 sts=2 sw=2 et
