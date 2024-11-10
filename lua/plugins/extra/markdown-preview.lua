return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = 'cd app && yarn install || npm install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
}
